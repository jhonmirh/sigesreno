import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { AuthModule } from './auth/auth.module';
import { StudentsModule } from './students/students.module';
import { RepresentativesModule } from './representatives/representatives.module';
import { SectionNameModule } from './section-name/section-name.module';
import { SchoolYearModule } from './school-year/school-year.module';
import { SpecialtyModule } from './specialty/specialty.module';
import { SectionModule } from './section/section.module';
import { EnrollmentModule } from './enrollment/enrollment.module';

@Module({
  imports: [PrismaModule, AuthModule, StudentsModule, RepresentativesModule, SectionNameModule, SchoolYearModule, SpecialtyModule, SectionModule, EnrollmentModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
