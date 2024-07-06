import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ApiConnectionService {

  private baseUrl = 'http://localhost:8081/api/';
  constructor(
    private http: HttpClient
  ) { }

  apiConection() {
    this.http.get(this.baseUrl).subscribe((data) => {
      console.log(data);
    });
  }


  demoInfo() {
    const endpoints = ['', 'characters', 'abilities']
    let demoJson = {
      status: 200,
      data: [] as any[] // provide a type for the data array
    };
  
    // Itera sobre cada endpoint
    endpoints.forEach(endpoint => {
      // Haz una solicitud GET al endpoint
      this.http.get(`${this.baseUrl}${endpoint}?token=tokenforadmin`).subscribe((data) => {
        // Asigna los datos directamente a formattedData
        let formattedData: any = data;
  
        demoJson.data.push(formattedData);
      });
    });
    console.log(demoJson)
  }
}
