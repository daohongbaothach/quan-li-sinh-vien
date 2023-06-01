package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="GIANGVIEN")
public class GiangVienE {
	@Id
	@Column(name="MaGV")
	private String MaGV;
	@Column(name="HoGV")
	private String HoGV;
	@Column(name="TenGV")
	private String TenGV;
	@Column(name="HocVi")
	private String HocVi;
	@Column(name="HocHam")
	private String HocHam;
	@Column(name="ChuyenMon")
	private String ChuyenMon;
	@Column(name="ChucVu")
	private String ChucVu;
	
	@OneToMany(mappedBy= "MaGV", fetch = FetchType.EAGER)
	private Collection<DayLopTCE> DayLopTCE;
	@OneToOne
	@PrimaryKeyJoinColumn(name = "TK")
	private TKGVE TKGVE;

	public String getMaGV() {
		return MaGV;
	}

	public void setMaGV(String maGV) {
		MaGV = maGV;
	}

	public String getHoGV() {
		return HoGV;
	}

	public void setHoGV(String hoGV) {
		HoGV = hoGV;
	}

	public String getTenGV() {
		return TenGV;
	}

	public void setTenGV(String tenGV) {
		TenGV = tenGV;
	}

	public String getHocVi() {
		return HocVi;
	}

	public void setHocVi(String hocVi) {
		HocVi = hocVi;
	}

	public String getHocHam() {
		return HocHam;
	}

	public void setHocHam(String hocHam) {
		HocHam = hocHam;
	}

	public String getChuyenMon() {
		return ChuyenMon;
	}

	public void setChuyenMon(String chuyenMon) {
		ChuyenMon = chuyenMon;
	}

	public String getChucVu() {
		return ChucVu;
	}

	public void setChucVu(String chucVu) {
		ChucVu = chucVu;
	}

	public Collection<DayLopTCE> getDayLopTCE() {
		return DayLopTCE;
	}

	public void setDayLopTCE(Collection<DayLopTCE> dayLopTCE) {
		DayLopTCE = dayLopTCE;
	}

	public TKGVE getTKGVE() {
		return TKGVE;
	}

	public void setTKGVE(TKGVE tKGVE) {
		TKGVE = tKGVE;
	}
	
}
