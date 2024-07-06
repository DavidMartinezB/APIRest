import { Component } from '@angular/core';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-features',
  templateUrl: './features.component.html',
  styleUrl: './features.component.scss'
})
export class FeaturesComponent {
  
  template = [
    {
      matIcon: 'database',
      title: 'API',
      description: 'Get all API details'
    },
    {
      matIcon: 'person',
      title: 'Agents',
      description: 'Get all agents details'
    },
    {
      matIcon: 'bolt',
      title: 'Abilities',
      description: 'Get all abilities details'
    },
    {
      matIcon: 'crop_free',
      title: 'Weapons',
      description: 'Get all weapons details'
    },
    {
      matIcon: 'gpp_maybe',
      title: 'Shields',
      description: 'Get all shields details'
    },
    {
      matIcon: 'store',
      title: 'Store',
      description: 'Get all store details'
    },
    {
      matIcon: 'settings',
      title: 'Agents Category',
      description: 'Get all agents category details'
    },
    {
      matIcon: 'settings',
      title: 'Weapons Category',
      description: 'Get all weapons category details'
    },
    {
      matIcon: 'settings',
      title: 'Abilities Category',
      description: 'Get all abilities category details'
    },
    {
      matIcon: 'settings',
      title: 'Store Category',
      description: 'Get all store category details'    
    }
  ]

  constructor() {}


}
