package com.yashi.controller;

import com.yashi.service.ResourceServiceInterface;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;


/**
 * Created by yashi on 13-07-2017.
 */
@Controller
public class ResourceController {
    @Autowired
    ResourceServiceInterface resourceServiceInterface;


    @RequestMapping (value = "/share_docx",method = RequestMethod.POST)
    public @ResponseBody
String saveDocxResource(@RequestParam ("docx") MultipartFile file, @RequestParam ("docx_desc") String description, @RequestParam ("topic_docx") String topic)
{
    if (!file.isEmpty()) {
        try {
            byte[] bytes = file.getBytes();

            // Creating the directory to store file
            String rootPath = "C:\\Users\\hp\\Downloads\\TTN Demo Project\\LinkSharing\\src\\main\\webapp\\WEB-INF\\resources";
            File dir = new File(rootPath + File.separator + "assets");
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            File serverFile = new File(dir.getAbsolutePath()
                    + File.separator + file.getOriginalFilename());
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();

            resourceServiceInterface.saveLinkResourceService(serverFile.getAbsolutePath(),description,topic,"Document");

            return "You successfully uploaded file";
        } catch (Exception e) {
            return "You failed to upload => " + e.getMessage();
        }
    } else {
        return "You failed to upload because the file was empty.";
    }


}


    @RequestMapping (value = "/shareLinkResource",method = RequestMethod.POST)
    public @ResponseBody
    String saveLinkResource(@RequestParam ("link") String link, @RequestParam ("description") String description, @RequestParam ("topic") String topic)
    {
        Integer result = resourceServiceInterface.saveLinkResourceService(link,description,topic,"Link");

        if(result==1)
            return "You successfully saved link";
        else
            return "Link is not successfullt saved";

    }

}
