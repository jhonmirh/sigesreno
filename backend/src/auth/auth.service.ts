import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { PrismaService } from '../prisma/prisma.service'; // Asegúrate de tener tu PrismaService importado
import { LoginDto } from './dto/login.dto';
import * as bcrypt from 'bcrypt';

@Injectable()
export class AuthService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly jwtService: JwtService,
  ) {}

  async login(loginDto: LoginDto) {
    const { nombreUsuario, password } = loginDto;

    // 1. Buscar usuario por nombre de usuario
    const user = await this.prisma.usuario.findUnique({
      where: { nombreUsuario },
      include: { roles: true }, // Incluimos roles para construir permisos en el JWT
    });

    if (!user) {
      throw new UnauthorizedException('Credenciales inválidas');
    }

    // 2. Verificar si el usuario está activo
    if (!user.activo) {
      throw new UnauthorizedException('El usuario se encuentra inactivo');
    }

    // 3. Comparar la contraseña ingresada con el hash
    const isPasswordValid = await bcrypt.compare(password, user.passwordHash);
    if (!isPasswordValid) {
      throw new UnauthorizedException('Credenciales inválidas');
    }

    // 4. Generar payload y token JWT
    const payload = {
      sub: user.id,
      nombreUsuario: user.nombreUsuario,
      role: user.roles && user.roles.length ? user.roles[0].rol : null,
    };

    return {
      access_token: await this.jwtService.signAsync(payload),
      user: {
        id: user.id,
        nombreUsuario: user.nombreUsuario,
        roles: user.roles ? user.roles.map((r) => r.rol) : [],
      },
    };
  }
}