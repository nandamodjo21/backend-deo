package id.ac.poltekgo.bukusaku.controller;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// import com.fasterxml.jackson.databind.util.JSONPObject;

import id.ac.poltekgo.bukusaku.dto.UserDto;
import id.ac.poltekgo.bukusaku.entity.User;
import id.ac.poltekgo.bukusaku.service.UserService;
import lombok.RequiredArgsConstructor;
import net.minidev.json.JSONObject;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class LoginController {

    private final UserService userService;

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody UserDto userDto) {
        String username = userDto.getUsername();
        String password = userDto.getPassword();

        User user = userService.findByUsername(username);

        if (user == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("username salah");
        }

        String hashPass = DigestUtils.md5Hex(password);
        if (hashPass.equals(user.getPassword())) {

            JSONObject response = new JSONObject();
            JSONObject js = new JSONObject();
            response.put("id_login", user.getId());
            response.put("username", user.getUsername());
            response.put("nik", user.getNik().getNik());
            js.put("data", response);
            js.put("status", 200);
            js.put("message", "Login sukses");

            return ResponseEntity.status(HttpStatus.OK).body(js.toJSONString());
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", 404);
        jsonObject.put("message", "Password salah");
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(jsonObject.toJSONString());
    }

}
