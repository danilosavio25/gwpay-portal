package br.com.gwpay.portal.controller;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.gwpay.portal.dao.HistoricoTransacaoDao;
import br.com.gwpay.portal.dao.UsuarioDao;
import br.com.gwpay.portal.model.HistoricoTransacao;
import br.com.gwpay.portal.model.Usuario;
import br.com.gwpay.portal.util.FiltroBusca;

@Controller
public class LoginController {

	@RequestMapping("/loginForm")
	public String loginForm(){
		System.out.println("loginForm"); 
		return "login-form";
	}
	
	@RequestMapping("/efetuaLogin")
	public String efetuaLogin(Usuario usuario, HttpSession session) {			
		
		UsuarioDao dao = new UsuarioDao();
		if(dao.existeUsuario(usuario)){
			session.setAttribute("usuarioLogado", usuario);
			return "redirect:home";
		}else{
			return "redirect:loginForm";
		}
	}
	
	
	@RequestMapping("/efetuaLogout")
	public String efetuaLogout(HttpSession session){
		session.invalidate();	
		return "redirect:loginForm";
	
	}
	
	@RequestMapping("/testeBanco")
	public String teste(){
		
		HistoricoTransacaoDao dao = new HistoricoTransacaoDao();
		List<HistoricoTransacao> historicos = dao.buscarHistoricosTransacao(null);
		
		return "redirect:home";
	}
	
	@RequestMapping("/home")
	public ModelAndView home(){
		
		Calendar c = Calendar.getInstance();
		c.set(2015, 10, 1, 00, 00);
		
		FiltroBusca filtro = new FiltroBusca();
		filtro.setClientId("1");
		filtro.setNumRegistros("10");
		
		System.out.println(filtro.getDataInicio());
		System.out.println(filtro.getDataFim());
		
		HistoricoTransacaoDao dao = new HistoricoTransacaoDao();
		
		List<HistoricoTransacao> historicos = dao.buscarDezPrimeiros(filtro);
		
		ModelAndView mv = new ModelAndView("home");  
		mv.addObject("historicos", historicos);
		
		return mv; 
	}
	
	
}
