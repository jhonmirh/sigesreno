import { Injectable, CanActivate, ExecutionContext, ForbiddenException } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { ROLES_KEY } from '../decorators/roles.decorator';

@Injectable()
export class RolesGuard implements CanActivate {
  constructor(private reflector: Reflector) {}

  canActivate(context: ExecutionContext): boolean {
    // Obtenemos los roles requeridos definidos en el decorador
    const requiredRoles = this.reflector.getAllAndOverride<string[]>(ROLES_KEY, [
      context.getHandler(),
      context.getClass(),
    ]);
    
    // Si la ruta no requiere roles específicos, la dejamos pasar
    if (!requiredRoles) {
      return true;
    }
    
    // Extraemos el usuario que fue validado por el JwtStrategy
    const { user } = context.switchToHttp().getRequest();
    
    // Comparamos el rol del usuario con los roles permitidos
    if (!user || !requiredRoles.includes(user.role)) {
      throw new ForbiddenException('No tienes el nivel de acceso requerido para esta acción');
    }
    
    return true;
  }
}