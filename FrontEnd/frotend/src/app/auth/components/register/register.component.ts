import { Component } from '@angular/core';
import { AuthService } from '../../auth.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrl: './register.component.scss'
})
export class RegisterComponent {
  username!: string;
  firstName!: string;
  lastName!: string;
  email!: string;
  password!: string;
  error?: string;

  constructor(private authService: AuthService) {}

  register() {
    this.authService.register(this.username, this.firstName, this.lastName, this.email, this.password).subscribe(
      (response) => {
        console.log('Usuario registrado:', response);
        const token = response['access_token'];
        localStorage.setItem('token', token);
        console.log('Token:', token);
      },
      error => {
        console.error('Error al registrar usuario:', error);
        this.error = 'Error al registrar usuario';
      }
    );
  }
}
