package io.hcmute.springbootstarter.models;

import java.util.List;

public class SortRequest {
	public String lastTypeSort = "#";
	public int page;
	public int pageSize = 10;
	public List<Product> listProduct;
	public SortRequest(List<Product> sortedList, String lastTypeSort, int page) {
		super();
		this.lastTypeSort = lastTypeSort;
		this.page = page;
		this.pageSize = 10;
	}

	public SortRequest() {
	}

	public SortRequest(List<Product> sortedList, String lastTypeSort) {
		super();
		this.lastTypeSort = lastTypeSort;
	}
	
}
