package com.watt.framework.home.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.watt.framework.common.domain.BaseDomain;

@Entity
@Table(name = "t_user")
public class User extends BaseDomain {

	private static final long serialVersionUID = 1L;

	private Long id;
	private String user_name;
	private String user_pwd;
	private String sex;
	private String mobile;
	private String province;
	private String city;
	private String image;
	private String intro;
	private String email;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate; // 创建时间
	@Temporal(TemporalType.TIMESTAMP)
	private Date update_date; // 创建时间
	private String role;//角色
	
	private List<Supporter> supporter;	//项目支持者
	private List<Project> project;	//用户发起的项目
	private List<ProjectFocus> projectFocus; //用户喜欢的项目
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy="user")
	public List<Supporter> getSupporter() {
		return supporter;
	}

	public void setSupporter(List<Supporter> supporter) {
		this.supporter = supporter;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy="user")
	public List<Project> getProject() {
		return project;
	}

	public void setProject(List<Project> project) {
		this.project = project;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy="user")
	public List<ProjectFocus> getProjectFocus() {
		return projectFocus;
	}

	public void setProjectFocus(List<ProjectFocus> projectFocus) {
		this.projectFocus = projectFocus;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name = "user_name")
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Column(name = "user_pwd")
	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	@Column(name = "sex")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(name = "mobile")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "province")
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	@Column(name = "city")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	@Column(name = "image")
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Column(name = "intro")
	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	@Column(name = "create_date")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "update_date")
	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	@Column(name = "role")
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
