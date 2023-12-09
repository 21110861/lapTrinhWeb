package io.hcmute.springbootstarter.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import io.hcmute.springbootstarter.models.Orders;
import io.hcmute.springbootstarter.services.OrdersService;

import java.util.List;

@Controller
public class OrderController {
    @Autowired 
    private OrdersService service;

    @GetMapping("/admin/orders")
    public String showOrderList(Model model) {
        List<Orders> listOrders = service.listAll();
        model.addAttribute("listOrders", listOrders);

        return "orders";
    }

    @GetMapping("/admin/orders/new")
    public String showNewForm(Model model) {
        model.addAttribute("order", new Orders());
        model.addAttribute("pageTitle", "Add New Order");
        return "order_form";
    }

    @PostMapping("/admin/orders/save")
    public String saveOrder(Orders order, RedirectAttributes ra) {
        service.save(order);
        ra.addFlashAttribute("message", "The Order has been saved successfully.");
        return "redirect:/admin/orders";
    }

    @GetMapping("/admin/orders/edit/{id}")
    public String showEditForm(@PathVariable("id") Integer id, Model model, RedirectAttributes ra) {
        try {
            Orders order = service.get(id);
            model.addAttribute("order", order);
            model.addAttribute("pageTitle", "Edit Order (ID: " + id + ")");

            return "order_form";
        } catch (Exception e) {
            ra.addFlashAttribute("message", e.getMessage());
            return "redirect:/admin/orders";
        }
    }

    @GetMapping("/admin/orders/detail/{id}")
    public String showDetailForm(@PathVariable("id") Integer id, Model model, RedirectAttributes ra)
    {
        try
        {
            Orders order = service.get(id);
            model.addAttribute("order", order);
            model.addAttribute("pageTitle", "Detail Order (ID: " + id + ")");

            return "order_detail";
        } catch (Exception e)
        {
            ra.addFlashAttribute("message", e.getMessage());
            return "redirect:/admin/orders";
        }
    }

    @GetMapping("/admin/orders/delete/{id}")
    public String deleteOrder(@PathVariable("id") Integer id, RedirectAttributes ra) {
        try {
            service.delete(id);
            ra.addFlashAttribute("message", "The Order ID " + id + " has been deleted.");
        } catch (Exception e) {
            ra.addFlashAttribute("message", e.getMessage());
        }
        return "redirect:/admin/orders";
    }


    @GetMapping("/admin/orders/search")
    public String searchByIdForm(Model model)
    {
        model.addAttribute("searchOrder", new Orders());  // Sử dụng Order làm đối tượng tìm kiếm

        return "searchForm";
    }

    @PostMapping("/admin/orders/search")
    public String searchById(@ModelAttribute("searchOrder") Orders searchOrder, RedirectAttributes ra) {
        try {
            Integer id = searchOrder.getId();
            Orders order = service.get(id);
            ra.addFlashAttribute("order", order);
            ra.addFlashAttribute("pageTitle", "Detail Order (ID: " + id + ")");

            return "order_detail";
        } catch (Exception e) {
            ra.addFlashAttribute("message", e.getMessage());
            return "redirect:/admin/orders";
        }
    }

}
