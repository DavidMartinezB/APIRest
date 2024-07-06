import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ValidationService {

  private url = 'http://localhost:8081/users/validate'

  constructor(
    private http: HttpClient
  ) { }

  tokenValidation(token: string | null): Observable<any> {
    return this.http.post(this.url, { token });
  }

}
