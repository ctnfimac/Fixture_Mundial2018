package ar.com.fimac.app;

import ar.com.fimac.Conexion.Conexion;

public class App {
	
	public static void main(String[] args){
		
		Conexion instancia = Conexion.getInstancia();
		instancia.conectar();
	    instancia.consulta("integrante","nombre","nombre LIKE '%Sergio%'");
	    instancia.printQuery();
	    instancia.desconectar();
	    
	}
}
