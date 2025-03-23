$(document).ready(function() {
    var table = $('#guruTable').DataTable({
        "pageLength": 10
    });

    // Get the modals
    var tambahModal = document.getElementById("tambahGuruModal");
    var editModal = document.getElementById("editGuruModal");
    var viewModal = document.getElementById("viewGuruModal");
    var span = document.getElementsByClassName("close");

    // Close modals
    for (var i = 0; i < span.length; i++) {
        span[i].onclick = function() {
            tambahModal.style.display = "none";
            editModal.style.display = "none";
            viewModal.style.display = "none";
        }
    }

    window.onclick = function(event) {
        if (event.target == tambahModal) {
            tambahModal.style.display = "none";
        } else if (event.target == editModal) {
            editModal.style.display = "none";
        } else if (event.target == viewModal) {
            viewModal.style.display = "none";
        }
    }

    // Tambah Guru
    var btnTambah = document.getElementById("tambahGuruBtn");
    btnTambah.onclick = function() {
        tambahModal.style.display = "block";
    }

    // View Guru
    $('#guruTable tbody').on('click', '.view-btn', function() {
        var id = $(this).data('id');
        $.ajax({
            url: 'proses/view-guru.php',
            type: 'GET',
            data: { id: id },
            success: function(response) {
                $('#viewGuruDetail').html(response);
                viewModal.style.display = "block";
            }
        });
    });

    // Edit Guru
    $('#guruTable tbody').on('click', '.edit-btn', function() {
        var id = $(this).data('id');
        $.ajax({
            url: 'proses/get-guru.php',
            type: 'GET',
            data: { id: id },
            success: function(response) {
                var data = JSON.parse(response);
                $('#edit_id_guru').val(data.id_guru);
                $('#edit_nama_guru').val(data.nama_guru);
                $('#edit_alamat').val(data.alamat);
                $('#edit_no_telp').val(data.no_telp);
                $('#edit_email').val(data.email);
                $('#edit_tanggal_lahir').val(data.tanggal_lahir);
                $('#edit_jenis_kelamin').val(data.jenis_kelamin);
                $('#edit_pendidikan_terakhir').val(data.pendidikan_terakhir);
                $('#edit_bidang_keahlian').val(data.bidang_keahlian);
                $('#edit_tanggal_mulai_kerja').val(data.tanggal_mulai_kerja);
                $('#edit_status_aktif').val(data.status_aktif);
                editModal.style.display = "block";
            }
        });
    });

    // Delete Guru
    $('#guruTable tbody').on('click', '.delete-btn', function() {
        var id = $(this).data('id');
        if (confirm('Yakin ingin menghapus data ini?')) {
            window.location.href = 'proses/hapus-guru.php?id=' + id;
        }
    });
});