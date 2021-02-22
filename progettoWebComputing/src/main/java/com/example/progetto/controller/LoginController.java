package com.example.progetto.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import connessioneDB.DBManager;
import model.Utenti;

@Controller
public class LoginController {
	@PostMapping("html/login")
	public String doLogin(HttpSession session, @RequestParam String email, @RequestParam String password) {
		boolean ok=false;
		String logged=DBManager.getInstance().utenteDAO().isLogged(email, password);
		if(logged!="") {	
			session.setAttribute("keyLogged", logged);
			session.setAttribute("id", email);
			session.setAttribute("google", ok);
			return "redirect:/html/index.html";
		}else {
			return "notlogged"; 
		}
	}
	
	@PostMapping("html/loginGoogle")
	public String doLoginGoogle(HttpSession session, @RequestParam String email) {
		boolean ok=false;
		String logged=DBManager.getInstance().utenteDAO().isLoggedGoogle(email);
		if(logged!="") {
			ok=true;
			session.setAttribute("keyLogged", logged);
			session.setAttribute("id", email);
			session.setAttribute("google", ok);
			return "redirect:/html/index.html";
		}else {
			return "notlogged";
		}
	}
	
	@PostMapping("html/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/html/index.html";
	}
	

	@GetMapping("html/profilo.html")
	public String modificaProfilo(HttpSession session, Model model) {
		Utenti u=DBManager.getInstance().utenteDAO().findUtente(session.getAttribute("id").toString());
		if(u!=null) {
			session.setAttribute("utente", u);
		}
		return "profilo";
	}
	
	
}