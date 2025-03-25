# 🚀 BaseDatoII - Guía Completa de Git/GitHub 📚

Repositorio privado para el curso de Bases de Datos II.  
**¡Domina Git con esta guía paso a paso!**

---

# 🔧 **Configuración Inicial**

### 1. Instalar Git
- **Windows/Mac**: [Descargar aquí](https://git-scm.com/downloads)
- **Linux**:  
  ```bash
  sudo apt update && sudo apt install git  # Debian/Ubuntu
  git config --global user.name "Tu Nombre"
  git config --global user.email "tu@email.com"
  git config --global init.defaultBranch main  # Usar 'main' como rama predeterminada
  ```
### 2. Configurar Identidad
# Generar clave SSH
    ssh-keygen -t ed25519 -C "tu@email.com"  # Presionar Enter para valores predeterminados
    cat ~/.ssh/id_ed25519.pub                # Copiar clave pública
# 🔐 **Autenticación en GitHub**
 Agregar clave a GitHub:
 1. Ve a [GitHub > Settings > SSH Keys](https://github.com/settings/keys)
 2. Pega la clave y guarda
 3. Configura el repositorio para usar SSH:
    git remote set-url origin git@github.com:S-Gull/BaseDatoII.git

# 🛠️ **Comandos Esenciales**
### Iniciar/Clonar Repositorio
    git init                            # Inicializar repo local
    git clone git@github.com:S-Gull/BaseDatoII.git  # Clonar vía SSH
### Flujo de Trabajo Diario
    git status                          # Ver cambios
    git add .                          # Preparar todos los archivos
    git add archivo.txt                # Preparar archivo específico
    git commit -m "Descripción clara"  # Guardar cambios localmente
    git push origin main               # Subir a GitHub
    git pull origin main               # Actualizar desde GitHub
### Ramas (Branches)
    git branch                          # Listar ramas
    git branch nueva-rama               # Crear rama
    git checkout nueva-rama             # Cambiar a rama
    git merge nueva-rama                # Fusionar rama actual con 'nueva-rama'
# ⏪ **Deshacer Cambios**
### Correcciones Seguras
    git restore archivo.txt             # Descartar cambios no stageados
    git restore --staged archivo.txt    # Quitar del stage
    git commit --amend                  # Modificar último commit
    git reset HEAD~1                    # Deshacer último commit (mantiene cambios)
### Forzar Cambios (¡Usar con Precaución!)
    git push --force origin main        # Sobrescribe el repositorio remoto
    git push --force-with-lease         # Versión más segura de force
# 🤝 **Trabajo Colaborativo**
# Buenas Prácticas
1. **Siempre actualiza primero:**
 ```bash
git pull origin main
```
2. **Crea ramas para nuevas funcionalidades:**
 ```bash
git checkout -b nombre-rama
```
3. **Resuelve conflictos:**

* -  Edita los archivos con <<<<<<< HEAD
* -  Ejecuta:
```bash
git add . && git commit -m "Resuelve conflictos"
```

# 🚨 **Solución de Problemas**
### Error: "Authentication Failed"
    ```bash
    # Si usas HTTPS:
    git remote set-url origin git@github.com:S-Gull/BaseDatoII.git  # Cambiar a SSH
    ```
### Error: "Updates Were Rejected"
```bash
git pull origin main   # Fusiona cambios remotos
git push origin main   # Vuelve a intentar
```
### Eliminar Historial Local y Resincronizar
```bash
git fetch origin
git reset --hard origin/main
```
# 📂 **Estructura del Proyecto**
```bash 
/BaseDatoII/
├── /src/             # Código fuente
├── /docs/            # Documentación
├── .gitignore        # Archivos a ignorar
└── README.md         # Este archivo
```
### Ejemplo de .gitignore
# Ignorar archivos generados
```bash
/node_modules/
*.log
*.tmp
.env
```
# 💡 **Consejos Profesionales**
- Commits Atómicos: Cambios pequeños y específicos.
- .gitignore: Siempre ignora archivos sensibles (ej: contraseñas).
- Mensajes Claros: Usa verbos en imperativo: "Agrega funcionalidad X", "Corrige error Y".

# 📜 Licencia

#### Este repositorio es de uso académico.
#### © 2023 - [Tu Nombre] - Todos los derechos reservados.

#### 🔄 Última Actualización: $(date +"%d/%m/%Y")


---

### **Cómo Usar Este README**  
1. Copia todo el contenido.  
2. Pégalo en un archivo `README.md`.  
3. Personaliza las secciones según tu proyecto.  
4. Sube al repositorio:  
```bash
    git add README.md && git commit -m "Agrega guía completa" && git push origin main
```