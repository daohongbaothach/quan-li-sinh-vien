package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="MONHOC")
public class MonHocE {
	@Id
	@Column(name="MaMH")
	private String MaMH;
	@Column(name="TenMH")
	private String TenMH;
	@Column(name="SoTC")
	private String SoTC;
	@Column(name="TietTH")
	private String TietTH;
	@Column(name="TietLT")
	private String TietLT;
	
	@OneToMany(mappedBy = "MaMH", fetch = FetchType.EAGER)
	private Collection<LopTinChiE> LopTinChiE;

	public String getMaMH() {
		return MaMH;
	}

	public void setMaMH(String maMH) {
		MaMH = maMH;
	}

	public String getTenMH() {
		return TenMH;
	}

	public void setTenMH(String tenMH) {
		TenMH = tenMH;
	}

	public String getSoTC() {
		return SoTC;
	}

	public void setSoTC(String soTC) {
		SoTC = soTC;
	}

	public String getTietTH() {
		return TietTH;
	}

	public void setTietTH(String tietTH) {
		TietTH = tietTH;
	}

	public String getTietLT() {
		return TietLT;
	}

	public void setTietLT(String tietLT) {
		TietLT = tietLT;
	}

	public Collection<LopTinChiE> getLopTinChiE() {
		return LopTinChiE;
	}

	public void setLopTinChiE(Collection<LopTinChiE> lopTinChiE) {
		LopTinChiE = lopTinChiE;
	}
}
