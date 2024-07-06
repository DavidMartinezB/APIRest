import { Component, OnInit } from '@angular/core';
import { AuthService } from './auth/auth.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent implements OnInit{
  title = 'frotend';

  constructor(
    private authService: AuthService
  ) {

  }
  
  ngOnInit() {
    this.authService.checkToken().subscribe(
      (response) => {
        if (response) {
          console.log('Token is valid');
        } else {
          console.log('Token is not valid');
        }
      },
      (error) => {
        console.error('Error validating token');
      }
    );
  }
}
