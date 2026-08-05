import { Module } from '@nestjs/common';
import { AnioEscolarService } from './anio-escolar.service';
import { AnioEscolarController } from './anio-escolar.controller';

@Module({
  controllers: [AnioEscolarController],
  providers: [AnioEscolarService],
})
export class AnioEscolarModule {}
