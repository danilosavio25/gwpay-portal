package br.com.gwpay.portal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.com.gwpay.portal.model.HistoricoTransacao;
import br.com.gwpay.portal.util.ConnectionFactory;
import br.com.gwpay.portal.util.FiltroBusca;


public class HistoricoTransacaoDao {
	
	public  HistoricoTransacaoDao(){
	} 
	
	public List<HistoricoTransacao> buscarHistoricosTransacao(FiltroBusca filtro){
		List<HistoricoTransacao> historicos = new ArrayList<HistoricoTransacao>();;
		try {
			
			ConnectionFactory connectionFactory = new ConnectionFactory();
			Connection conn = connectionFactory.getConnection();
			System.out.println("after getconn");
			PreparedStatement pstmt;
			
			String sql = " SELECT H.NSU_ID, H.TERMINAL_ID, H.NUM_CARTAO,  H.BANDEIRA_ID, H.VALOR , H.DAT_TRS, H.DSC_RESPOSTA, B.NOME AS BANDEIRA FROM HISTORICO_TRANSACAO H JOIN BANDEIRA B ON H.BANDEIRA_ID = B.ID "
					+ "AND H.DAT_TRS BETWEEN ? AND ? "
					+ "AND H.CLIENTE_ID = ? ";
					if(!filtro.getBandeiraId().equals("0")){
						sql += "AND H.BANDEIRA_ID = ? ";
					}
					if(!filtro.getAdquirenteId().equals("0")){
						sql += "AND H.ADQ_ID = ? ";
					}
					sql += " ORDER BY H.DAT_TRS DESC ";
					 
			
			pstmt = conn.prepareStatement(sql);
					
			System.out.println(convertToTimeStamp(filtro.getDataInicio()));
			System.out.println(convertToTimeStamp(filtro.getDataFim()));
					
			pstmt.setTimestamp(1, convertToTimeStamp(filtro.getDataInicio()));
			pstmt.setTimestamp(2,  convertToTimeStamp(filtro.getDataFim()));
			pstmt.setInt(3, Integer.parseInt(filtro.getClientId()));
			
			if(!filtro.getBandeiraId().equals("0")){
				pstmt.setInt(4, Integer.parseInt(filtro.getBandeiraId()));

			}
			if(!filtro.getAdquirenteId().equals("0") && !filtro.getBandeiraId().equals("0")){
				pstmt.setInt(5, Integer.parseInt(filtro.getAdquirenteId()));
			}else if(!filtro.getAdquirenteId().equals("0") && filtro.getBandeiraId().equals("0")){
				pstmt.setInt(4, Integer.parseInt(filtro.getAdquirenteId()));
			}
			
			 
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				HistoricoTransacao historico = new HistoricoTransacao();
				historico.setCodNSU(rs.getString("nsu_id"));
				historico.setCodCliente(rs.getString("terminal_id"));
				historico.setNumCartao(rs.getString("num_cartao"));
				historico.setBandeiraId(rs.getInt("bandeira_id"));
				historico.setValor(rs.getDouble("valor"));
				historico.setDataTransacao(rs.getTimestamp("dat_trs"));
				historico.setDescricaoResposta(rs.getString("dsc_resposta"));
				historico.setBandeira(rs.getString("bandeira"));
				//historico.setAdquirenteId(rs.getInt("adq_id"));
				historico.setProduto("Crédito");
				historico.setAdquirente("GetNet"); 
				historicos.add(historico);
			}
			rs.close();

			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return historicos;
		
	}
	
	public List<HistoricoTransacao> buscarQuantidadeRegistros(FiltroBusca filtro){
		List<HistoricoTransacao> historicos = new ArrayList<HistoricoTransacao>();;
		try {
			
			ConnectionFactory connectionFactory = new ConnectionFactory();
			Connection conn = connectionFactory.getConnection();
			System.out.println("after getconn");
			PreparedStatement pstmt;
			
			String sql = " SELECT H.NSU_ID, H.TERMINAL_ID, H.NUM_CARTAO,  H.BANDEIRA_ID, H.VALOR , H.DAT_TRS, H.DSC_RESPOSTA, B.NOME AS BANDEIRA FROM HISTORICO_TRANSACAO H JOIN BANDEIRA B ON H.BANDEIRA_ID = B.ID "
					+ "AND H.CLIENTE_ID = ? "
					+ "ORDER BY H.DAT_TRS DESC LIMIT ?";
					
			
			pstmt = conn.prepareStatement(sql);
					
					
			pstmt.setInt(1, Integer.parseInt(filtro.getClientId()));
			pstmt.setInt(2, Integer.parseInt(filtro.getNumRegistros()));

			
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				HistoricoTransacao historico = new HistoricoTransacao();
				historico.setCodNSU(rs.getString("nsu_id"));
				historico.setCodCliente(rs.getString("terminal_id"));
				historico.setNumCartao(rs.getString("num_cartao"));
				historico.setBandeiraId(rs.getInt("bandeira_id"));
				historico.setValor(rs.getDouble("valor"));
				historico.setDataTransacao(rs.getTimestamp("dat_trs"));
				historico.setDescricaoResposta(rs.getString("dsc_resposta"));
				historico.setBandeira(rs.getString("bandeira"));
				//historico.setAdquirenteId(rs.getInt("adq_id"));
				historico.setProduto("Crédito");
				historico.setAdquirente("GetNet"); 
				historicos.add(historico);
			}
			rs.close();

			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return historicos;
		
	}
	
	public Timestamp convertToTimeStamp(String data){
	       // you can change format of date
	     try {
	    	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
			Date date = formatter.parse(data);
			return new Timestamp(date.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
}
