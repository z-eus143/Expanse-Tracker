package com.app.et.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.et.entity.User;
import com.app.et.service.ExpenseService;
import com.app.et.service.UserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ExpenseTrackerController {

	private UserService userService;

	private ExpenseService expenseService;

	public ExpenseTrackerController(UserService userService, ExpenseService expenseService) {
		this.userService = userService;
		this.expenseService = expenseService;
	}

	@GetMapping("/")
	public String showLoginPage() {
		return "login";
	}

	@GetMapping("/register")
	public String registerPage(Model model) {
		model.addAttribute("user", new User());
		return "register";
	}

	@PostMapping("/register")
	public String postMethodName(User user, Model model) {

		boolean registered = userService.registerUser(user);

		if (registered) {
			// registered succ
			model.addAttribute("succmsg", "Register Successfuly");
		} else {
			// already registered
			model.addAttribute("errmsg", "Already Register");
		}

		return "login";
	}

	@PostMapping("/login")
	public ModelAndView loginUser(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		boolean isValid = userService.login(username, password);

		ModelAndView mv = new ModelAndView();

		if (isValid) {
			mv.setViewName("welcome");
		} else {
			mv.setViewName("login");
			mv.addObject("errmsg", "Invalid credentials");
		}

		return mv;
	}

}
