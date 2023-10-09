package id.ac.poltekgo.bukusaku.controller;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// import id.ac.poltekgo.bukusaku.dao.BiodataDao;
// import id.ac.poltekgo.bukusaku.dao.MahasiswaDao;
import id.ac.poltekgo.bukusaku.dao.UserDao;

// import com.fasterxml.jackson.databind.util.JSONPObject;

import id.ac.poltekgo.bukusaku.dto.UserDto;
// import id.ac.poltekgo.bukusaku.entity.Biodata;
// import id.ac.poltekgo.bukusaku.entity.Mahasiswa;
import id.ac.poltekgo.bukusaku.entity.User;
import id.ac.poltekgo.bukusaku.service.UserService;
import lombok.RequiredArgsConstructor;
import net.minidev.json.JSONObject;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class LoginController {

    private final UserService userService;
    private final UserDao userDao;
    // private final BiodataDao biodataDao;

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody UserDto userDto) {
        String username = userDto.getUsername();
        String password = userDto.getPassword();

        User user = userService.findByUsername(username);

        JSONObject js = new JSONObject();
        if (user == null) {
            js.put("status", 404);
            js.put("message", "User Tidak terdaftar");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(js.toJSONString());
        }

        String hashPass = DigestUtils.md5Hex(password);
        if (hashPass.equals(user.getPassword())) {

            JSONObject response = new JSONObject();

            response.put("id_login", user.getId());
            response.put("username", user.getUsername());
            response.put("nim", user.getNim());
            response.put("nama", user.getNamaLengkap());
            js.put("data", response);
            js.put("status", 200);
            js.put("message", "Login sukses");

            return ResponseEntity.status(HttpStatus.OK).body(js.toJSONString());
        }

        js.put("status", 404);
        js.put("message", "Password salah");
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(js.toJSONString());
    }

    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody UserDto userDto) {
        String username = userDto.getUsername();
        String password = userDto.getPassword();
        String nim = userDto.getNim();
        String nama = userDto.getNamaLengkap();
        String hashPass = DigestUtils.md5Hex(password);

        System.out.println(username);
        System.out.println(password);
        System.out.println(nim);
        System.out.println(nama);
        System.out.println(hashPass);

        JSONObject js = new JSONObject();

        User user = new User();
        // Biodata biodata = new Biodata();

        user.setUsername(username);
        user.setPassword(hashPass);
        user.setNamaLengkap(nama);
        user.setNim(nim);
        // save
        userDao.save(user);
        // biodataDao.save(biodata);

        js.put("code", 200);
        js.put("message", "register berhasil");
        return ResponseEntity.status(HttpStatus.OK).body(js.toJSONString());

    }

}
