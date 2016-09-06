# Prueba de infuxDB + Telegraf standard + HAproxy

Require Docker y el binario de telegraf instalado en el sistema o accesible en
el path

Cada orden se queda en primer plano mostrando logs

Arrancar telegraf en primer plano con

```
telegraf -config start telegraf.conf
```


arrancar influxdb con

```
./start_influx.sh
```

arrancar haproxy con

```
./start_haproxy.sh
```

Los datos de influx se borran cada vez que se para el contenedor.

El UI de InfluxDB esta en http://127.0.0.1:8083

Abrir en el navegador, seleccionar la base de datos telegraf y lanzar la
consulta

```
  SELECT * FROM trig
```

Probar a tirar distintas partes

## Comportamiento esperado

Si se apaga influx o el haproxy el telegraf debe empezar a a acumular
metricas en su buffer, restablecidos los sistemas debe de volver a vaciar el
buffer

Si el telegraf se apaga con el buffer lleno, las metricas que no se han enviado
a influx se pierden
