import { Module } from '@nestjs/common';
import { RepresentativesService } from './this.prisma.representative';
import { RepresentativesController } from './representatives.controller';
import { PrismaModule } from '../prisma/prisma.module'; // <-- Importar

@Module({
  imports: [PrismaModule], // <-- Añadir aquí
  controllers: [RepresentativesController],
  providers: [RepresentativesService],
})
export class RepresentativesModule {}