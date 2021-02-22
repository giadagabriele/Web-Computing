package dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connessioneDB.DBSource;
import dao.PuntateSerieDAO;
import model.SerieTv;
import model.puntateSerie;

public class PuntateSerieDAOJDBC implements PuntateSerieDAO{

	DBSource dbSource;
	
	public PuntateSerieDAOJDBC(DBSource dataSource) {
		this.dbSource = dataSource;
	}

	@Override
	public void save(puntateSerie serie) {
		Connection conn=null;
		try {
			conn = dbSource.getConnection();
			String query = "INSERT INTO puntateserie(serie,stagione,puntate,durata) VALUES(?,?,?,?)";
			PreparedStatement st = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);

			st.setString(1, serie.getSerie());
			st.setInt(2, serie.getStagione());
			st.setInt(3, serie.getPuntate());
			st.setString(4, serie.getDurata());
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
	public puntateSerie findByPrimaryKey(String serie,int s) {
		Connection conn = null;
		puntateSerie p= null;
		try {
		conn = dbSource.getConnection();
		String query = "select puntate,durata from puntateserie where serie=? and stagione=?";
		PreparedStatement st = conn.prepareStatement(query);
		st.setString(1, serie);
		st.setInt(2, s);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()){
			p= new puntateSerie();
			p.setDurata(rs.getString("durata"));
			p.setPuntate(rs.getInt("puntate"));
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
		return p;
	}

	@Override
	public List<SerieTv> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(SerieTv serie) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String serie) {
Connection conn=null;
		
		try {
			conn = dbSource.getConnection();
			String query = "delete from puntateserie where serie=?";
			PreparedStatement st = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);

			st.setString(1, serie);
		
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
	public List<Integer> findSeasons(String serie) {
		Connection conn = null;
		List<Integer> seasons= new ArrayList<Integer>();
		try {
			conn = dbSource.getConnection();
			String query = "select * from puntateserie where serie ilike ? ";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, serie);
	
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				seasons.add(rs.getInt("stagione"));
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
		return seasons;
	}
	
	

}
