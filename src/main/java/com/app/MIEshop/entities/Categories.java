package com.app.MIEshop.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name ="tbl_category")
public class Categories extends BaseEntity{
	@Column(name = "name", length = 100,nullable = false)
	private String name;
	
	@Column(name = "description", length = 100,nullable = false)
	private String description;
	
	@Column(name = "seo", length = 1000,nullable = true)
	private String seo;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "categories") // Ten Property trong
	private Set<Product> product = new HashSet<Product>(); 
	
	// Trong phia OneToMany can dinh nghia 2 methods 
	// tro giup cho viec them moi va xoa.
	public void addProduct(Product product) {
		this.product.add(product);
		product.setCategories(this);
	}
	public void deleteProduct(Product product) {
		this.product.remove(product);
		product.setCategories(null);
	}
	
	public Set<Product> getProduct() {
		return product;
	}

	public void setProducts(Set<Product> product) {
		this.product = product;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}
	
}
