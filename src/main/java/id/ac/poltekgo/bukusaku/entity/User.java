package id.ac.poltekgo.bukusaku.entity;

import org.hibernate.annotations.GenericGenerator;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "t_login")
public class User {

    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "id_login", columnDefinition = "VARCHAR(255)")
    private String id;

    @ManyToOne
    @JoinColumn(name = "jk")
    private Jenis jk;

    @ManyToOne
    @JoinColumn(name = "agama")
    private Agama agama;

    @ManyToOne
    @JoinColumn(name = "id_role")
    private Role role;

    private String nim;

    @Column(name = "nama_lengkap")
    private String namaLengkap;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "is_active")
    private Integer isActive;

    @Column(name = "status_mhs")
    private Integer statusMhs;

    @PrePersist
    public void setDefaultRole() {
        if (role == null) {
            // Set default role ID here (e.g., "2" for role with ID 2)
            Role defaultRole = new Role();
            defaultRole.setId(2);
            role = defaultRole;
        }

        if (isActive == null) {
            // Set default is_active value to 1
            isActive = 1;
        }

        if (statusMhs == null) {
            statusMhs = 1;
        }
    }
}
