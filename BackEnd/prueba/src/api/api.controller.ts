// Importamos las dependencias necesarias
import { Controller, Get, Param } from '@nestjs/common';
import { ApiService } from './api.service';

// Importamos los decoradores para la autenticación
// import { UseGuards } from '@nestjs/common';
// import { AuthGuard } from '@nestjs/passport';

// Aplicamos el decorador de autenticación
// @UseGuards(AuthGuard('jwt'))

// Definimos el controlador para la ruta 'api'
@Controller('api')
export class ApiController {
  // Inyectamos el servicio ApiService en el controlador
  constructor(private readonly apiService: ApiService) {}

  // Definimos la ruta GET para obtener todos los elementos
  @Get()
  findAll() {
    return this.apiService.getAll();
  }

  // Definimos la ruta GET para obtener todos los personajes
  @Get('characters')

  findAllCharacters() {
    return this.apiService.findAllCharacters();
  }

  // Definimos la ruta GET para obtener todas las armas
  @Get('weapons')
  findAllWeapons() {
    return this.apiService.findAllWeapons();
  }

  // Definimos la ruta GET para obtener todos los escudos
  @Get('shields')
  findAllShields() {
    return this.apiService.findAllShields();
  }

  // Definimos la ruta GET para obtener todas las categorías de armas
  @Get('weapons/categories')
  findAllWeaponsCategory() {
    return this.apiService.findAllWeaponsCategory();
  }

  // Definimos la ruta GET para obtener todas las categorías de habilidades
  @Get('abilities/categories') //! Cambiar a abilities
  findAllAbilitieCategory() {
    return this.apiService.findAllAbilitiesCategory();
  }

  // Definimos la ruta GET para obtener todas las categorías de la tienda
  @Get('store/categories')
  findAllStoreCategory() {
    return this.apiService.findAllCategoryStore();
  }

  // Definimos la ruta GET para obtener todas las habilidades de la tienda
  // @Get('abilities/store')
  // findAllAbilitiesStore() {
  //   return this.apiService.findAllAbilitiesStore();
  // }

  // Definimos la ruta GET para obtener todas las habilidades
  @Get('abilities')
  findAllAbilities() {
    return this.apiService.findAllAbilities();
  }

  // Definimos la ruta GET para obtener un personaje específico por su id
  @Get('characters/:id')
  findOneCharacter(@Param('id') id_personaje: number) {
    return this.apiService.findOneCharacter(id_personaje);
  }

  // Definimos la ruta GET para obtener una habilidad específica por su id
  @Get('abilities/:id')
  findOneAbility(@Param('id') ability_id: number) {
    return this.apiService.findOneAbility(ability_id);
  }
}