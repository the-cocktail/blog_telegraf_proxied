# Prueba de infuxDB + Telegraf standard + HAproxy

Require Docker y Linux 64

Cada orden se queda en primer plano mostrando logs

arrancar influxdb con

```
./start_influx.sh
```

Arrancar telegraf "proxy"

```
../telegraf_custom -config telegraf_tcp_input.cfg
```

Arrancar telegraf "proxied"

```
../telegraf_custom -config telegraf_tcp_output.cfg
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

El telegraf no proxy no puede ser arrancado sin la presencia del proxy

Si la conexion con el proxy se pierde el telegraf que no actua de proxy no puede
recuperarla

Si influx se apaga el proxy comienza a acumular en el buffer peticiones de ambos
telegrafs, recuperandose cuando se restaura.
