# Trabajo práctico: Protocolo RSA
## Objetivo
- Poner a prueba los conocimientos aprendidos sobre Algebra mediante un proyecto simple y pequeño. El mismo se basa en implementar una versión simplificada del protocolo de seguridad RSA. (https://es.wikipedia.org/wiki/RSA)
- Correcto uso de funciones recursivas.
- Utilización de nombres declarativos para las funciones. 

# Correr tests
El trabajo admite una serie de tests para poner a prueba el correcto funcionamiento del código.
Para compilar y poder correrlos se necesita la herramienta GHC (Glasgow Haskell Compiler).
Desde la carpeta root ejecutar:
El archivo `main.hs` es el encargado de unificar todo, se deberá cargar en GHCI con ghci `main.hs`, esto incluir ́a todos los archivos. Luego, utilizar la 
función `main`, que codifica, decodifica y rompe algunos mensajes dados.  O  también  la  función `test`,  a  la  cual  se le  puede  pasar  una  lista  de mensajes que codificará, decodificará y romperá.
