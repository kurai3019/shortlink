
package com.shortlink.controllers;

import com.shortlink.DAO.LinkDAO;
import static java.lang.Math.random;
import static java.lang.StrictMath.random;
import java.util.Random;
import static jdk.nashorn.internal.objects.NativeMath.random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class LinkController {
    @Autowired
    LinkDAO linkDAO;
    
    @RequestMapping(value="/", method= RequestMethod.GET)
    public String index(ModelMap map) {
        map.addAttribute("hello", "Hello Spring from Netbeans!!");
        return "shortLink";
    }


    private static final Random random = new Random();
private static final String CHARS = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ234567890";






    @RequestMapping(value="/add", method=RequestMethod.GET)
    public String addLink(@RequestParam(value="url", required=false) String url,
            ModelMap map) {

    StringBuilder token = new StringBuilder(5);
    for (int i = 0; i < 5; i++) {
        token.append(CHARS.charAt(random.nextInt(CHARS.length())));
    }
    
        String tokenstring = token.toString();
        linkDAO.getLink(url,tokenstring);
        map.addAttribute("link","Link của bạn:<a href="+"http://localhost:8084/"+ tokenstring+">http://localhost:8084/"+tokenstring+"</a>");        
        return "shortLink";
    }    

        @RequestMapping(value="/{shortLink}", method=RequestMethod.GET)
    public String shortLink(@PathVariable(value="shortLink") String URL,
            ModelMap map) {
        
        String link = linkDAO.loadURL(URL);
        if (link == null ){
        return "404";
        }
        map.addAttribute("link", link);        
        return "link";
    }     

    
}
