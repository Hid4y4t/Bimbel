<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Register</title>
    <link rel="stylesheet" href="aset/style.css">
</head>

<body>
    <div class="wrapper">
        <form id="form" action="#">
            <h2 id="form-title">Login</h2>
            <div class="input-field">
                <input type="text" name="email" required>
                <label>Enter your email</label>
            </div>
            <div class="input-field">
                <input type="password" name="password" required>
                <label>Enter your password</label>
            </div>
            <button type="submit">Log In</button>
            <div class="register">
                <p>Don't have an account? <a id="register-link" href="#">Register</a></p>
            </div>
        </form>
    </div>

    <script>
        const form = document.getElementById('form');
        const formTitle = document.getElementById('form-title');

        // Fungsi untuk mengubah tampilan form
        function setFormContent(type) {
            form.style.opacity = 0;
            form.style.transform = 'translateY(-20px)';
            setTimeout(() => {
                if (type === 'register') {
                    formTitle.textContent = 'Register';
                    form.innerHTML = `
                        <h2 id="form-title">Register</h2>
                        <div class="input-field">
                            <input type="text" name="email" required>
                            <label>Enter your email</label>
                        </div>
                        <div class="input-field">
                            <input type="password" name="password" required>
                            <label>Enter your password</label>
                        </div>
                        <div class="input-field">
                            <input type="password" name="confirm_password" required>
                            <label>Confirm your password</label>
                        </div>
                        <button type="submit">Register</button>
                        <div class="register">
                            <p>Already have an account? <a id="login-link" href="#">Log In</a></p>
                        </div>
                    `;
                    document.getElementById('login-link').addEventListener('click', (e) => {
                        e.preventDefault();
                        setFormContent('login');
                    });
                } else {
                    formTitle.textContent = 'Login';
                    form.innerHTML = `
                        <h2 id="form-title">Login</h2>
                        <div class="input-field">
                            <input type="text" name="email" required>
                            <label>Enter your email</label>
                        </div>
                        <div class="input-field">
                            <input type="password" name="password" required>
                            <label>Enter your password</label>
                        </div>
                        <button type="submit">Log In</button>
                        <div class="register">
                            <p>Don't have an account? <a id="register-link" href="#">Register</a></p>
                        </div>
                    `;
                    document.getElementById('register-link').addEventListener('click', (e) => {
                        e.preventDefault();
                        setFormContent('register');
                    });
                }
                form.style.opacity = 1;
                form.style.transform = 'translateY(0)';
            }, 500);
        }

        // Event listener untuk tombol register
        document.getElementById('register-link').addEventListener('click', (e) => {
            e.preventDefault();
            setFormContent('register');
        });

        // Event listener untuk submit form
        form.addEventListener('submit', (e) => {
            e.preventDefault();
            const formData = new FormData(form);
            const action = formTitle.textContent.toLowerCase();

            fetch(action === 'login' ? 'login.php' : 'registrasi.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    if (action === 'login') {
                        // Redirect ke halaman admin setelah login berhasil
                        window.location.href = 'admin/index.php';
                    } else {
                        // Tampilkan pesan sukses registrasi dan alihkan ke form login
                        alert(data.message);
                        setFormContent('login');
                    }
                } else {
                    // Tampilkan pesan error
                    alert(data.message);
                }
            })
            .catch(error => console.error('Error:', error));
        });
    </script>
</body>

</html>