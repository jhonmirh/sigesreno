import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { UsersModule } from './users/users.module';
import { AcademicoModule } from './academico/academico.module';
import { ProfesoresModule } from './profesores/profesores.module';
import { RepresentantesModule } from './representantes/representantes.module';
import { EstudiantesModule } from './estudiantes/estudiantes.module';
import { AnioEscolarModule } from './anio-escolar/anio-escolar.module';
import { MatriculaModule } from './matricula/matricula.module';
import { GruposEstablesModule } from './grupos-estables/grupos-estables.module';
import { EvaluacionesModule } from './evaluaciones/evaluaciones.module';

@Module({
  imports: [PrismaModule, UsersModule, AcademicoModule, ProfesoresModule, RepresentantesModule, EstudiantesModule, AnioEscolarModule, MatriculaModule, GruposEstablesModule, EvaluacionesModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
