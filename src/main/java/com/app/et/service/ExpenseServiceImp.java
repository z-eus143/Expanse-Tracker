package com.app.et.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.et.entity.Expense;
import com.app.et.entity.User;
import com.app.et.repository.ExpenseRepository;

@Service
public class ExpenseServiceImp implements ExpenseService {

	@Autowired
	private ExpenseRepository expenseRepository;

	@Override
	public Integer saveExpense(Expense expense) {
		// TODO Auto-generated method stub
		return expenseRepository.save(expense).getEid();
	}

	@Override
	public Expense findByEid(Integer eid) {
		// TODO Auto-generated method stub
		return expenseRepository.findByEid(eid);
	}

	@Override
	public String updateExpense(Expense expense) {
		// TODO Auto-generated method stub
		Expense exp = findByEid(expense.getEid());
		exp.setName(expense.getName());
		exp.setDescription(expense.getDescription());
		exp.setAmount(expense.getAmount());
		expenseRepository.save(exp);
		return "Updated Successfully";
	}

	@Override
	public String deleteExpense(Expense expense) {
		// TODO Auto-generated method stub
		expenseRepository.delete(expense);
		return "Deleted Successfully";
	}

	@Override
	public List<Expense> filter(User user, String fromDate, String toDate) {
		// TODO Auto-generated method stub
		LocalDate fDate = LocalDate.parse(fromDate);
		LocalDate tDate = LocalDate.parse(toDate);
		List<Expense> expenses = expenseRepository.findByUserAndCreatedDateBetween(user, fDate, tDate);
		return expenses;
	}

}
