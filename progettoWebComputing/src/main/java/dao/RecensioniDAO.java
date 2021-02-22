package dao;

import java.util.List;

import model.Recensioni;
import model.Utenti;

public interface RecensioniDAO {
	public void save(Recensioni rec);  // Create
	public boolean findByPrimaryKey(String utente, String titolo);     // Retrieve
	public List<Recensioni> findAll(String titolo);     
	public List<Utenti> findUtenti(String titolo);
	public void update(Recensioni rec); //Update
	public void delete(Recensioni rec); //Delete	
}
