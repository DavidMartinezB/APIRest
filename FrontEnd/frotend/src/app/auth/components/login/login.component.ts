import { Component } from '@angular/core';
import { AuthService } from '../../auth.service';
import { ValidationService } from '../../../shared/services/validation.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})

export class LoginComponent {
  email!: string;
  password!: string;
  error?: string;


  
  constructor(
    private authService: AuthService,
    private ValidationService: ValidationService
  ) {
    this.ValidationService.tokenValidation(localStorage.getItem('token')).subscribe(
      (response) => console.log('Token validado:', response),
      error => console.error('Error al validar el token:', error
    ));
     
  }

  ngOninit() {

  }


  login() {
    this.authService.login(this.email, this.password).subscribe(
      (response) => {
          const token = response['access_token'];
          localStorage.setItem('token', token);
          console.log('Token:', token);
      },
      error => {
        console.error('Error al iniciar sesión:', error);
        this.error = 'Usuario o contraseña incorrectos';
      }
    );
  }
}