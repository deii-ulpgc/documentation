   ### Autor:
   - Alejandro Viera Ruiz (@AVR21)   
   
   # GUÍA DE CONFIGURACIÓN DEL ENTORNO DE DESARROLLO 

   ## Índice:
   
   - [Introducción](#introducción)
   - [Instalación de WSL](#instalación-de-wsl-windows-subsystem-for-linux)
   - [Selección de versión de node mediante nvm](#selección-de-versión-de-node-mediante-nvm)
   - [Configuración de Docker](#configuración-de-docker)
   - [Conclusión](#conclusión)

   ## Introducción 

Bueno, si estás aqui supongo que ya sabrás de que va el rollo, sino, aquí tienes la [guia del desarrollo web galáctico.][1]

Sin más rodeos, voy a explicarte cómo entrar en la atmósfera de la forma más sencilla posible. Necesitarás los siguientes programas:

- **nvm**: Con este programa podrás elegir qué versión de **NodeJS** usar en tu máquina, en este caso, la versión 18.14.0 .
- **Docker**: Gracias a este programa montaremos los *contenedores* que soportarán la estructura de la página web .

Por desgracia para ti, astro genérico de Windows, no será tán fácil como instalarte los programas que te acabo de mencionar, ya que vas a necesitar que tu nave funcione con Linux para que tu viaje vaya como la seda. Para ello, te voy a enseñar como instalar tu propio subsistema de Linux en Windows. 

Si, en cambio, eres un usuario galáctico de Linux, puedes ir directamente a la sección: [Selección de versión de NodeJS mediante nvm](#selección-de-versión-de-nodejs-mediante-nvm)  

  
   ## Instalación de WSL (Windows Subsystem for Linux)

Gracias al WSL podemos instalar una distribución de Linux y usar aplicaciones, utilidades y herramientas de la línea de comandos de *Bash* directamente en Windows (no hay entornos gráficos en las naves espaciales), sin la necesidad de una máquina virtual.

Suponiendo que tienes la última versión de Windows 10 o Windows 11, solo tienes que abrir tu términal de *PowerShell* y ejecutar el siguiente comando:

```PowerShell
wsl --install
```
(Deberás reiniciar el ordenador tras la instalación)

A continuación, podrás instalar una distribución de las posibles que puedes listar con:

```PowerShell
wsl --list --online
```

E instalar la que quieras con:

```PowerShell 
wsl --install -d <DistroName>
```
Recuerda que tras instalar una distribución de Linux, incluso en WSL, deberás **crear un usuario con su propia contraseña**. Para entrar desde el *Simbolo de Sistema* o el terminal de *PowerShell* puedes ejecutar el siguiente comando:
```PowerShell
wsl -d <name_of_the_distribution>
```
Si no sabes el nombre exacto de la distribución instalada, puedes ejecutar:
```PowerShell
wsl --list
```
Y sustituir ```<name_of_the_distribution>``` por el nombre de la distribución instalada.

También puedes instalar una distribución desde la [*Microsoft Store*][2] siempre y cuando hayas instalado WSL, que viene con su propio terminal accesible desde el menú de Inicio, pero te recomiendo usar el programa [*Windows Terminal*][3] que permite abrir pestañas con distintas herramientas de línea de comandos en la misma sesión, incluido el terminal de Linux de la distribución instalada.

A partir de ahora, deberás acceder a tu distribución de Linux para seguir la guía. 

   ## Selección de versión de NodeJS mediante nvm

Gracias a **nvm (Node Version Manager)** podemos elegir en qué versión de **NodeJS** trabajaremos desde nuestra máquina, si ya tienes éste instalado no te preocupes, puedes alternar entre versiones en cualquier momento sin ningún problema.

Para instalar **nvm** en tu sistema operativo Linux o distribución del subsistema de Windows, puedes descargar y ejecutar el script de instalación con cualquiera de los siguientes comandos:

(Necesitas instalar cURL o Wget para usar los comandos respectivamente)

```bash
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
 ```

```bash
$ wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

Para confirmar que **nvm** se ha instalado correctamente puedes ejecutar ``` command -v nvm``` y si te imprime ```nvm```, la instalación ha sido un éxito.

En caso de que no te aparezca, prueba a cerrar el terminal, abrir uno nuevo y volver a ejecutar el comando.


Una vez tenemos **nvm** instalado, necesitas instalar la versión de NodeJS con la que trabajaremos a lo largo del proyecto, la versión 18.14.0 . Para ello ejecutaremos el siguiente comando:

```bash
$ nvm install Hydrogen # v18.14.1
```

Puedes confirmarlo ejecutando a continuación:

```bash
$ node --version
```

Cuya salida debería ser ```v18.14.1```. En caso de que tuvieras instalada otra versión de node, puedes ejecutar el siguiente comando para cambiar a la versión deseada dentro del terminal actual:

```bash
$ nvm use Hydrogen
```

Y establecerlo como predeterminado para todos los terminales con:

```bash
$ nvm alias default Hydrogen
```

A partir de ahora, todos los terminales que inicies cargarán la versión 18.14.0, puedes cambiar a cualquier otra version con el comando ```nvm use node```, sustituyendo ````node``` por el número de la versión o su nombre en caso de que lo tenga. 

Si quieres ver las versiones de **NodeJS** disponibles desde **nvm** puedes ejecutar el comando ```nvm ls-remote```, y si quieres ver las instaladas en tu sistema, usa ```nvm ls```.

   ## Configuración de Docker

Si has llegado hasta aquí sin ningún problema, significa que soy muy bueno explicando. Vale, no, pero lo que sí significa es que estás a punto de completar la configuración de tu setup galáctico.

Sólo te queda instalar **Docker** en tu nave, gracias al cuál generarás el contenedor donde estará la página web.

En caso de que te suene **Docker** pero no estés seguro de tenerlo ya instalado, lo mejor será que te asegures de quitar cualquier paquete relacionada:

```bash
$ sudo apt-get remove docker docker-engine docker.io containerd runc
```
Una vez hemos confirmado la ausencia de **Docker** en nuestro sistema, podemos proceder a instalarlo. 

La forma que te voy a mostrar, hace uso del repositorio oficial de **Docker**, asi que vamos a hacer un par de pasos para configurarlo.

Para empezar, vamos a actualizar ```apt``` y añadir el repositorio para su uso por ```apt``` a través de HTTPS:

```bash
$ sudo apt-get update

$ sudo apt-get install \
   ca-certificates \
   curl \
   gnupg \
   lsb-release
```
A continuación, añadimos las claves GPG oficiales de **Docker:**
```bash
$ sudo mkdir -m 0755 -p /etc/apt/keyrings

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
Y, con el siguiente comando, establecemos el repositorio en cuestión:
```bash
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Finalmente, actualiza ```apt``` para establecer los cambios, y ya estarás listo:
```bash
$ sudo apt-get update
```

Ahora si, es la hora de instalar **Docker** junto a todos los paquetes que te ayudarán a desarrollar la nueva estelar página web. 

Instala la última versión y todos los paquetes necesarios con el siguiente comando:
```bash
$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
Normalmente, el servicio de **Docker** inicia automáticamente, sin embargo en caso de que al hacer alguno de los comandos que te presento más adelante aparece este error:
```bash
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
```
Entonces, tendrás que entrar en las entrañas de tu máquina e iniciar los servicios de la manera más complicada posible...o también puedes usar esta instrucción:
```bash
$ sudo service docker start
```

Si tienes Linux nativo y quieres que el servicio se inicie junto al sistema desde que enciendes el ordenador, haz lo siguiente:
```bash
$ sudo systemctl enable docker.service
$ sudo systemctl enable containerd.service
```
Si cambias de opinión solo tienes que cambiar ```enable``` por ```disable```.

También es posible que **Docker** solo ejecute las instrucciones desde un usuario root o haciendo ```sudo```, en caso de que no quieras tener que escribir esto último una y otra vez, puedes hacer lo siguiente:

Crear un grupo que permita ejecutar docker con permisos *root:*
```bash
$ sudo groupadd docker
```
Añadir tu usuario a este grupo:
```bash
$ sudo usermod -aG docker $USER
```
Cierra sesión con el usuario en cuestión y vuelve a iniciarla para que surta efecto y listo.

Ahora si, para comprobar que tu máquina esta preparada, ejecuta:
```bash
$ docker run hello-world
```
Si se ejecuta correctamente, ya estás preparado.

Si bien lo mejor es que te adaptes a la linea de comandos y aquí siempre tendrás todo lo que necesitas para usar **Docker** en tu terminal, puedes descargarte [Docker Desktop][4] si eres usuario nativo de Linux pero en esta guía no explicaré como usarlo. 

   ## Conclusión

Puesto que ahora tienes todas las herramientas para trabajar como parte de tu equipo de Frontend/Backend, te dejo a continuación, varias instrucciones que te harán falta para tus pruebas de desarrollo.

Gracias a **Docker** puedes generar un contenedor a partir de una imágen que iniciará la página web desde el entorno de desarrollo, una vez que hayas clonado el repositorio correspondiente a la página web, situandote en el directorio donde se encuentra el repositorio clonado ejecuta ```npm install``` y, a continuación, el comando ```docker compose up```. Esto generará el contenedor que contiene la página web, si haces alguna modificación en el archivo *src/app/page.tsx* y guardas los cambios, estos deberían reflejarse en la página web en un periodo de máximo 5 segundos.

Si tuviste que instalar y configurar WSL, probablemente no quieras usar vim desde la terminal, pero puedes usar el comando ```code .``` desde el directorio de trabajo para abrir [*Visual Studio Code*][5] en caso de que lo tengas instalado.

Si has iniciado un contenedor con el comando ```docker run [IMAGE]``` tendrás una imagen descargada, puedes ver los contenedores generados con el comando ```docker ps -a``` y eliminarlos con ```docker rm [SHA-256]``` escribiendo tras ```rm``` los 4 primeros dígitos o el SHA-256 completo. Este código sirve como identificador de las imágenes y contenedores generados. Para ver las imágenes puedes hacer ```docker images``` y eliminarlas también escribiendo ```docker rmi [IMAGE]``` especificando su nombre.



[1]:https://github.com/deii-ulpgc-tecnologia/documentation/blob/main/introductory-guides/guia-del-web-developer-galactico.md
[2]:https://apps.microsoft.com/store/detail/ubuntu-on-windows/9NBLGGH4MSV6?hl=es-es&gl=es
[3]:https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=es-es&gl=es
[4]:https://docs.docker.com/desktop/install/linux-install/
[5]:https://code.visualstudio.com/Download
