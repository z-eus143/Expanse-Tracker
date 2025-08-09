package com.app.et.service;

import java.util.List;

import com.app.et.entity.Expense;
import com.app.et.entity.User;

public interface ExpenseService {

	Integer saveExpense(Expense expense);

	Expense findByEid(Integer eid);

	String updateExpense(Expense expense);

	String deleteExpense(Expense expense);

	List<Expense> filter(User user, String fromDate, String toDate);

}
