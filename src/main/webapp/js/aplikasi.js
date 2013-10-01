function notifPesan(pesan, jenisPesan){    
    $.notify(pesan, {
        header: jenisPesan,
        theme: jenisPesan,
        type: 4000
    });
} 
