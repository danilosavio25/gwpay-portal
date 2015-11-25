package br.com.gwpay.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConciliacaoController {
	@RequestMapping("/conciliacao")
	public String conciliacao(){
		return "conciliacao/conciliacao";
	}
}
