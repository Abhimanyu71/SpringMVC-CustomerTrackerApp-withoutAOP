package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.springdemo.entity.Customer;

@Repository
public  class CustomerDAOImpl implements CustomerDAO {

	//need to inject session factory
@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<Customer> getCustomers() {
		
		//get the current hibernate session
	Session currentSession=sessionFactory.getCurrentSession();
		
		
		
		//create a query   sort by lastName
		Query<Customer> theQuery=currentSession.createQuery("from Customer order by lastName", Customer.class);
		
		//execute the query and get the result set
		List<Customer> customers=theQuery.getResultList();
		


		//return the result
		
		return customers;
	}


	@Override
	public void saveCustomer(Customer theCustomer) {
		// get current hibernate session
		
		Session currentSession=sessionFactory.getCurrentSession();
		
		//save & update customer(based on primary key) the customer finally
		currentSession.saveOrUpdate(theCustomer);
	}


	@Override
	public Customer getCustomer(int theId) {

		//get the current hibernate session
		Session currentSession=sessionFactory.getCurrentSession();
		
		//now retrieve/read from database using primary key
		Customer theCustomer=currentSession.get(Customer.class,theId);
		
		return theCustomer;
	}


	@Override
	public void deleteCustomer(int theId) {

		//get the current hibernate session
		Session currentSession=sessionFactory.getCurrentSession();
		
		//delete object with primary key 
		
		Query theQuery=currentSession.createQuery("delete from customer where id=:customerId");
		theQuery.setParameter("customerId", theId);
	}


	

}
