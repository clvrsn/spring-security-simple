package br.edu.up.posjava.app5.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;

import javax.persistence.NoResultException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionSystemException;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.edu.up.posjava.app5.entity.User;
import br.edu.up.posjava.app5.repository.UserRepository;

@Controller
public class UserController {

	private Logger logger = Logger.getLogger(UserController.class);

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private MessageSource msg;

	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public String login(Model model) {

		model.addAttribute("msg", "");
		model.addAttribute("user", new User());
		// returns the view name
		return "login";

	}


	@RequestMapping(value = "/user/new", method = RequestMethod.GET)
	public String newUser(Model model) {

		model.addAttribute("msg", "");
		model.addAttribute("user", new User());
		// returns the view name
		return "user_new";

	}

	@RequestMapping(value = "/user/create", method = RequestMethod.POST)
	public String create(@ModelAttribute("user") User user, Model model) {

		user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));

		try {
			userRepository.save(user);
			
			model.addAttribute("msg_type", "success");
			model.addAttribute("msg", "Usuário cadastrado com sucesso!");

			
		} catch (TransactionSystemException tse) {

			User u2 = userRepository.findByEmail(user.getEmail());

			if (u2 != null) {
				model.addAttribute("msg_type", "error");
				model.addAttribute("msg", "E-mail já cadastrado!");
			} else {
				model.addAttribute("msg_type", "error");
				model.addAttribute("msg", tse.getMessage());
			}

		}

		
		return "user_new";

	}

	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public String login(@ModelAttribute User user, HttpServletResponse response, Model model, Locale locale) {

		try {
			User userDb = userRepository.findByEmail(user.getEmail());
			if(userDb == null){
				model.addAttribute("msg_type", "warning");
				model.addAttribute("msg", "Usuario ou senha inválido");
				return "login";
			}

			try {
				MessageDigest m = MessageDigest.getInstance("MD5");
				m.update(user.getPassword().getBytes("UTF-8"));
				BigInteger bigInt = new BigInteger(1, m.digest());
				String hashtext = bigInt.toString(16);
				// Now we need to zero pad it if you actually want the full 32
				// chars.
				while (hashtext.length() < 32) {
					hashtext = "0" + hashtext;
				}

				String md5pwd = hashtext;
				System.out.println(hashtext);

				if (userDb.getPassword().equals(md5pwd)) {

					model.addAttribute("msg_type", "success");
					model.addAttribute("msg", "Sucesso");

					response.addCookie(new Cookie("bralol-session-id", "cookietest"));

				} else {
					model.addAttribute("msg_type", "warning");
					model.addAttribute("msg", "Usuario ou senha inválido");

				}
			} catch (UnsupportedEncodingException eu) {

			} catch (NoSuchAlgorithmException en) {

			}

		} catch (NoResultException ex) {

			model.addAttribute("msg_type", "warning");
			model.addAttribute("msg", msg.getMessage("email_login_invalid", null, locale));
		}
		model.addAttribute("user", user);
		// returns the view name
		return "login";

	}

}
