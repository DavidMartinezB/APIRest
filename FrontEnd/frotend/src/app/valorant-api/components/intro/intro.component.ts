import { Component } from '@angular/core';
import { ApiConnectionService } from '../../services/api-connection.service';

@Component({
  selector: 'app-intro',
  templateUrl: './intro.component.html',
  styleUrl: './intro.component.scss'
})
export class IntroComponent {
  constructor(
    private apiConectionService: ApiConnectionService
  ) {
    this.apiConectionService.demoInfo();
  }
}
