package rrs.control.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import rrs.model.entities.Account;
import rrs.model.services.AccountService;
import rrs.model.services.FileService;
import rrs.model.utils.FileUpload;
import rrs.model.utils.SendMail;
import rrs.utils.CustomException;
import rrs.utils.HTMLUtil;
import rrs.utils.HTMLUtil.BGR;
import rrs.utils.Random;

@Controller
@CrossOrigin("*")
@RequestMapping("/security")
public class SecurityControl {
	
	private final String BACK_HOME = "/pages/home";
	private final String DIRECTORY = "images/account";
	
	private String general = Random.UpperCase("RRs", 8);
	private String email = null;
	
	// @formatter:on
	private @Autowired HttpServletRequest req;
	private @Autowired AccountService dao; // CRUD account
	private @Autowired FileUpload upFile; // Create and delete account's image
	private @Autowired SendMail mail;
	
	@GetMapping("/{page}") public String pageURI() {
		return new StringBuilder("/pages").append(req.getRequestURI()).toString();
	}
	
	// ___________________________________________________________ LOGIN
	@GetMapping("/loginForm") public String loginForm() {
		return pageURI(); // append "/pages" before URI
	}
	
	@GetMapping("/loginSuccess") public String loginSuccess() {
		Principal principal = req.getUserPrincipal();
		String title = "????ng nh???p t??i kho???n th??nh c??ng";
		String message = principal.getName()+" ???? ????ng nh???p th??nh c??ng";
		req.setAttribute("message", HTMLUtil.alert(BGR.SUCCESS, title, message, 3000));
		req.setAttribute("user", principal);
		
		return BACK_HOME; // back home
	}

	@PostMapping("/loginFailed") public String loginFailed() {
		String title = "????ng nh???p t??i kho???n th???t b???i";
		String message = "T??n ????ng nh???p ho???c m???t kh???u kh??ng ????ng!";
		req.setAttribute("message", HTMLUtil.alert(BGR.WARN, title, message, 3000));
		
		return "/pages/security/loginForm"; // return page
	}

	// ___________________________________________________________ LOGOUT
	@GetMapping("/logoutForm") public String logoutForm() {
		String title = "Chuy???n trang ????ng xu???t";
		String body = "X??c nh???n b?????c ti???p ????? ????ng xu???t t??i kho???n";
		req.setAttribute("message", HTMLUtil.alert(BGR.WARN, title, body, 1000));
		return pageURI();
	}
	
	@GetMapping("/logoutSuccess") public String logoutSuccess() {
		String title = "????ng xu???t t??i kho???n";
		String message = "???? ????ng xu???t t??i kho???n";
		req.setAttribute("message", HTMLUtil.alert(BGR.LIGHT, title, message, 3000));
		return BACK_HOME;
	}
	
	// _GET -> FORM _____________POST -> SAVE ____________________ SIGN-UP
	@GetMapping("/register") public String register(Model model, @ModelAttribute Account account) {
		model.addAttribute("account", account);
		return pageURI(); // get register form
	}
	
	@PostMapping("/register") public String register(Model model, 
			@RequestParam MultipartFile file, Account account, Errors errors) {
		
		// set account image if file != null
		if(file.getSize() > 0) account.setImage(
			newFileName(account.getUsername(),file.getOriginalFilename())
		);
		
		String message, title = "????ng k?? t??i kho???n";
		if(!errors.hasErrors())
			try {
				if(dao.getByEmail(account.getEmail()) != null) {
					throw new CustomException(account.getEmail()+" ???? ???????c s??? d???ng, vui l??ng ch???n email kh??c");
				}
				Account a = dao.save(account);
				if(a != null) {
					message = "????ng k?? t??i kho???n "+a.getUsername()+" th??nh c??ng";
					model.addAttribute("message", HTMLUtil.alert(BGR.SUCCESS, title, message, 3000));
					if(file.getSize() > 0) upFile.saveFile(account.getImage(), file, this.DIRECTORY);
					return "/pages/security/loginForm"; // load login page
				} 
				message = "????ng k?? t??i kho???n th???t b???i!";
				model.addAttribute("message", HTMLUtil.alert(BGR.DANGER, title, message, 5000));
			} catch (IllegalArgumentException | CustomException e) {
				model.addAttribute("message", HTMLUtil.alert(BGR.WARN, title, e.getMessage(), 3000));
			}
		return pageURI(); // callback to re-register input data
	}
	

	// ___________________________________________________________ FORGOT - PASSWORD
	@ResponseBody @RequestMapping("/getCode")
	public ResponseEntity<String> getCodeToMail(@RequestParam String address, HttpServletRequest req) throws CustomException {
		String subject = "Y??u c???u m?? x??c th???c t??i kho???n!";
		String text = HTMLUtil.getCode("RRs g???i m?? x??c th???c t??i kho???n", this.general = Random.UpperCase("RRs", 8), "requestresponseser@gmail.com");

		if(dao.getByEmail(address)==null) throw new CustomException(address + " ch??a ???????c ????ng k?? th??ng tin, vui l??ng ki???m tra l???i!");
		try {
			System.out.println("Send mail code: "+this.general);
			mail.sendMimeMessage(subject, text, null, null, this.email=address);
			return ResponseEntity.ok("[\"RRs ???? g???i m?? x??c th???c g???m "+this.general.length()+" k?? t??? t???i email: "+address+" vui l??ng ki???m tra h???p th??.\"]");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.noContent().build();
		}
	}
	
	@PostMapping("/getPassCode") 
	public String getPassCode(Model model, @RequestParam(required = false) String code) throws CustomException {
		if(code.equals(this.general)) {
			Account a = dao.getByEmail(this.email);
			if(a==null) throw new CustomException(this.email+" t??i kho???n kh??ng t???n t???i!");
			model.addAttribute("account", new Account(a.getUsername(), a.getPassword()));
			return "/pages/security/change_password";
		} else req.setAttribute("message", HTMLUtil.alert(BGR.LIGHT,
				"X??c th???c t??i kho???n","X??c th???c th???t b???i, "+code+" kh??ng ????ng!", 3000)
				);
		return "/pages/security/forgot_password";
	}

	// ___________________________________________________________ CHANGE PASSWORD
	@GetMapping("/change_password") public String changePassword(Model model, @ModelAttribute Account account) {
		Principal principal = req.getUserPrincipal();
		Optional<Account> optional = dao.getOptional(principal.getName()); 
		if(optional.isPresent()) {
			Account a = optional.get();
			account.setUsername(a.getUsername());
			account.setPassword(a.getPassword());			
		} model.addAttribute("account", account);
		return this.pageURI();
	}
	
	@PostMapping("/change_password") public String changePassword(@ModelAttribute Account account,
			@RequestParam String newPass, @RequestParam String rePass) {
		String title = "Thay ?????i m???t kh???u";
		String message = "Nh???p l???i m???t kh???u kh??ng ????ng!";
		
		if(!rePass.equals(newPass)) req.setAttribute("message", HTMLUtil.alert(BGR.WARN, title, message, 3000));
		else {
			try {
				Optional<Account> optional = dao.getOptional(account.getUsername());
				if(optional.isPresent()) {
					if(account.getPassword().equals(optional.get().getPassword())) {
						message = "Thay ?????i m???t kh???u th??nh c??ng";
						req.setAttribute("message", HTMLUtil.alert(BGR.SUCCESS, title, message, 3000));
						account = optional.get();
						account.setPassword(newPass);
						dao.update(account);
						return BACK_HOME;
					}
				} req.setAttribute("message", HTMLUtil.alert(BGR.WHITE, title, "T??i kho???n ho???c m???t kh???u kh??ng ????ng", 3000));
			} catch (IllegalArgumentException | CustomException e) {
				e.printStackTrace();
				req.setAttribute("message", HTMLUtil.alert(BGR.WHITE, title, e.getMessage(), 3000));
			}
		} return this.pageURI();
	}
	
	// ___________________________________________________________ UPDATE INFO
	@GetMapping("/about_me") public String getAboutMe(Model model) {
		Principal p = req.getUserPrincipal();
		Optional<Account> optional = dao.getOptional(p.getName());
		model.addAttribute("account", optional.isEmpty() ? new Account() : optional.get());
		return this.pageURI();
	}
	
	@PostMapping("/about_me") public String saveAboutMe(Model model, 
			@RequestParam MultipartFile file, Account account, Errors errors) {
		String directoryImage = "images/account";
		String message, title = "C???p nh???t th??ng tin";
		
		
		if(!errors.hasErrors())
			try {
				// update file image
				if(file.getSize() > 0) {
					try {
						upFile.deleteFile(FileService.uri(directoryImage, account.getImage()));
						account.setImage(newFileName(account.getUsername(),file.getOriginalFilename()));
					} catch (IOException e) {
					}
				}
				
				// update account
				Account a = dao.update(account);
				if(a != null) {
					message = "C???p nh???t t??i kho???n "+a.getUsername()+" th??nh c??ng";
					model.addAttribute("message", HTMLUtil.alert(BGR.SUCCESS, title, message, 3000));
					if(file.getSize() > 0) upFile.saveFile(account.getImage(), file, this.DIRECTORY);
				} else {
					message = "C???p nh???t th??ng tin c?? nh??n th???t b???i!";
					model.addAttribute("message", HTMLUtil.alert(BGR.WARN, title, message, 3000));
				}
			} catch (IllegalArgumentException | CustomException e) {
				model.addAttribute("message", HTMLUtil.alert(BGR.DANGER, title, e.getMessage(), 5000));
			}
		
		return this.pageURI(); // callback to about_me page
	}
	
	// @formatter:off
	
	// concat string in strs into a string then hashCode replace for file name
	private String newFileName(String...strs) {
		StringBuilder name = new StringBuilder();
		for(String str : strs) name.append(str);
		return name.hashCode()+name.substring(name.lastIndexOf("."));
	}
}
