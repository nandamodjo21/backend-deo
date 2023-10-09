// package id.ac.poltekgo.bukusaku.entity;

// import org.hibernate.annotations.GenericGenerator;

// import jakarta.persistence.Column;
// import jakarta.persistence.Entity;
// import jakarta.persistence.GeneratedValue;
// import jakarta.persistence.Id;
// import jakarta.persistence.JoinColumn;
// import jakarta.persistence.ManyToOne;
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
// @Table(name = "t_biodata")
// public class Biodata {

// @Id
// @GeneratedValue(generator = "uuid2")
// @GenericGenerator(name = "uuid2", strategy =
// "org.hibernate.id.UUIDGenerator")
// @Column(name = "id_biodata", columnDefinition = "VARCHAR(255)")
// private String id;

// private String nik;
// private String nim;

// @Column(name = "nama_lengkap")
// private String namaLengkap;

// @ManyToOne
// @JoinColumn(name = "jk")
// private Jenis jk;

// @ManyToOne
// @JoinColumn(name = "id_agama")
// private Agama agama;

// }
