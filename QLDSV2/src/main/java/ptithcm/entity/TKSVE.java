package ptithcm.entity;

import java.util.Collection;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="TKSV")
public class TKSVE {
	@Id
	@Column(name="TK")
	private String TK;
	@Column(name="MK")
	private String MK;
	@Column(name="MaQuyen")
	private int MaQuyen;
	
	@OneToOne
	@PrimaryKeyJoinColumn(name = "TK")
	private SinhVienE SinhVienE;


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

	public SinhVienE getSinhVienE() {
		return SinhVienE;
	}

	public void setSinhVienE(SinhVienE sinhVienE) {
		SinhVienE = sinhVienE;
	}

	public int getMaQuyen() {
		return MaQuyen;
	}

	public void setMaQuyen(int maQuyen) {
		MaQuyen = maQuyen;
	}
	
}
