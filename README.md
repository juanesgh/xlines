Para poder utilizar la aplicacion correctamente>
Realizar login, mandando json conn este estilo

{
	"email":"b@bbb.com",
	"password":"bbbbbb",
	"session":{
		"email":"b@bbb.com",
		"password":"bbbbbb"
	}
}

Luego, guardar del header recibido (No importaa si se realizo get post o delete) los siguientes headers:
*access-token
*client
*uid
realizar esta acion cada vez que se haga una request http, porque si no el token access queda invalido y toca hacer login de nuevo