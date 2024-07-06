// Importamos las dependencias necesarias
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { AuthService } from './auth.service';

// Definimos la estrategia JWT para Passport.js
@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  // Inyectamos el servicio AuthService en el constructor
  constructor(private authService: AuthService) {
    super({
      // Extraemos el token JWT del encabezado de autorización como un token portador
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      // No ignoramos la expiración del token
      ignoreExpiration: false,
      // Usamos una clave secreta para verificar la firma del token
      // TODO: Cambie esto por una clave secreta más segura
      secretOrKey: 'Aa11aa11',
    });
  }

  // Validamos el payload del token
  async validate(payload: any) {
    // Llamamos al método validateUser del servicio AuthService con el payload
    const user = await this.authService.validateUser(payload);
    // Si el usuario es indefinido o nulo, lanzamos una excepción no autorizada
    if (user === undefined || user === null) {
      throw new UnauthorizedException();
    }
    // Si el usuario es válido, lo devolvemos
    return user;
  }
}