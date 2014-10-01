package com.watt.framework.home.domain;

import java.math.BigDecimal;
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

/**
 * 项目支持者
 * @author JIAYUAN
 *
 */
@Entity
@Table(name = "t_supporter")
public class Supporter extends BaseDomain {

	private static final long serialVersionUID = 1L;

	private Long id; // 主键
	private int copies; // 支持份额
	private BigDecimal limit_price; // 支持单价
	private BigDecimal total_price; // 支持总金额
	@Temporal(TemporalType.DATE)
	private Date buy_date; // 支持日期
	private BigDecimal back_price;// 反馈金额
	
	private String status; // 订单状态
	@Temporal(TemporalType.TIMESTAMP)
	private Date update_date; // 修改时间
	
	private User user; //支持者
	
	private Project project; //支持的项目
	
	@ManyToOne(cascade = { CascadeType.REFRESH, CascadeType.MERGE }, optional = false)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne(cascade = { CascadeType.REFRESH, CascadeType.MERGE }, optional = false)
	@JoinColumn(name = "project_id")
	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name = "copies")
	public int getCopies() {
		return copies;
	}

	public void setCopies(int copies) {
		this.copies = copies;
	}

	@Column(name = "limit_price")
	public BigDecimal getLimit_price() {
		return limit_price;
	}

	public void setLimit_price(BigDecimal limit_price) {
		this.limit_price = limit_price;
	}

	@Column(name = "total_price")
	public BigDecimal getTotal_price() {
		return total_price;
	}

	public void setTotal_price(BigDecimal total_price) {
		this.total_price = total_price;
	}

	@Column(name = "buy_date")
	public Date getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}

	@Column(name = "back_price")
	public BigDecimal getBack_price() {
		return back_price;
	}

	public void setBack_price(BigDecimal back_price) {
		this.back_price = back_price;
	}

	@Column(name = "status")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "update_date")
	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	
	
}
