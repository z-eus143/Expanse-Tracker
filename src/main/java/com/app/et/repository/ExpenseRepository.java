package com.app.et.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.et.entity.Expense;
import com.app.et.entity.User;

public interface ExpenseRepository extends JpaRepository<Expense, Integer> {

	Expense findByEid(Integer eid);

	List<Expense> findByUserAndCreatedDateBetween(User user, LocalDate fDate, LocalDate tDate);

}
