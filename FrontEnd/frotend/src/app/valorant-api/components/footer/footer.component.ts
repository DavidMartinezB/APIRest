import { Component } from '@angular/core';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrl: './footer.component.scss'
})
export class FooterComponent {
  contacts = [
    {
      icon: '../../../../assets/images/github-mark-white.svg',
      link: 'https://github.com/PedroJSanchezUtrero/TFC'
    },
    {
      icon: '../../../../assets/images/mailto.png',
      link: 'mailto:dypfctdaw@gmail.com'
    },
  ]
}
