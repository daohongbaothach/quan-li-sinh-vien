package ptithcm.entity;

import java.util.Collection;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import ptithcm.entityid.IDDangKiLTC;

@Entity
@Table(name="DANGKYLTC")
@IdClass(IDDangKiLTC.class)
public class DangKiLTCE {
	@Id
	@Column(name="MaSV")
	private String MaSV;
	@Id
	@Column(name="MaLTC")
	private String MaLTC;
	@Column(name="DCC")
	private float DCC;
	@Column(name="DGK")
	private float DGK;
	@Column(name="DThi")
	private float DThi;
	@Column(name="HuyDK")
	private boolean HuyDK;
	@ManyToOne
	@JoinColumn(name="MaSV",insertable=false, updatable=false)
	private SinhVienE SinhVienE;
	@ManyToOne
	@JoinColumn(name="MaLTC",insertable=false, updatable=false)
	private LopTinChiE LopTinChiE;
	public String getMaSV() {
		return MaSV;
	}
	public void setMaSV(String maSV) {
		MaSV = maSV;
	}
	public String getMaLTC() {
		return MaLTC;
	}
	public void setMaLTC(String maLTC) {
		MaLTC = maLTC;
	}
	public float getDCC() {
		return DCC;
	}
	public void setDCC(float dCC) {
		DCC = dCC;
	}
	public float getDGK() {
		return DGK;
	}
	public void setDGK(float dGK) {
		DGK = dGK;
	}
	public float getDThi() {
		return DThi;
	}
	public void setDThi(float dThi) {
		DThi = dThi;
	}
	public boolean isHuyDK() {
		return HuyDK;
	}
	public void setHuyDK(boolean huyDK) {
		HuyDK = huyDK;
	}
	public SinhVienE getSinhVienE() {
		return SinhVienE;
	}
	public void setSinhVienE(SinhVienE sinhVienE) {
		SinhVienE = sinhVienE;
	}
	public LopTinChiE getLopTinChiE() {
		return LopTinChiE;
	}
	public void setLopTinChiE(LopTinChiE lopTinChiE) {
		LopTinChiE = lopTinChiE;
	}
	



	
}
