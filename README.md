# DESCLI 🔍🏗️

Este repositorio contiene las herramientas especializadas en la ingeniería inversa y descompilación de sistemas desarrollados en entornos **XBase (Clipper/FoxPro)**. Es un módulo de recuperación técnica diseñado para auditar y migrar lógica de negocio desde ejecutables *legacy* hacia arquitecturas modernas.

## 🚀 Propósito del Proyecto

Proveer un entorno de análisis para la extracción de código fuente, estructuras de datos y flujos de procesos de aplicaciones antiguas donde el código original no está disponible. **DESCLI** permite a los auditores y desarrolladores entender la mecánica interna de sistemas heredados para garantizar su continuidad operativa o su migración segura.

## 📁 Estructura del Repositorio

Organizado para procesos de análisis forense y recuperación:

* **src/**: 
  * **/Decompiler**: Lógica para la interpretación de bytecodes y reconstrucción de archivos `.prg`.
  * **/Headers**: Herramientas para el análisis de cabeceras de ejecutables y detección de versiones de enlazadores.
  * **/Recovery**: Scripts para la restauración de constantes, variables y tablas de símbolos.
* **docs/**: Manuales sobre la arquitectura interna de la máquina virtual de Clipper y técnicas de desofuscación.
* **tools/**: Utilidades de inspección de archivos binarios y dumpers de memoria.

## 🛠️ Capacidades Técnicas

* **Recuperación de Activos**: Capacidad de reconstruir la lógica de negocio de sistemas bancarios o comerciales antiguos para su integración en `MiSistema`.
* **Auditoría Forense**: Permite verificar la existencia de "puertas traseras" o código malicioso en aplicaciones donde no se posee el fuente original.
* **Soporte de Migración**: Base fundamental para alimentar la **Software Factory con IA**, proporcionando el contexto necesario para que los agentes traduzcan código antiguo a lenguajes modernos.

---
*Desarrollado por Miguel Quinteiro - Senior Software Architect & Reverse Engineering Specialist.*