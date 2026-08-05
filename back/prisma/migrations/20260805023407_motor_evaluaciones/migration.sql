-- CreateTable
CREATE TABLE "AnioEscolar" (
    "id" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "fechaInicio" TIMESTAMP(3) NOT NULL,
    "fechaCierreInscripcion" TIMESTAMP(3) NOT NULL,
    "fechaFin" TIMESTAMP(3) NOT NULL,
    "activo" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "AnioEscolar_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Matricula" (
    "id" TEXT NOT NULL,
    "estudianteId" TEXT NOT NULL,
    "seccionId" TEXT NOT NULL,
    "anioEscolarId" TEXT NOT NULL,
    "numeroLista" INTEGER NOT NULL,
    "condicion" TEXT NOT NULL DEFAULT 'Regular',
    "fechaRetiro" TIMESTAMP(3),
    "motivoRetiro" TEXT,
    "institucionDestino" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Matricula_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GrupoEstable" (
    "id" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "profesorId" TEXT NOT NULL,

    CONSTRAINT "GrupoEstable_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InscripcionGrupoEstable" (
    "id" TEXT NOT NULL,
    "estudianteId" TEXT NOT NULL,
    "grupoEstableId" TEXT NOT NULL,

    CONSTRAINT "InscripcionGrupoEstable_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Lapso" (
    "id" TEXT NOT NULL,
    "numero" INTEGER NOT NULL,
    "anioEscolarId" TEXT NOT NULL,

    CONSTRAINT "Lapso_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlanEvaluacion" (
    "id" TEXT NOT NULL,
    "materiaId" TEXT NOT NULL,
    "lapsoId" TEXT NOT NULL,
    "tecnica" TEXT NOT NULL,
    "instrumento" TEXT NOT NULL,
    "fechaAplicacion" TIMESTAMP(3) NOT NULL,
    "horaAplicacion" TEXT NOT NULL,

    CONSTRAINT "PlanEvaluacion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Calificacion" (
    "id" TEXT NOT NULL,
    "matriculaId" TEXT NOT NULL,
    "planEvaluacionId" TEXT NOT NULL,
    "notaForma1" DOUBLE PRECISION,
    "inasistenteForma1" BOOLEAN NOT NULL DEFAULT false,
    "notaForma2" DOUBLE PRECISION,
    "inasistenteForma2" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Calificacion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MateriaPendiente" (
    "id" TEXT NOT NULL,
    "estudianteId" TEXT NOT NULL,
    "materiaId" TEXT NOT NULL,
    "anioEscolarId" TEXT NOT NULL,
    "oportunidad" TEXT NOT NULL,
    "notaForma1" DOUBLE PRECISION,
    "inasistenteForma1" BOOLEAN NOT NULL DEFAULT false,
    "notaForma2" DOUBLE PRECISION,
    "inasistenteForma2" BOOLEAN NOT NULL DEFAULT false,
    "aprobado" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "MateriaPendiente_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "AnioEscolar_nombre_key" ON "AnioEscolar"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "Matricula_estudianteId_anioEscolarId_key" ON "Matricula"("estudianteId", "anioEscolarId");

-- CreateIndex
CREATE UNIQUE INDEX "InscripcionGrupoEstable_estudianteId_grupoEstableId_key" ON "InscripcionGrupoEstable"("estudianteId", "grupoEstableId");

-- CreateIndex
CREATE UNIQUE INDEX "Calificacion_matriculaId_planEvaluacionId_key" ON "Calificacion"("matriculaId", "planEvaluacionId");

-- AddForeignKey
ALTER TABLE "Matricula" ADD CONSTRAINT "Matricula_estudianteId_fkey" FOREIGN KEY ("estudianteId") REFERENCES "Estudiante"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Matricula" ADD CONSTRAINT "Matricula_seccionId_fkey" FOREIGN KEY ("seccionId") REFERENCES "Seccion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Matricula" ADD CONSTRAINT "Matricula_anioEscolarId_fkey" FOREIGN KEY ("anioEscolarId") REFERENCES "AnioEscolar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GrupoEstable" ADD CONSTRAINT "GrupoEstable_profesorId_fkey" FOREIGN KEY ("profesorId") REFERENCES "Profesor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InscripcionGrupoEstable" ADD CONSTRAINT "InscripcionGrupoEstable_estudianteId_fkey" FOREIGN KEY ("estudianteId") REFERENCES "Estudiante"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InscripcionGrupoEstable" ADD CONSTRAINT "InscripcionGrupoEstable_grupoEstableId_fkey" FOREIGN KEY ("grupoEstableId") REFERENCES "GrupoEstable"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lapso" ADD CONSTRAINT "Lapso_anioEscolarId_fkey" FOREIGN KEY ("anioEscolarId") REFERENCES "AnioEscolar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlanEvaluacion" ADD CONSTRAINT "PlanEvaluacion_materiaId_fkey" FOREIGN KEY ("materiaId") REFERENCES "Materia"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlanEvaluacion" ADD CONSTRAINT "PlanEvaluacion_lapsoId_fkey" FOREIGN KEY ("lapsoId") REFERENCES "Lapso"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Calificacion" ADD CONSTRAINT "Calificacion_matriculaId_fkey" FOREIGN KEY ("matriculaId") REFERENCES "Matricula"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Calificacion" ADD CONSTRAINT "Calificacion_planEvaluacionId_fkey" FOREIGN KEY ("planEvaluacionId") REFERENCES "PlanEvaluacion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MateriaPendiente" ADD CONSTRAINT "MateriaPendiente_estudianteId_fkey" FOREIGN KEY ("estudianteId") REFERENCES "Estudiante"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MateriaPendiente" ADD CONSTRAINT "MateriaPendiente_materiaId_fkey" FOREIGN KEY ("materiaId") REFERENCES "Materia"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
