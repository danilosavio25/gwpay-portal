package br.com.gwpay.portal.util;

import java.sql.Timestamp;

public class FiltroBusca {
	
	private int clientId;
	private Timestamp dataInicio;
	private Timestamp dataFim;

	public Timestamp getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(Timestamp dataInicio) {
		this.dataInicio = dataInicio;
	}
	public Timestamp getDataFim() {
		return dataFim;
	}
	public void setDataFim(Timestamp dataFim) {
		this.dataFim = dataFim;
	}
	public int getClientId() {
		return clientId;
	}
	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

}
