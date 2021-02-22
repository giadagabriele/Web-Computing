  
package dao;

import java.util.List;

import model.Film;

public interface FilmDAO {
	public void save(Film film);  // Create
	public Film findByPrimaryKey(String titolo);     // Retrieve
	public List<Film> findAll();       
	public void update(Film film); //Update
	public void delete(String titolo); //Delete	
	public List<Film> findByGenere(String genere);
	
}