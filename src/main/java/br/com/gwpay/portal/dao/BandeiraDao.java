package br.com.gwpay.portal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.gwpay.portal.model.Bandeira;
import br.com.gwpay.portal.util.ConnectionFactory;

public class BandeiraDao {
	
	public List<Bandeira> buscaDadosBandeira(){
		
		ArrayList<Bandeira> bandeiras = new ArrayList<>();
		try {
			 
			ConnectionFactory connectionFactory = new ConnectionFactory();
			Connection conn = connectionFactory.getConnection();
			System.out.println("after getconn");
			PreparedStatement pstmt;
			
			pstmt = conn.prepareStatement("SELECT ID, NOME from bandeira");
										
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Bandeira bandeira = new Bandeira();
				bandeira.setId(rs.getInt("id"));
				bandeira.setNome(rs.getString("nome"));
				bandeiras.add(bandeira);
			}
			rs.close();

			pstmt.close();
			conn.close();
			
			return bandeiras;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return bandeiras;
		
	}
	
}
