$(document).ready(function() {
    var table = $('#programTable').DataTable({
        "pageLength": 10
    });

    // Get the modals
    var editModal = document.getElementById("editProgramModal");
    var span = document.getElementsByClassName("close")[0];

    // Close modals
    span.onclick = function() {
        editModal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == editModal) {
            editModal.style.display = "none";
        }
    }

    // Edit Program
    $('#programTable tbody').on('click', '.edit-btn', function() {
        var id = $(this).data('id');
        $.ajax({
            url: 'proses/get-program.php',
            type: 'GET',
            data: { id: id },
            success: function(response) {
                var data = JSON.parse(response);
                $('#edit_id_programpilihan').val(data.id_programpilihan);
                $('#edit_pilihanprogram').val(data.pilihanprogram);
                $('#edit_biayaprogram').val(data.biayaprogram);
                editModal.style.display = "block";
            }
        });
    });

    // Delete Program
    $('#programTable tbody').on('click', '.delete-btn', function() {
        var id = $(this).data('id');
        if (confirm('Yakin ingin menghapus data ini?')) {
            window.location.href = 'proses/hapus-program.php?id=' + id;
        }
    });
});

// Get the modal
var addModal = document.getElementById("addProgramModal");
var addBtn = document.getElementById("addProgramBtn");
var closeBtn = document.getElementsByClassName("close1")[0];

// When the user clicks the button, open the modal 
addBtn.onclick = function() {
    addModal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
closeBtn.onclick = function() {
    addModal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == addModal) {
        addModal.style.display = "none";
    }
}