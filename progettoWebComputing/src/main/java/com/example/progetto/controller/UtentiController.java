package com.example.progetto.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import connessioneDB.DBManager;
import dao.UtentiDAO;
import model.Utenti;

@Controller
public class UtentiController {
	
		@PostMapping("html/faiIscrizione")
		public String iscrivi(@RequestParam String nome, @RequestParam String cognome, @RequestParam String eta,@RequestParam String email, @RequestParam String password) {
			
			if(DBManager.getInstance().utenteDAO().findByPrimaryKey(email)) {
				return "redirect:/html/registrazione.html";
			}
			Utenti u = new Utenti(nome,cognome,email,Integer.parseInt(eta),password);
			DBManager.getInstance().utenteDAO().save(u);
			
			return "redirect:/html/index.html";
			
		}
		
		@ResponseBody
		@PostMapping("html/faiIscrizioneGoogle")
		public String iscriviGoogle(@RequestParam String nome,@RequestParam String email) {
			
			if(DBManager.getInstance().utenteDAO().findByPrimaryKey(email)) {
				return "redirect:/html/registrazione.html";
			}
			Utenti u = new Utenti(nome,email);
			DBManager.getInstance().utenteDAO().save(u);
			
			return "true";
			
		}
		
		@ResponseBody
		@PostMapping("html/aggiornaProfilo")
		public String aggiornaUtente(HttpSession session,@RequestParam String nomeUtente,@RequestParam String cognomeUtente,@RequestParam String pathUtente, @RequestParam int eta, @RequestParam String pwd) {
			String email = session.getAttribute("id").toString();
			Utenti utente= new Utenti( nomeUtente, cognomeUtente,  email, eta,pwd ,pathUtente);
			DBManager.getInstance().utenteDAO().update(utente);
			return "Modifica salvata!";
		}
		
		@ResponseBody
		@PostMapping("html/aggiornaProfiloGoogle")
		public String aggiornaUtenteGoogle(HttpSession session,@RequestParam String nomeUtente,@RequestParam String pathUtente) {
			String email = session.getAttribute("id").toString();
			Utenti utente= new Utenti(nomeUtente,"",email,0,"", pathUtente);
			DBManager.getInstance().utenteDAO().update(utente);
			return "Modifica salvata!";
		}

} 