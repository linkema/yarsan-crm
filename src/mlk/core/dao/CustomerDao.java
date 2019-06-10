package mlk.core.dao;

import java.util.List;

import mlk.core.bean.Customer;

public interface CustomerDao {

	List<Customer> selectCustomerList(Customer customer);
	Integer selectCustomerListCount(Customer customer);
	Customer getCustomerById(Long id);
	void updateCustomer(Customer customer);
	void deleteCustomer(Long id);

    void insertCustomer(Customer customer);
}