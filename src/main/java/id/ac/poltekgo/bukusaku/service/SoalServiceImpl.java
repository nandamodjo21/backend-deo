package id.ac.poltekgo.bukusaku.service;

import java.util.List;

import org.springframework.stereotype.Service;

import id.ac.poltekgo.bukusaku.dao.SoalDao;
import id.ac.poltekgo.bukusaku.entity.Soal;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SoalServiceImpl implements SoalService {

    private final SoalDao soalDao;

    @Override
    public List<Soal> getSoal() {

        return soalDao.findAll();
    }

}
