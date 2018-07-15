package ar.com.fimac.app;

import java.sql.*;
import java.util.Scanner;

public class App {
	static final String bd = "jdbc:mysql://localhost:3306/mundialdb";
	static final String user = "root";
	static final String password = "";
	
	public static void main(String[] args){
		Scanner teclado = new Scanner(System.in);
		String query;
		
		System.out.print("Escribe una consulta: ");
		query = teclado.nextLine();
		
		consulta(query);
		teclado.close();
	}
	
	static void consulta(String query){
		try {
			ResultSet respuesta = conectar().executeQuery(query);
			while(respuesta.next()){
				System.out.println("Jugador: " + respuesta.getString("nombre"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	static Statement conectar(){
		Statement sesionSql = null;
		
		Connection conexion;
		try {
			conexion = DriverManager.getConnection(bd,user,password);
			sesionSql = conexion.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sesionSql;
	}
}
