package br.com.gwpay.portal.controller;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.gwpay.portal.dao.HistoricoTransacaoDao;
import br.com.gwpay.portal.model.HistoricoTransacao;
import br.com.gwpay.portal.util.FiltroBusca;

@Controller
public class ConsultaController {

	@RequestMapping("/consultaTransacao")
	public ModelAndView consultaTransacao(){
		
		Calendar c = Calendar.getInstance();
		c.set(2015, 10, 1, 00, 00);
		
		FiltroBusca filtro = new FiltroBusca();
		filtro.setClientId(1);
		filtro.setDataInicio(new Timestamp(c.getTimeInMillis()));
		
		filtro.setDataFim(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		
		System.out.println(filtro.getDataInicio());
		System.out.println(filtro.getDataFim());
		
		HistoricoTransacaoDao dao = new HistoricoTransacaoDao();
		List<HistoricoTransacao> historicos = dao.buscarHistoricosTransacao(filtro);
		
		ModelAndView mv = new ModelAndView("consulta/consulta-transacao");
		mv.addObject("historicos", historicos);
		
		return mv; 
	}
	
}
