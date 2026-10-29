# Alcance del Proyecto — Sistema Web de Gestión de Inventario

## 1. Descripción del proyecto

El grupo desarrolla una propuesta de Infraestructura para un Sistema Web de Gestión de Inventario, utilizando Amazon Web Services (AWS) y Terraform.

La arquitectura está orientada a una organización con múltiples sucursales que requiere administrar sus existencias y movimientos de inventario de manera centralizada, segura y disponible.

## 2. Requerimientos de la arquitectura objetivo

La propuesta general considera:

- 120 sucursales.
- Hasta 1,000 usuarios concurrentes.
- Aproximadamente 100,000 movimientos de inventario diarios.
- Disponibilidad mensual objetivo del 99.9 %.
- Tiempo de respuesta objetivo de hasta 2 segundos para las operaciones principales.
- Respaldos diarios con retención de 30 días.
- Registros de auditoría con retención de 90 días.

Estos valores corresponden a los objetivos de la arquitectura completa y no a resultados ya alcanzados por el laboratorio.

## 3. Objetivo del laboratorio

Implementar y documentar progresivamente una parte representativa de la infraestructura AWS mediante Terraform, demostrando la creación automatizada de recursos, la organización del código y el control de versiones con Git.

## 4. Componentes incluidos en el laboratorio

Se propone implementar, de forma progresiva:

1. **AWS Provider:** configuración de Terraform para interactuar con AWS.
2. **Amazon VPC:** creación de una red virtual para el sistema.
3. **Subredes públicas:** distribución básica en dos zonas de disponibilidad.
4. **Internet Gateway:** componente de conectividad de la VPC.
5. **Tablas de rutas:** configuración del enrutamiento de las subredes.
6. **Amazon EC2 (opcional):** servidor de demostración para una aplicación básica de inventario, sujeto a la revisión previa de costos.

## 5. Componentes fuera del alcance inicial

La primera implementación no contempla:

- Amazon RDS Multi-AZ.
- Amazon ElastiCache.
- NAT Gateway.
- Amazon SQS y AWS Lambda.
- Amazon CloudFront y AWS WAF.
- Amazon Cognito.
- Balanceador de carga y Auto Scaling.
- Infraestructura completa de producción.

Estos componentes forman parte de la arquitectura objetivo, pero podrán abordarse en futuros avances.

## 6. Metodología de implementación

El trabajo se desarrollará mediante avances pequeños y verificables:

1. Escribir o modificar el código.
2. Documentar la finalidad del cambio.
3. Ejecutar las validaciones correspondientes.
4. Guardar evidencias.
5. Registrar un commit específico en Git.

Cada avance contará con una entrada en la bitácora del proyecto.

## 7. Control de costos (MODIFICABLE POR COSTOS)

Se priorizarán recursos de bajo costo y se evitará desplegar servicios que no sean necesarios para la demostración.

Antes de ejecutar `terraform apply`, se revisará el plan de Terraform y el posible costo de los recursos.

Los recursos temporales se eliminarán al finalizar las pruebas, previa verificación de que ya se guardaron las evidencias.

## 8. Resultados esperados

Al finalizar el laboratorio se espera demostrar:

- Un repositorio Git organizado.
- Código Terraform documentado.
- Validación de la configuración.
- Creación reproducible de una infraestructura básica de red.
- Evidencias de los recursos desplegados, si se autoriza el despliegue.
- Historial de commits que permita explicar cada avance.

##