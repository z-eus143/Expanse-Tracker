package com.app.et.service;

import com.app.et.entity.Expense;

public interface ExpenseService {

	Integer saveExpense(Expense expense);

	Expense findByEid(Integer eid);

	String updateExpense(Expense expense);

	String deleteExpense(Expense expense);

}
