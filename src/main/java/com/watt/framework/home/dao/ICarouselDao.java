package com.watt.framework.home.dao;

import java.util.List;

import com.watt.framework.common.dao.IBaseDao;
import com.watt.framework.home.domain.Carousel;

public interface ICarouselDao extends IBaseDao<Carousel, Long> {
	
    /**
     * 查询走马灯
     * @return
     */
    public List<Carousel> listCarousel();
}
