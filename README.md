# La Parri de Rosendo
Rosendo tiene una parrilla y nos pidió un sistema para administrar el menú de su reciente parrilla.


## 1. Comidas
Nos piden modelar los distintos platos que ofrecen. De cada comida nos interesa conocer su _peso_ y saber si es _apta vegetariano_. 

### Provoleta
- Se informa su peso y si lleva especias.
- Es apto vegetariano.

### Asado
- Se nos indica los cortes de carne pedidos. De cada corte se conoce su _calidad_ (es un número, ver más abajo) y _peso_.
- El peso del asado es la suma de los pesos de sus cortes.
- No es apto vegetariano.

### Hamburguesas
- Nos informan el tipo de pan que lleva (ver más abajo).
- Su peso es siempre de 120gr.
- Las hamburguesas por lo general no son aptas vegetariano, exceptuando las **hamburguesas vegetarianas**.
- Para las hambuguesas vegetarianas, que son como cualquier otra hamburguesa salvo que sí son aptas vegetariano, además del tipo de pan nos informan la legumbre con la que se va a hacer la hamburgusa. Por ahora solo nos interesa su nombre, por ej: "Lentejas", "Porotos", Garbanzos".


## 2. Valoración
Nos piden saber la valoración que le da Rosendo a cada comida. La valoración para cualquier comida es la suma entre:
- Una _valoración propia_ de cada comida
- Mas _50 puntos extra_ si la comida es apta vegetariano, por ser amiga de los animales.

La valoración propia depende del tipo de comida que sea:
- Para la **provoleta**: es de 120 puntos si es especial, sino 80. Sabemos que una provoleta es especial cuando _es abundante_ y tiene especias. Por ahora nos dicen que las comidas abundantes son las que pesan más de 100gr. 
- Para el **asado**: es `15 * máxima calidad de sus cortes - cantidad de cortes` sin poder ser menor que 0.
- Para las **hamburguesas**: tienen 60 puntos de base más los puntos que le ortorga el pan:
  - **Pan con sésamo** otorga 20 puntos.
  - **Pan casero** otorga 35 puntos.
  - **Pan parmesano** otorga 55 puntos.
  - Además, las hamburguesas vegetarianas tienen otro plus igual a `2 * cantidad de letras del nombre de la legumbre`.
  

## 3. Comensales
Nos piden agregar al modelo a los comensales. De los comensales nos interesa saber si _le agrada una commida_, esto depende de su gusto culinario:
- A los **vegetarianos** les agradan las comidas que son aptas vegetariano y tienen una valoración mayor a 85.
- A los de **hambre media** simplemente les agradan las comidas abundantes.
- A los **exquisitos** les agradan las comidas que pesan entre 150gr y 300gr, y además tengan una valoración mayor a 100.
Por ahora nos piden modelar estos tipos de comensales, sabiendo que es posible que se agreguen más en el futuro.


## 4. Menú
Se quiere agregar al modelo un menú, que tiene _todas las comidas_ que se ofrecen en la parrilla. Se quiere conocer
- La _comida más valiosa_ del menú. Esta es la que tiene mayor valoración.
- Saber si el menú _tiene alguna comida liviana_. O sea, alguna que pese menos de 100gr.
- Saber si el menú está _libre de maltrato animal_. Esto significa que todas sus comidas son aptas vegetariano.
- Conocer todas las comidas que _le gustan a un comensal_.

También se pide **poder elegir un plato** del menú para un comensal. Por ahora es cualquier plato que le guste. Si no le gusta ningún plato del menú entonces se debería lanzar un error específico.


## 5. Secreto parrillero
Por último, se nos pide agregar a Rosendo al sistema para saber cómo queda su parrilla luego de cocinar para un grupo de comensales. Esto significa, al recibir colección de comensales:
- Tomar sus pedidos, o sea, que elijan un plato.
- Cocinarlos todos: el secreto de Rosendo es dejar las comidas en la parrilla un rato más para que _se tuesten_. 
Al tostar una comida, todas ellas reaccionan aumentando su valoración un 50%. Pero además, el asado pierde sus cortes con calidad de 1 o menos (porque se queman).

El sistema debe poder determinar cómo queda la parrilla (o sea, las comidas) luego de recibir a un conjunto de comensales.

## 6. BONUS: Criterios de hambre
A Rosendo le gustaría extender el sistema por el cual un comensal elige una comida del menú. Sigue mantieniendo que debe ser una comida que le guste, pero por lo general no eligen cualquiera al azar, sino que tenemos los siguientes patrones:
- Los **hambrientos** elijen, entre las comidas del menú que le gustan al comensal, la primera abundante.
- Los **glotones** elijen, entre las comidas del menú que le gustan al comensal, la más pesada
- Los **memoriosos** elijen, entre las comidas del menú que le gustan al comensal, la que pidieron la última vez. Pero si es la primera que va, o la comida no se encuentra en el menú (porque la sacaron o porque le dejó de gustar), elije cualquiera (y la recuerda, obviamente).
