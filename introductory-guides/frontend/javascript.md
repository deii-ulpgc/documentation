

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
`<script><\script>` en un documento HTML y empezar a escribir. Aunque
si te da pereza aquí te dejo el 
[JavaScript Playground](https://playcode.io/javascript) para que puedas jugar
a gusto sin mover un dedo.

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

Recuerda que `const` se aplica a la variable y no al dato al que apunta. De forma
que nunca podremos modificar a que hace referencia la variable pero si podemos
modificar el dato al que hace referencia

```JAVASCRIPT
const array = [1, 2, 3, 4];

/* Resultará en error porque estamos intentando cambiar la referencia */
array = ["someString", "someOtherString"];

/* Funciona perfectamente porque no modifica la referencia, si no la estructura */
/* a la que esta apunta.                                                        */
array.pop() // array = [1, 2, 3];

// Nota: .pop() elimina el último elemento de un array, en este caso 4.
```

----

<br>

Se prefiere usar `const` sobre `let` siempre que sea posible. En este 
[enlace](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Grammar_and_Types#variables) puedes aprender sobre variables.



## Objetos en JavaScript

Aunque en JavaScript se pueden crear clases e intancias de las mismas siguiendo
más o menos el paradigma de POO clásico, la realidad es que en JS existen otro
tipo de objetos, a los que comunmente se les denomina objetos de JavaScript, que
se usan mucho más frecuentemente.

```JAVASCRIPT
const person = {
    name: "MasterJoseph",
    age: 23,
    profession: "Au! Au! Au!"
}

/* Podemos acceder a los distintos campos del objeto usando el operador '.' */

console.log(`${person.name} what is your profession?`);
console.log(person.profession);

// Nota: console.log viene a ser el print.
```

Estos objetos son, literlamente, como diccionarios de Python con la única 
diferencia de que todas las claves son de tipo `string`. De hecho podemos 
acceder a los campos del objeto usando el operador `[]` como haríamos en Python.

El mismo ejemplo de antes pero usando `[]`.

```JAVASCRIPT
console.log(`${person["name"]} what is your profession?`);
console.log(person["profession"]);
```

Por supuesto utilizaremos el operador `.` sobre el operador `[]` siempre que
sea posible.

La característica más potente de estos objetos es que se pueden traducir 
a JSON y viceversa de forma muy sencilla usando la función `JSON.stringify()`
y `JSON.parse()` respectivamente. Aunque la mayoría de veces esta operación 
la hará una librería por ti de forma que solo tendrás que preocuparte de pasar
objetos y recibirlos de las funciones de alguna librería.

```JAVASCRIPT
const json = JSON.stringify(person);

console.log("-> ", json);
console.log("-> ", typeof json);
```
Output:
```
-> {"name":"MasterJoseph","age":23",profession":"Au! Au! Au!"}
-> string
```

Ahora podríamos poner la string `json` en el *payload* de una petición HTTP
y enviarlo a través de internet para que todo el mundo conozca a Jose.

Aquí te dejo un [enlace](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object)
para que puedas profundizar más en los objetos de JavaScript.

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

Nota: Si te interesa saber que es la variable `e` que nuestro *listener* 
recibe por parámetro te recomiendo que mires este [enlace](https://developer.mozilla.org/en-US/docs/Web/API/Event).

Es **muy importante** familiarizarse con las **Arrow Functions** pues el paradigma
funcional es fuertemente utilizado en la gran mayoría de *frameworks* modernos de 
desarrollo web.

### Paradigma funcional

En esta sección se mencionan algunas de las funciones más importantes del paradigma
funcional y que serán de ayuda al trabajar con **react**.

```JAVASCRIPT
/* Un array que contiene objetos de tipo persona */
const persons = [
    {
        name: "Pepe",
        age: 21
    },
    {
        name: "Cristóbal",
        age: 22
    }
]
```

Digamos que queremos transformar este array de personas en una array de `string` que 
siga el siguiente formato: **'`<name>` tiene `<age>` años'**. La forma tradicional de 
hacerlo sería la siguiente:

```JAVASCRIPT

const newArray = [];

for(let person of persons) {
    newArray.push(`${person.name} tiene ${person.age} años`);
}
```

Sin embargo, usando el paradigma funcional podríamos usar la función `map` que aplica
a cada elemento de un array una función y lo devuelve en un nuevo array:

```JAVASCRIPT
const newArray = persons.map(person => `${persona.nombre} tiene ${persona.edad} años`);
```

Bastante sencillo ¿No? De verdad, si no te lo parece, pregunta que no hay 
ningún problema.

Para el curioso o el que no le quede claro esto es, más o menos, lo que hace la
función map:

```JAVASCRIPT
function myMap(array, func) {

    resultArray = [];

    for(let item of array){
        resultArray.push( func(item) );
    }

    return resultArray;
}

/* Esto nos daría un resultado equivalente al del ejemplo anterior */
const newArray = myMap(
    persons,                                                 /* array */
    person => `${persona.nombre} tiene ${persona.edad} años` /* func  */
);
```

#### Otras funciones útiles:

En esta sección describiré algunas otras funciones útiles para operar con
arrays siguiendo el paradigma funcional. Se incluirá una versión imperativa
de como obtener el mismo resultado y luego un ejemplo de uso.

**Filter:**

Esta función nos permite crear una copia de un array excluyendo los elementos
que no cumplan con una cierta condición, que pasaremos como una función.

Imperativo:
```JAVASCRIPT
const array = [1, 4, 8, 10, 2];
const newArray = [];

for(let n of array){
    if(n > 2){
        newArray.push(n);
    }
}

// Output: newArray = [4, 8, 10]
```

Funcional:
```JAVASCRIPT
const array = [1, 4, 8, 10, 2];

const newArray = array.filter(n => n > 2);
// Output: newArray = [4, 8, 10]
```

**Find:**

Esta función retorna el primer *item* en un array que cumple con una cierta 
condición que, de nuevo, pasaremos como una función.


Imperativo:
```JAVASCRIPT
const array = [1, 4, 8, 10, 2];
let theItem;

for(let n of array){
    if(n === 8){
        theItem = n;
        break;
    }
}

// Output: theItem = 8
```

Funcional:
```JAVASCRIPT
const array = [1, 4, 8, 10, 2];

const theItem = array.find(n => n === 8);
// Output: theItem = 8
```

Nota: Físese que para asegurar igualidad se usa el operador `===` en lugar 
del clásico `==` esto es porque en JavaScript la expresión `'5' == 5` produce
`true` a pesar de que los tipos de los elementos comparadados son distintos.
A este operador `===` se le conoce como *strict equality operator* y debe 
usarse siempre en lugar de `==` para evitarnos dolores de cabeza a posterior.

**Sort:**

Esta función **no sigue el paradigma funcional** porque al contrario
que en los ejemplos anteriores modifica el array que se pasa como input. Pero
sigue siendo una función muy útil que hay que conocer.

Ordena el array sobre el que se invoca la función según un criterio que, una 
vez más, pasaremos como una función. Sin embargo, esta vez hay
una diferencia significativa: para realizar comparaciones hacen falta al menos 
dos cosas y hasta ahora las funciones que hemos pasado siempre reciben un solo
argumento. No pasa nada, sort va a intentar llamar a la función que le pasemos
como si tuviera dos argumentos así que lo único que hay que hacer es poner que
tiene dos argumentos. Se puede invocar la función `sort()` sin parámetros e 
intentará ordenar la lista usando los operadores de comparación `>` o `<`.

El orden por defecto de `sort()` es **ascendente** (menor a mayor) y la 
función de comparación debe devolver `> 0` cuando se considere que el primer
elemento es mayor que el segundo, `=== 0` cuando se consideren iguales y
`< 0` cuando el primer elemento se considere menor que el segundo.

Imperativo:

Jasjas que te crees que voy a implementar un algoritmo de ordenado.

Funcional:
```JAVASCRIPT
const persons = [
    {
        name: "Pepe",
        age: 21
    },
    {
        name: "Cristóbal",
        age: 22
    },
    {
        name: "MiPrimito",
        age: 6 
    }
];

/* Queremos ordenar el array persons de menor edad a mayor edad */
persons.sort((firstPerson, secondPerson) => {
    if(firstPerson.age > secondPerson.age)
        return 1;
    if(firstPerson.age < secondPerson.age)
        return -1;

    return 0;
});

/* O si no te parece muy claro lo de arriba esto es equivalente */

const cmpFunc = (firstPerson, secondPerson) => {
    if(firstPerson.age > secondPerson.age)
        return 1;
    if(firstPerson.age < secondPerson.age)
        return -1;

    return 0;
};

persons.sort(cmpFunc);

/* 
Output:
[
  { name: 'MiPrimito', age: 6 },
  { name: 'Pepe', age: 21 },
  { name: 'Cristóbal', age: 22 }
]
*/
```

Nótese como para crear **Arrow functions** con dos parámetros se deben poner
paréntesis.

Puedes encontrar más información sobre esta función en este 
[enlace](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort).

**ForEach:**

Esta última función **no cumple con el paradigma funcional** pues tiene 
[side effects](https://www.yld.io/blog/the-not-so-scary-guide-to-functional-programming/)
pero también puede ser muy útil.

Como `map()` esta función nos permite aplicar a cada elemento de un array 
otra función. Al contrario que `map()` los resultados de esas funciones no 
se almacenarán en ningún lugar. Fíjate que el nombre de la función es literalmente
el nombre de un bucle de los que recorre elemento a elemento un array.

Digamos que quiero imprimir un array elemento por elemento.

Imperativo: 

```JAVASCRIPT
const array = [1, 4, 8, 10, 2];

for(let n of array){
    console.log(n);
}

/* 
Output:
1
4
8
10
2
*/
```

Funcional: 

```JAVASCRIPT
const array = [1, 4, 8, 10, 2];

array.forEach(n => console.log(n));

/* 
Output:
1
4
8
10
2
*/
```

## TypeScript

Aún por redactar.

