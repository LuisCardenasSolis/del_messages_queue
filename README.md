# del_messages_queue
Eliminar mensajes encolados de un remitente y destinatario especifico

~~~
Ejecutar: ./dqueue.sh sender recipient
-sender: correo del remitente
-recipient: correo del destinario
~~~

##Comodines
~~~
./dqueue.sh sender all : Borrar cola de mensajes de un remitente especifico y cual destinatario de este
./dqueue.sh all recipient : Borrar cola de mensajes de un destinario especifico y cual remitente de este
~~~
