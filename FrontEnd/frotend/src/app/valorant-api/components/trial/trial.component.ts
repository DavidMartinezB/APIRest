import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { environment } from '../../../../environments/environment'; 
import { AuthService } from '../../../auth/auth.service';

@Component({
  selector: 'app-trial',
  templateUrl: './trial.component.html',
  styleUrl: './trial.component.scss'
})
export class TrialComponent {
  token!: string
  public url: string = '';
  public json: any;
  public baseUrl: string = environment.URLLOCALHOST;

  constructor(
    private httpClient: HttpClient,
    private authService: AuthService
  ) { 
    this.makeResquest(this.baseUrl);
  }
  
  makeResquest(url: string) {
    return this.httpClient.get(url).subscribe((data) => {
      this.json = data;
    });
  }

  getUrl($event: any) {
    if (this.json === ''){
      this.json = null;
    }
    this.url = $event.target.value;
    console.log(this.url);
    this.makeResquest(`${this.baseUrl}/${this.url}?token=tokenforadmin`);
    console.log(this.json);
  }

  generateToken() {
    this.authService.getUserToken().subscribe((token) => {
      console.log(token);
      this.token = token;
    });
  }

}
