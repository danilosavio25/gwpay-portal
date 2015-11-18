package br.com.gwpay.portal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.gwpay.portal.dao.UsuarioDao;
import br.com.gwpay.portal.model.Usuario;

@Controller
public class LoginController {

	@RequestMapping("/loginForm")
	public String loginForm(){
		return "login-form";
	}
	
	@RequestMapping("/efetuaLogin")
	public String efetuaLogin(Usuario usuario, HttpSession session){			
		
		UsuarioDao dao = new UsuarioDao();
		if(dao.existeUsuario(usuario)){
			session.setAttribute("usuarioLogado", usuario);
			return "home";
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
		
		Usuario usuario = new Usuario();
		usuario.setLogin("danilo.savio");
		
		UsuarioDao dao = new UsuarioDao();
		Usuario usuarioRetornado = dao.getUsuario(usuario);
		
		System.out.println("login: " + usuarioRetornado.getLogin());
		System.out.println("Id: " + usuarioRetornado.getId());
		
		return "home";
	}
	
	
	
}
