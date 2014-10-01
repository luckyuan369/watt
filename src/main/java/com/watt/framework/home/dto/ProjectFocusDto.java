package com.watt.framework.home.dto;

import com.watt.framework.common.dto.BaseDto;
import com.watt.framework.home.domain.Project;
import com.watt.framework.home.domain.User;

public class ProjectFocusDto extends BaseDto {

	private static final long serialVersionUID = 1L;

	private Long id;
	private Project project; // 喜欢的项目
	private User user; // 用户
	private String create_date; // 创建时间

	// /////////////////////////////////////
	private Long user_Id; // 用户ID
	private Long project_id;// 项目ID

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(Long user_Id) {
		this.user_Id = user_Id;
	}

	public Long getProject_id() {
		return project_id;
	}

	public void setProject_id(Long project_id) {
		this.project_id = project_id;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
