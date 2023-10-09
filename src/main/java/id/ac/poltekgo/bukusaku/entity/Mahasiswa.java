// package id.ac.poltekgo.bukusaku.entity;

// import org.hibernate.annotations.GenericGenerator;

// // import org.hibernate.annotations.GenericGenerator;

// import jakarta.persistence.Column;
// import jakarta.persistence.Entity;
// import jakarta.persistence.GeneratedValue;
// import jakarta.persistence.GenerationType;
// import jakarta.persistence.Id;
// import jakarta.persistence.JoinColumn;
// import jakarta.persistence.ManyToOne;
// // import jakarta.persistence.PrePersist;
// import jakarta.persistence.Table;
// import lombok.AllArgsConstructor;
// import lombok.Getter;
// import lombok.NoArgsConstructor;
// import lombok.Setter;

// @Entity
// @Getter
// @Setter
// @AllArgsConstructor
// @NoArgsConstructor
// @Table(name = "t_mahasiswa")
// public class Mahasiswa {

// @Id
// @GeneratedValue(generator = "uuid2")
// @GenericGenerator(name = "uuid2", strategy =
// "org.hibernate.id.UUIDGenerator")
// @Column(name = "idmhs", columnDefinition = "VARCHAR(255)")
// private String id;

// @ManyToOne
// @JoinColumn(name = "id_biodata")
// private User idUser;

// @ManyToOne
// @JoinColumn(name = "id_prodi")
// private Prodi prodi;

// @Column(name = "status_mhs")
// private Integer statusMhs = 2;

// // @PrePersist
// // public void setDefaultStatus() {
// // if (statusMhs == null) {
// // statusMhs = 1;
// // }
// // }

// }
