package mlk.core.service;

import mlk.common.utils.Page;
import mlk.core.bean.Salevisit;

public interface SaleVisitService {
    // 查询客户列表
    public Page<Salevisit> findSalevisitList(Integer page, Integer rows,
                                            String sale_man, String visit_location, String visit_sum );

    public Salevisit getSalevisitByName(String sale_name);

    public void updateSalevisit(Salevisit salevisit);

    public void deleteSalevsit(String sale_man);

    public void insertSalevisit(Salevisit salevisit);
}
