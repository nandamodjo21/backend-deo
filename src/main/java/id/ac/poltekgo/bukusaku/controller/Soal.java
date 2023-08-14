package id.ac.poltekgo.bukusaku.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.ac.poltekgo.bukusaku.dto.SoalDto;
import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
@Transactional
public class Soal {

    final EntityManager em;

    @GetMapping("/soal")
    public ResponseEntity<Object> data() {
        List<Object> soal = em.createNativeQuery(
                "SELECT s.id_soal,m.materi,m.file_materi, s.soal, s.status, s.created_at FROM `t_soal` s, t_materi m WHERE m.id_materi=s.id_materi AND date(s.created_at) = date(now()) AND s.status > 0")
                .getResultList();

        JSONObject js = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        if (soal.isEmpty()) {
            js.put("code", 200);
            js.put("error", "No data");
            return new ResponseEntity<Object>(HttpStatus.NOT_FOUND);
        } else {

            for (Object data : soal) {
                Object[] o2 = (Object[]) data;
                JSONObject jsonObject = new JSONObject();

                jsonObject.put("id_soal", o2[0]);
                jsonObject.put("materi", o2[1]);
                jsonObject.put("file_materi", o2[2]);
                jsonObject.put("soal", o2[3]);
                jsonObject.put("status", o2[4]);
                jsonObject.put("created_at", o2[5]);
                jsonArray.add(jsonObject);

            }

            return new ResponseEntity<>(jsonArray, HttpStatus.OK);

        }

    }

    @PostMapping("/jawab")
    public ResponseEntity jawaban(@RequestBody SoalDto soalDto) {

        List data = em.createNativeQuery(
                "select id_jawaban, jawaban, id_user from t_jawaban where id_user = :id_user and date(createt_at) = date(now())")
                .setParameter("id_user", soalDto.getIdUser())
                .getResultList();

        JSONObject jsonObject = new JSONObject();

        if (data.isEmpty()) {
            em.createNativeQuery(
                    "INSERT INTO `t_jawaban` (`id_jawaban`, `id_user`, `id_soal`, `jawaban`, `createt_at`) VALUES (UUID(), :id_user, :id_soal, :jawaban, CURRENT_TIMESTAMP)")
                    .setParameter("id_user", soalDto.getIdUser())
                    .setParameter("id_soal", soalDto.getSoal())
                    .setParameter("jawaban", soalDto.getJawaban())
                    .executeUpdate();

            jsonObject.put("code", 200);
            jsonObject.put("message", "sukses menjawab");

            return new ResponseEntity<>(jsonObject, HttpStatus.OK);
        } else {
            jsonObject.put("code", 500);
            jsonObject.put("message", "gagal");
            return new ResponseEntity<>(jsonObject, HttpStatus.NOT_FOUND);
        }
    }
}
