# Prueba de infuxDB + Telegraf standard + HAproxy

Require Docker y Linux 64

Cada orden se queda en primer plano mostrando logs

arrancar influxdb con

```
./start_influx.sh
```

Arrancar telegraf en primer plano con

```
telegraf -config start telegraf.conf
```

Los datos de influx se borran cada vez que se para el contenedor.

El UI de InfluxDB esta en http://127.0.0.1:8083

Abrir en el navegador, seleccionar la base de datos telegraf y lanzar la
consulta

```
  SELECT * FROM trig
```

Probar a tirar distintas partes

## Comportamiento observado

Si se apaga influx o el haproxy el telegraf debe empezar a a acumular
metricas en su buffer, restablecidos los sistemas debe de volver a vaciar el
buffer

Si el telegraf se apaga con el buffer lleno, las metricas que no se han enviado
a influx se pierden
