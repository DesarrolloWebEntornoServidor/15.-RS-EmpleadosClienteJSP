<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>RS-EmpleadosSP</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    </head>
    <body>
        <h1>Servicio REST RS-EmpleadosClienteJSP</h1>
        <div style="border:solid 1px;width:450px;height:200px;padding:10px; float:left;">
            <h3> LISTADO DE EMPLEADOS (Método @GET)</h3>
            <input type="button" id="listar" value="Listar empleados" /> <br /><br />
            <textarea id="salida1" readonly="readonly" style="border: 1px solid;width:200px;height:60px;"></textarea><br/><br/>
        </div>
        <div style="width:30px;padding:10px; float:left;"></div>
        <div style="border:solid 1px;width:450px;height:200px;padding:10px; float:left;">
            <h3> CREAR UN EMPLEADO (Método @POST)</h3>
            Introduce un empleado:<br/><br/>
            Id:<input type="text" name="idEmpleado" id="idEmpleado"/><br/>
            Nombre:<input type="text" name="nombreEmpleado" id="nombreEmpleado"><br><br>
            <input type="button" id="crear" value="Crear empleado" /> <br /><br />
        </div>
            
        <script type="text/javascript">
            var BASE_URI='http://localhost:8080/RS-Empleados/webresources/entidades.empleados';           
            // Listar Empleados
            jQuery("#listar").click(function(){                  
                $.getJSON(BASE_URI,function(empleados) {
                    $("#salida1").html("");
                    $.each(empleados, function(posicion, empleado){
                        $("#salida1").append(posicion+"> "+empleado.idempleado+" "+empleado.nombre + "\n");    
                    });                    
                });
            });
            
            // Crear Empleado
            jQuery("#crear").click(function(){
                var idEmpleado=jQuery("#idEmpleado").val();
                var nombreEmpleado=jQuery("#nombreEmpleado").val();
                // Damos el formato JSON a la variable datosEmpleado
                var datosEmpleado='{"idempleado":'+idEmpleado+','+'"nombre":"'+nombreEmpleado+'"}'; 
                // Envío de datosEmpleado (cuyo contenido es JSON) por el método POST
                $.ajax({
                    url: BASE_URI,
                    method: "POST",
                    data: datosEmpleado,
                    success: function(){alert('Empleado creado: ' + datosEmpleado);},
                    error: function() {alert('Error');},
                    contentType: "application/json"
                });               
            });
        </script>
    </body>
</html>