package com.yashi.controller;

import com.yashi.service.ResourceServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Created by yashi on 13-07-2017.
 */
@Controller
public class ResourceController {
    @Autowired
    ResourceServiceInterface resourceServiceInterface;

@RequestMapping (value = "/shareLinkResource",method = RequestMethod.POST)
    public @ResponseBody
String saveLinkResource(@RequestParam ("link") String link, @RequestParam ("description") String description, @RequestParam ("topic") String topic)
{
    Integer result = resourceServiceInterface.saveLinkResourceService(link,description,topic);
    return result+"";
}


    @RequestMapping (value = "/shareDocxResource",method = RequestMethod.POST)
    public @ResponseBody
    String saveDocxResource(@RequestParam ("attachedFile") String attachedFile, @RequestParam ("description") String description, @RequestParam ("topic") String topic)
    {
        Integer result = resourceServiceInterface.saveLinkResourceService(attachedFile,description,topic);
        return result+"";
    }

}
