import { Global, Module } from '@nestjs/common';
import { PrismaService } from './prisma.service';

@Global() // Esto permite usar Prisma en todo el sistema sin importarlo a cada rato
@Module({
  providers: [PrismaService],
  exports: [PrismaService],
})
export class PrismaModule {}