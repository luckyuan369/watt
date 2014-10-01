package com.watt.framework.home.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.watt.framework.common.dao.impl.BaseDaoImpl;
import com.watt.framework.home.dao.ICarouselDao;
import com.watt.framework.home.domain.Carousel;

@Repository
public class CarouselDaoImpl extends BaseDaoImpl<Carousel, Long> implements ICarouselDao {

	@Inject
    public CarouselDaoImpl(@Value("com.watt.framework.home.domain.Carousel")Class<Carousel> clazz) {
        super(clazz);
    }

	public List<Carousel> listCarousel() {
		String queryStr = "from Carousel order by sn asc";
		return this.getListByQuery(queryStr);
	}
	
}
