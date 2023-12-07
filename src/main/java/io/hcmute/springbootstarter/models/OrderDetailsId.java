package io.hcmute.springbootstarter.models;

import java.io.Serializable;
import java.util.Objects;

public class OrderDetailsId implements Serializable {
	private static final long serialVersionUID = 1L;
	public Integer id;
    public Integer idprod;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OrderDetailsId that = (OrderDetailsId) o;
        return Objects.equals(id, that.id) &&
               Objects.equals(idprod, that.idprod);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, idprod);
    }

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getIdprod() {
		return idprod;
	}

	public void setIdprod(Integer idprod) {
		this.idprod = idprod;
	}
    
}

