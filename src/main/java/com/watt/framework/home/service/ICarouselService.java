package com.watt.framework.home.service;

import java.util.List;

import com.watt.framework.common.service.IBaseService;
import com.watt.framework.home.domain.Carousel;

public interface ICarouselService extends IBaseService {
	 /**
     * 查询走马灯
     * @return
     */
    public List<Carousel> listCarousel() throws Exception;
    
    /**
     * 保存走马灯
     * @param Carousel
     * @throws Exception
     */
    public void saveCarousel(Carousel carousel) throws Exception;
    
    /**
     * 修改走马灯
     * @param Carousel
     * @throws Exception
     */
    public void updateCarousel(Carousel carousel) throws Exception;
    
    /**
     * 删除走马灯
     * @param Carousel
     * @throws Exception
     */
    public void removeCarouselById(Long id) throws Exception;
}
