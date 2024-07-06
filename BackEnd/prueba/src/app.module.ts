import { MiddlewareConsumer, Module, NestModule } from "@nestjs/common";
import { MongooseModule } from "@nestjs/mongoose";
import { UsersModule } from "./users/users.module";
import { TypeOrmModule } from "@nestjs/typeorm";
import { ApiModule } from './api/api.module';
import { AuthModule } from './auth/auth.module';
import { AuthMiddleware } from "./auth/auth.middleware";
import { ApiController } from "./api/api.controller";
import { MailService } from './mail/mail.service';


@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'valorantdb',
      port: 3306,
      username: 'root',
      password: 'Aa11aa11',
      database: 'bd',
      entities: [__dirname + '/**/*.entity{.ts,.js}'],
      synchronize: false,
    }),
    MongooseModule.forRoot('mongodb://mongodb:27017/users'),
    UsersModule,
    ApiModule,
    AuthModule,
  ],
  controllers: [],
  providers: [UsersModule, MailService],
})
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer) {
    consumer
      .apply(AuthMiddleware)
      .forRoutes(ApiController);
  }
}
