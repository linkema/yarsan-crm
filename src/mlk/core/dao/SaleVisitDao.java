package mlk.core.dao;

import mlk.core.bean.Salevisit;

import java.util.List;

public interface SaleVisitDao {
    List<Salevisit> selectSaleVisitList(Salevisit salevisit);
    Integer selectSaleVisitListCount(Salevisit salevisit);
    Salevisit getSaleVisitBySale_man(String sale_man);
    void updateSaleVisit(Salevisit salevisit);
    void deleteSalevisit(String  sale_man);

    void insertSaleVisit(Salevisit salevisit);
}
