package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="CHUYENNGANH")
public class ChuyenNganhE {
	@Id
	@Column(name="MaCN")
	private String MaGV;
	@Column(name="TenCN")
	private String TenCN;

	
	@OneToMany(mappedBy = "MaLop",fetch = FetchType.EAGER)
	private Collection<LopE> LopE;

	public String getMaGV() {
		return MaGV;
	}

	public void setMaGV(String maGV) {
		MaGV = maGV;
	}

	public String getTenCN() {
		return TenCN;
	}

	public void setTenCN(String tenCN) {
		TenCN = tenCN;
	}


	public Collection<LopE> getLopE() {
		return LopE;
	}

	public void setLopE(Collection<LopE> lopE) {
		LopE = lopE;
	}
	
	
}
