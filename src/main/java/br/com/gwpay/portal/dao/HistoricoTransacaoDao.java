package br.com.gwpay.portal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.gwpay.portal.model.HistoricoTransacao;
import br.com.gwpay.portal.util.ConnectionFactory;
import br.com.gwpay.portal.util.FiltroBusca;


public class HistoricoTransacaoDao {
	
	
	public  HistoricoTransacaoDao(){
		
	}
	
	public boolean inserirHistoricoTransacao(HistoricoTransacao transacao){
		
		try {
			
			ConnectionFactory connectionFactory = new ConnectionFactory();
			Connection conn = connectionFactory.getConnection();
			
				System.out.println("after getconn");
				PreparedStatement pstmt;
				
				
				String sql = "INSERT INTO historico_transacao(terminal_id, trs_loja_id, valor, moeda, tip_pagamento,                                        	"
						+"														num_pcl,num_cartao, mes_vct_cartao, ano_vct_cartao, nme_ptd_cartao,    	"
						+"														udf1, udf2, udf3, udf4, udf5,                                          	"
						+"														nsu_id, dat_trs, trs_original_id, dsc_resposta, cod_resposta,          	"
						+"														val_primeira_pcl, val_outras_pcl,val_total,	"
						+"														taxa_juros, juros_ins_fin, valor_cancelado,   	"
						+"														tip_trs_id, cliente_id, bandeira_id, tip_cancelamento_id, cod_seguranca_cartao)              	"
						+"					    VALUES (?, ?, ?, ?, ?,                                                                           	"
						+"						    	?, ?, ?, ?, ?,                                                                               	"
						+"						   	    ?, ?, ?, ?, ?,                                                                                	"
						+"						   	    ?, current_timestamp, ?,?,?,                                                                 	"
						+"						   	     ?, ?, ?,                                                                             	"
						+"						   	    ?, ?,  ?,                                                                             	"
						+"						    	?, ?, ?, ?,?);                                                                                    	";
	
				
				pstmt = conn.prepareStatement(sql);
	
			
				
				pstmt.setString(1, transacao.getCodCliente());
				pstmt.setString(2,transacao.getCodRastreio());
				pstmt.setDouble(3,transacao.getValor());
				pstmt.setString(4, transacao.getMoeda());			
				pstmt.setString(5, transacao.getTipoPagamento());
				pstmt.setInt(6, transacao.getNumParcelas());
				pstmt.setString(7, transacao.getNumCartao());
				pstmt.setInt(8, transacao.getMesVencimentoCartao());
				pstmt.setInt(9, transacao.getAnoVencimentoCartao());
				
				String nomePortador = "";
				if(transacao.getNomePortador() != null){
					if(transacao.getNomePortador().length() > 26){
						nomePortador = transacao.getNomePortador().substring(0, 26);
					}else{
						nomePortador = transacao.getNomePortador();
					}
				}
				
				pstmt.setString(10, nomePortador);
				pstmt.setString(11, transacao.getCampo1());
				pstmt.setString(12, transacao.getCampo2());
				pstmt.setString(13, transacao.getCampo3());
				pstmt.setString(14, transacao.getCampo4());
				pstmt.setString(15, transacao.getCampo5());
				pstmt.setString(16, transacao.getCodNSU());
				//pstmt.setString(17, current_timestamp);
				pstmt.setString(17, transacao.getCodTransacaoOriginal());
				pstmt.setString(18, transacao.getDescricaoResposta());
				pstmt.setString(19, transacao.getCodResposta());
				pstmt.setDouble(20, transacao.getValorPrimeiraParcela());
				pstmt.setDouble(21, transacao.getValorOutrasParcelas());
				pstmt.setDouble(22, transacao.getValorTotal() );
				pstmt.setDouble(23, transacao.getTaxaJuros());
				pstmt.setDouble(24, transacao.getJurosInstFinanceira());
				pstmt.setDouble(25, transacao.getValorCancelado());
				pstmt.setInt(26, transacao.getTipoTransacaoId());
				pstmt.setInt(27, transacao.getClienteId());
				pstmt.setInt(28, transacao.getBandeiraId());
				pstmt.setInt(29, transacao.getTipoCancelamentoId());
				pstmt.setString(30, transacao.getCodSegurancaCartao());

	
				
				pstmt.executeUpdate();
	
				pstmt.close();
				conn.close();
				
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		
	}
	
	public List<HistoricoTransacao> buscarHistoricosTransacao(FiltroBusca filtro){
		
		List<HistoricoTransacao> historicos = new ArrayList<HistoricoTransacao>();;
		try {
			
			ConnectionFactory connectionFactory = new ConnectionFactory();
			Connection conn = connectionFactory.getConnection();
			System.out.println("after getconn");
			PreparedStatement pstmt;
			
			pstmt = conn.prepareStatement("SELECT * FROM HISTORICO_TRANSACAO "
					+ "WHERE DAT_TRS BETWEEN ? AND ? "
					+ "AND CLIENTE_ID = ? ");

			pstmt.setTimestamp(1, filtro.getDataInicio());
			pstmt.setTimestamp(2, filtro.getDataFim());
			pstmt.setInt(3, filtro.getClientId());
			
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
	
	
	
	
	
}
