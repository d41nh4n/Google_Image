package d41nh4n.google_image.demo.controller;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import d41nh4n.google_image.demo.dto.request.LoginDto;
import d41nh4n.google_image.demo.entity.User.User;
import d41nh4n.google_image.demo.security.UserPrincipal;
import d41nh4n.google_image.demo.service.AuthService;
import d41nh4n.google_image.demo.service.UserService;
import d41nh4n.google_image.demo.validation.Utils;
import d41nh4n.google_image.demo.validation.Utils;
import d41nh4n.google_image.demo.validation.ValidTokenService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/login")
public class LoginController {

    private final AuthService authService;
    private final ValidTokenService validTokenService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final Utils utils;

    @PostMapping("/auth")
    public String login(@ModelAttribute LoginDto loginDto, Model model, HttpServletResponse response) {
        try {
            String accessToken = authService.login(loginDto.getUsername(), loginDto.getPassword());
            UserPrincipal userPrincipal = validTokenService.principalFromToken(accessToken);
            if (userPrincipal != null) {
                List<String> roles = userPrincipal.getAuthorityStrings();
                model.addAttribute("username", userPrincipal.getUserId());
                model.addAttribute("roles", roles);
                Cookie cookie = new Cookie("accessToken", accessToken);
                cookie.setPath("/");
                cookie.setMaxAge(24 * 60 * 60);
                response.addCookie(cookie);
            }
            return "redirect:/";
        } catch (AuthenticationException e) {
            return "redirect:/login/form?error=true";
        }
    }

    @GetMapping("/form")
    public String loginForm(HttpServletRequest request, Model model,
            @RequestParam(value = "error", required = false) Boolean error,
            @RequestParam(value = "success", required = false) Boolean success,
            @RequestParam(value = "userExist", required = false) Boolean userExist) {
        Optional<String> accessToken = utils.getTokenFromCookies(request);

        if (accessToken.isPresent() && !validTokenService.isTokenExpired(accessToken.get())) {
            return "redirect:/";
        }

        if (Boolean.TRUE.equals(error)) {
            model.addAttribute("errorMessage", "Invalid username or password");
        }
        if (Boolean.TRUE.equals(success)) {
            model.addAttribute("success", "Register success!");
        }
        if (Boolean.TRUE.equals(userExist)) {
            model.addAttribute("errorMessage", "Username exist!");
        }

        return "login-form";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        utils.removeTokenCookie(response);
        return "redirect:/login/form";
    }

    @GetMapping("/register/form")
    public String formRegister() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute LoginDto loginDto) {
        if (userService.getUserByUsername(loginDto.getUsername()) != null || loginDto.getPassword().isEmpty()) {
            return "redirect:/login/form?userExist=true";
        }
        String encodedPassword = passwordEncoder.encode(loginDto.getPassword());
        User user = new User();
        user.setUserId( utils.renderCode(10));
        user.setUsername(loginDto.getUsername());
        user.setPassword(encodedPassword);
        user.setRole("USER");
        user.setAvatarUrl("https://png.pngtree.com/element_our/20200610/ourlarge/pngtree-default-avatar-image_2237213.jpg");
        userService.save(user);
        return "redirect:/login/form?success=true";
    }
}
