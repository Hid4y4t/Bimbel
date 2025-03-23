$(document).ready(function() {
    $('#kelompokBimbelTable').DataTable();
    $('#kelompokSiswaTable').DataTable();
    $('#jadwalBimbelTable').DataTable();

    // Get the modals
    var modals = {
        tambahKelompokBimbelModal: document.getElementById("tambahKelompokBimbelModal"),
        tambahKelompokSiswaModal: document.getElementById("tambahKelompokSiswaModal"),
        tambahJadwalBimbelModal: document.getElementById("tambahJadwalBimbelModal"),
        viewModal: document.getElementById("viewModal"),
        editModal: document.getElementById("editModal"),
        viewKelompokBimbelModal: document.getElementById("viewKelompokBimbelModal"),
        editKelompokBimbelModal: document.getElementById("editKelompokBimbelModal"),
        viewKelompokSiswaModal: document.getElementById("viewKelompokSiswaModal"),
        editKelompokSiswaModal: document.getElementById("editKelompokSiswaModal"),
        viewJadwalBimbelModal: document.getElementById("viewJadwalBimbelModal"),
        editJadwalBimbelModal: document.getElementById("editJadwalBimbelModal")
    };

    // Close modals
    var span = document.getElementsByClassName("close");
    for (var i = 0; i < span.length; i++) {
        span[i].onclick = function() {
            for (var key in modals) {
                modals[key].style.display = "none";
            }
        }
    }

    window.onclick = function(event) {
        for (var key in modals) {
            if (event.target == modals[key]) {
                modals[key].style.display = "none";
            }
        }
    }

    // Open modals
    document.getElementById("tambahKelompokBimbelBtn").onclick = function() {
        modals.tambahKelompokBimbelModal.style.display = "block";
    }

    document.getElementById("tambahKelompokSiswaBtn").onclick = function() {
        modals.tambahKelompokSiswaModal.style.display = "block";
    }

    document.getElementById("tambahJadwalBimbelBtn").onclick = function() {
        modals.tambahJadwalBimbelModal.style.display = "block";
    }

    // View kelompok bimbel
    $(document).on('click', '.view-btn-kelompok', function() {
        var id_kelompok = $(this).data('id');
        $.ajax({
            url: 'proses/view-kelompok-bimbel.php',
            type: 'GET',
            data: { id_kelompok: id_kelompok },
            success: function(response) {
                $('#viewKelompokBimbelDetail').html(response);
                modals.viewKelompokBimbelModal.style.display = 'block';
            }
        });
    });

    // Edit kelompok bimbel
    $(document).on('click', '.edit-btn-kelompok', function() {
        var id_kelompok = $(this).data('id');
        $.ajax({
            url: 'proses/get-kelompok-bimbel.php',
            type: 'GET',
            data: { id_kelompok: id_kelompok },
            success: function(response) {
                var data = JSON.parse(response);
                $('#edit_kelompok_bimbel_id').val(data.id_kelompok);
                $('#edit_nama_kelompok').val(data.nama_kelompok);
                $('#edit_guru').val(data.id_guru);
                $('#edit_hari').val(data.hari);
                $('#edit_jam').val(data.jam);
                $('#edit_alamat').val(data.alamat);
                modals.editKelompokBimbelModal.style.display = 'block';
            }
        });
    });

    // Delete kelompok bimbel
    $(document).on('click', '.delete-btn-kelompok', function() {
        var id_kelompok = $(this).data('id');
        if (confirm('Yakin ingin menghapus data ini?')) {
            $.ajax({
                url: 'proses/hapus-kelompok-bimbel.php',
                type: 'GET',
                data: { id_kelompok: id_kelompok },
                success: function(response) {
                    location.reload();
                }
            });
        }
    });

    // View kelompok siswa
    $(document).on('click', '.view-btn-siswa', function() {
        var id_kelompok_siswa = $(this).data('id');
        $.ajax({
            url: 'proses/view-kelompok-siswa.php',
            type: 'GET',
            data: { id_kelompok_siswa: id_kelompok_siswa },
            success: function(response) {
                $('#viewKelompokSiswaDetail').html(response);
                modals.viewKelompokSiswaModal.style.display = 'block';
            }
        });
    });

    // Edit kelompok siswa
    $(document).on('click', '.edit-btn-siswa', function() {
        var id_kelompok_siswa = $(this).data('id');
        $.ajax({
            url: 'proses/get-kelompok-siswa.php',
            type: 'GET',
            data: { id_kelompok_siswa: id_kelompok_siswa },
            success: function(response) {
                var data = JSON.parse(response);
                $('#edit_kelompok_siswa_id').val(data.id_kelompok_siswa);
                $('#edit_nama_kelompok').val(data.id_kelompok);
                $('#edit_nama_siswa').val(data.id_siswa);
                modals.editKelompokSiswaModal.style.display = 'block';
            }
        });
    });

    // Delete kelompok siswa
    $(document).on('click', '.delete-btn-siswa', function() {
        var id_kelompok_siswa = $(this).data('id');
        if (confirm('Yakin ingin menghapus data ini?')) {
            $.ajax({
                url: 'proses/hapus-kelompok-siswa.php',
                type: 'GET',
                data: { id_kelompok_siswa: id_kelompok_siswa },
                success: function(response) {
                    location.reload();
                }
            });
        }
    });

    // View jadwal bimbel
    $(document).on('click', '.view-btn-jadwal', function() {
        var id_bimbel = $(this).data('id');
        $.ajax({
            url: 'proses/view-jadwal-bimbel.php',
            type: 'GET',
            data: { id_bimbel: id_bimbel },
            success: function(response) {
                $('#viewJadwalBimbelDetail').html(response);
                modals.viewJadwalBimbelModal.style.display = 'block';
            }
        });
    });



    // Delete jadwal bimbel
    $(document).on('click', '.delete-btn-jadwal', function() {
        var id_bimbel = $(this).data('id');
        if (confirm('Yakin ingin menghapus data ini?')) {
            $.ajax({
                url: 'proses/hapus-jadwal-bimbel.php',
                type: 'GET',
                data: { id_bimbel: id_bimbel },
                success: function(response) {
                    location.reload();
                }
            });
        }
    });
});