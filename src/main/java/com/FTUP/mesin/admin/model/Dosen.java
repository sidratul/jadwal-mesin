package com.FTUP.mesin.admin.model;

public class Dosen {
    private Integer ID;
    private String NIDN;
    private String Nama_Dosen;
    private String Alamat;
    private String No_Telpon;
    private String Email;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getNIDN() {
        return NIDN;
    }

    public void setNIDN(String NIDN) {
        this.NIDN = NIDN;
    }

    public String getNama_Dosen() {
        return Nama_Dosen;
    }

    public void setNama_Dosen(String Nama_Dosen) {
        this.Nama_Dosen = Nama_Dosen;
    }

    public String getAlamat() {
        return Alamat;
    }

    public void setAlamat(String Alamat) {
        this.Alamat = Alamat;
    }

    public String getNo_Telpon() {
        return No_Telpon;
    }

    public void setNo_Telpon(String No_Telpon) {
        this.No_Telpon = No_Telpon;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
    
}
