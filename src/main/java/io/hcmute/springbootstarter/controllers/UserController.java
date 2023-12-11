package io.hcmute.springbootstarter.controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import io.hcmute.springbootstarter.models.Users;
import io.hcmute.springbootstarter.services.UsersService;

@Controller
public class UserController {

    @Autowired
    private UsersService usersService;

    @GetMapping("/admin/users")
    public String loadUsers(Model model) {
        List<Users> users = usersService.getAllUsers();

        model.addAttribute("listUsers", users);
        return "users";
    }

	@DeleteMapping("/admin/users/delete/{id}")
	public ResponseEntity<String> deleteCategory(@PathVariable("id") int id) {
		try {
			// Gọi service để xóa sản phẩm dựa trên ID
			usersService.deleteUser(id);
			return ResponseEntity.ok("category deleted successfully");
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return ResponseEntity.status(500).body("Failed to delete user at server");
		}
	}

	@PostMapping("/admin/users/add")
	public ResponseEntity<?> addNewCaterory(@RequestBody Users newUser) {
		// Kiểm tra nếu request là request lấy favicon.ico thì không xử lý
		if ("favicon.ico".equals(newUser.getName())) {
			return ResponseEntity.status(HttpStatus.OK).build();
		}
		Users addedUser = usersService.addUser(newUser);

		return ResponseEntity.status(HttpStatus.CREATED).body(addedUser);
	}

}
