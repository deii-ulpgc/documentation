

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

Comenzar con JavaScript es muy fácil, basta con incluir una etiqueta 
`<script><\script>` en un documento HTML y empezar a escribir.

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

Se prefiere usar `const` sobre `let` siempre que sea posible. En este 
[enlace](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Grammar_and_Types#variables) puedes aprender sobre variables.



## Control de flujo 

## Funciones

Una función se declara de la siguiente forma:

```JAVASCRIPT
function byTwo(x) {
    return x*2;
}
```

También se pueden declarar usando lo que se conoce por **Arrow Syntax**:

```JAVASCRIPT
const byTwo = x => {
    return x*2;
} 
```

En primer lugar escribiriamos la lista de parámetros `(a, b, c)` (Podemos ignorar
los paréntesis en caso de que la lista solo incluya un parámetro) seguida de `=>` y
, posteriormente, el **cuerpo de la función**.

Cuando una función solo contiene una instrucción de retorno, como en el caso del
ejemplo anterior, podemos modificar la sintáxis ligeramente para escribir menos.

```JAVASCRIPT
const byTwo = x => x*2;
```

Como puedes observar si escribimos el cuerpo de la función sin llaves se asume que
solo contiene una instrucción y esta es de retorno de forma que no hace falta 
escribir la palabra reservada `return`.

Las **Arrow functions** son útiles cuando queremos pasar una función como parámetro
a otra:

```HTML
<body>
    <script>
        const onLoad = () => {
            const myButton = document.getElementById("myButton");
            const counterDisplay = document.getElementById("counterDisplay");
            let counter = 0;

            /* Pasamos una Arrow Function como la función que se debe ejecutar */
            /* cuando ocurra el evento "click" en el botón myButton */
            myButton.addEventListener("click", e => {
                counterDisplay.innerText = ++counter;
            });
        }

        window.onload = onLoad;
    </script>

    <p>Count: <span id="counterDisplay">0</span></p>
    <button id="myButton">Increment</button>
</body>
```

Nota: `window.onload` se incluye en el script para asegurarnos de que el código 
no se ejecuta hasta que la página haya cargado, es decir, hasta que el DOM esté listo.
De otra forma la función `document.getElementById(...)` retornará `null` pues *myButton*
no existe todavía.

Es **muy importante** familiarizarse con las **Arrow Functions** pues el paradigma
funcional es fuertemente utilizado en la gran mayoría de *frameworks* modernos de 
desarrollo web.

### Paradigma funcional

En esta sección se mencionan algunas de las funciones más importantes del paradigma
funcional y que serán de ayuda al trabajar con **react**.

```JAVASCRIPT
/* Un array que contiene objetos de tipo persona */
const personas = [
    {
        nombre: "Pepe",
        edad: 21
    },
    {
        nombre: "Cristóbal",
        edad: 22
    }
]
```

Digamos que queremos transformar este array de personas en una array de `string` que 
siga el siguiente formato: '**`<nombre>` tiene `<edad>` años**'. La forma tradicional de 
hacerlo sería la siguiente:

```JAVASCRIPT

const nuevoArray = [];

for(let persona of personas) {
    nuevoArray.push(`${persona.nombre} tiene ${persona.edad} años`);
}
```

Sin embargo, usando el paradigma funcional podríamos usar la función `map` que aplica
a cada elemento de un array una función y lo devuelve en un nuevo array:

```JAVASCRIPT
const nuevoArray = personas.map(persona => `${persona.nombre} tiene ${persona.edad} años`);
```

Bastante sencillo ¿No?

**Otras funciones útiles**:
- Filter
- Reduce

