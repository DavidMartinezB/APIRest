export interface Api {
    Characters:         Character[];
    Abilities:          Ability[];
    Weapons:            Weapon[];
    Shields:            Shield[];
    Weapons_Category:   CategoryStore[];
    Abilities_Category: AbilitiesCategoryElement[];
    Category_Store:     CategoryStore[];
    objetosTienda:      ObjetosTienda[];
}

export interface Ability {
    ability_id:          number;
    name:                string;
    description:         string;
    url_image:           string;
    abilities_Category?: AbilitiesCategory;
}

export interface AbilitiesCategory {
    category_id: number;
    name:        Name;
}

export enum Name {
    Abilities = "Abilities",
    Pistols = "Pistols",
    Purcheable = "purcheable",
    Shields = "Shields",
    Ultimate = "ultimate",
    Weapons = "Weapons",
}

export interface AbilitiesCategoryElement {
    category_id: number;
    name:        Name;
    abilities:   Ability[];
}

export interface CategoryStore {
    category_id: number;
    name:        string;
    weapons?:    Weapon[];
    shields?:    Shield[];
}

export interface Shield {
    shield_id:       number;
    category_id:     number;
    name:            string;
    description:     string;
    resistance:      number;
    price:           string;
    url_image:       string;
    category_Store?: AbilitiesCategory;
}

export interface Weapon {
    weapon_id:          number;
    category_id:        number;
    weapon_category_id: number;
    name:               string;
    description:        string;
    url_image:          string;
    fire_rate:          number;
    close_body_damage:  number;
    medium_body_damage: number;
    far_body_damage:    number;
    close_head_damage:  number;
    medium_head_damage: number;
    far_head_damage:    number;
    price:              string;
    weapons_Category?:  AbilitiesCategory;
}

export interface Character {
    character_id:   number;
    name:           string;
    role:           Role;
    description:    string;
    url_image:      string;
    portrait_image: string;
    abilities:      Ability[];
}

export enum Role {
    Controller = "Controller",
    Duelist = "Duelist",
    Initiator = "Initiator",
    Sentinel = "Sentinel",
}

export interface ObjetosTienda {
    item_id:           number;
    weapon_id:         number | null;
    shield_id:         number | null;
    ability_id:        number | null;
    category_store_id: number;
    price:             string;
    category_Store:    AbilitiesCategory;
}
