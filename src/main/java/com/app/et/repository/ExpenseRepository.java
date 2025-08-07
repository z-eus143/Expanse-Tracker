package com.app.et.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.et.entity.Expense;

public interface ExpenseRepository extends JpaRepository<Expense, Integer> {

}
