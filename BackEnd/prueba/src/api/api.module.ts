import { Module } from '@nestjs/common';
import { ApiService } from './api.service';
import { ApiController } from './api.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Characters } from './entities/characters.entity';
import { Weapons } from './entities/weapons.entity';
import { Shields } from './entities/shields.entity';
import { Weapons_Category, Abilities_Category, Category_Store } from './entities/categories.entity';
import { Abilities_Store, Items_Store } from './entities/store.entity';
import { Abilities } from './entities/abilities.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      Characters,
      Weapons,
      Shields,
      Weapons_Category,
      Abilities_Category,
      Category_Store,
      Items_Store,
      Abilities,
      Abilities_Store
    ]),
  ],
  controllers: [ApiController],
  providers: [ApiService],
})
export class ApiModule {}
