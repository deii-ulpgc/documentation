

# Introducción a JavaScript 

El objetivo de este documento no es convertirte en un experto de JavaScript sino 
dar a conocer las características más importantes del lenguaje, así como redirigirte
a referencias y tutoriales que te permitan profundizar al respecto. 

## ¿Qué es JavaScript?

JavaScript es un lenguaje de programación que tiene su origen en el navegador. Se 
diseñó originalmente para proveer las páginas web de interactividad. La comunidad
es rica y ha convertido a JavaScript en un lenguaje muy potente proveyendo librerías
para hacer desde desarrollo orientado, como [React](https://es.reactjs.org/), a componentes hasta gráficos 2D y 3D, como [THREEjs](https://threejs.org/).

Existen, además, distintos **frameworks** para JS que tienen como objetivo agilizar
el desarrollo de sitios y apliciones web como [Angular](https://angular.io/) 
o [Next](https://nextjs.org/). Un framework es un esquema de trabajo que define como
se debe llevar a cabo la implementación de un cierto software facilitando el 
desarrollo y escalado del proyecto. Para lograr ese objetivo los frameworks hacen
uso de distintas librerías, como React en el caso de Next, y otras herramientas, como
el [transpilador](https://en.wikipedia.org/wiki/Source-to-source_compiler) de
TypeScript.

Originalmente JavaScript se ejecutaba en el navegador y este sigue siendo el caso
para todo código JS que tenga como objetivo aportar interactividad en una página web,
sin embargo, con la aparición de [Node.js](https://en.wikipedia.org/wiki/Node.js) 
ahora se puede ejecutar JavaScript en cualquier contexto. 

## Variables 

Existen varias formas de declarar variables. De todas actualmente solo dos
se consideran buenas prácticas y son las únicas que discutiremos. 

----

### Let

La palabra reservada `let` sirve para declarar variables cuyo valor puede reasignarse 
después de la declaración.

```JAVASCRIPT

let name = "Pepe";

/* o */

let name;
name = "Pepe";
```

```JAVASCRIPT
/* Let nos permite cambiar el valor de una variable posteriormente */

let name = "Pepe";

name = "Jose";
```

### Const

La palabra reservada `const` permite declarar variables cuyo valor no puede 
reasignarse después de la declaración. Similar a como funciona la palabra reservada
`final` en Java.

```JAVASCRIPT

const DNI = '45661789X';

/* Esto causará un error */
DNI = '33333333T';  /* Uncaught TypeError: Assignment to constant variable. */
```

Al igual que en Java las variables declaradas usando `const` deben ser inicializadas
en su declaración. Por ejemplo el siguiente programa producirá un error:

```JAVASCRIPT
const name; /* Uncaught SyntaxError: Missing initializer in const declaration */
name = "Pepe";
```

----

<br>

Se debe preferir usar `const` sobre `let` siempre que sea posible. En este 
[enlace](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Grammar_and_Types#variables) puedes aprender sobre variables.



## Control de flujo 

## Funciones
