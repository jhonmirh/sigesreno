import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { UsersModule } from './users/users.module';
import { AcademicoModule } from './academico/academico.module';

@Module({
  imports: [PrismaModule, UsersModule, AcademicoModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
