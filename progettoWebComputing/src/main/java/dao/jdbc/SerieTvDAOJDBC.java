package dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connessioneDB.DBSource;
import dao.SerieTvDAO;
import model.SerieTv;

public class SerieTvDAOJDBC implements SerieTvDAO{
	
	DBSource dbSource;
	
	public SerieTvDAOJDBC(DBSource dataSource) {
		this.dbSource = dataSource;
	}

	@Override
	public List<SerieTv> findAll() {
		// TODO Auto-generated method stub
		Connection conn=null;
		List<SerieTv> serie = new ArrayList<SerieTv>();
		try {
			conn = dbSource.getConnection();
			String query = "select * from serietv";
			Statement st = conn.createStatement();
			ResultSet rs= st.executeQuery(query);
			
			while(rs.next()) {
				String titolo = rs.getString("titolo");
				String genere= rs.getString("genere");
				int stagioni=rs.getInt("stagioni");
				String regista= rs.getString("regista");
				String descrizione= rs.getString("descrizione");
				String pathImage= rs.getString("pathimage");
				String annoUscita= rs.getString("annouscita");
				boolean disponibilita = rs.getBoolean("disponibilita");
				String piattaforme=rs.getString("piattaforme");
				
				SerieTv s= new SerieTv();
				
				s.setTitolo(titolo);
				s.setGenere(genere);
				s.setStagioni(stagioni);
				s.setDescrizione(descrizione);
				s.setPathImage(pathImage);
				s.setAnnoUscita(annoUscita);
				s.setDisponibilita(disponibilita);	
				s.setRegista(regista);
				s.setPiattaforme(piattaforme);
				
				serie.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return serie;
	}





	@Override
	public void save(SerieTv serie) {
		Connection conn=null;
		try {
			conn = dbSource.getConnection();
			String query = "INSERT INTO serietv(titolo,genere,stagioni,regista,pathimage,descrizione,annouscita,disponibilita,piattaforme) VALUES(?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);

			st.setString(1, serie.getTitolo());
			st.setString(2, serie.getGenere());
			st.setInt(3, serie.getStagioni());
			st.setString(4, serie.getRegista());
			st.setString(5, serie.getPathImage());
			st.setString(6, serie.getDescrizione());
			st.setString(7, serie.getAnnoUscita());
			st.setBoolean(8, serie.isDisponibilita());
			st.setString(9, serie.getPiattaforme());
			st.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}





	@Override
	public SerieTv findByPrimaryKey(String titolo) {
		Connection conn = null;
		SerieTv s= null;
		try {
			conn = dbSource.getConnection();
			String query = "select * from serietv where titolo ilike ? ";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, titolo);
	
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				s=new SerieTv();
				s.setTitolo(rs.getString("titolo"));
				s.setGenere(rs.getString("genere"));
				s.setStagioni(rs.getInt("stagioni"));
				s.setDescrizione(rs.getString("descrizione"));
				s.setPathImage(rs.getString("pathimage"));
				s.setAnnoUscita(rs.getString("annouscita"));
				s.setDisponibilita(rs.getBoolean("disponibilita"));
				s.setRegista(rs.getString("regista"));
				s.setPiattaforme(rs.getString("piattaforme"));
			}			

		} catch (SQLException e) {
		e.printStackTrace();
		}
		finally {
			try {
			conn.close();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
		return s;
	}


	@Override
	public List<SerieTv> findByGenere(String genere) {
		Connection conn = null;
		List<SerieTv> serie=new ArrayList<SerieTv>();
		try {
			conn = dbSource.getConnection();
			String query = "select * from serietv where genere = ? ";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, genere);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				SerieTv s=new SerieTv();
				s.setTitolo(rs.getString("titolo"));
				s.setGenere(rs.getString("genere"));
				s.setStagioni(rs.getInt("stagioni"));
				s.setDescrizione(rs.getString("descrizione"));
				s.setPathImage(rs.getString("pathimage"));
				s.setAnnoUscita(rs.getString("annouscita"));
				s.setDisponibilita(rs.getBoolean("disponibilita"));
				s.setRegista(rs.getString("regista"));
				s.setPiattaforme(rs.getString("piattaforme"));
				serie.add(s);
			}

		} catch (SQLException e) {
		e.printStackTrace();
		}
		finally {
			try {
			conn.close();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
		return serie;
	}


	@Override
	public void update(SerieTv serie) {
		// TODO Auto-generated method stub
		
	}





	@Override
	public void delete(String titolo) {
		Connection conn=null;
		
		try {
			conn = dbSource.getConnection();
			String query = "delete from serietv where titolo=?";
			PreparedStatement st = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);

			st.setString(1, titolo);
		
			st.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
}