package com.app.et.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.app.et.entity.Expense;
import com.app.et.entity.User;
import com.app.et.service.ExpenseService;
import com.app.et.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ExpenseTrackerController {

	private final UserService userService;
	private final ExpenseService expenseService;

	public ExpenseTrackerController(UserService userService, ExpenseService expenseService) {
		this.userService = userService;
		this.expenseService = expenseService;
	}

	// Utility method to get the logged-in user
	private User getLoggedInUser(HttpServletRequest request) {
		String username = (String) request.getSession().getAttribute("username");
		return userService.findByUserName(username);
	}

	// Public pages
	@GetMapping("/login")
	public String showLoginPage() {
		return "login";
	}

	@GetMapping("/")
	public String showWelcomePage() {
		return "welcome";
	}

	@GetMapping("/register")
	public String registerPage(Model model) {
		model.addAttribute("user", new User());
		return "register";
	}

	@GetMapping("/passwordreset")
	public String passwordresetPage(Model model) {
		return "passwordreset";
	}

	// Login handler
	@PostMapping("/login")
	public ModelAndView loginUser(@RequestParam String username, @RequestParam String password,
			HttpServletRequest request, Model model) {
		ModelAndView mv = new ModelAndView();

		if (userService.login(username, password)) {
			HttpSession session = request.getSession(true);
			session.setAttribute("username", username);

			User user = userService.findByUserName(username);
			model.addAttribute("exps", user.getExpenses());
			mv.setViewName("home");
		} else {
			mv.setViewName("login");
			mv.addObject("errmsg", "Invalid credentials");
		}
		return mv;
	}

	@PostMapping("/register")
	public String registerUser(User user, Model model) {
		boolean registered = userService.registerUser(user);
		if (registered) {
			model.addAttribute("succmsg", "Registered successfully");
			return "login";
		} else {
			model.addAttribute("errmsg", "Username already exists");
			return "register";
		}
	}

	// Protected pages (Interceptor will ensure login)
	@GetMapping("/home")
	public String homePage(Model model, HttpServletRequest request) {
		User user = getLoggedInUser(request);
		model.addAttribute("exps", user.getExpenses());
		return "home";
	}

	@GetMapping("/addexpense")
	public String addExpensePage(Model model) {
		model.addAttribute("expense", new Expense());
		return "addexpense";
	}

	@PostMapping("/addexpense")
	public String saveExpense(Expense expense, Model model, HttpServletRequest request) {
		User user = getLoggedInUser(request);
		expense.setUser(user);
		Integer eid = expenseService.saveExpense(expense);

		model.addAttribute("msg", "Expense added successfully with ID: " + eid);
		model.addAttribute("exps", user.getExpenses());
		return "home";
	}

	@GetMapping("/updateExpense")
	public String updateExpensePage(@RequestParam Integer eid, Model model, HttpServletRequest request) {
		Expense expense = expenseService.findByEid(eid);
		model.addAttribute("exp", expense);
		return "updateExpense";
	}

	@PostMapping("/updateexpense")
	public String updateExpense(Expense expense, Model model, HttpServletRequest request) {
		String message = expenseService.updateExpense(expense);
		User user = getLoggedInUser(request);

		model.addAttribute("msg", message);
		model.addAttribute("exps", user.getExpenses());
		return "home";
	}

	@GetMapping("/deleteexpense")
	public String deleteExpense(Expense expense, Model model, HttpServletRequest request) {
		String message = expenseService.deleteExpense(expense);
		User user = getLoggedInUser(request);

		model.addAttribute("msg", message);
		model.addAttribute("exps", user.getExpenses());
		return "home";
	}

	@GetMapping("/filterExpenses")
	public String filter(HttpServletRequest request, Model model) {
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");

		User user = getLoggedInUser(request);

		List<Expense> expenses = expenseService.filter(user, fromDate, toDate);

		model.addAttribute("exps", expenses);
		model.addAttribute("from", fromDate);
		model.addAttribute("to", toDate);

		return "home";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false); // get existing session
		if (session != null) {
			session.invalidate(); // destroy session
		}
		model.addAttribute("succmsg", "You have been logged out successfully");
		return "welcome";
	}
}
