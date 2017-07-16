package com.yashi.controller;

import com.yashi.service.AdminServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by yashi on 16-07-2017.
 */
@Controller
public class AdminController {

    @Autowired
    AdminServiceInterface adminServiceInterface;

    @RequestMapping(value = "/fetchUTPListForAdmin", method = RequestMethod.POST)
    public @ResponseBody List<Object> fetchUTPListForAdmin(@RequestParam ("utpSelected") String utpSelected,@RequestParam ("utpOptionSelected") String utpOptionSelected)
    {
        List<Object> responseList = adminServiceInterface.fetchList(utpSelected,utpOptionSelected);

        return responseList;
    }
}
