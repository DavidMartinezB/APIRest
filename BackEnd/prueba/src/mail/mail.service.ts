import { Injectable } from '@nestjs/common';
import { createTransport } from 'nodemailer';

@Injectable()
export class MailService {
  private transporter;

  constructor() {
    this.transporter = createTransport({
      service: 'gmail',
      auth: {
        user: process.env.EMAIL,
        pass: process.env.EMAIL_PASSWORD
      }
    });
  }

  async sendConfirmationEmail(to: string, token: string) {
    const url = `http://localhost:3000/auth/confirm?token=${token}`;

    await this.transporter.sendMail({
      to,
      subject: 'Confirm Email',
      html: `Please click this url to confirm your email: <a href="${url}">${url}</a>`
    });
  }
}