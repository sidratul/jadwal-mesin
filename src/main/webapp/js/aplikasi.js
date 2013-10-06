function notifPesan(pesan, jenisPesan){    
    $.notify(pesan, {
        header: jenisPesan,
        theme: jenisPesan,
        type: 4000
    });
}

$("select").selectpicker({
        style: 'btn-hg btn-primary',
        menuStyle: 'dropdown-inverse'
    }
);
