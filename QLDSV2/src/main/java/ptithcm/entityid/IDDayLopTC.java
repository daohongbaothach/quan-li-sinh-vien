package ptithcm.entityid;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;

@Embeddable
public class IDDayLopTC implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String MaGV;
	private String MaLTC;

	@Override
	public int hashCode() {
		return Objects.hash(MaGV,MaLTC);
	}
	@Override
	public boolean equals(Object objd) {
		if (this == objd)
			return true;
		if (objd == null)
			return false;
		if (getClass() != objd.getClass())
			return false;
		IDDayLopTC other = (IDDayLopTC) objd;
		return Objects.equals(MaGV, other.MaGV) && Objects.equals(MaLTC, other.MaLTC);
	}
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
	
}
