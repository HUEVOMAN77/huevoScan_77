# huevoScan_77 v1.0

**Suite de Recon Automático Profesional – Termux**

Creado por: **HUEVOMAN77**

---

## 📌 Descripción

`huevoScan_77` es una herramienta de reconocimiento avanzada diseñada para ejecutarse en **Termux**. Este script permite realizar escaneos completos y profesionales sobre dominios, tecnologías web, puertos, subdominios y más. También incluye un traductor integrado.

Ideal para pruebas de penetración, análisis web y automatización de tareas de recon.

---

## 🚀 Características Principales

- 🔍 **Escaneo de Subdominios** (subfinder + amass)  
- 🔎 **Escaneo completo de puertos y servicios** (Nmap)  
- 🌐 **Detección de tecnologías web** (WhatWeb)  
- 📸 **Screenshots automáticos** de sitios web (Gowitness)  
- 🤖 **Recon Automático Completo**  
- 🇪🇸 **Traductor integrado al español** (translate-shell)

---

## 🛠 Instalación y ejecución paso a paso

### 🟦 1. Actualizar Termux y paquetes:

```bash
pkg update && pkg upgrade -y
pkg install git curl wget nano -y

🟦 2. Clonar el repositorio:

git clone https://github.com/HUEVOMAN77/huevoScan_77.git

🟦 3. Entrar al directorio del proyecto:

cd huevoScan_77

🟦 4. Dar permisos al script:

chmod +x huevoScan_77.sh

🟦 5. Instalar las herramientas necesarias:

pkg install nmap -y
pkg install python -y
pip install gowitness whatweb subfinder amass
pkg install translate-shell -y

🟦 6. Ejecutar el script:

bash huevoScan_77.sh

🧑‍💻 Créditos

Script desarrollado por: HUEVOMAN77
Versión: huevoScan_77 v1.0


---

⭐ Si te gustó este proyecto…

No olvides dar ⭐ en el repositorio para apoyar futuras versiones.


