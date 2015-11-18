package br.com.gwpay.portal.test;

import org.junit.Test;

import br.com.gwpay.portal.dao.UsuarioDao;
import br.com.gwpay.portal.model.Usuario;

import static org.junit.Assert.*;

public class UsuarioDaoTest {
	
	@Test
	public void retornaUsuario(){
		
		Usuario usuario = new Usuario();
		usuario.setLogin("danilo.savio");
		
		UsuarioDao dao = new UsuarioDao();
		Usuario usuarioRetornado = dao.getUsuario(usuario);
		
		System.out.println("login: " + usuario.getLogin());
		System.out.println("Id: " + usuario.getId());
		
		assertEquals("danilo.savio", usuarioRetornado.getLogin());
	}
	
}
