package com.FTUP.mesin.admin.model;

public class MataKuliah {
    private Integer id;
    private String kodeMatkul;
    private String namaMatkul;
    private Integer sks;
    private Integer semester;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKodeMatkul() {
        return kodeMatkul;
    }

    public void setKodeMatkul(String kodeMatkul) {
        this.kodeMatkul = kodeMatkul;
    }

    public String getNamaMatkul() {
        return namaMatkul;
    }

    public void setNamaMatkul(String namaMatkul) {
        this.namaMatkul = namaMatkul;
    }

    public Integer getSks() {
        return sks;
    }

    public void setSks(Integer sks) {
        this.sks = sks;
    }

    public Integer getSemester() {
        return semester;
    }

    public void setSemester(Integer semester) {
        this.semester = semester;
    }
    
}
