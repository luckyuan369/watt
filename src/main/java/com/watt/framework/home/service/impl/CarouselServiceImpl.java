package com.watt.framework.home.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.watt.framework.common.exception.AppException;
import com.watt.framework.common.service.impl.BaseServiceImpl;
import com.watt.framework.home.dao.ICarouselDao;
import com.watt.framework.home.domain.Carousel;
import com.watt.framework.home.service.ICarouselService;

@Transactional(rollbackFor = AppException.class)
@Service
public class CarouselServiceImpl extends BaseServiceImpl implements ICarouselService {

	@Autowired
	private ICarouselDao carouselDao;

	public List<Carousel> listCarousel() throws Exception {
		return this.carouselDao.listCarousel();
	}

	public void saveCarousel(Carousel carousel) throws Exception {
		this.carouselDao.save(carousel);
	}

	public void updateCarousel(Carousel carousel) throws Exception {
		this.carouselDao.update(carousel);
	}

	public void removeCarouselById(Long id) throws Exception {
		this.carouselDao.remove(id);
	}

}
