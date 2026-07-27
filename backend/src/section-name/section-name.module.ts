import { Module } from '@nestjs/common';
import { SectionNameService } from './section-name.service';
import { SectionNameController } from './section-name.controller';
import { PrismaModule } from '../prisma/prisma.module'; // <-- Importar
@Module({
  controllers: [SectionNameController],
  providers: [SectionNameService],
  imports: [PrismaModule],
})
export class SectionNameModule {}
