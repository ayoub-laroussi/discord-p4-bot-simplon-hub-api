import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('classes')
  async getClasses() {
    return this.appService.getClasses();
  }

  @Get('weapons')
  async getWeapons() {
    return this.appService.getWeapons();
  }

  @Get('bosses')
  async getBosses() {
    return this.appService.getBosses();
  }
}
