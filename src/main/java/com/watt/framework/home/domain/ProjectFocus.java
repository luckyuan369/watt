package com.watt.framework.home.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.watt.framework.common.domain.BaseDomain;

@Entity
@Table(name = "t_project_focus")
public class ProjectFocus extends BaseDomain {
	
	private static final long serialVersionUID = 1L;
	
	private Long id;
	@Temporal(TemporalType.TIMESTAMP)
	private Date create_date; // 创建时间
	
	private Project project; //喜欢的项目
	private User user;	//用户
	
	@ManyToOne(cascade = { CascadeType.REFRESH, CascadeType.MERGE }, optional = false)
	@JoinColumn(name = "project_id")
	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	@ManyToOne(cascade = { CascadeType.REFRESH, CascadeType.MERGE }, optional = false)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name = "create_date")
	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
}
