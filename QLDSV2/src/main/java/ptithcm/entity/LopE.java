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
@Table(name="LOP")
public class LopE {
	@Id
	@Column(name="MaLop")
	private String MaLop;
	@Column(name="TenLop")
	private String TenLop;
	@Column(name="KhoaHoc")
	private int KhoaHoc;
	@Column(name="MaCN")
	private String MaCN;
	@OneToMany(mappedBy = "LopE", fetch = FetchType.EAGER)
	private Collection<SinhVienE> SinhVienE;
	@ManyToOne
	@JoinColumn(name="MaCN",insertable=false, updatable=false)
	private ChuyenNganhE ChuyenNganhE;
	
	public String getMaLop() {
		return MaLop;
	}
	public void setMaLop(String maLop) {
		MaLop = maLop;
	}
	public String getTenLop() {
		return TenLop;
	}
	public void setTenLop(String tenLop) {
		TenLop = tenLop;
	}
	public int getKhoaHoc() {
		return KhoaHoc;
	}
	public void setKhoaHoc(int khoaHoc) {
		KhoaHoc = khoaHoc;
	}
	public String getMaCN() {
		return MaCN;
	}
	public void setMaCN(String maCN) {
		MaCN = maCN;
	}
	public Collection<SinhVienE> getSinhVien() {
		return SinhVienE;
	}
	public void setSinhVien(Collection<SinhVienE> sinhVienE) {
		SinhVienE = sinhVienE;
	}
	public ChuyenNganhE getChuyenNganhE() {
		return ChuyenNganhE;
	}
	public void setChuyenNganhE(ChuyenNganhE chuyenNganhE) {
		ChuyenNganhE = chuyenNganhE;
	}

}
