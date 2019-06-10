package mlk.core.bean;

import java.util.Date;

public class Salevisit {
//<!--FIELD            TYPE          COLLATION        NULL    KEY     DEFAULT  Extra   PRIVILEGES                       COMMENT-->
//<!-- -&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;  &#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;  -&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;  &#45;&#45;&#45;&#45;&#45;&#45;  &#45;&#45;&#45;&#45;&#45;&#45;  -&#45;&#45;&#45;&#45;&#45;&#45;  &#45;&#45;&#45;&#45;&#45;&#45;  -&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;  -&#45;&#45;&#45;&#45;&#45;&#45;-->
//<!--sale_createtime  DATETIME      (NULL)           YES             (NULL)           SELECT,INSERT,UPDATE,REFERENCES         -->
//<!--sale_man         VARCHAR(32)   utf8_general_ci  YES             (NULL)           SELECT,INSERT,UPDATE,REFERENCES         -->
//<!--visit_location   VARCHAR(100)  utf8_general_ci  YES             (NULL)           SELECT,INSERT,UPDATE,REFERENCES         -->
//<!--visit_sum        VARCHAR(32)   utf8_general_ci  YES             (NULL)           SELECT,INSERT,UPDATE,REFERENCES         -->
    private Date saleVisit_createtime;
    private String sale_man;
    private String visit_location;
    private String visit_sum;
    private Integer start;
    private Integer rows;
    public Date getSaleVisit_createtime() {
        return saleVisit_createtime;
    }

    public void setSaleVisit_createtime(Date saleVisit_createtime) {
        this.saleVisit_createtime = saleVisit_createtime;
    }

    public String getSale_man() {
        return sale_man;
    }

    public void setSale_man(String sale_man) {
        this.sale_man = sale_man;
    }

    public String getVisit_location() {
        return visit_location;
    }

    public void setVisit_location(String visit_location) {
        this.visit_location = visit_location;
    }

    public String getVisit_sum() {
        return visit_sum;
    }

    public void setVisit_sum(String visit_sum) {
        this.visit_sum = visit_sum;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }
}
