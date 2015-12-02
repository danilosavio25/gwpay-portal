package br.com.gwpay.portal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.gwpay.portal.model.Adquirente;
import br.com.gwpay.portal.util.ConnectionFactory;

public class AdquirenteDao {
	
	public List<Adquirente> buscaDadosAdquirente(){
		
		ArrayList<Adquirente> adquirentes = new ArrayList<>();
		try {
			 
			ConnectionFactory connectionFactory = new ConnectionFactory();
			Connection conn = connectionFactory.getConnection();
			System.out.println("after getconn");
			PreparedStatement pstmt;
			
			pstmt = conn.prepareStatement("SELECT ID, NOME from adquirente");
										
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Adquirente adquirente = new Adquirente();
				adquirente.setId(rs.getInt("id"));
				adquirente.setNome(rs.getString("nome"));
				adquirentes.add(adquirente);
			}
			rs.close();

			pstmt.close();
			conn.close();
			
			return adquirentes;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return adquirentes;
		
	}
	
}
