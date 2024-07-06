import { BadRequestException, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';

// La anotación @Injectable() declara que esta clase es un proveedor que puede ser inyectado en otros componentes.
@Injectable()
export class AuthService {
  // Inyectamos el servicio JwtService en el constructor.
  constructor(private jwtService: JwtService) {}

  // Esta función genera un token JWT para un usuario.
  async generateToken(user: any) {
    // El payload del token JWT contiene el correo electrónico del usuario y su ID.
    const payload = { username: user.email, sub: user._id };
    return {
      // Usamos el servicio JwtService para firmar el payload y generar el token JWT.
      access_token: this.jwtService.sign(payload),
    };
  }

  // Esta función valida un usuario basándose en el payload de un token JWT.
  async validateUser(token: string) {
    const secretKey = process.env.PASSWORD;
    try {
        const payload = this.jwtService.verify(token, { secret: secretKey });
        return payload;
    } catch (error) {
        console.error(error);
        throw new BadRequestException('Invalid token');
    }
  }

  async token() {
    const token = Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
    return token;
  }
}