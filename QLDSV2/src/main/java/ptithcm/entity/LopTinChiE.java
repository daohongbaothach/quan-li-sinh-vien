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
@Table(name="LOPTINCHI")
public class LopTinChiE {
	@Id
	@Column(name="MaLTC")
	private String MaLTC;
	@Column(name="SVTT")
	private int SVTT;
	@Column(name="SVTD")
	private int SVTD;
	@Column(name="MaMH")
	private String MaMH;
	@Column(name="HocKi")
	private int HocKi;
	@Column(name="Nam")
	private int Nam;
	@Column(name="HeSo1")
	private float HeSo1;
	@Column(name="HeSo2")
	private float HeSo2;
	@Column(name="TrangThai")
	private boolean TrangThai;
	
	
	@ManyToOne
	@JoinColumn(name="MaMH",insertable=false, updatable=false)
	private MonHocE MonHocE;
	
	@OneToMany(mappedBy = "MaLTC", fetch = FetchType.EAGER)
	private Collection<DangKiLTCE> DangKiLTCE;

	
	public Collection<DangKiLTCE> getDangKiLTCE() {
		return DangKiLTCE;
	}
	public void setDangKiLTCE(Collection<DangKiLTCE> dangKiLTCE) {
		DangKiLTCE = dangKiLTCE;
	}
	@OneToMany(mappedBy = "MaLTC", fetch = FetchType.EAGER)
	private Collection<DayLopTCE> DayLopTCE;
	public String getMaLTC() {
		return MaLTC;
	}
	public void setMaLTC(String maLTC) {
		MaLTC = maLTC;
	}
	public int getSVTD() {
		return SVTD;
	}
	public void setSVTD(int sVTD) {
		SVTD = sVTD;
	}
	public String getMaMH() {
		return MaMH;
	}
	public void setMaMH(String maMH) {
		MaMH = maMH;
	}
	public int getHocKi() {
		return HocKi;
	}
	public void setHocKi(int hocKi) {
		HocKi = hocKi;
	}
	public int getNam() {
		return Nam;
	}
	public void setNam(int nam) {
		Nam = nam;
	}
	public float getHeSo1() {
		return HeSo1;
	}
	public void setHeSo1(float heSo1) {
		HeSo1 = heSo1;
	}
	public float getHeSo2() {
		return HeSo2;
	}
	public void setHeSo2(float heSo2) {
		HeSo2 = heSo2;
	}
	

	public boolean isTrangThai() {
		return TrangThai;
	}
	public void setTrangThai(boolean trangThai) {
		TrangThai = trangThai;
	}
	public MonHocE getMonHocE() {
		return MonHocE;
	}
	public void setMonHocE(MonHocE monHocE) {
		MonHocE = monHocE;
	}
	public int getSVTT() {
		return SVTT;
	}
	public void setSVTT(int sVTT) {
		SVTT = sVTT;
	}
	public Collection<DayLopTCE> getDayLopTCE() {
		return DayLopTCE;
	}
	public void setDayLopTCE(Collection<DayLopTCE> dayLopTCE) {
		DayLopTCE = dayLopTCE;
	}
	
}
