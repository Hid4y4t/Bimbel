$(document).ready(function() {
    var table = $('#siswaTable').DataTable({
        "pageLength": 10
    });

    // Get the modals
    var viewModal = document.getElementById("viewSiswaModal");
    var editModal = document.getElementById("editSiswaModal");
    var span = document.getElementsByClassName("close");

    // Close modals
    for (var i = 0; i < span.length; i++) {
        span[i].onclick = function() {
            viewModal.style.display = "none";
            editModal.style.display = "none";
        }
    }

    window.onclick = function(event) {
        if (event.target == viewModal) {
            viewModal.style.display = "none";
        } else if (event.target == editModal) {
            editModal.style.display = "none";
        }
    }

    // View Siswa
    $('#siswaTable tbody').on('click', '.view-btn', function() {
        var id = $(this).data('id');
        $.ajax({
            url: 'proses/view-siswa.php',
            type: 'GET',
            data: { id: id },
            success: function(response) {
                $('#viewSiswaDetail').html(response);
                viewModal.style.display = "block";
            }
        });
    });

    // Edit Siswa
    $('#siswaTable tbody').on('click', '.edit-btn', function() {
        var id = $(this).data('id');
        $.ajax({
            url: 'proses/get-siswa.php',
            type: 'GET',
            data: { id: id },
            success: function(response) {
                var data = JSON.parse(response);
                $('#edit_id_siswa').val(data.id_siswa);
                $('#edit_nama').val(data.nama);
                $('#edit_tempatlahir').val(data.tempatlahir);
                $('#edit_tanggallahir').val(data.tanggallahir);
                $('#edit_asalsekolah').val(data.asalsekolah);
                $('#edit_kelas').val(data.kelas);
                $('#edit_jeniskelamin').val(data.jeniskelamin);
                $('#edit_alamat').val(data.alamat);
                $('#edit_nohp').val(data.nohp);
                $('#edit_tempat_les').val(data.tempat_les);
                $('#edit_pilihanprogram').val(data.pilihanprogram);
                $('#status_siswa').val(data.status_siswa);
                $('#edit_keterangan').val(data.keterangan);
                editModal.style.display = "block";
            }
        });
    });

    // Delete Siswa
    $('#siswaTable tbody').on('click', '.delete-btn', function() {
        var id = $(this).data('id');
        if (confirm('Yakin ingin menghapus data ini?')) {
            window.location.href = 'proses/hapus-siswa.php?id=' + id;
        }
    });
});

// Get the modal
var modal = document.getElementById("tambahSiswaModal");
var btn = document.getElementById("tambahSiswaBtn");
var span = document.getElementsByClassName("close1")[0];

btn.onclick = function() {
    modal.style.display = "block";
}

span.onclick = function() {
    modal.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}