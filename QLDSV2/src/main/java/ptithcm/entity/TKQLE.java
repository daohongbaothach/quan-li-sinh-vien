package ptithcm.entity;

import java.util.Collection;
import java.sql.Date;

import javax.persistence.*;


@Entity
@Table(name="TKQL")
public class TKQLE {
	@Id
	@Column(name="TK")
	private String TK;
	@Column(name="MK")
	private String MK;
	@Column(name="MaQuyen")
	private int MaQuyen;
	



	public String getTK() {
		return TK;
	}

	public void setTK(String tK) {
		TK = tK;
	}

	public String getMK() {
		return MK;
	}

	public void setMK(String mK) {
		MK = mK;
	}


	public int getMaQuyen() {
		return MaQuyen;
	}

	public void setMaQuyen(int maQuyen) {
		MaQuyen = maQuyen;
	}
	

}
