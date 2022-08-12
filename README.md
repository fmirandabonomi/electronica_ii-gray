# Trabajo práctico 1 - Electrónica II 2022 para ingeniería electrónica - Codificador para código gray de tres bits

Para completar el práctico debes:
- Instalar Visual Studio Code.
- Instalar la extension puorc.awesome-vhdl
- Instalar Git.
- Instalar GHDL.
- Clonar este repositorio en tu máquina.
- Ejecutar el testbench y ver que falla.
- Corregir la implementación hasta que pase las pruebas.

## Instalar Visual Studio Code y la extensión VHDL

Para instalar Visual Studio Code con la extensión necesaria

- Ve al sitio [code.visualstudio.com](https://code.visualstudio.com/) en tu navegador
- Descarga el instalador
- Ejecuta la instalación
- Abre Visual Studio Code
- Presiona Ctrl+Mayusc+X para abrir el panel de extensiones
- Escribe en el cuadro de búsqueda en la parte superior del panel escribe (o copia y pega, sin las comillas) "puorc.awesome-vhdl"
- Debe aparecer un único resultado, presiona "Install" en el resultado.

## Instalar Git

Para instalar Git

- Ve al sitio [git-scm.com/downloads](https://git-scm.com/downloads) en tu navegador
- Ve al link de tu plataforma
- Descarga el instalador (en windows "Standalone Installer" de 32 o 64 bits según corresponda)
- Ejecuta el instalador
- Cuando te pide elegir el editor elije "Visual Studio Code" en lugar de vim. Todas las otras opciones puedes dejarlas por defecto.
- Windows: Abre "git cmd", lo encontrarás en el menú inicio en git o con windows+q "git cmd" si tienes windows 10 o superior.
- Linux: Abre una terminal nueva.
- Configura tu nombre y email. Luego de cada comando debes presionar enter. Una vez configurado puedes salir de la consola.
```
  git config --global --add user.name "<escribe tu nombre aquí>"
  git config --global --add user.email <escribe tu email aquí>
  exit
```
## Instalar GHDL

En linux se instala con el manejador de paquetes de tu distribución.
En Windows
- Instala MSYS2 siguiendo las instrucciones en [msys2.org](https://www.msys2.org/) y supongo que lo instalas en `c:\msys64`
- Abre la consola de MSYS (desde el acceso directo en el menú inicio o buscando con windows+q)
- Actualiza el sistema ejecutando el siguiente comando (respeta mayúscula y minúscula, presiona enter para ejecutar) repetidas veces hasta que indique que todo está actualizado (up to date).
```
  pacman -Syu
```
  Nota: Debes aceptar cuando pregunte. Con algunas actualizaciones deberás volver a abrir MSYS.
- Instala ghdl (32 bits) y sus dependencias
```
  pacman -S mingw-w64-i686-ghdl-mcode
```
  debes aceptar para que proceda con la instalación.
- Puedes cerrar la consola luego de instalar
```
  exit
```  
- Agrega al path la carpeta `C:\msys64\mingw32\bin` para ello debes
  - Abrir _Propiedades del sistema_
  - Abrir _Configuración avanzada del sistema_
  - En opciones avanzadas elegir _Variables de entorno_
  - En el listado de variables de usuario hacer doble click en la variable `Path`
  - Agregar al final de la lista `C:\msys64\mingw32\bin`
    Nota: en versiones anteriores de windows aparece un solo texto largo en lugar de un listado, en ese caso agregar `;C:\msys64\mingw32\bin` (incluye el punto y coma) al final del texto

## Clonar el repositorio y probar el testbench

Para clonar este repositorio 
- Abre Visual Studio Code
- Presiona _Ctrl+Mayusc+P_ para abrir la paleta de comandos
- Escribe `Git:Clone` y presiona enter
- Pega en el cuadro de entrada lo siguiente y presinona enter:
```
  https://github.com/fmirandabonomi/electronica_ii-gray.git
```
- Selecciona una carpeta base. El repositorio se clonará en una nueva carpeta llamada `electronica_ii-gray` dentro de la carpeta que elijas.
- Una vez clonado aparecerá un cuadro en el sector inferior izquierdo y te dará la opción de abrirlo. Selecciona _Open_ u _Open in New Window_.
- Abre una terminal con el menú _Terminal->New terminal_
- Escribe los comandos 
```
  ghdl -a *.vhd
  ghdl -r bin_a_gray_tb
```
  Si todo está bién verás una serie de mensajes de error y luego "bin_a_gray debe generar un codigo gray [FAIL]"
  
## Corregir la implementación

Para corregir la implementación debes editar el archivo `design.vhd`. 
- Abre el panel "explorer" con _Ctrl+Mayus+E_
- Haz click en `design.vhd` para abrirlo. Aparecerá el editor en el lado derecho
- Lee el programa y haz los cambios que corresponda
- Para probar tu implementación debes guardar el archivo con _Ctrl+S_, ir a la terminal (puedes usar _Ctrl+ñ_), e introducir los comandos
```
  ghdl -a *.vhd
  ghdl -r bin_a_gray_tb
```
  Si falla (`[FAIL]`) puedes encontrar pistas leyendo los errores.
- El práctico está completo cuando pasa las pruebas (`[PASS]`)
