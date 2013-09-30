function notifPesan(pesan, jenisPesan){    
    $.notify(pesan, {
        header: 'Sukses',
        theme: jenisPesan,
        type: 4000
    });
} 
