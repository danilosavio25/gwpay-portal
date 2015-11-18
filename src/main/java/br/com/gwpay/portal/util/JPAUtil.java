package br.com.gwpay.portal.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAUtil {

    private static EntityManagerFactory entityManagerFactory = Persistence
            .createEntityManagerFactory("gwpaybdlocal");

    public static EntityManager getEntityManager() {
        return entityManagerFactory.createEntityManager();
    }
}