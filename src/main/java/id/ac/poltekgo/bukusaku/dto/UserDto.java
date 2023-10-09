package id.ac.poltekgo.bukusaku.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserDto {

    private String username;
    private String password;
    private String nim;
    private String namaLengkap;
    private Integer jk;
    private Integer agama;

}
