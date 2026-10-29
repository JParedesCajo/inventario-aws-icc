# Sistema Web de Gestión de Inventario — Grupo 05

**Infraestructura como Código (IaC) con Terraform y Amazon Web Services (AWS)**

## 1. Descripción del proyecto

El proyecto **Sistema Web de Gestión de Inventario** tiene como finalidad diseñar e implementar progresivamente una infraestructura en la nube utilizando Amazon Web Services (AWS) y Terraform.

La solución está orientada a una organización con múltiples sucursales que requiere centralizar la gestión de inventarios, garantizar la disponibilidad de la información y preparar una infraestructura escalable, segura y mantenible.

El desarrollo se organiza mediante funcionalidades incrementales, documentación técnica y control de versiones en GitHub.

## 2. Requerimientos de la solución

La arquitectura propuesta considera los siguientes requerimientos:

| Requerimiento | Objetivo |
|---|---|
| Sucursales | 120 |
| Usuarios concurrentes | Hasta 1,000 |
| Movimientos de inventario | Aproximadamente 100,000 diarios |
| Disponibilidad mensual | 99.9% |
| Tiempo de respuesta | Máximo 2 segundos para operaciones principales |
| Respaldos | Diarios, con retención de 30 días |
| Registros de auditoría | Retención de 90 días |

Estos valores corresponden a los objetivos de diseño de la solución y no a resultados de pruebas de carga o disponibilidad.

## 3. Objetivo general

Diseñar e implementar progresivamente la infraestructura AWS del Sistema Web de Gestión de Inventario mediante Terraform, aplicando principios de alta disponibilidad, seguridad, escalabilidad, automatización y gestión de infraestructura como código.

### Objetivos específicos

- Organizar la infraestructura mediante configuraciones Terraform reutilizables y versionadas.
- Implementar la base de red utilizando Amazon VPC y subredes distribuidas en zonas de disponibilidad.
- Preparar la arquitectura para incorporar servicios de cómputo, almacenamiento, seguridad y monitoreo.
- Validar los cambios antes de su despliegue.
- Documentar las decisiones técnicas, incidencias y resultados de cada avance.
- Mantener trazabilidad mediante Git y GitHub.

## 4. Arquitectura AWS propuesta

La arquitectura de referencia contempla los siguientes componentes:

| Categoría | Servicios AWS |
|---|---|
| Red | Amazon VPC, subredes, Internet Gateway, NAT Gateway y tablas de rutas |
| Distribución de tráfico | Amazon Route 53, CloudFront y Application Load Balancer |
| Seguridad y autenticación | AWS WAF, IAM, Amazon Cognito, Secrets Manager y AWS KMS |
| Cómputo | Amazon EC2, Auto Scaling y AWS Lambda |
| Base de datos | Amazon RDS Multi-AZ |
| Caché | Amazon ElastiCache |
| Mensajería | Amazon SQS y Amazon SNS |
| Almacenamiento y respaldo | Amazon S3 y AWS Backup |
| Monitoreo y auditoría | Amazon CloudWatch, CloudTrail y AWS X-Ray |

**Importante:** estos servicios forman parte de la arquitectura objetivo. Su inclusión en el diseño no significa que todos estén implementados o desplegados.

La implementación se desarrolla por etapas, priorizando los componentes fundamentales de red.

## 5. Tecnologías y herramientas

| Herramienta | Utilización |
|---|---|
| Terraform | Definición y gestión declarativa de infraestructura |
| AWS | Plataforma de servicios en la nube |
| AWS CLI | Autenticación y consultas a servicios AWS |
| Visual Studio Code | Desarrollo y edición del proyecto |
| Git | Control de versiones |
| GitHub | Repositorio remoto y seguimiento de cambios |
| Markdown | Documentación técnica y bitácoras |

## 6. Estructura del repositorio

```text
inventario-aws-icc/
├── .github/
│   └── workflows/
├── docs/
│   ├── bitacora/
│   │   ├── 01-inicializacion.md
│   │   ├── 02-documentacion.md
│   │   ├── 03-proveedor-aws.md
│   │   ├── 04-vpc.md
│   │   ├── 05-subredes.md
│   │   └── 06-rutas.md
│   ├── alcance.md
│   └── arquitectura.md
├── terraform/
│   └── environments/
│       └── dev/
│           ├── main.tf
│           ├── providers.tf
│           ├── variables.tf
│           ├── versions.tf
│           └── .terraform.lock.hcl
├── .gitignore
└── README.md
```

Los archivos de bitácora pueden existir como documentos en preparación antes de que su funcionalidad correspondiente esté terminada.

## 7. Metodología de desarrollo

El proyecto utiliza un enfoque incremental basado en funcionalidades y control de versiones.

Cada avance sigue el siguiente procedimiento:

1. Definir el objetivo y alcance de la funcionalidad.
2. Implementar los recursos o configuraciones mediante Terraform.
3. Aplicar formato y validar la configuración.
4. Revisar el plan de infraestructura cuando corresponda.
5. Documentar los cambios, resultados e incidencias.
6. Registrar un commit descriptivo en Git.
7. Publicar los cambios en GitHub.

### Convenciones de commits

Se utiliza una convención basada en el tipo de cambio:

- `feat:` incorporación de funcionalidades o recursos.
- `docs:` actualización de documentación.
- `fix:` corrección de errores.
- `chore:` configuración y mantenimiento del proyecto.
- `refactor:` reorganización del código sin modificar su comportamiento previsto.

## 8. Estado de implementación

### Sprint 1 — Infraestructura base

| Avance | Componente | Estado |
|---|---|---|
| 01 | Inicialización del repositorio y herramientas | Completado |
| 02 | Documentación y alcance de la arquitectura | Completado |
| 03 | Configuración del proveedor AWS | Completado |
| 04 | Implementación de Amazon VPC | Codificado y validado |
| 05 | Subredes públicas en dos zonas de disponibilidad | En desarrollo |
| 06 | Internet Gateway y tablas de rutas | Pendiente |

### Infraestructura implementada en código

**Amazon VPC**

- Recurso Terraform: `aws_vpc.inventario`.
- Nombre: `inventario-vpc-dev`.
- Región: `us-east-2`.
- CIDR: `10.0.0.0/16`.
- Soporte DNS habilitado.
- Nombres de host DNS habilitados.

**Subredes públicas — en desarrollo**

- Subred A: `10.0.1.0/24`, zona `us-east-2a`.
- Subred B: `10.0.2.0/24`, zona `us-east-2b`.

El estado de estas subredes se actualizará después de completar su validación y registrar el avance correspondiente.

## 9. Validación de Terraform

Para trabajar con la configuración del entorno de desarrollo:

```powershell
cd terraform/environments/dev
```

Verificar el formato:

```powershell
terraform fmt -check
```

Validar la configuración:

```powershell
terraform validate
```

Generar el plan de infraestructura:

```powershell
terraform plan
```

La generación de un plan permite revisar los cambios previstos, pero no implica que los recursos hayan sido creados en AWS.

## 10. Seguridad y control de costos

Se aplican las siguientes medidas durante el desarrollo:

- Uso de un usuario IAM específico para Terraform.
- Autenticación mediante un perfil local de AWS CLI.
- Exclusión de credenciales, archivos de estado y planes guardados del repositorio Git.
- Revisión de recursos y costos antes de cualquier despliegue.
- Implementación progresiva para evitar aprovisionamiento innecesario.
- Registro de incidencias relacionadas con permisos y configuración.

### Restricción de despliegue identificada

Durante la implementación de la VPC, la ejecución de `terraform apply` fue rechazada por AWS con el error `UnauthorizedOperation`, debido a una denegación explícita de `ec2:CreateVpc` mediante una Service Control Policy (SCP).

Por esta razón, la infraestructura se mantiene actualmente en fase de implementación y validación declarativa.

El despliegue real quedará pendiente hasta disponer de un entorno AWS autorizado.

## 11. Documentación técnica

La carpeta `docs/` contiene:

- **alcance.md:** objetivos, límites y resultados esperados.
- **arquitectura.md:** descripción y justificación de los componentes AWS.
- **bitacora/:** registro progresivo de implementaciones, validaciones, incidencias y decisiones técnicas.

## 12. Próximas implementaciones

Las siguientes funcionalidades previstas son:

1. Completar las subredes públicas en dos zonas de disponibilidad.
2. Implementar Internet Gateway.
3. Configurar tablas de rutas y asociaciones.
4. Evaluar subredes privadas para cómputo y datos.
5. Incorporar componentes adicionales de la arquitectura según el alcance y tiempo disponibles.

## 13. Equipo del proyecto

**Grupo 05 — Infraestructura como Código**

El repositorio se organiza por áreas de responsabilidad: arquitectura, redes, seguridad, automatización y documentación. El historial de Git registra los cambios efectivamente realizados.

## 14. Estado general

**Proyecto en desarrollo — Sprint 1: infraestructura de red AWS con Terraform.**

La arquitectura completa constituye el diseño de referencia del sistema. La implementación actual representa una parte de esa arquitectura y continuará ampliándose progresivamente.