package com.yashi.controller;

import com.sun.org.apache.regexp.internal.RE;
import com.yashi.model.Resource;
import com.yashi.model.User;
import com.yashi.service.DatabaseConnectionService;
import com.yashi.service.DatabaseConnectionServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by yashi on 18-07-2017.
 */
@Controller
public class DynamicDataFetchController {

    @Autowired
    DatabaseConnectionService databaseConnectionService;

    @RequestMapping(value = "/fetchImage",method = RequestMethod.GET)
    public void fetchImage(HttpServletResponse response, @RequestParam("username") String username) throws IOException {
       User user = (User) databaseConnectionService.fetchObject("User","username",username);
       byte[] photo = user.getPhoto();

        try {
            response.getOutputStream().write(photo);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
