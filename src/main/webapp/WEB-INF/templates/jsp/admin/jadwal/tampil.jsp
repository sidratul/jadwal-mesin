<%-- 
    Document   : tampil
    Created on : Sep 24, 2013, 12:16:54 PM
    Author     : sidratul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${not empty pesanTampil}">
            <div class="alert alert-${jenisPesan}">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <span class="kapital"> <strong>${jenisPesan} !</strong> ${pesanTampil}</span>
            </div>
	</c:if>
        <h3>
            Jadwal <c:out value="${param['tingkat']}"></c:out> - Hari <c:set var="hari" value="${param['hari']}"/>
            <c:choose>
                <c:when test="${empty hari or hari == 2}">Senin</c:when>
                <c:when test="${hari == 3}">Selasa</c:when>
                <c:when test="${hari == 4}">Rabu</c:when>
                <c:when test="${hari == 5}">Kamis</c:when>
                <c:when test="${hari == 6}">Jumat</c:when>
            </c:choose>
                
        </h3>
        <div class="btn-toolbar">
                <div class="btn-group">
                  <a class="btn btn-primary" href="tampil?tingkat=<c:out value="${param['tingkat']}"></c:out>&hari=2" class="btn btn-success">Senin</a>
                  <a class="btn btn-primary" href="tampil?tingkat=<c:out value="${param['tingkat']}"></c:out>&hari=3" class="btn btn-success">Selasa</a>
                  <a class="btn btn-primary" href="tampil?tingkat=<c:out value="${param['tingkat']}"></c:out>&hari=4" class="btn btn-success">Rabu</a>
                  <a class="btn btn-primary" href="tampil?tingkat=<c:out value="${param['tingkat']}"></c:out>&hari=5" class="btn btn-success">Kamis</a>
                  <a class="btn btn-primary" href="tampil?tingkat=<c:out value="${param['tingkat']}"></c:out>&hari=6" class="btn btn-success">Jumat</a>
                  <a class="btn btn-success" href="<%= request.getContextPath() %>/dokumen/jadwal/pdf?tingkat=<c:out value="${param['tingkat']}"></c:out>" class="btn btn-success">Download</a>
                  <a class="btn btn-danger" href="hapus-semua?tingkat=<c:out value="${param['tingkat']}"></c:out>" class="btn btn-success" onclick='return tampil_confirm("apakah anda yakin untuk menghapus semua jadwal ${param['tingkat']} ?")'>Hapus Semua</a>
                </div>
            </div>
        <c:choose>
            <c:when test="${empty listJadwal}">
                <h3>Data Jadwal Kosong</h3>
            </c:when>
            <c:otherwise>
                <table class="table table-striped table-hover tabel_jadwal">
                    <thead>
                        <tr class="tab-head">
                            <th>#</th>
                            <th>jam</th>
                            <th>matakuliah</th>
                            <th>dosen</th>
                            <th>SKS</th>
                            <th>Semester</th>
                            <th>Kelas</th>
                            <th>ruang</th>
                            <th>hari</th>
                            <th>keterangan<a href="hapus-keterangan?hari=${param['hari']}&tingkat=${param['tingkat']}" onclick='return tampil_confirm("apakah anda yakin untuk menghapus semua keterangan hari ini?")'><i class="icon-remove icon-white" title="Hapus Pengumuman"></i></a></th>
                            <th colspan="2">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listJadwal}" var="lj" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>
                                    <fmt:formatDate pattern="HH:mm" value="${lj.jamMulai}"></fmt:formatDate> -
                                    <fmt:formatDate pattern="HH:mm" value="${lj.jamSelesai}"></fmt:formatDate>
                                </td>
                                <td class="kapital">${lj.mataKuliah.namaMatkul}</td>
                                <td class="kapital">${lj.dosen.namaDosen}</td>
                                <td>${lj.mataKuliah.sks}</td>
                                <td>${lj.mataKuliah.semester}</td>
                                <td>${lj.kelas}</td>
                                <td>${lj.ruang}</td>
                                <td class="kapital">
                                    <c:choose>
                                        <c:when test="${lj.hari == 1}">Minggu</c:when>
                                        <c:when test="${lj.hari == 2}">Senin</c:when>
                                        <c:when test="${lj.hari == 3}">Selasa</c:when>
                                        <c:when test="${lj.hari == 4}">Rabu</c:when>
                                        <c:when test="${lj.hari == 5}">Kamis</c:when>
                                        <c:when test="${lj.hari == 6}">Jumat</c:when>
                                        <c:when test="${lj.hari == 7}">Sabtu</c:when>
                                    </c:choose> 
                                </td>
                                <td class="kapital" id="${lj.id}" ondblclick='jadiSelect(${lj.id},"${lj.keterangan}",this)'>
                                    <c:choose>
                                        <c:when test="${lj.keterangan == 1}">Hadir</c:when>
                                        <c:when test="${lj.keterangan == 2}">Izin</c:when>
                                        <c:when test="${lj.keterangan == 3}">Absen</c:when>
                                        <c:when test="${lj.keterangan == 4}">Tugas</c:when>
                                        <c:when test="${lj.keterangan == 5}">Sakit</c:when>
                                        <c:when test="${lj.keterangan == 6}">UTS</c:when>
                                        <c:when test="${lj.keterangan == 7}">Diganti</c:when>
                                        <c:when test="${lj.keterangan == 8}">Pengumuman</c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </td>
                                <td><a href="edit-jadwal?id=${lj.id}&tingkat=${lj.mataKuliah.kategoriTingkat}">
                                    <img src="<%= request.getContextPath() %>/img/edit.png" width="20" title="Edit" alt="Edit" /></a></td>
                                <td><a href="hapus?id=${lj.id}&tingkat=${lj.mataKuliah.kategoriTingkat}">
                                    <img src="<%= request.getContextPath() %>/img/delete.png" width="20" title="Delete" alt="Delete" onclick='return tampil_confirm("apakah anda yakin untuk menghapus matakuliah ${lj.mataKuliah.namaMatkul} dari jadwal?")' /></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
        <script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.js"></script>
        <script>
            function jadiSelect(id,ket,obj){                
                $(obj).html(
                        "<select id='select"+id+"' name='keterangan' onchange='ubahKeterangan("+id+",this)' onblur='batalUbah("+id+","+ket+",this)'>"+
                            "<option value='0'>Pilih Keterangan</option>"+
                            "<option value='1'>Hadir</option>"+
                            "<option value='2'>Izin</option>"+
                            "<option value='3'>Absen</option>"+
                            "<option value='4'>Tugas</option>"+
                            "<option value='5'>Sakit</option>"+
                            "<option value='6'>UTS</option>"+
                            "<option value='7'>Diganti</option>"+
                            "<option value='8'>Pengumuman</option>"+
                        "</select>"
                );
                    
                $("[value="+ket+"]").prop("selected",true);
                $("#select"+id).focus();
                    
            }
            
            function batalUbah(id, val,obj){
                simpanPerubahan(id,val,obj);
            }
            
            function ubahKeterangan(id,obj){
                var val= obj.value;
                
                $.get("<%= request.getContextPath() %>/ajax/jadwal/edit-keterangan?id="+id+"&&keterangan="+val,function(data,status){
                    simpanPerubahan(id,val,obj);
                });
                
            }
            
            function simpanPerubahan(id,val,obj){
                var a = $(obj).parent("td");
                var isi;
                if(val==1){
                    isi="Hadir";
                }else if(val==2){
                    isi="Izin";
                }else if(val==3){
                    isi="Absen";
                }else if(val==4){
                    isi="Tugas";
                }else if(val==5){
                    isi="Sakit";
                }else if(val==6){
                    isi="UTS";
                }else if(val==7){
                    isi="Diganti";
                }else if(val==8){
                    isi="Pengumuman";
                }else{
                    isi="-";
                }
                $(a).html(isi);
                $(a).attr("ondblclick","jadiSelect("+id+","+val+",this)");
            }
            
        </script>
            
    </body>
</html>
