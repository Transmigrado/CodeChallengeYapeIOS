# CodeChallengeYapeIOS

Challenge para postular al puesto de desarrollador Mobile en Yape

Score en codebeat

[![codebeat badge](https://codebeat.co/badges/a1d03516-eb88-47fa-9959-d3577f98010e)](https://codebeat.co/a/jorge-acosta-313fd96d-776e-49af-9bd2-9de5a5d7a1da/projects/github-com-transmigrado-codechallengeyapeios-main)


## aclaración del proyecto
como es un proyecto de prueba, algunos modulos quedaron incompletos dado el tiempo. como el modulo de login, aunque el modulo de registro funciona, no esta indicando carga, asi que se recomienda en general no seguir caminos fallidos, como en el caso de agregar receta, un formulario que tiene validaciones en los campos de nombre, descripcion e ingredientes, pero es necesario que se suba una imagen, apretar el boton y esperar un momento.

Además no pude hacer pruebas sobre los Thunks debido a que la libreria de testing adjunta con la libreria presento problemas y dado que ya estaba utilizando la arquitectura no tuve tiempo de resolver dicho problema. sin embargo el proyecto cuenta con todos los requerimientos completos.

## descripción

El proyecto esta programado en swift usando SWiftUI y utilizando una arquitectura Redux Thunk, basado en acciones

!![Simulator Screen Shot - iPhone 14 - 2023-03-24 at 01 46 57](https://user-images.githubusercontent.com/1039942/227556427-0ae6ef49-f55c-41e5-9bc1-2e3de7b02905.png)
![Simulator Screen Shot - iPhone 14 - 2023-03-24 at 01 46 53](https://user-images.githubusercontent.com/1039942/227556429-41fd557e-bb33-4adc-970f-60fc9aca4aec.png)
![Simulator Screen Shot - iPhone 14 - 2023-03-24 at 01 46 46](https://user-images.githubusercontent.com/1039942/227556437-03f01b56-c4b2-4164-972e-9b0e8f36e5a1.png)
[Uploading Simulator Screen Shot - iPhone 14 - 2023-03-24 at 01.47.03.png…]()


## uso de SWinject
el uso de SWinject se hizo fundamental para poder inyectar las vistas a utilizar y que mantuvieran un mismo contexto global, sin SWinject no hubiera sido posible hacer logout, ya que al cambiar de contexto, el store de Redux se perderia, pero con la inyección de dependencia se mantiene un contexto global desde un inicio.


## uso de redux
Existe una store central con dos reducers, uno para usuario y otro para recetas, los thunks son funciones que se ejecutan anidadas para poder enviar mas adelante acciones de redux, por ejemplo: agregar receta y luego refrescar nuevamente las resetas.

## uso de FormValidator

se uso esta libreria para validar los formulario, se creo un validador custom para poder validar la lista de ingredientes al momento de agregar una receta

## Librerias

- Firebase
- Reswift
- Reswift-Thunk
- Coordinator
- Swinject
- FormValidator


## Instalación de mapbox
la aplicación usa mapbox para desplegar los mapas, recomiendo ver la guia para que la dependencia funcione
https://docs.mapbox.com/ios/maps/guides/install/

Crear token de mapbox y agregarlo como variable de entorno (MAPBOX_API_KEY)



