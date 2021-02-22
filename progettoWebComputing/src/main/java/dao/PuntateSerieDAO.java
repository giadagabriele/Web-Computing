package dao;

import java.util.List;

import model.SerieTv;
import model.puntateSerie;

public interface PuntateSerieDAO {
	public puntateSerie findByPrimaryKey(String serie,int s);     // Retrieve
	public List<Integer> findSeasons(String serie);
	public List<SerieTv> findAll();       
	public void update(SerieTv serie); //Update
	public void delete(String serie); //Delete	
	public void save(puntateSerie serie);
	
}
