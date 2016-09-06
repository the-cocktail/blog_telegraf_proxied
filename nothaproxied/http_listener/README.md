# Prueba de infuxDB + Telegraf standard + HAproxy

Require Docker y Linux 64

Cada orden se queda en primer plano mostrando logs

arrancar influxdb con

```
./start_influx.sh
```

Arrancar telegraf "proxificado" en primer plano con

```
../telegraf_custom -config http_listener/telegraf_normal_firewalled.config
```

Arrancar el telegraf "proxy" en primer plano con

```
../telegraf_custom -config http_listener/telegraf_http_listener.cfg
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

Si se apaga el proxy el otro telegraf deberia empezar a acumular metricas en el
buffer, recuperandose al arrancar el proxy

Si se apaga el influx el proxy deberia empezar a acumular metricas pero el no
proxy no.

Se deben de poder arrancar en cualquier orden.
