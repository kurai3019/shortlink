package com.shortlink.controllers;

import com.shortlink.DAO.LinkDAO;
import com.shortlink.DAO.ShortUrlDaoimpl;
import com.shortlink.entities.Users;
import com.shortlink.entities.Vipcode;
import com.shortlink.model.shortlLink;
import java.io.IOException;
import static java.lang.Math.random;
import static java.lang.StrictMath.random;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Random;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static jdk.nashorn.internal.objects.NativeMath.random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LinkController {

    @Autowired
    LinkDAO linkDAO;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap map,HttpSession session) {
        map.addAttribute("hello", "Hello Spring from Netbeans!!");
        if (session.getAttribute("username") != null) {
            int sumlink = linkDAO.thongkeuserlink((Integer) session.getAttribute("userid"));
            int sumview = linkDAO.thongkeuserview((Integer) session.getAttribute("userid"));
            String kq = linkDAO.xephang((Integer) session.getAttribute("userid"));
            map.addAttribute("kq", kq);
            map.addAttribute("sumview", sumview);
            map.addAttribute("sumlink", sumlink);
            return "shortLink";
        } else {
            return "shortLink";

        }    }

    private static final Random random = new Random();
    private static final String CHARS = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ234567890";

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addLink(@RequestParam(value = "url", required = false) String url,
            ModelMap map, HttpSession session) throws URISyntaxException {
        URI urlC = new URI(url);
        String urlCut = urlC.getHost();
        boolean checkURLBack = linkDAO.checkBackList(urlCut);
        if (checkURLBack == true) {
            map.addAttribute("link", "Host này phải bị chặn");

            return "shortLink";

        }
        StringBuilder token = new StringBuilder(5);
        for (int i = 0; i < 5; i++) {
            token.append(CHARS.charAt(random.nextInt(CHARS.length())));
        }

        String tokenstring = token.toString();
        boolean already = linkDAO.checkRandomKey(tokenstring);
        if (already == true) {
            map.addAttribute("link", "Hệ thống bị lỗi, bạn vui lòng rút gọn lại link");

            return "shortLink";

        }
        if (session.getAttribute("userid") == null) {
            linkDAO.getLink(url, tokenstring, null);
            map.addAttribute("link", "http://localhost:8084/" + tokenstring);
            return "shortLink";

        }
        String userid = session.getAttribute("userid").toString();
        linkDAO.getLink(url, tokenstring, userid);

        map.addAttribute("link", "http://localhost:8084/" + tokenstring );
        return "shortLink";
    }
        @RequestMapping(value = "/addcodevip", method = RequestMethod.POST)
    public String addcodevip(@RequestParam(value = "codevip", required = false) String code,
            ModelMap map, HttpSession session) throws URISyntaxException {
         for (int i = 1;i < code.length(); i++){
            if (code.charAt(i) == '@' || code.charAt(i) == '"'){
                map.addAttribute("vipmess", "Code vip không được chứa ký tự đặc biệt");
                return "myProlife";
            }
        };     
             if ((Integer) session.getAttribute("role") == 1) {
                map.addAttribute("vipmess", "Admin không thể sử dụng code vip");
                return "myProlife";
                }
        Vipcode vipcode = linkDAO.addvipcode(code);
        if (vipcode.getDate() != 0){
              linkDAO.updatestatuscode(vipcode.getId());
              if ((Integer) session.getAttribute("role") == 3) {
                  linkDAO.updatedateviplinkcustom(vipcode.getDate(), (Integer) session.getAttribute("userid"));
                  linkDAO.updatedatevipuser(vipcode.getDate(), (Integer) session.getAttribute("userid"));
                  map.addAttribute("vipmess", "Bạn đã được cộng thêm "+vipcode.getDate()+" ngày vip");

                }
              else{
                  linkDAO.updatedateviplinkcustomtoday(vipcode.getDate(), (Integer) session.getAttribute("userid"));
                  linkDAO.updatedatevipusertoday(vipcode.getDate(), (Integer) session.getAttribute("userid"));
                  map.addAttribute("vipmess", "Bạn đã trở thành vip "+vipcode.getDate()+" ngày");
              }
          Users user = linkDAO.update((Integer) session.getAttribute("userid"));
         if (user != null) {

            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRoleId());
            session.setAttribute("userid", user.getUserId());
            session.setAttribute("fullname", user.getFullname());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("createdate", user.getStringDate());
            session.setAttribute("vipdate", user.getStringDatevip());

            
            }
              
            
        }
        else{
                  map.addAttribute("vipmess", "Code không tồn tại hoặc đã được sử dụng");

        }
        
        return "myProlife";

    }

    @RequestMapping(value = "/{shortLink}", method = RequestMethod.GET)
    public String shortLink(@PathVariable(value = "shortLink") String URL,
            ModelMap map) {

        String link = linkDAO.loadURL(URL);
        if (link == null) {
            return "404";
        }
        linkDAO.AddView(URL);
        map.addAttribute("link", link);
        return "link";
    }

    @RequestMapping(value = "/admin/shorturlpage")
    public void getAllShortLink(HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        response.setStatus(200);
        response.getWriter().print("{'concho':1}");

    }

    @RequestMapping(value = "/hello")
    public @ResponseBody
    shortlLink LinkController() {
        ShortUrlDaoimpl a = new ShortUrlDaoimpl();
        shortlLink a1 = a.getListLink(-1).get(0);
        return a1;
    }

    @RequestMapping(value = "/view")
    public String deleteAllUsers() {
        return "/admin/testwebgetjson";
    }

}
