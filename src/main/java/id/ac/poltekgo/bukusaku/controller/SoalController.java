package id.ac.poltekgo.bukusaku.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import id.ac.poltekgo.bukusaku.entity.Soal;
import id.ac.poltekgo.bukusaku.service.SoalService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class SoalController {

    private final SoalService soalService;

    @GetMapping("/soal")
    public ResponseEntity<List<Soal>> getSoal() {
        return ResponseEntity.status(HttpStatus.OK).body(soalService.getSoal());
    }
}