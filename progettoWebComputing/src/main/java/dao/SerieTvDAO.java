package dao;

import java.util.List;

import model.SerieTv;

public interface SerieTvDAO {
	public void save(SerieTv serie);  // Create
	public SerieTv findByPrimaryKey(String titolo);     // Retrieve
	public List<SerieTv> findAll();       
	public void update(SerieTv serie); //Update
	public void delete(String titolo); //Delete	
	public List<SerieTv> findByGenere(String genere);
	
}
