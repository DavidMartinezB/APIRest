import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn
} from 'typeorm';
import { Characters } from './characters.entity';
import { Abilities_Category, Category_Store } from './categories.entity';

// Define la entidad 'Habilidades' para la tabla 'Habilidades'
@Entity('Abilities')
export class Abilities {
  // Columna generada automáticamente 'id_habilidad'
  @PrimaryGeneratedColumn()
  ability_id: number;

  // Relación muchos-a-uno con la entidad 'Personajes'
  @ManyToOne(() => Characters)
  @JoinColumn({ name: 'character_id' })
  character: Characters;

  // Columna 'nombre' de tipo varchar con una longitud de 100
  @Column({ type: 'varchar', length: 100 })
  name: string;

  // Columna 'descripcion' de tipo texto
  @Column({ type: 'text' })
  description: string;

  @Column({ type: 'varchar', length: 100 })
  url_image: string;

  // Relación muchos-a-uno con la entidad 'CategoriaHabilidades'
  @ManyToOne(() => Abilities_Category, abilities_Category => abilities_Category.abilities)
  @JoinColumn({ name: 'category' }) 
  abilities_Category: Abilities_Category;

  @ManyToOne(() => Category_Store)
  @JoinColumn({ name: 'category_store_id' })
  category_Store: Category_Store;

}