function notifSukses(pesan){    
    $.notify(pesan, {
        header: 'Sukses',
        theme: 'Success',
        type: 4000
    });
} 

function notifGagal(pesan){    
    $.notify(pesan, {
        header: 'Gagal',
        theme: 'error',
        type: 4000
    });
} 


