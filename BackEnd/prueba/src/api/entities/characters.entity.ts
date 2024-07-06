// Importando los decoradores y tipos necesarios de 'typeorm'
import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
// Importando la entidad 'Habilidades'
import { Abilities } from './abilities.entity';

// Definiendo la entidad 'Personajes' para la tabla 'Personajes'
@Entity('Characters')
export class Characters {
  // Columna generada automáticamente 'id_personaje'
  @PrimaryGeneratedColumn()
  character_id: number;

  // Columna 'nombre' de tipo string
  @Column()
  name: string;

  // Columna 'rol' de tipo string
  @Column()
  role: string;

  // Columna 'descripcion' de tipo string
  @Column()
  description: string;

  // Columna 'imagen_url' de tipo string
  @Column()
  url_image: string;

  @Column()
  portrait_image: string;
  
  // Relación uno-a-muchos con la entidad 'Habilidades'
  @OneToMany(() => Abilities, abilities => abilities.character)
  abilities: Abilities[];
}