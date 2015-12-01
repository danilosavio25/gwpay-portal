package br.com.gwpay.portal.util;

public class FiltroBusca {
	
	private String adquirenteId;
	private String clienteId;
	private String bandeiraId; 
	private String dataInicio;
	private String dataFim;
	private String numRegistros;
	
	public FiltroBusca() {
	}

	public String getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(String dataInicio) {
		this.dataInicio = dataInicio;
	}
	public String getDataFim() {
		return dataFim;
	}
	public void setDataFim(String dataFim) {
		this.dataFim = dataFim;
	}
	public String getClientId() {
		return clienteId;
	}
	public void setClientId(String clientId) {
		this.clienteId = clientId;
	}
	public String getAdquirenteId() {
		return adquirenteId;
	}
	public void setAdquirenteId(String adquirenteId) {
		this.adquirenteId = adquirenteId;
	}
	public String getBandeiraId() {
		return bandeiraId;
	}
	public void setBandeiraId(String bandeiraId) {
		this.bandeiraId = bandeiraId;
	}
	public String getNumRegistros() {
		return numRegistros;
	}
	public void setNumRegistros(String numRegistros) {
		this.numRegistros = numRegistros;
	}

}
