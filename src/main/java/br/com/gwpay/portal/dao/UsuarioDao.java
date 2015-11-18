package br.com.gwpay.portal.dao;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.gwpay.portal.model.Usuario;
import br.com.gwpay.portal.util.JPAUtil;

public class UsuarioDao {
	
	public Usuario getUsuario(Usuario usuario){
		
		EntityManager manager = new JPAUtil().getEntityManager();

        Query query = manager
                .createQuery("select u from Usuario u where u.login=:pLogin");
        
        query.setParameter("pLogin", usuario.getLogin());
        
        Usuario usuarioRetornado = (Usuario) query.getSingleResult();
        
        manager.close();
        
        return usuarioRetornado;
	}
	
	
	public boolean existeUsuario(Usuario usuario) {

		EntityManager manager = JPAUtil.getEntityManager();
		
		Query query = manager
                .createQuery("select u from Usuario u where u.login=:pLogin and u.senha=:pSenha");
        
        query.setParameter("pLogin", usuario.getLogin());
        query.setParameter("pSenha", usuario.getSenha());

        
        Usuario usuarioRetornado = (Usuario) query.getSingleResult();
        
        manager.close();
		
		if(usuarioRetornado != null){
			return true;
		}
		
		return false;
	}

}
