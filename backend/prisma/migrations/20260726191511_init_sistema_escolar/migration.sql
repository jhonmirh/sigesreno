-- CreateEnum
CREATE TYPE "RolEnum" AS ENUM ('ADMINISTRADOR', 'CONTROL_ESTUDIO', 'DIRECTOR', 'DOCENTE');

-- CreateEnum
CREATE TYPE "AccionAuditoria" AS ENUM ('CREATE', 'UPDATE', 'DELETE');

-- CreateEnum
CREATE TYPE "TipoCuentaBanco" AS ENUM ('CORRIENTE', 'AHORRO', 'OTRO');

-- CreateEnum
CREATE TYPE "Nacionalidad" AS ENUM ('VENEZOLANO', 'EXTRANJERO');

-- CreateEnum
CREATE TYPE "Sexo" AS ENUM ('MASCULINO', 'FEMENINO');

-- CreateEnum
CREATE TYPE "Parentesco" AS ENUM ('MADRE', 'PADRE', 'PERSONA_AUTORIZADA', 'OTRO');

-- CreateEnum
CREATE TYPE "TallaCamisaEnum" AS ENUM ('S', 'M', 'L', 'XL', 'XXL', 'XXXL', 'TALLA_10', 'TALLA_11', 'TALLA_12', 'TALLA_13', 'TALLA_14', 'TALLA_15', 'TALLA_16');

-- CreateEnum
CREATE TYPE "MencionPlan" AS ENUM ('MEDIA_GENERAL_BACHILLER', 'TECNICO_AGROPECUARIA_CIENCIAS_AGRICOLAS_PECUARIAS');

-- CreateEnum
CREATE TYPE "CondicionEstudiante" AS ENUM ('REGULAR', 'REPETIDOR', 'MATERIA_PENDIENTE', 'RETIRADO_PRIMEROS_30_DIAS', 'RETIRADO_MODIFICADO');

-- CreateTable
CREATE TABLE "Usuario" (
    "id" TEXT NOT NULL,
    "cedula" TEXT NOT NULL,
    "nombreUsuario" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "activo" BOOLEAN NOT NULL DEFAULT true,
    "creadoEn" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizadoEn" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RolUsuario" (
    "id" TEXT NOT NULL,
    "usuarioId" TEXT NOT NULL,
    "rol" "RolEnum" NOT NULL,

    CONSTRAINT "RolUsuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditoriaLog" (
    "id" TEXT NOT NULL,
    "usuarioId" TEXT,
    "accion" "AccionAuditoria" NOT NULL,
    "tablaAfectada" TEXT NOT NULL,
    "registroId" TEXT NOT NULL,
    "valorAnterior" JSONB,
    "valorNuevo" JSONB,
    "ipOrigen" TEXT,
    "fechaHora" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditoriaLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Profesor" (
    "id" TEXT NOT NULL,
    "usuarioId" TEXT,
    "cedula" TEXT NOT NULL,
    "nacionalidad" "Nacionalidad" NOT NULL DEFAULT 'VENEZOLANO',
    "primerNombre" TEXT NOT NULL,
    "segundoNombre" TEXT,
    "primerApellido" TEXT NOT NULL,
    "segundoApellido" TEXT,
    "estadoCivil" TEXT,
    "direccion" TEXT NOT NULL,
    "tituloPregrado" TEXT,
    "tituloPostgradoEsp" TEXT,
    "tituloPostgradoMaes" TEXT,
    "tituloDoctorado" TEXT,
    "otroTitulo" TEXT,
    "poseeDiscapacidad" BOOLEAN NOT NULL DEFAULT false,
    "informeMedicoDiscap" BOOLEAN NOT NULL DEFAULT false,
    "numeroHijos" INTEGER NOT NULL DEFAULT 0,
    "banco" TEXT,
    "tipoCuenta" TEXT,
    "numeroCuenta" TEXT,
    "codigoCargo" TEXT,
    "descripcionCargo" TEXT,
    "funcionInstitucion" TEXT,
    "tallaPantalón" TEXT,
    "tallaCamisa" TEXT,
    "tallaZapatos" INTEGER,
    "fechaIngresoMinisterio" TIMESTAMP(3),
    "creadoEn" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizadoEn" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Profesor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Representante" (
    "id" TEXT NOT NULL,
    "cedula" TEXT NOT NULL,
    "nacionalidad" "Nacionalidad" NOT NULL DEFAULT 'VENEZOLANO',
    "parentesco" "Parentesco" NOT NULL,
    "primerNombre" TEXT NOT NULL,
    "segundoNombre" TEXT,
    "primerApellido" TEXT NOT NULL,
    "segundoApellido" TEXT,
    "profesion" TEXT,
    "direccionHabitacion" TEXT NOT NULL,
    "lugarTrabajo" TEXT,
    "direccionTrabajo" TEXT,
    "telefonoPrincipal" TEXT NOT NULL,
    "telefonoSecundario" TEXT,
    "colaboracionInscrip" TEXT,
    "viveConEstudiante" BOOLEAN NOT NULL DEFAULT true,
    "descripcionAutoriz" TEXT,
    "lugarNacimiento" TEXT,
    "fechaNacimiento" TIMESTAMP(3),
    "sexo" "Sexo" NOT NULL,
    "correo" TEXT,
    "banco" TEXT,
    "tipoCuenta" "TipoCuentaBanco",
    "numeroCuenta" TEXT,
    "grupoSanguineo" TEXT,
    "creadoEn" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizadoEn" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Representante_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PersonaReferencia" (
    "id" TEXT NOT NULL,
    "estudianteId" TEXT NOT NULL,
    "cedula" TEXT NOT NULL,
    "nombres" TEXT NOT NULL,
    "apellidos" TEXT NOT NULL,
    "telefono" TEXT NOT NULL,
    "direccion" TEXT NOT NULL,

    CONSTRAINT "PersonaReferencia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Estudiante" (
    "id" TEXT NOT NULL,
    "cedula" TEXT,
    "nacionalidad" "Nacionalidad" NOT NULL DEFAULT 'VENEZOLANO',
    "primerNombre" TEXT NOT NULL,
    "segundoNombre" TEXT,
    "primerApellido" TEXT NOT NULL,
    "segundoApellido" TEXT,
    "sexo" "Sexo" NOT NULL,
    "telefono" TEXT,
    "correo" TEXT,
    "lugarNacimiento" TEXT NOT NULL,
    "estadoNacimiento" TEXT NOT NULL,
    "municipioNacimiento" TEXT NOT NULL,
    "parroquiaNacimiento" TEXT NOT NULL,
    "fechaNacimiento" TIMESTAMP(3) NOT NULL,
    "direccion" TEXT NOT NULL,
    "estaturaMetros" INTEGER NOT NULL,
    "estaturaCentimetros" INTEGER NOT NULL,
    "pesoKilos" INTEGER NOT NULL,
    "pesoGramos" INTEGER NOT NULL,
    "tallaCamisa" "TallaCamisaEnum" NOT NULL,
    "tallaPantalon" TEXT NOT NULL,
    "tallaZapatos" INTEGER NOT NULL,
    "grupoSanguineo" TEXT,
    "poseeDiscapacidad" BOOLEAN NOT NULL DEFAULT false,
    "informeMedicoDiscap" BOOLEAN NOT NULL DEFAULT false,
    "especificDiscapacidad" TEXT,
    "esAlergico" BOOLEAN NOT NULL DEFAULT false,
    "especificAlergia" TEXT,
    "representanteId" TEXT NOT NULL,
    "viveConMadre" BOOLEAN NOT NULL DEFAULT true,
    "nombreMadre" TEXT NOT NULL,
    "cedulaMadre" TEXT NOT NULL,
    "direccionMadre" TEXT NOT NULL,
    "telefonoMadre" TEXT,
    "viveConPadre" BOOLEAN NOT NULL DEFAULT true,
    "nombrePadre" TEXT NOT NULL,
    "cedulaPadre" TEXT NOT NULL,
    "direccionPadre" TEXT NOT NULL,
    "telefonoPadre" TEXT,
    "plantelDestino" TEXT,
    "ultimoAnoAprobado" TEXT NOT NULL,
    "literalUltimoAno" TEXT,
    "creadoEn" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizadoEn" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Estudiante_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentosEstudiante" (
    "id" TEXT NOT NULL,
    "estudianteId" TEXT NOT NULL,
    "copiaCedulaEstudiante" BOOLEAN NOT NULL DEFAULT false,
    "partidaNacimiento" BOOLEAN NOT NULL DEFAULT false,
    "boletaPromocion" BOOLEAN NOT NULL DEFAULT false,
    "fotoEstudiante" BOOLEAN NOT NULL DEFAULT false,
    "fotoRepresentante" BOOLEAN NOT NULL DEFAULT false,
    "copiaCedulaRepresent" BOOLEAN NOT NULL DEFAULT false,
    "notasCertificadas" BOOLEAN NOT NULL DEFAULT false,
    "cartaBuenaConducta" BOOLEAN NOT NULL DEFAULT false,
    "copiaCuentaBancaria" BOOLEAN NOT NULL DEFAULT false,
    "informeMedico" BOOLEAN NOT NULL DEFAULT false,
    "autorizacionNoPadres" BOOLEAN NOT NULL DEFAULT false,
    "observaciones" TEXT,

    CONSTRAINT "DocumentosEstudiante_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AnnoEscolar" (
    "id" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "fechaInicio" TIMESTAMP(3) NOT NULL,
    "fechaCierre" TIMESTAMP(3),
    "activo" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "AnnoEscolar_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SeccionAnnoEscolar" (
    "id" TEXT NOT NULL,
    "annoEscolarId" TEXT NOT NULL,
    "gradoAnno" INTEGER NOT NULL,
    "nombreProcer" TEXT NOT NULL,
    "mencion" "MencionPlan" NOT NULL,

    CONSTRAINT "SeccionAnnoEscolar_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InscripcionAnnoEscolar" (
    "id" TEXT NOT NULL,
    "estudianteId" TEXT NOT NULL,
    "annoEscolarId" TEXT NOT NULL,
    "seccionId" TEXT NOT NULL,
    "numeroListaFijo" INTEGER NOT NULL,
    "fechaInscripcion" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "condicion" "CondicionEstudiante" NOT NULL DEFAULT 'REGULAR',

    CONSTRAINT "InscripcionAnnoEscolar_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GrupoEstable" (
    "id" TEXT NOT NULL,
    "nombreGrupo" TEXT NOT NULL,
    "profesorId" TEXT NOT NULL,

    CONSTRAINT "GrupoEstable_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EstudianteGrupoEstable" (
    "id" TEXT NOT NULL,
    "grupoEstableId" TEXT NOT NULL,
    "estudianteId" TEXT NOT NULL,

    CONSTRAINT "EstudianteGrupoEstable_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RegistroRetiro" (
    "id" TEXT NOT NULL,
    "estudianteId" TEXT NOT NULL,
    "institucionDestino" TEXT NOT NULL,
    "razonRetiro" TEXT NOT NULL,
    "fechaRetiro" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "annoEscolarRetiro" TEXT NOT NULL,

    CONSTRAINT "RegistroRetiro_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Asignatura" (
    "id" TEXT NOT NULL,
    "codigoPlan" TEXT NOT NULL,
    "mencion" "MencionPlan" NOT NULL,
    "gradoAnno" INTEGER NOT NULL,
    "nombreMateria" TEXT NOT NULL,
    "esCualitativa" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Asignatura_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AsignacionProfesorSeccion" (
    "id" TEXT NOT NULL,
    "profesorId" TEXT NOT NULL,
    "seccionAnnoEscolarId" TEXT NOT NULL,
    "asignaturaId" TEXT NOT NULL,

    CONSTRAINT "AsignacionProfesorSeccion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NotaLapso" (
    "id" TEXT NOT NULL,
    "inscripcionId" TEXT NOT NULL,
    "asignaturaId" TEXT NOT NULL,
    "lapso" INTEGER NOT NULL,
    "notaCuantitativa" DOUBLE PRECISION,
    "notaCualitativa" TEXT,
    "esInasistente" BOOLEAN NOT NULL DEFAULT false,
    "notaRevision1" DOUBLE PRECISION,
    "notaRevision2" DOUBLE PRECISION,
    "definitivaMateria" DOUBLE PRECISION,
    "creadoEn" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizadoEn" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "NotaLapso_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EvaluacionDetalle" (
    "id" TEXT NOT NULL,
    "notaLapsoId" TEXT NOT NULL,
    "numeroEval" INTEGER NOT NULL,
    "tecnicaUtilizada" TEXT NOT NULL,
    "instrumentoUtil" TEXT NOT NULL,
    "fechaAplicacion" TIMESTAMP(3) NOT NULL,
    "horaAplicacion" TEXT NOT NULL,
    "notaOriginal" DOUBLE PRECISION,
    "nota2daForma" DOUBLE PRECISION,
    "inasistente1ra" BOOLEAN NOT NULL DEFAULT false,
    "inasistente2da" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "EvaluacionDetalle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NotaMateriaPendiente" (
    "id" TEXT NOT NULL,
    "inscripcionId" TEXT NOT NULL,
    "asignaturaId" TEXT NOT NULL,
    "fechaOctubre" TIMESTAMP(3),
    "octubreForma1" DOUBLE PRECISION,
    "octubreForma2" DOUBLE PRECISION,
    "octubreInasist" BOOLEAN NOT NULL DEFAULT false,
    "fechaDiciembre" TIMESTAMP(3),
    "diciembreForma1" DOUBLE PRECISION,
    "diciembreForma2" DOUBLE PRECISION,
    "diciembreInasist" BOOLEAN NOT NULL DEFAULT false,
    "fechaFebrero" TIMESTAMP(3),
    "febreroForma1" DOUBLE PRECISION,
    "febreroForma2" DOUBLE PRECISION,
    "febreroInasist" BOOLEAN NOT NULL DEFAULT false,
    "fechaMarzo" TIMESTAMP(3),
    "marzoForma1" DOUBLE PRECISION,
    "marzoForma2" DOUBLE PRECISION,
    "marzoInasist" BOOLEAN NOT NULL DEFAULT false,
    "revisionForma1" DOUBLE PRECISION,
    "revisionForma2" DOUBLE PRECISION,
    "aprobada" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "NotaMateriaPendiente_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_cedula_key" ON "Usuario"("cedula");

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_nombreUsuario_key" ON "Usuario"("nombreUsuario");

-- CreateIndex
CREATE UNIQUE INDEX "RolUsuario_usuarioId_rol_key" ON "RolUsuario"("usuarioId", "rol");

-- CreateIndex
CREATE UNIQUE INDEX "Profesor_usuarioId_key" ON "Profesor"("usuarioId");

-- CreateIndex
CREATE UNIQUE INDEX "Profesor_cedula_key" ON "Profesor"("cedula");

-- CreateIndex
CREATE UNIQUE INDEX "Representante_cedula_key" ON "Representante"("cedula");

-- CreateIndex
CREATE UNIQUE INDEX "PersonaReferencia_estudianteId_key" ON "PersonaReferencia"("estudianteId");

-- CreateIndex
CREATE UNIQUE INDEX "Estudiante_cedula_key" ON "Estudiante"("cedula");

-- CreateIndex
CREATE UNIQUE INDEX "DocumentosEstudiante_estudianteId_key" ON "DocumentosEstudiante"("estudianteId");

-- CreateIndex
CREATE UNIQUE INDEX "AnnoEscolar_nombre_key" ON "AnnoEscolar"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "SeccionAnnoEscolar_annoEscolarId_gradoAnno_nombreProcer_men_key" ON "SeccionAnnoEscolar"("annoEscolarId", "gradoAnno", "nombreProcer", "mencion");

-- CreateIndex
CREATE UNIQUE INDEX "InscripcionAnnoEscolar_estudianteId_annoEscolarId_key" ON "InscripcionAnnoEscolar"("estudianteId", "annoEscolarId");

-- CreateIndex
CREATE UNIQUE INDEX "InscripcionAnnoEscolar_seccionId_numeroListaFijo_key" ON "InscripcionAnnoEscolar"("seccionId", "numeroListaFijo");

-- CreateIndex
CREATE UNIQUE INDEX "EstudianteGrupoEstable_grupoEstableId_estudianteId_key" ON "EstudianteGrupoEstable"("grupoEstableId", "estudianteId");

-- CreateIndex
CREATE UNIQUE INDEX "AsignacionProfesorSeccion_profesorId_seccionAnnoEscolarId_a_key" ON "AsignacionProfesorSeccion"("profesorId", "seccionAnnoEscolarId", "asignaturaId");

-- AddForeignKey
ALTER TABLE "RolUsuario" ADD CONSTRAINT "RolUsuario_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuario"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AuditoriaLog" ADD CONSTRAINT "AuditoriaLog_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profesor" ADD CONSTRAINT "Profesor_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PersonaReferencia" ADD CONSTRAINT "PersonaReferencia_estudianteId_fkey" FOREIGN KEY ("estudianteId") REFERENCES "Estudiante"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Estudiante" ADD CONSTRAINT "Estudiante_representanteId_fkey" FOREIGN KEY ("representanteId") REFERENCES "Representante"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentosEstudiante" ADD CONSTRAINT "DocumentosEstudiante_estudianteId_fkey" FOREIGN KEY ("estudianteId") REFERENCES "Estudiante"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SeccionAnnoEscolar" ADD CONSTRAINT "SeccionAnnoEscolar_annoEscolarId_fkey" FOREIGN KEY ("annoEscolarId") REFERENCES "AnnoEscolar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InscripcionAnnoEscolar" ADD CONSTRAINT "InscripcionAnnoEscolar_estudianteId_fkey" FOREIGN KEY ("estudianteId") REFERENCES "Estudiante"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InscripcionAnnoEscolar" ADD CONSTRAINT "InscripcionAnnoEscolar_annoEscolarId_fkey" FOREIGN KEY ("annoEscolarId") REFERENCES "AnnoEscolar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InscripcionAnnoEscolar" ADD CONSTRAINT "InscripcionAnnoEscolar_seccionId_fkey" FOREIGN KEY ("seccionId") REFERENCES "SeccionAnnoEscolar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GrupoEstable" ADD CONSTRAINT "GrupoEstable_profesorId_fkey" FOREIGN KEY ("profesorId") REFERENCES "Profesor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EstudianteGrupoEstable" ADD CONSTRAINT "EstudianteGrupoEstable_grupoEstableId_fkey" FOREIGN KEY ("grupoEstableId") REFERENCES "GrupoEstable"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EstudianteGrupoEstable" ADD CONSTRAINT "EstudianteGrupoEstable_estudianteId_fkey" FOREIGN KEY ("estudianteId") REFERENCES "Estudiante"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RegistroRetiro" ADD CONSTRAINT "RegistroRetiro_estudianteId_fkey" FOREIGN KEY ("estudianteId") REFERENCES "Estudiante"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AsignacionProfesorSeccion" ADD CONSTRAINT "AsignacionProfesorSeccion_profesorId_fkey" FOREIGN KEY ("profesorId") REFERENCES "Profesor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AsignacionProfesorSeccion" ADD CONSTRAINT "AsignacionProfesorSeccion_seccionAnnoEscolarId_fkey" FOREIGN KEY ("seccionAnnoEscolarId") REFERENCES "SeccionAnnoEscolar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AsignacionProfesorSeccion" ADD CONSTRAINT "AsignacionProfesorSeccion_asignaturaId_fkey" FOREIGN KEY ("asignaturaId") REFERENCES "Asignatura"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NotaLapso" ADD CONSTRAINT "NotaLapso_inscripcionId_fkey" FOREIGN KEY ("inscripcionId") REFERENCES "InscripcionAnnoEscolar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NotaLapso" ADD CONSTRAINT "NotaLapso_asignaturaId_fkey" FOREIGN KEY ("asignaturaId") REFERENCES "Asignatura"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EvaluacionDetalle" ADD CONSTRAINT "EvaluacionDetalle_notaLapsoId_fkey" FOREIGN KEY ("notaLapsoId") REFERENCES "NotaLapso"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NotaMateriaPendiente" ADD CONSTRAINT "NotaMateriaPendiente_inscripcionId_fkey" FOREIGN KEY ("inscripcionId") REFERENCES "InscripcionAnnoEscolar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NotaMateriaPendiente" ADD CONSTRAINT "NotaMateriaPendiente_asignaturaId_fkey" FOREIGN KEY ("asignaturaId") REFERENCES "Asignatura"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
