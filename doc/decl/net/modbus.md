# modbus

```decl
protocol MODBUS { variants=RTU|TCP }
```

## RTU over [[serial]]

```decl
protocol mrtu:modbus { over=uart|rs485|tcp }
```

## TCP

```decl
protocol mtcp:modbus { over=tcp }
```
