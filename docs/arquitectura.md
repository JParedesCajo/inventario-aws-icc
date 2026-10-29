# Arquitectura AWS — Sistema Web de Gestión de Inventario

**Proyecto:** Sistema Web de Gestión de Inventario  
**Equipo:** Grupo 05  
**Tecnología de infraestructura:** Terraform  
**Plataforma:** Amazon Web Services (AWS)

## 1. Descripción de la arquitectura

El proyecto contempla el diseño y la implementación progresiva de una infraestructura AWS para un Sistema Web de Gestión de Inventario, orientado a la administración centralizada de productos, existencias y movimientos de inventario de 120 sucursales.

La arquitectura propuesta utiliza servicios de red, cómputo, almacenamiento, seguridad, monitoreo y automatización para atender los requerimientos no funcionales del sistema.

## 2. Objetivos de la arquitectura

- Soportar hasta 1,000 usuarios concurrentes.
- Procesar aproximadamente 100,000 movimientos de inventario diarios.
- Alcanzar una disponibilidad mensual objetivo del 99.9 %.
- Mantener tiempos de respuesta de hasta 2 segundos en operaciones principales.
- Proteger la información mediante autenticación, autorización y cifrado.
- Conservar respaldos diarios durante 30 días.
- Mantener registros de auditoría durante 90 días.

Estos objetivos deberán verificarse mediante pruebas cuando los componentes correspondientes estén implementados.

## 3. Componentes de la arquitectura objetivo

### 3.1 Red y conectividad

- **Amazon VPC:** red virtual que permite organizar y aislar los recursos.
- **Subredes públicas:** destinadas a componentes que requieren conectividad pública.
- **Subredes privadas:** destinadas a los servidores de aplicación y bases de datos.
- **Internet Gateway:** permite la conectividad a internet de los recursos que cumplen las condiciones de enrutamiento y acceso.
- **NAT Gateway:** proporciona conectividad saliente a recursos privados sin exponerlos directamente a conexiones entrantes desde internet.

### 3.2 Cómputo y distribución

- **Application Load Balancer:** distribuye solicitudes hacia los servidores de aplicación.
- **Amazon EC2:** ejecuta los servicios del sistema de inventario.
- **Auto Scaling:** permite ajustar la cantidad de instancias según las condiciones configuradas.

### 3.3 Datos y procesamiento

- **Amazon RDS Multi-AZ:** base de datos relacional con mecanismos de disponibilidad y conmutación ante fallos.
- **Amazon ElastiCache:** almacenamiento temporal de datos consultados frecuentemente.
- **Amazon SQS:** cola para desacoplar tareas asíncronas.
- **AWS Lambda:** procesamiento de tareas en segundo plano.
- **Amazon S3:** almacenamiento de archivos y recursos del sistema.

Los movimientos críticos de stock deberán conservar la consistencia de la información. Las tareas asíncronas se diseñarán sin asumir que un mensaje pendiente equivale a una operación confirmada.

### 3.4 Seguridad

- **AWS WAF:** protección frente a determinadas solicitudes web maliciosas.
- **Amazon Cognito:** autenticación y administración de usuarios.
- **AWS IAM:** gestión de permisos de los recursos AWS.
- **AWS Secrets Manager:** administración de credenciales y secretos.
- **AWS KMS:** administración de claves de cifrado.

### 3.5 Monitoreo y recuperación

- **Amazon CloudWatch:** métricas, registros y alarmas.
- **Amazon SNS:** distribución de notificaciones.
- **AWS CloudTrail:** registro de actividad de las API de AWS.
- **AWS Backup:** administración de políticas de respaldo para recursos compatibles.

### 3.6 Automatización

- **Terraform:** definición y administración de infraestructura mediante código.
- **Git:** control de versiones.
- **GitHub:** repositorio del proyecto.
- **GitHub Actions:** validación y automatización de procesos de integración.

## 4. Componentes priorizados para la implementación

Durante la presente etapa del proyecto se priorizan:

| Componente | Finalidad | Estado |
|---|---|---|
| AWS Provider | Configurar la conexión de Terraform con AWS | Pendiente |
| Amazon VPC | Crear la red principal del proyecto | Pendiente |
| Subred pública A | Distribuir recursos en la primera zona | Pendiente |
| Subred pública B | Distribuir recursos en la segunda zona | Pendiente |
| Internet Gateway | Habilitar conectividad de la VPC | Pendiente |
| Tablas de rutas | Configurar el enrutamiento de red | Pendiente |
| Security Groups | Establecer controles de acceso de red | Pendiente |
| Amazon EC2 | Ejecutar una aplicación demostrativa | Opcional |

Los demás componentes permanecen definidos en la arquitectura objetivo para las siguientes etapas.

## 5. Relación entre arquitectura y Terraform

Cada componente implementado se representará mediante recursos declarativos en archivos `.tf`.

El código se organizará por funcionalidades para permitir:

1. Revisar los cambios antes del despliegue.
2. Validar la configuración.
3. Reproducir la infraestructura.
4. Registrar avances mediante Git.
5. Documentar las decisiones técnicas.

## 6. Estrategia de implementación

El desarrollo se organizará en avances independientes:

1. Configuración del proveedor AWS.
2. Implementación de la VPC.
3. Creación de subredes.
4. Configuración del Internet Gateway y rutas.
5. Implementación de controles de seguridad.
6. Despliegue opcional de una aplicación demostrativa.

Cada avance deberá contar con evidencia y un commit identificable.

## 7. Consideraciones técnicas

La infraestructura inicial no representa la arquitectura completa de producción.

La distribución en dos zonas de disponibilidad establece una base para el diseño, pero no garantiza por sí sola el cumplimiento del 99.9 % de disponibilidad.

Asimismo, la implementación de la VPC no demuestra todavía los objetivos de concurrencia, rendimiento ni continuidad operativa.

## 8. Control de costos

Se priorizará el despliegue de recursos necesarios para las pruebas y se evitará activar componentes costosos sin una revisión previa.

La creación y eliminación de recursos se realizará mediante Terraform, conservando las evidencias correspondientes.

## 9. Estado del documento

Documento de arquitectura correspondiente al desarrollo progresivo del proyecto semestral del Grupo 05.

**Estado:** arquitectura documentada; implementación Terraform pendiente.