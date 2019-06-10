package mlk.core.web.controller;

import mlk.common.utils.Page;
import mlk.core.bean.Salevisit;
import mlk.core.service.SaleVisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class SaleVisitController {
    @Autowired
    private SaleVisitService saleVisitService;
    @RequestMapping(value = "/salevisit")
    public String showSale(){
        return "redirect:/salevisit/list.action";
    }
    //拜访列表
    @RequestMapping(value = "/salevisit/list")
    public String list(@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="5")Integer rows,
                       String sale_man, String visit_location, String visit_sum, Model model) {

        Page<Salevisit> salevisitPage = saleVisitService.findSalevisitList(page, rows,sale_man,visit_location,visit_sum);
        model.addAttribute("page", salevisitPage);
        //参数回显
        model.addAttribute("sale_man", sale_man);
        model.addAttribute("visit_location", visit_location);
        model.addAttribute("visit_sum", visit_sum);
        return "salevisit";
    }
    @RequestMapping("/salevisit/edit")
    @ResponseBody
    public Salevisit getSalevisitByName(String sale_name) {
        Salevisit salevisit = saleVisitService.getSalevisitByName(sale_name);
        return salevisit;
    }
    @RequestMapping("/salevisit/update")
    @ResponseBody
    public String saleVisitUpdate(Salevisit salevisit) {
        saleVisitService.updateSalevisit(salevisit);
        return "OK";
    }
    @RequestMapping("/salevisit/delete")
    @ResponseBody
    public String saleVisitDelete(String sale_man){
        saleVisitService.deleteSalevsit(sale_man);
        return "OK";
    }
    @RequestMapping("/salevisit/insert")
    @ResponseBody
    public String saleVisitInsert(Salevisit salevisit){
        saleVisitService.insertSalevisit(salevisit);
        return "OK";
    }
}
