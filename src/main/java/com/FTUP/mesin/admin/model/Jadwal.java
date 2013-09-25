package com.FTUP.mesin.admin.model;

import java.util.Date;

public class Jadwal {
    private Integer id;
    private MataKuliah mataKuliah;
    private Dosen dosen;
    private Date jamMulai;
    private Date jamSelesai;
    private Integer hari;
    private String ruang;
    private String keterangan;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getJamMulai() {
        return jamMulai;
    }

    public void setJamMulai(Date jamMulai) {
        this.jamMulai = jamMulai;
    }

    public Date getJamSelesai() {
        return jamSelesai;
    }

    public void setJamSelesai(Date jamSelesai) {
        this.jamSelesai = jamSelesai;
    }
    
    public Integer getHari() {
        return hari;
    }

    public void setHari(Integer hari) {
        this.hari = hari;
    }

    public String getRuang() {
        return ruang;
    }

    public void setRuang(String ruang) {
        this.ruang = ruang;
    }
    
    public Dosen getDosen() {
        return dosen;
    }

    public void setDosen(Dosen dosen) {
        this.dosen = dosen;
    }

    public MataKuliah getMataKuliah() {
        return mataKuliah;
    }

    public void setMataKuliah(MataKuliah mataKuliah) {
        this.mataKuliah = mataKuliah;
    }

    public String getKeterangan() {
        return keterangan;
    }

    public void setKeterangan(String keterangan) {
        this.keterangan = keterangan;
    }
    
}
