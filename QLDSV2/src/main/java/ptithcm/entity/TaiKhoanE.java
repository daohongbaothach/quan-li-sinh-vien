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
@Table(name="TAIKHOAN")
public class TaiKhoanE {
	@Id
	@Column(name="ID")
	private String ID;
	@Column(name="PWD")
	private String PWD;
	@Column(name="Quyen")
	private int Quyen;
	
	@OneToOne
	@PrimaryKeyJoinColumn(name = "ID")
	private SinhVienE SinhVienE;

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getPWD() {
		return PWD;
	}

	public void setPWD(String pWD) {
		PWD = pWD;
	}

	public int getQuyen() {
		return Quyen;
	}

	public void setQuyen(int quyen) {
		Quyen = quyen;
	}

	public SinhVienE getSinhVienE() {
		return SinhVienE;
	}

	public void setSinhVienE(SinhVienE sinhVienE) {
		SinhVienE = sinhVienE;
	}
}
