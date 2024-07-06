import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, map, Observable, of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private baseUrl = 'http://localhost:8081/users';

  constructor(private http: HttpClient) {}

  login(email: string, password: string): Observable<any> {
    return this.http.post(`${this.baseUrl}/login`, { email, password });
  }

  register(username: string, firstName: string, lastName: string, email: string, password: string): Observable<any> {
    return this.http.post(`${this.baseUrl}`, { username, firstName, lastName, email, password });
  }

  getUserToken() {
    const token = localStorage.getItem('token');
    if (token) {
      return this.http.post(`${this.baseUrl}/validate`, { token }).pipe(
        map((response: any) => {
          if (response.valid) {
            console.log(response.user);
            return response.user.token;
          } else {
            localStorage.removeItem('token');
            console.log('Token is not valid');
            return false;
          }
        }),
        catchError(() => {
          console.log('Error validating token');
          return of(false);
        })
      );
    } else {
      return of(false);
    }

  }

  // checkToken() {
  //   const token = localStorage.getItem('token');
  //   let valid = false;
  //   if (token) {
  //     this.http.post(`${this.baseUrl}/validate`, { token }).subscribe((response: any) => {
  //       console.log(response);
  //       if (response.valid) {
  //         valid = true;
  //       } else {
  //         localStorage.removeItem('token');
  //         console.log('Token is not valid');
  //         valid = false;
  //       }
  //     });
  //   }
  //   console.log(valid);
  //   return valid;
  // }

  checkToken(): Observable<boolean> {
    const token = localStorage.getItem('token');
    if (token) {
      return this.http.post(`${this.baseUrl}/validate`, { token }).pipe(
        map((response: any) => {
          if (response.valid) {
            return true;
          } else {
            localStorage.removeItem('token');
            console.log('Token is not valid');
            return false;
          }
        }),
        catchError(() => {
          console.log('Error validating token');
          return of(false);
        })
      );
    } else {
      return of(false);
    }
  }
}
