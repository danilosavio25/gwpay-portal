package br.com.gwpay.portal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.gwpay.portal.dao.AdquirenteDao;
import br.com.gwpay.portal.dao.BandeiraDao;
import br.com.gwpay.portal.dao.HistoricoTransacaoDao;
import br.com.gwpay.portal.model.Adquirente;
import br.com.gwpay.portal.model.Bandeira;
import br.com.gwpay.portal.model.HistoricoTransacao;
import br.com.gwpay.portal.util.FiltroBusca;
 
@Controller
public class TransacaoController {

	@RequestMapping("/transacoes")
	public ModelAndView transacao(){
		AdquirenteDao aDao = new AdquirenteDao();
		List<Adquirente> adquirentes = aDao.buscaDadosAdquirente();
		
		BandeiraDao bDao = new BandeiraDao();
		List<Bandeira> bandeiras = bDao.buscaDadosBandeira();
		
		
		ModelAndView mv = new ModelAndView("transacoes/filtro-transacoes");
		mv.addObject("adquirentes", adquirentes);
		mv.addObject("bandeiras", bandeiras);
		  
		return mv;  
		
	}  
	  
	@RequestMapping("/buscaTodasTransacoes")
	public ModelAndView buscaTodasTransacoes(HttpSession session){
	
		System.out.println("session " + session.getAttribute("clienteId").toString());
		
		 
		FiltroBusca filtro = new FiltroBusca();
		filtro.setClientId(session.getAttribute("clienteId").toString());
		filtro.setNumRegistros("1000");
		
		HistoricoTransacaoDao dao = new HistoricoTransacaoDao();
		List<HistoricoTransacao> historicos = dao.buscarQuantidadeRegistros(filtro);
		  
		AdquirenteDao aDao = new AdquirenteDao();
		List<Adquirente> adquirentes = aDao.buscaDadosAdquirente();
		
		BandeiraDao bDao = new BandeiraDao();
		List<Bandeira> bandeiras = bDao.buscaDadosBandeira();
		
		
		ModelAndView mv = new ModelAndView("transacoes/filtro-transacoes");
		mv.addObject("historicos", historicos);
		mv.addObject("adquirentes", adquirentes);
		mv.addObject("bandeiras", bandeiras);
		  
		return mv;  
	}   
	      
	@RequestMapping("/buscaTransacoes")
	public ModelAndView buscaTransacoes(FiltroBusca filtro, HttpSession session){
 		 
		filtro.setClientId(session.getAttribute("clienteId").toString());
		
		System.out.println("Adq: " + filtro.getAdquirenteId());
		System.out.println("Band: " + filtro.getBandeiraId());
		System.out.println("Ini: " + filtro.getDataInicio());
		System.out.println("Fim: " + filtro.getDataFim());
 
		
		HistoricoTransacaoDao dao = new HistoricoTransacaoDao();
		List<HistoricoTransacao> historicos = dao.buscarHistoricosTransacao(filtro);
		
		AdquirenteDao aDao = new AdquirenteDao();
		List<Adquirente> adquirentes = aDao.buscaDadosAdquirente();
		
		BandeiraDao bDao = new BandeiraDao();
		List<Bandeira> bandeiras = bDao.buscaDadosBandeira();
		
		ModelAndView mv = new ModelAndView("transacoes/filtro-transacoes");
		mv.addObject("historicos", historicos);
		mv.addObject("adquirentes", adquirentes);
		mv.addObject("bandeiras", bandeiras);
		  
		return mv; 
	}
	
	
}
