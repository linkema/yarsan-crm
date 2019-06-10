package mlk.core.service.impl;

import mlk.common.utils.Page;
import mlk.core.bean.Salevisit;
import mlk.core.dao.SaleVisitDao;
import mlk.core.service.SaleVisitService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SaleVisitServiceImpl implements SaleVisitService {
    @Autowired
    private SaleVisitDao saleVisitDao;
    @Override
    public Page<Salevisit> findSalevisitList(Integer page, Integer rows, String sale_man, String visit_location, String visit_sum) {
       Salevisit salevisit=new Salevisit();
       if(StringUtils.isNotBlank(sale_man)){
           salevisit.setSale_man(sale_man);
       }
       if(StringUtils.isNotBlank(visit_location)){
           salevisit.setVisit_location(visit_location);
       }
       if(StringUtils.isNotBlank(visit_sum)){
           salevisit.setVisit_sum(visit_sum);
       }
       salevisit.setStart((page-1)*rows);
       salevisit.setRows(rows);
       List<Salevisit> list=saleVisitDao.selectSaleVisitList(salevisit);
       Integer count=saleVisitDao.selectSaleVisitListCount(salevisit);
        Page<Salevisit> result = new Page<>();
        result.setPage(page);
        result.setRows(list);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    @Override
    public Salevisit getSalevisitByName(String sale_man) {

        Salevisit salevisit=saleVisitDao.getSaleVisitBySale_man(sale_man);
        return  salevisit;
    }

    @Override
    public void updateSalevisit(Salevisit salevisit) {
        saleVisitDao.updateSaleVisit(salevisit);
    }

    @Override
    public void deleteSalevsit(String sale_man) {
        saleVisitDao.deleteSalevisit(sale_man);
    }

    @Override
    public void insertSalevisit(Salevisit salevisit) {
        saleVisitDao.insertSaleVisit(salevisit);
    }
}
