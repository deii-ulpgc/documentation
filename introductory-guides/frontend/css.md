# ¿Cómo empezar con CSS?

(Introducción to guapa que ya pensaré en otro momento)

Una de las mejores herramientas para ir comprobando poco a poco los distintos cambios es presionar F12 estando en el navegador, e ir cambiando las distintas clases ahí. Una vez se está conforme con el resultado copiar los cambios al código.

![f12-inicio](./assets/f12-inicio.png)

Puede que se vea mejor mirando el HTML/CSS directamente: [CSS.html](./examples/css.html).

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

## Espaciados

### Márgenes

### Padding

## Bordes y sombras

Lo más básico de cualquier páginas son lo denomidado "tarjetas" o "contenedores".

Generador de bordes: [https://html-css-js.com/css/generator/border-outline/](https://html-css-js.com/css/generator/border-outline/)

Generador de sombras[:]([https://html-css-js.com/css/generator/box-shadow/](https://html-css-js.com/css/generator/border-outline/)) [https://www.cssmatic.com/box-shadow](https://www.cssmatic.com/box-shadow)

## Grid y Flex

Página para probar Grid: Grid Garden: [https://cssgridgarden.com/#es]([https://cssgridgarden.com/#es]()).

Página para probar Flex: Flexbox Froggy: [https://flexboxfroggy.com/#es](https://flexboxfroggy.com/#es).

## Pseudoclases

## SCSS Básico
