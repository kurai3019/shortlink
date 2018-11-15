/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shortlink.controllers;

import com.shortlink.DAO.LinkDAO;
import com.shortlink.DAO.loginDAO;
import com.shortlink.common.GooglePojo;
import com.shortlink.common.GoogleUtils;
import com.shortlink.common.RestFB;
import com.shortlink.entities.Links;
import com.shortlink.entities.Users;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Random;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Administrator
 */
@Controller

public class LoginController {

    @Autowired
    private loginDAO loginDAO;

    @Autowired
    private LinkDAO linkDAO;

    @Autowired
    private GoogleUtils googleUtils;

    @Autowired
    private RestFB restFB;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String addLink(@RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session,
            ModelMap map) {
        for (int i = 1; i < username.length(); i++) {
            if (username.charAt(i) == '@' || username.charAt(i) == '"') {
                map.addAttribute("error", "<div class=\"alert alert-danger\" role=\"alert\">\n"
                        + "  Tên tài khoản không được chứa ký tự đặc biệt!\n"
                        + "</div>");
                return "shortLink";
            }
        };

        for (int i = 1; i < password.length(); i++) {
            if (password.charAt(i) == '@' || password.charAt(i) == '"') {
                map.addAttribute("error", "<div class=\"alert alert-danger\" role=\"alert\">\n"
                        + "  Tên tài khoản không được chứa ký tự đặc biệt!\n"
                        + "</div>");
                return "shortLink";
            }
        };

        Users user = loginDAO.login(username, password);
        if (user != null) {
            if (user.getRoleId() == 3) {
                boolean a = loginDAO.checkVipEx(user.getUsername());
                if (a == true) {
                    loginDAO.changeEX(user.getUsername());
                    user.setRoleId(2);
                }
            }

            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRoleId());
            session.setAttribute("userid", user.getUserId());
            session.setAttribute("fullname", user.getFullname());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("createdate", user.getStringDate());
            session.setAttribute("vipdate", user.getStringDatevip());

            int link = linkDAO.thongkeuserlink(user.getUserId());
            int view = linkDAO.thongkeuserview(user.getUserId());
            String kq = linkDAO.xephang(user.getUserId());
            map.addAttribute("kq", kq);
            map.addAttribute("sumview", view);
            map.addAttribute("sumlink", link);

            return "shortLink";
        } else {
            map.addAttribute("error", "<div class=\"alert alert-danger\" role=\"alert\">\n"
                        + "  Sai tài khoản và mật khẩu!\n"
                        + "</div>");
            return "shortLink";
        }

    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(
            HttpSession session,
            ModelMap map) {
        if (((String) session.getAttribute("username")) != null) {
            int link = linkDAO.thongkeuserlink((Integer) session.getAttribute("userid"));
            int view = linkDAO.thongkeuserview((Integer) session.getAttribute("userid"));
            String kq = linkDAO.xephang((Integer) session.getAttribute("userid"));
            map.addAttribute("kq", kq);
            map.addAttribute("sumview", view);
            map.addAttribute("sumlink", link);
            return "shortLink";
        } else {
            session.removeAttribute("username");
            session.removeAttribute("role");
            session.removeAttribute("userid");
            session.removeAttribute("email");
            session.removeAttribute("fullname");
            session.removeAttribute("createdate");
            return "shortLink";

        }
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session, ModelMap map) {
        session.removeAttribute("username");
        session.removeAttribute("role");
        session.removeAttribute("userid");
        session.removeAttribute("email");
        session.removeAttribute("fullname");
        session.removeAttribute("createdate");

        map.addAttribute("error", "<div class=\"alert alert-success\" role=\"alert\">\n"
                + "  Logout Thành công!\n"
                + "</div>");

        return "shortLink";
    }

    @RequestMapping(value = "myprolife", method = RequestMethod.GET)
    public String myprolife(HttpSession session, ModelMap map) {
        if ((Integer) session.getAttribute("role") == 3) {
            boolean a = loginDAO.checkVipEx((String) session.getAttribute("username"));
            if (a == true) {
                loginDAO.changeEX((String) session.getAttribute("username"));
                session.setAttribute("role", 2);

            }
        }

        return "myProlife";
    }

    @RequestMapping(value = "gethistory", method = RequestMethod.GET)
    public String gethistory(HttpSession session, ModelMap map) {
        String userid = session.getAttribute("userid").toString();
        List<Links> list = loginDAO.linkHistory(userid);
        map.addAttribute("listHistory", list);

        if ((Integer) session.getAttribute("role") == 3) {
            boolean a = loginDAO.checkVipEx((String) session.getAttribute("username"));
            if (a == true) {
                loginDAO.changeEX((String) session.getAttribute("username"));
                session.setAttribute("role", 2);

            }
        }

        return "history";
    }

    @RequestMapping("/login-google")
    public String loginGoogle(
            HttpSession session,
            ModelMap map,
            HttpServletRequest request) throws ClientProtocolException, IOException {

        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            return "redirect:/login?message=google_error";
        }

        String accessToken = googleUtils.getToken(code);

        GooglePojo googlePojo = googleUtils.getUserInfo(accessToken);

        String email = googlePojo.getEmail();
        String userName = googlePojo.getEmail();
        String userFullName = googlePojo.getName();

        // check
        boolean a = loginDAO.checkLoginByGoogle(email);

        if (a == true) {
            Users user = loginDAO.loginByGoogle(email);

            if (user != null) {
                if (user.getRoleId() == 3) {
                    boolean a1 = loginDAO.checkVipEx(user.getUsername());
                    if (a1 == true) {
                        loginDAO.changeEX(user.getUsername());
                        user.setRoleId(2);
                    }
                }
                session.setAttribute("username", user.getUsername());
                session.setAttribute("role", user.getRoleId());
                session.setAttribute("userid", user.getUserId());
                session.setAttribute("fullname", user.getFullname());
                session.setAttribute("email", user.getEmail());
                session.setAttribute("createdate", user.getStringDate());
                session.setAttribute("vipdate", user.getStringDatevip());

                int link = linkDAO.thongkeuserlink((Integer) session.getAttribute("userid"));
                int view = linkDAO.thongkeuserview((Integer) session.getAttribute("userid"));
                String kq = linkDAO.xephang((Integer) session.getAttribute("userid"));
                map.addAttribute("kq", kq);
                map.addAttribute("sumview", view);
                map.addAttribute("sumlink", link);
                return "shortLink";
            } else {
                map.addAttribute("error", "Sai tài khoản hoặc mật khẫu");
                return "shortLink";
            }

        } else {
            loginDAO.insertLoginByGoogle(email, userName, userFullName);
        }

        return "shortLink";
    }

    @RequestMapping("/register")
    public String register(HttpSession session, ModelMap map) {
        return "dangki";
    }

    @RequestMapping(value = "/registerEvent", method = RequestMethod.POST)
    public String registerEvent(
            HttpSession session,
            ModelMap map,
            @RequestParam("userNameRegister") String userNameRegister,
            @RequestParam("userPassWordRegister") String userPassWordRegister,
            @RequestParam("userFullNameRegister") String userFullNameRegister,
            @RequestParam("emailRegister") String emailRegister
    ) {

        String a = userNameRegister;
        String b = userPassWordRegister;
        String c = userFullNameRegister;
        String d = emailRegister;

        boolean checkEmail = loginDAO.checkLoginByGoogle(d);

        boolean checkUsers = loginDAO.checkRegisterByMaual(a);
        if (checkEmail == true) {
            map.addAttribute("error", "Email : " + d + " đã có người đăng ký rồi");
            return "dangki";
        } else if (checkUsers == true) {
            map.addAttribute("error", "Users : " + a + " đã có người đăng ký rồi");
            return "dangki";
        } else {
            loginDAO.insertRegisterByMaual(a, b, c, d);
            Users user = loginDAO.login(a, b);
            map.addAttribute("success", "Welcome " + c + "");

            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRoleId());
            session.setAttribute("userid", user.getUserId());
            session.setAttribute("fullname", user.getFullname());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("createdate", user.getStringDate());
            session.setAttribute("vipdate", user.getStringDatevip());

            int link = linkDAO.thongkeuserlink(user.getUserId());
            int view = linkDAO.thongkeuserview(user.getUserId());
            String kq = linkDAO.xephang(user.getUserId());
            map.addAttribute("kq", kq);
            map.addAttribute("sumview", view);
            map.addAttribute("sumlink", link);
            return "shortLink";

        }
    }

    static String emailToRecipient, emailSubject, emailMessage;
    static final String emailFromRecipient = "nguyenbuithoi1997@gmail.com";

    private static final Random random = new Random();
    private static final String CHARS = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ234567890";

    @Autowired
    private JavaMailSender mailSenderObj;

    @RequestMapping("/forgotPassword")
    public String forgotPassword(HttpSession session, ModelMap map) {

        return "forgotPassword";
    }

    @RequestMapping(value = "forgotPasswordEvent", method = RequestMethod.POST)
    public String forgotPasswordEvent(
            @RequestParam("emailTo") String emailTo,
            HttpServletRequest request,
            ModelMap map) {
        boolean a = loginDAO.checkLoginByGoogle(emailTo);
        String forgotRandomKeyString = null;
        if (a != false) {
           
            boolean b = true;
            if(b != false){
            StringBuilder forgotRandomKey = new StringBuilder(10);
            for (int i = 0; i < 10; i++) {
                forgotRandomKey.append(CHARS.charAt(random.nextInt(CHARS.length())));
            }
            forgotRandomKeyString = forgotRandomKey.toString();
            
            b = loginDAO.checkForgotRandomKey(forgotRandomKeyString);
                
                if(b==false){
                     String forgotRandomKeyStringTrue = forgotRandomKeyString;
                     loginDAO.updateForgotPassWord(emailTo, forgotRandomKeyStringTrue);
                }
            
            }
            
            Users user = loginDAO.loginByGoogle(emailTo);
            String d = user.getUsername();
            String hoicham = "?";
            emailToRecipient = request.getParameter("emailTo");
            emailMessage = "http://localhost:8084/checkkey"+hoicham+"userid="+d+"&key="+forgotRandomKeyString+"";
            mailSenderObj.send(new MimeMessagePreparator() {
                public void prepare(MimeMessage mimeMessage) throws Exception {

                    MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                    mimeMsgHelperObj.setTo(emailToRecipient);
                    mimeMsgHelperObj.setFrom(emailFromRecipient);
                    mimeMsgHelperObj.setText(emailMessage);
                    mimeMsgHelperObj.setSubject("Quên Mật Khẩu - ShortLink");

                }
            });
            map.addAttribute("success1", "Thành công");
            map.addAttribute("success2", "Yêu cầu lấy lại mật khẩu của bạn được chúng tôi gửi về mail : " + emailTo + " ,Vui lòng Check Mail");
            return "forgotPassword";
        } else {
            map.addAttribute("error1", "Lỗi kiểm tra");
            map.addAttribute("error2", "Email " + emailTo + " chưa được đăng ký hoặc sử dụng trong ShortLink");
            return "forgotPassword";
        }

    }
    
    @RequestMapping(value = "checkkey", method = RequestMethod.GET)
    public String aaaaa(
            @RequestParam("userid") String userid,
            @RequestParam("key") String key,
            HttpServletRequest request,
            HttpSession session,
            ModelMap map) {
            
            session.setAttribute("username", userid);
            
        
            return "forgotPasswordChange";
    };
    
     @RequestMapping(value = "checkkeyEvent", method = RequestMethod.POST)
    public String checkkeyEvent(
            HttpSession session,
            ModelMap map,
            @RequestParam("username1") String username,
            @RequestParam("password1") String password
           ) {
            String b = password;
            boolean a = loginDAO.updateChangePassWord1(password, username);
            if(a == false){
            map.addAttribute("error1", "Lỗi checkkeyEvent");
            map.addAttribute("error2", "Lối ");
            return "forgotPassword";
            }else{
            map.addAttribute("success1", "Thành công");
            map.addAttribute("success2", "Đổi mật khẩu thành công");
            return "forgotPasswordChange";
            } 
    };
    
     @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public String changePassword(
            HttpSession session,
            ModelMap map,
            @RequestParam("mkOld") String mkOld,
            @RequestParam("mkNewms") String mkNewms,
            @RequestParam("username1") String username1
    ) {
        
        boolean a1 = loginDAO.checkEmail(username1);
        boolean b1 = true;
         if (a1 == b1) {
        boolean a = loginDAO.checkUserNameAndPassWord(username1, mkOld);
        boolean b = true;
         if (a == b) {
             loginDAO.updateChangePassWord(mkOld, mkNewms, username1);
             map.addAttribute("success1", "Thành Công");
          map.addAttribute("success2", "đổi mật khẩu thành công");
         }else{
          map.addAttribute("error1", "Lỗi kiểm tra");
          map.addAttribute("error2", "Sai mật khẩu");
         }  }
         else{
          map.addAttribute("error1", "Lỗi kiểm tra");
          map.addAttribute("error2", "Bạn đang đang nhập gmail không đổi mật khẩu được");
         }
       return "myProlife";
    }

}
