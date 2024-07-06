import { Injectable, NestMiddleware, UnauthorizedException } from '@nestjs/common';
import { Request, Response, NextFunction } from 'express';
import { UsersService } from '../users/users.service';

@Injectable()
export class AuthMiddleware implements NestMiddleware {
  constructor(private readonly usersService: UsersService) {}

  async use(req: Request, res: Response, next: NextFunction) {
    const token = req.query.token;
    if (!token) {
      throw new UnauthorizedException('Token is required');
    }

    const user = await this.usersService.validateDbToken(token as string);
    if (!user) {
      throw new UnauthorizedException('Invalid token');
    }

    req.user = user;
    next();
  }
}