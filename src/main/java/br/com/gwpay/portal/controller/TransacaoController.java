package br.com.gwpay.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TransacaoController {

	@RequestMapping("/transacoes")
	public String transacao(){
		return "transacoes/transacoes"; 
	}
	
}
