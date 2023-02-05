# ¿Cómo empezar con CSS?

(Introducción to guapa que ya pensaré en otro momento)

Una de las mejores herramientas para ir comprobando poco a poco los distintos cambios es presionar F12 estando en el navegador, e ir cambiando las distintas clases ahí. Una vez se está conforme con el resultado copiar los cambios al código.

![f12-inicio](../assets/f12-inicio.png)

Puede que se vea mejor mirando el HTML/CSS directamente: [CSS.html](./examples/css.html).

Algunos errores básicos al empezar pueden ser:

No darse cuenta que es en cascada, esto significa que a medida que se escriben nuevos atributos, se pueden ir sobreescribiendo los atributos anteriores.

Ejemplo Final

## Información básica

[Página de referencia](https://www.diegocmartin.com/como-empezar-con-css/).

Se puede estilizar las distintas etiquetas de forma directa desde la etiqueta usando el atributo *style:*

`<p style="color:'orange'; background-color: 'whitesmoke'">Hola</p>`

Aunque lo preferible es separar ambos ficheros, y dejar TODO el estilo en los CSS y toda la estructura en el HTML.

```apache
# Ubicado en style.css
.special-text{ 
    color: orange;
}

# Ubicado en index.html
<p class="special-text">Texto especial</p>
```

## Relacionadas con texto

```apache
# Ubicado en style.css
.special-text{ 
    color: orange;
    background-color: black;
    font-size: large;
    font-weight: 400;
    font-family:Verdana, Geneva, Tahoma, sans-serif;
}

# Ubicado en index.html
<p class="special-text">Texto especial</p>
```

color: color de la letra;

background-color: color del fondo;

font-size: tamaño de la letra;

font-weight: grosor de la letra;

font-family: tipografía de la letra;

line-height: distancia entre líneas (lo normal es dejarlo al 100%);

font-style: normal, itálica, oblicua;

text-align: alineado del texto (lo normal suele ser- center, end o justify);

## Bordes y sombras

Lo más básico de cualquier páginas son lo denomidado "tarjetas" o "contenedores".

Generador de bordes: [https://html-css-js.com/css/generator/border-outline/](https://html-css-js.com/css/generator/border-outline/)

Generador de sombras[:]([https://html-css-js.com/css/generator/box-shadow/](https://html-css-js.com/css/generator/border-outline/)) [https://www.cssmatic.com/box-shadow](https://www.cssmatic.com/box-shadow)

## Espaciados

### Márgenes

![marging-border-content](../assets/margin-border-padding.png)

Los márgenes es el espacio exterior a la divisón. Se puede configurar de la siguiente forma:

margin: 1px 2px 3px 4px;

Siendo 1px- el superior; 2px el derecho; 3px el  inferior y 4px el izquierdo.

De la misma forma, se puede modificar 1 solo lado del margen haciendo uso de margin-top, margin-right, margin-bottom y margin-left.

### Padding

Los padding es el espacio interior, entre el borde y el contenido. Se puede configurar de la siguiente forma:

padding: 1px 2px 3px 4px;

Siendo 1px- el superior; 2px el derecho; 3px el  inferior y 4px el izquierdo.

De la misma forma, se puede modificar 1 solo lado del padding haciendo uso de padding-top, padding-right, padding-bottom y padding-left.

## Grid y Flex

Página para probar Grid: Grid Garden: [https://cssgridgarden.com/#es]([https://cssgridgarden.com/#es]()).

Página para probar Flex: Flexbox Froggy: [https://flexboxfroggy.com/#es](https://flexboxfroggy.com/#es).

### Grid

[Página de referencia](https://platzi.com/tutoriales/1229-css-grid-layout/6653-todo-lo-que-necesitas-saber-de-css-grid/?utm_source=google&utm_medium=cpc&utm_campaign=19643931773&utm_adgroup=&utm_content=&gclid=EAIaIQobChMIrrKj-Pn-_AIVUASLCh1PZABAEAAYASAAEgI6pvD_BwE&gclsrc=aw.ds).

Se suele usar para mostrar "mosaicos" y tener un control de los distintos elementos dentro de él.

Las órdenes básicas para usar grid son:

display: grid; Para generar un grid.

grid-template-colums: Para definir el nº y ancho de la columna. En orden de izquierda a derecha. Pe. grid-template-colums: 50px 300px;

grid-template-rows: Para definir el nº y alto de la columna, En orden de arriba a abajo. Pe. grid-template-rows: 200px 75px;

### Flex

[Página de referencia](https://developer.mozilla.org/es/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox).

Se suele usar listar elementos tanto en horizontal como en vertical.

Las órdenes básicas para usar flex son:

display: flex; Para obtener un flex;

flex-direction: en fila, en columna, en fila invertida o en columna invertida.

flex-wrap: en caso de llegar al final de la línea, si se genera un oveflow(nowrap) o si pasa a la siguiente línea (wrap).

Cada elemento interno del flex se puede controlar haciendo uso de `order: n`.

```apache
.verde{ order: 1; }
.rojo{ order: 2; } 
.azul{ order: 1; } 
.morado{ order: 3; }
.rosa{ order: 4; }
.gris{ order: 1; }
```

De esta forma, las cajas se ordenarán tal que verde, azul, gris, rojo, modaro, rosa. Da igual en qué orden coloquemos las distintas cajas en el HTML.

### Distancias

Para hacer las separaciones de los distintos componentes internos se usa **gap**.

## Pseudoclases

[Página de referencia](https://developer.mozilla.org/es/docs/Web/CSS/Pseudo-classes)

Las pseudoclases más usadas son:

`:active` - (Asumamos un botón) Será la apariencia que tenga cuando esté clicado.

`:hover` - Representa la apariencia que tiene  un elemento cuando se pasa el ratón por encima.

`:checked` - Representa la apariencia de los radio-buttons, checkbox y selects al ser seleccionados.

`:disabled` - Representa la apariencia que tiene un elemento desabilitado.

`:valid` - Selecciona cualquier elemento válido.

`:focus` - Representa la apariencia que tiene un elemento cuando está seleccionado. Se suele usar para los inputs.

`:first-child` - El primer elemento dentro de las etiquetas.

`:last-child` - El último elemento dentro de las etiquetas.

`:not()` - Cualquier elemento que no sea lo que está dentro de la función dentro de las etiquetas.

`:nth-child(xn)` - Selecciona cada xn elementos dentro de las etiquetas

`:required` - Selecciona cualquier elemento requerido.

`:visited` - Representa la apariencia que tiene  un elemento cuando se ha visitado. Se suele usar para los enlaces.

## SCSS Básico
