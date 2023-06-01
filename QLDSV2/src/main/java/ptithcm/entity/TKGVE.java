package ptithcm.entity;

import java.util.Collection;
import java.sql.Date;

import javax.persistence.*;


@Entity
@Table(name="TKGV")
public class TKGVE {
	@Id
	@Column(name="TK")
	private String TK;
	@Column(name="MK")
	private String MK;
	@Column(name="MaQuyen")
	private int MaQuyen;
	
	

	@OneToOne
	@PrimaryKeyJoinColumn(name = "TK")
	private GiangVienE GiangVienE;


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

	public GiangVienE getGiangVienE() {
		return GiangVienE;
	}

	public void setGiangVienE(GiangVienE giangVienE) {
		GiangVienE = giangVienE;
	}

	public int getMaQuyen() {
		return MaQuyen;
	}

	public void setMaQuyen(int maQuyen) {
		MaQuyen = maQuyen;
	}
	

}
