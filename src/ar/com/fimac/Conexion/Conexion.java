package ar.com.fimac.Conexion;

import java.sql.*;

public class Conexion{
	private static Conexion instancia = null;
	private final String host = "localhost";
	private final String puerto = "3306";
	private final String usuario = "root";
	private final String contrasenia = "";
	private final String bd = "mundialdb";
	
	private Connection conexion;
	private Statement sesionSql;
	private ResultSet respuestaDeConsulta;
	
	private Conexion(){}
	
	public static Conexion getInstancia(){
		if(instancia == null){
			instancia = new Conexion();
		}
		return instancia;
	}
	
	
	public void conectar() {
		try {
			conexion = DriverManager.getConnection("jdbc:mysql://"+ host +":"+ puerto +"/"+ bd , usuario , contrasenia);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * Desconecto la base de datos
	 * */
	public void desconectar() {
		conexion = null;
	}
	
	/*
	 * Realiza una consulta
	 * @param consulta completa
	 * */
	public void consulta(String query){
		try {
			sesionSql = conexion.createStatement();
			respuestaDeConsulta = sesionSql.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/*
	 * Realiza una consulta para mostrar campos de determinada tabla
	 * */
	public void consulta(String tabla, String campos){
		String query = "SELECT "+campos+" FROM "+tabla;
		try {
			sesionSql = conexion.createStatement();
			respuestaDeConsulta = sesionSql.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/*
	 * Realiza una consulta con su respectiva condicion
	 * */
	public void consulta(String tabla, String campos, String condicion){
		String query = "SELECT "+ campos +" FROM "+ tabla +" WHERE " + condicion;
		try {
			sesionSql = conexion.createStatement();
			respuestaDeConsulta = sesionSql.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * Imprime la consulta en consola
	 * */
	public void printQuery(){
		try {
			while(respuestaDeConsulta.next()){
				System.out.println("Jugador: " + respuestaDeConsulta.getString("nombre"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
