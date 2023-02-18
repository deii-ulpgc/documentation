   ### Autor:
   - Alejandro Viera Ruiz (@AVR21)
   
   
   # Infraestructura de Frontend

   ## Índice
   - [NodeJS & NextJS](#nodejs--nextjs)
   - [Docker](#docker)
   - [Resumen](#resumen)

La finalidad de este documento es registrar todas las decisiones tomadas a lo largo del desarrollo de la infraestructura de Frontend para el desarrollo del sitio web de la Delegación y el por qué de estas.

En la [guía del desarrollador web galáctico][1] se explica la infraestructura que tendrá el servidor del sitio web, así como los frameworks, herramientas y aplicaciones que se emplearán en el proceso. Aquí solo nos centraremos en el Frontend. 

   ## NodeJS & NextJS

El entorno de ejecución (*runtime*) y el framework elegidos son **NodeJS** y **NextJS** respectivamente, usaremos la versión LTS (Long Term Support) de **NodeJS** llamada *Hydrogen* que corresponde a la versión 18.14.1. Dado que esa no es la última versión disponible, la mejor forma de alternar entre versiones es **nvm** (Node Version Manager). 

Gracias **NextJS**, un framework de *React* (librería de *JavaScript*) tenemos la posibilidad de crear aplicaciones web con integración, herramientas y funciones extras. También nos permite ver en tiempo real los cambios realizados en el código sin necesidad de desmontar y montar la imágen en la que se encuentra o recargar la página, en el entorno de desarrollo.

   ## Docker

El servidor donde se alojará el sitio web, ejecutará para el Frontend, un contenedor generado con **Docker**, una aplicación de desarrollo con el objetivo de lanzar y ejecutar aplicaciones web a partir de imágenes y permitiendo separar la infraestructura de la aplicación final. En este caso, una imagen de Ubuntu con las dependencias de **NodeJS** en la versión *Hydrogen*. Sin embargo, durante la configuración y prueba del contenedor desde una máquina con sistema operativo Windows, nos dimos cuenta, que una de las grandes ventajas de **NextJS**, realizar cambios a tiempo real, se perdía, siendo necesario un reinicio constante del contenedor por cada modificación. 

Como solución a esto, se requiere instalar *WSL* (Windows Subsystem for Linux), en aquellas máquinas que trabajen con Windows. En la [guía de configuración del entorno de desarrollo][2] se entra en más detalle y explica como instalar esta junto a una distribución, en este caso Ubuntu. 

La instalación de WSL conlleva el uso de docker dentro de la terminal de Windows, entrando previamente al subsistema de Linux. La instalación y configuración se lleva de la misma forma que en un sistema de Linux nativo, funciona igual y soluciona el problema mencionado anteriormente. Puesto que este subsistema no se lanza con *systemd* no es posible ejecutar comandos relacionados, por lo tanto, es necesario activar manualmente los servicios de docker al inicio de cada sesión de trabajo. ```sudo service docker start```


   ## Resumen

- Uso del entorno de ejecución (o *runtime*) **NodeJS** en la versión 18.14.1 - *Hydrogen* (LTS).
- Uso del framework **NextJS** para el desarrollo web.
- Uso de la plataforma **Docker** para el lanzamiento de la aplicación web.
- Instalación de *WSL* (Windows Subsystem for Linux) requerida en máquinas de Windows. 

[1]: https://github.com/deii-ulpgc-tecnologia/documentation/blob/systems-docs/introductory-guides/guia-del-web-developer-galactico.md
[2]: https://github.com/deii-ulpgc-tecnologia/documentation/blob/systems-docs/introductory-guides/setup-guide.md