# ¿Qué es Django?

[Página de referencia](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Django/Introduction)

[Wikipedia](https://es.wikipedia.org/wiki/Django_(framework))

"**Django** es un framework de alto nivel de Python que permite desarrollo rápido,seguro y mantenible de aplicaciones web. Desarollado por programadores con mucha experiencia, Django cuida al detalle de muchas de las necesidades que conlleva el desarrollo web, para que puedas enfocarte en construir tu aplicacion sin necesidad de reinventar la rueda. Es gratis y de código libre, tiene una comunidad activa muy grande gran [documentación](https://docs.djangoproject.com/en/4.1/) y muchas opciones de soporte gratuitas y pagas."

# Introdución a Django
En un sitio web tradicional basado en datos, una aplicación web espera solicitudes HTTP del navegador web (u otro cliente). Cuando se recibe una solicitud, la aplicación determina lo que se necesita en función de la URL y, posiblemente, de la información de los datos POST o GET. Dependiendo de lo que se requiera, puede leer o escribir información de una base de datos o realizar otras tareas necesarias para satisfacer la solicitud. Luego, la aplicación devolverá una respuesta al navegador web, a menudo creando dinámicamente una página HTML para que el navegador la muestre al insertar los datos recuperados en marcadores de posición en una plantilla HTML.

Las aplicaciones web de Django generalmente agrupan el código que maneja cada uno de estos pasos en archivos separados:
![Esquema](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Django/Introduction/basic-django.png)

- URL: si bien es posible procesar solicitudes de cada URL individual a través de una sola función, es mucho más fácil de mantener escribir una función de vista separada para manejar cada recurso. Se utiliza un mapeador de URL para redirigir las solicitudes HTTP a la vista adecuada en función de la URL de la solicitud. El mapeador de URL también puede hacer coincidir patrones particulares de cadenas o dígitos que aparecen en una URL y pasarlos a una función de vista como datos.
  
- Vista: una vista es una función de manejo de solicitudes, que recibe solicitudes HTTP y devuelve respuestas HTTP. Las vistas acceden a los datos necesarios para satisfacer las solicitudes a través de modelos y delegan el formato de la respuesta a las plantillas.
- Modelos: los modelos son objetos de Python que definen la estructura de los datos de una aplicación y proporcionan mecanismos para administrar (agregar, modificar, eliminar) y consultar registros en la base de datos.
- Plantillas: una plantilla es un archivo de texto que define la estructura o el diseño de un archivo (como una página HTML), con marcadores de posición que se utilizan para representar el contenido real. Una vista puede crear dinámicamente una página HTML usando una plantilla HTML, llenándola con datos de un modelo. Se puede utilizar una plantilla para definir la estructura de cualquier tipo de archivo; ¡No tiene que ser HTML!

Toda esta magia se construye utilizando el patrón Modelo Vista Controlador, puedes leer más sobre el [aquí](https://medium.com/geekculture/django-model-view-controller-framework-4c0a979ec4b1).

## Roadmap
Para afianzar los conocimientos sobre Django recomendamos visitar la [documentación oficial](https://docs.djangoproject.com/en/4.1/) y leer sobre los principales elementos:
- [Modelos](https://docs.djangoproject.com/en/4.1/topics/db/models/)
- [URLS](https://docs.djangoproject.com/en/4.1/topics/http/urls/)
- [Templates](https://docs.djangoproject.com/en/4.1/topics/templates/)

Una vez se haya leído la información básica sobre django recomendamos hacer el siguiente tutorial(Tutorial a elegir aun)


# Django Rest Framework
Tu camino para desarrollar aplicaciones usando Django como herramienta solo ha comenzado, ahora que has visto lo básico, estás preparado para saber que el framework ha evolucionado con el tiempo, introduciendo nuevas funcionalidades que hacen la construcción de [APIs Rest](https://www.codecademy.com/article/what-is-rest) mucho más sencilla que nunca, te presentamos **[Django Restframework](https://www.django-rest-framework.org/)**.

## Diferencia con Django normal
Django es un framework diseñado para el desarrollo web en Python, y Django Rest Framework (DRF) es la biblioteca utilizada en Django para construir API RESTful.

Con DRF es mucho mas facil diseñar las operaciones [CRUD](https://www.freecodecamp.org/news/crud-operations-explained/) y usar el servidor Django como una [API](https://en.wikipedia.org/wiki/API) REST.
¿Que significa esto?, imaginemos que necesitamos registrar libros en una aplicación para una biblioteca, el administrador de la biblioteca necesita poder hacer las operaciones CRUD con los libros, una vez desarrollada la interfaz en el frontend veremos que necesitamos extraer,insertar y actualizar los datos de una base de datos, SQL podria ser una solución, pero no podemos meter sentencias SQL en nuestro código frontend, aparte si necesitamos paginar la información, filtrarla y ordenarla, vamos a acabar con cientos de líneas de código, sin embargo DRF nos da la oportunidad de crear un [Endpoint](https://smartbear.com/learn/performance-monitoring/api-endpoints/#:~:text=Simply%20put%2C%20an%20endpoint%20is,of%20a%20server%20or%20service.) del estilo "http/url/libros/" al que podemos acceder desde el frontend con distintos verbos HTTP de una forma sencilla. Así de una forma sencilla y con muy pocas lineas de código ofrecemos una API REST para acceder a la información que nuestro equipo de frontend estará encantado de utilizar.

Para consolidar estas ideas puedes familiarizarte con los nuevos elementos que introduce Django Rest Framework realizando un Endpoint de usuarios siguiendo [este tutorial](https://www.django-rest-framework.org/tutorial/quickstart/).

## Principales Elementos DRF
Se recomienda leer con calma los siguientes links de la documentación original donde se explican las funcionalidades principales de Django Rest Framework:
- [Serialización](https://www.django-rest-framework.org/tutorial/1-serialization/#tutorial-1-serialization): Los serializadores permiten que datos complejos, como conjuntos de consultas e instancias de modelos, se conviertan en tipos de datos nativos de Python que luego se pueden representar fácilmente en JSON, XML u otros tipos de contenido. Los serializadores también brindan deserialización, lo que permite que los datos analizados se vuelvan a convertir en tipos complejos, después de validar primero los datos entrantes.
- [Peticiones y respuestas](https://www.django-rest-framework.org/tutorial/2-requests-and-responses/): Los objetos de petición y respuesta de DRF brindan un análisis de solicitudes flexible que le permite tratar solicitudes con datos JSON u otros tipos de medios de la misma manera que normalmente trataría con datos de formularios.
- [Vistas basadas en clases](https://www.django-rest-framework.org/tutorial/3-class-based-views/): son útiles para mantener el código más legible y reutilizable.
- [Conjuntos de vistas y enrutadores](https://www.django-rest-framework.org/tutorial/6-viewsets-and-routers/): permiten combinar la lógica para un conjunto de vistas relacionadas en una sola clase

## Tutorial Django Rest Framework
(Video tutorial a elegir aun)