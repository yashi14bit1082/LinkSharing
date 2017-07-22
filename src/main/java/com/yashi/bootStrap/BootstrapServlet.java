package com.yashi.bootStrap;

/*
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

*/
/**
 * Created by yashi on 21-07-2017.
 *//*

public class BootstrapServlet extends HttpServlet {

    public void init() {
        System.out.println("******************************************************************************BOOTSTARPING DATA");


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
*/


import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.dao.DatabaseConnectionDaoInterface;
import com.yashi.model.User;
import org.hibernate.Session;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

@Service
public class BootstrapServlet implements InitializingBean,startSession,stopSession {

    @Autowired
    DatabaseConnectionDaoInterface databaseConnectionDaoInterface;

    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println("########################################## BOOOOTTTTSTRAPING DATA................................*************************");
        boolean result = databaseConnectionDaoInterface.checkDataExistence("User","username","admin");

        if(!result)
        {
            Session session = startsession();
            User user = new User();
            user.setFirstname("admin");
            user.setLastname("admin");
            user.setPassword("admin");
            user.setUsername("admin");
            user.setEmail("yashi.gupta@tothenew.com");
            user.setDateUpdated(new Date());
            user.setDateCreated(new Date());
            user.setActive(true);
            user.setAdmin(true);
            Path path = Paths.get("C:\\Users\\hp\\Downloads\\TTN Demo Project\\LinkSharing\\src\\main\\webapp\\resources\\unknown_icon.png");
            user.setPhoto(Files.readAllBytes(path));

            databaseConnectionDaoInterface.saveAdmin(user);
            stopsession(session);
        }

    }

}