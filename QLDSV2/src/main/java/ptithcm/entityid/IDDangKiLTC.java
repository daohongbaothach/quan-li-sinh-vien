package ptithcm.entityid;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;

@Embeddable
public class IDDangKiLTC implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String MaSV;
	private String MaLTC;

	@Override
	public int hashCode() {
		return Objects.hash(MaLTC, MaSV);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		IDDangKiLTC other = (IDDangKiLTC) obj;
		return Objects.equals(MaLTC, other.getMaLTC()) && Objects.equals(MaSV, other.getMaSV());
	}
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
	
}
