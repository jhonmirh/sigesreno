import { ExtractJwt, Strategy } from 'passport-jwt';
import { PassportStrategy } from '@nestjs/passport';
import { Injectable } from '@nestjs/common';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor() {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: process.env.JWT_SECRET || 'super_secreto_rene_key_2026',
    });
  }

  // Este método se ejecuta automáticamente si el token es válido
  async validate(payload: any) {
    // Lo que retornemos aquí estará disponible en request.user
    return { id: payload.sub, email: payload.email, role: payload.role };
  }
}
