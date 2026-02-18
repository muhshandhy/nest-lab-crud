import { Controller, Post, Body } from '@nestjs/common';
import { ApiCreatedResponse, ApiTags } from '@nestjs/swagger';
import { AuthService } from './auth.service';
import { LoginDto } from './dto/login.dto';
import { AuthEntity } from './entity/auth.entity';

@Controller('auth')
@ApiTags('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('login')
  @ApiCreatedResponse({ type: AuthEntity })
  login(@Body() loginDto: LoginDto): Promise<AuthEntity> {
    return this.authService.login(loginDto.email, loginDto.password);
  }
}
