import { Module } from '@nestjs/common';
import { SchoolYearService } from './school-year.service';
import { SchoolYearController } from './school-year.controller';
import { PrismaModule } from '../prisma/prisma.module'; // <-- Importar
@Module({
  controllers: [SchoolYearController],
  providers: [SchoolYearService],
  imports: [PrismaModule],
})
export class SchoolYearModule {}
