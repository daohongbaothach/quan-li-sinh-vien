package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ptithcm.entity.LopE;
import ptithcm.entity.SinhVienE;
@Transactional
@Controller
@RequestMapping(value="sinhvien/")
public class QLSinhVienController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("DSSV")
	public String listSV(HttpServletRequest request, ModelMap model, @ModelAttribute("sinhvien") SinhVienE sinhvien) {
		List<SinhVienE> SVList= this.getSVs();
		PagedListHolder pagedListHolder= new PagedListHolder(SVList);
		int page=ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(4);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("SVList", SVList);
		return"sinhvien/show";
	}
	@RequestMapping(value="DSSV", params="btnAdd")
	public String addSV(HttpServletRequest request, ModelMap model, @ModelAttribute("sinhvien") SinhVienE sinhvien) {
		Integer temp= this.insertSV(sinhvien);
		if(temp!=0) {
			model.addAttribute("message", "Thêm thành công");
		}
		else {
			model.addAttribute("message", "Thêm thất bại");
		}
		PagedListHolder pagedListHolder= new PagedListHolder(this.getSVs());
		int page=ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(4);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("btnStatus", "btnAdd");
		return"sinhvien/show";
	}
	
	@RequestMapping(value="DSSV/{MaEdit}.htm", params="linkEdit")
	public String editSV(HttpServletRequest request, ModelMap model,
			@ModelAttribute("sinhvien") SinhVienE sinhvien,
			@PathVariable("MaEdit") String MaEdit) {
		List<SinhVienE> SVList= this.getSVs();
		PagedListHolder pagedListHolder= new PagedListHolder(SVList);
		int page=ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(4);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("btnStatus", "btnEdit");
		model.addAttribute("sinhvien", this.getSV(MaEdit));
		return"sinhvien/show";
	}
	@RequestMapping(value="DSSV", params="btnEdit")
	public String editSV(HttpServletRequest request, ModelMap model,
			@ModelAttribute("sinhvien") SinhVienE sinhvien) {
		Integer temp= this.updateSV(sinhvien);
		if(temp!=0) {
			model.addAttribute("message", "Sửa thành công");
		}
		else {
			model.addAttribute("message", "Sửa thất bại");
		}
		PagedListHolder pagedListHolder= new PagedListHolder(this.getSVs());
		int page=ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(4);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return"sinhvien/show";
	}
	
	@RequestMapping(value="DSSV", params="btnSearch")
	public String searchSV(HttpServletRequest request, ModelMap model,
			@ModelAttribute("sinhvien") SinhVienE sinhvien) {
		List<SinhVienE> SVList=this.searchSV(request.getParameter("searchInput"));
		PagedListHolder pagedListHolder= new PagedListHolder(SVList);
		int page=ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(4);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return"sinhvien/show";
	}
	public SinhVienE getSV(String MaGet){
		Session session = factory.getCurrentSession();
		String hql="FROM SinhVienE where MaSV=: MaGet";
		Query query =session.createQuery(hql);
		query.setParameter("MaGet", MaGet);
		SinhVienE sv=(SinhVienE) query.list().get(0);
		return sv;
		
	}
	public List<SinhVienE> getSVs(){
		Session session = factory.getCurrentSession();
		String hql="FROM SinhVienE";
		Query query =session.createQuery(hql);
		List<SinhVienE> list= query.list();
		return list;
		
	}
	@ModelAttribute("getLop")
	public List<LopE> getLop(){
		Session session= factory.getCurrentSession();
		String hql="FROM LopE";
		Query query =session.createQuery(hql);
		List<LopE> list= query.list();
		return list;
	}
public Integer insertSV(SinhVienE sv) {
    	
    	Session session = factory.openSession();
    	Transaction t = session.beginTransaction();
    	try {
			session.save(sv);;
			t.commit();
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
		}finally {
			session.close();
		}
    	return 1;
    }
public Integer updateSV(SinhVienE sv) {
	
	Session session = factory.openSession();
	Transaction t = session.beginTransaction();
	try {
		session.update(sv);;
		t.commit();
	} catch (Exception e) {
		// TODO: handle exception
		t.rollback();
	}finally {
		session.close();
	}
	return 1;
}
public List<SinhVienE> searchSV(String maSearch){
	Session session= factory.getCurrentSession();
	String hql="FROM LopE where MaSV = :MaSearch";
	Query query =session.createQuery(hql);
	query.setParameter("maSearch", maSearch);
	List<SinhVienE> list= query.list();
	return list;
}
}
