package com.watt.framework.home.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.watt.framework.common.domain.BaseDomain;

@Entity
@Table(name = "t_project")
public class Project extends BaseDomain {

	private static final long serialVersionUID = 1L;

	private Long id;
	private String name; // 项目名称
	private int copies; // 筹集份数
	private BigDecimal limit_price; // 每份金额
	private int deal_days = 0; // 筹资天数
	private String cate_id; // 产品
	private String province; // 所属省份
	private String city; // 所属城市
	private String image;// 项目封面
	private String brief; // 项目简介
	private String description; // 项目明细
	private int attention = 0; // 关注
	private String status; // 项目状态

	@Temporal(TemporalType.DATE)
	private Date releaseDate; // 发布日期
	@Temporal(TemporalType.DATE)
	private Date expirationDate; // 截止日期
	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate; // 创建时间
	@Temporal(TemporalType.TIMESTAMP)
	private Date update_date; // 修改时间

	private User user;	//项目创建者
	
	private List<Supporter> supporter;	//项目支持者
	
	private List<ProjectFocus> projectFocus; //项目关注者
	
	@ManyToOne(cascade = { CascadeType.REFRESH, CascadeType.MERGE }, optional = false)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy="project")
	public List<Supporter> getSupporter() {
		return supporter;
	}

	public void setSupporter(List<Supporter> supporter) {
		this.supporter = supporter;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy="project")
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

	@Column(name = "attention")
	public int getAttention() {
		return attention;
	}

	public void setAttention(int attention) {
		this.attention = attention;
	}

	@Column(name = "status")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "release_date")
	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	@Column(name = "expiration_date")
	public Date getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}

	@Column(name = "create_date")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "limit_price")
	public BigDecimal getLimit_price() {
		return limit_price;
	}

	public void setLimit_price(BigDecimal limit_price) {
		this.limit_price = limit_price;
	}

	@Column(name = "deal_days")
	public int getDeal_days() {
		return deal_days;
	}

	public void setDeal_days(int deal_days) {
		this.deal_days = deal_days;
	}

	@Column(name = "cate_id")
	public String getCate_id() {
		return cate_id;
	}

	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Column(name = "brief")
	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	@Column(name = "description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "copies")
	public int getCopies() {
		return copies;
	}

	public void setCopies(int copies) {
		this.copies = copies;
	}

	@Column(name = "update_date")
	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

}
