package br.com.gwpay.portal.controller;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.gwpay.portal.dao.HistoricoTransacaoDao;
import br.com.gwpay.portal.model.HistoricoTransacao;
import br.com.gwpay.portal.util.FiltroBusca;
 
@Controller
public class TransacaoController {

	@RequestMapping("/transacoes")
	public String transacao(){
		return "transacoes/filtro-transacoes"; 
	} 
	
	@RequestMapping("/buscaTodasTransacoes")
	public ModelAndView buscaTodasTransacoes(){
		
		Calendar c = Calendar.getInstance();
		c.set(2015, 10, 1, 00, 00);
		
		FiltroBusca filtro = new FiltroBusca();
		filtro.setClientId("1");
		filtro.setDataInicio("" + new Timestamp(c.getTimeInMillis()));
		filtro.setDataFim("" + new Timestamp(Calendar.getInstance().getTimeInMillis()));
		filtro.setAdquirenteId("0");
		filtro.setBandeiraId("0");
		
		
		HistoricoTransacaoDao dao = new HistoricoTransacaoDao();
		List<HistoricoTransacao> historicos = dao.buscarHistoricosTransacao(filtro);
		 
 
		ModelAndView mv = new ModelAndView("transacoes/transacoes");
		mv.addObject("historicos", historicos);
		
		return mv;  
	}   
	    
	@RequestMapping("/buscaTransacoes")
	public ModelAndView buscaTransacoes(FiltroBusca filtro){
 		 
		filtro.setClientId("1");
		//filtro.setDataInicio(new Timestamp(c.getTimeInMillis()));
		//filtro.setDataFim(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		//filtro.setAdquirenteId(0);
		//filtro.setBandeiraId(0);
		
		System.out.println("Adq: " + filtro.getAdquirenteId());
		System.out.println("Band: " + filtro.getBandeiraId());
		System.out.println("Ini: " + filtro.getDataInicio());
		System.out.println("Fim: " + filtro.getDataFim());
 
		
		HistoricoTransacaoDao dao = new HistoricoTransacaoDao();
		List<HistoricoTransacao> historicos = dao.buscarHistoricosTransacao(filtro);
		
		ModelAndView mv = new ModelAndView("transacoes/filtro-transacoes");
		mv.addObject("historicos", historicos);
		
		return mv; 
	}
	
	
}
