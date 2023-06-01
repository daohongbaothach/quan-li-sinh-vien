package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import ptithcm.entityid.IDDayLopTC;

@Entity
@IdClass(IDDayLopTC.class)
@Table(name="DAYLOPTC")
public class DayLopTCE {
	@Id
	@Column(name="MaGV")
	private String MaGV;
	@Id
	@Column(name="MaLTC")
	private String MaLTC;

	
	@ManyToOne()
	@JoinColumn(name="MaGV",insertable=false, updatable=false)
	private GiangVienE GiangVienE;
	@ManyToOne()
	@JoinColumn(name="MaLTC",insertable=false, updatable=false)
	private LopTinChiE LopTinChiE;

	public String getMaGV() {
		return MaGV;
	}


	public void setMaGV(String maGV) {
		MaGV = maGV;
	}


	public String getMaLTC() {
		return MaLTC;
	}


	public void setMaLTC(String maLTC) {
		MaLTC = maLTC;
	}


	public GiangVienE getGiangVienE() {
		return GiangVienE;
	}


	public void setGiangVienE(GiangVienE giangVienE) {
		GiangVienE = giangVienE;
	}


	public LopTinChiE getLopTinChiE() {
		return LopTinChiE;
	}


	public void setLopTinChiE(LopTinChiE lopTinChiE) {
		LopTinChiE = lopTinChiE;
	}
	
	
}
