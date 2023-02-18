Autores:
    - Jose Manuel Illera Rodríguez(@Illera1999)
    - Cristobal José Jiménez Gómez (@Cristobaljjg)

# La guía del Git poderoso 💪🏼

Bienvenido a la guía que nunca hará merge con tus emociones, pero que si hablará sobre Git y más en concreto en nuestro Git Workflow.

Por si acaso lleves toda tu vida en una cueva, Git es como una caja de juguetes para desarrolladores de software: puedes agregar, quitar, mover y cambiar todo lo que quieras, pero si no tienes cuidado, puedes terminar con una montaña de piezas desordenadas que no encajan.

Siempre hay que tener cuidado con git, **¡Así que asegúrate de hacer commits temprano y a menudo, mantén un historial limpio y ordenado, y siempre recuerda hacer push antes de irte a casa!**

# Índice

<br>

# ¿Qué es Git Workflow?

Para que se hagan una idea, un git workflow es un conjunto de prácticas y procesos que implementa en un proyecto utilizando el sistema de control Git.

# Nuestro Git Workflow

En esta guía se da por hecho que se manejan a nivel principiante en git y si por algun casual no es asi pueden mirar este [enlace de referencia](https://git-scm.com/docs).

Tendremos 4 tipos de ramas:

* La **rama main/release**: Se utiliza como **rama oficial de producción**, contendrá todo lo relacionado con producción. Tendremos que procurar que SIEMPRE esté bien, ya que será la página donde podrá entrar la gente.
* La **rama develop**: Se utiliza como **rama de desarrollo**, la cual tendrá los cambios a implementar en cada sprint.
  * Al principio de un sprint se hará un **merge** desde **main/release**.
  * Se irán introduciendo los pequeños cambios de las ramas de *features*, hasta que todas las historias estén completas.
  * Cuando se completen todas las historias del sprint, se hará un **merge** de esta rama a **main**.
* Las **ramas features**: Se hará una rama feature por cada historia de usuario u objetivo.
  * Se crearán las ramas a partir del último *commit* de **develop**.
  * Se harán tantos *commits* como sean necesarios hasta completar el sprint.
  * Una vez completada la funcionalidad o historia, se verificará su correcto funcionamiento.
  * Si todo está correcto, se hará un **pull request** hacia **develop**.
* Las **ramas Hotfix** (Esperemos crear el menor nº posible de estas): Se utilizan para **cambios rápidos en main/release**.
  * Se hará una rama de hotfix para solucionar el problema.
  * Se solucionará lo más rápido posible.
  * Se hará **merge/pull request** a **main/release** con los cambios ya hechos.

## Pequeño ejemplo de funcionamiento ilustrado

![img](https://file+.vscode-resource.vscode-cdn.net/d%3A/Repositorios/documentation/workflows/assets/sprint1.png)![img](../assets/sprint1.png)
