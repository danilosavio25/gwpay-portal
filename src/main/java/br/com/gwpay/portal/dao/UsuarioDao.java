package br.com.gwpay.portal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.gwpay.portal.model.Usuario;
import br.com.gwpay.portal.util.ConnectionFactory;

public class UsuarioDao {
	
	public int getId(Usuario usuario){
		
		try {
			 
			ConnectionFactory connectionFactory = new ConnectionFactory();
			Connection conn = connectionFactory.getConnection();
			System.out.println("after getconn");
			PreparedStatement pstmt;
			
			pstmt = conn.prepareStatement("SELECT ID FROM USUARIO  WHERE LOGIN = ? AND SENHA = ?");
										

			pstmt.setString(1, usuario.getLogin());
			pstmt.setString(2, usuario.getSenha());

			ResultSet rs = pstmt.executeQuery();
			
			int id = 0;
			while (rs.next()) {
				id =  rs.getInt("id");
			}
			rs.close();

			pstmt.close();
			conn.close();
			
			return id;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
		
	}
	
	public int buscaClienteId(Usuario usuario){
		
		try {
			 
			ConnectionFactory connectionFactory = new ConnectionFactory();
			Connection conn = connectionFactory.getConnection();
			System.out.println("after getconn");
			PreparedStatement pstmt;
			
			pstmt = conn.prepareStatement("SELECT C.ID AS ID FROM CLIENTE C JOIN USUARIO U ON C.ID = U.CLIENTE_ID AND U.LOGIN = ? AND U.SENHA = ?");
										

			pstmt.setString(1, usuario.getLogin());
			pstmt.setString(2, usuario.getSenha());

			ResultSet rs = pstmt.executeQuery();
			
			int id = 0;
			while (rs.next()) {
				id =  rs.getInt("id");
			}
			rs.close();

			pstmt.close();
			conn.close();
			
			return id;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
		
	}
	
	
	
	
	public boolean existeUsuario(Usuario usuario) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			ConnectionFactory connectionFactory = new ConnectionFactory();
			conn = connectionFactory.getConnection();
			System.out.println("after getconn");
			
			pstmt = conn.prepareStatement("SELECT LOGIN FROM USUARIO  WHERE LOGIN = ? AND SENHA = ?");

			pstmt.setString(1, usuario.getLogin());
			pstmt.setString(2, usuario.getSenha());

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				return true;
			}
			
			return false;

		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("Ops... Um erro aconteceu. Caso este erro persista, entre em contato com a GWPay.");
		} finally{
			System.out.println("closing connections");
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("Ops... Um erro aconteceu. Caso este erro persista, entre em contato com a GWPay.");
			}
		}
	}

	public String buscaDadosUsuario(Usuario usuario) {
		try {
			 
			ConnectionFactory connectionFactory = new ConnectionFactory();
			Connection conn = connectionFactory.getConnection();
			System.out.println("after getconn");
			PreparedStatement pstmt;
			
			pstmt = conn.prepareStatement("SELECT NOME FROM USUARIO  WHERE LOGIN = ? AND SENHA = ?");
										

			pstmt.setString(1, usuario.getLogin());
			pstmt.setString(2, usuario.getSenha());

			ResultSet rs = pstmt.executeQuery();
			
			String nome = null;
			while (rs.next()) {
				nome =  rs.getString("NOME");
			}
			rs.close();

			pstmt.close();
			conn.close();
			
			return nome;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
		
	}
}
