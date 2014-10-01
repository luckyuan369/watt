package com.watt.framework.home.dto;

import java.math.BigDecimal;
import java.util.Date;

import com.watt.framework.common.dto.BaseDto;
import com.watt.framework.home.domain.Project;

public class SupporterDto extends BaseDto {

	private static final long serialVersionUID = 1L;

	private Long id; // 主键
	private Long project_id; // 项目主键
	private Long user_id; // 支持者主键
	private int copies; // 支持份额
	private BigDecimal limit_price; // 支持单价
	private BigDecimal total_price; // 支持总金额
	private Date buy_date; // 支持日期
	private BigDecimal back_price;// 反馈金额
	private String status; // 订单状态
	private Date update_date; // 修改时间

	private Project project;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getProject_id() {
		return project_id;
	}

	public void setProject_id(Long project_id) {
		this.project_id = project_id;
	}

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	public int getCopies() {
		return copies;
	}

	public void setCopies(int copies) {
		this.copies = copies;
	}

	public BigDecimal getLimit_price() {
		return limit_price;
	}

	public void setLimit_price(BigDecimal limit_price) {
		this.limit_price = limit_price;
	}

	public BigDecimal getTotal_price() {
		return total_price;
	}

	public void setTotal_price(BigDecimal total_price) {
		this.total_price = total_price;
	}

	public Date getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}

	public BigDecimal getBack_price() {
		return back_price;
	}

	public void setBack_price(BigDecimal back_price) {
		this.back_price = back_price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}
	
}
