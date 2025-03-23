function setFormContent(type) {
    const form = document.getElementById('form');
    const formTitle = document.getElementById('form-title');
    form.style.opacity = 0;
    form.style.transform = 'translateY(-20px)';
    setTimeout(() => {
        if (type === 'register') {
            formTitle.textContent = 'Register';
            form.innerHTML = `
                <h2 id="form-title">Register</h2>
                <div class="input-field">
                    <input type="text" required>
                    <label>Enter your email</label>
                </div>
                <div class="input-field">
                    <input type="password" required>
                    <label>Enter your password</label>
                </div>
                <div class="input-field">
                    <input type="password" required>
                    <label>Confirm your password</label>
                </div>
                <button type="submit">Register</button>
                <div class="register">
                    <p>Already have an account? <a id="login-link" href="#">Log In</a></p>
                </div>
            `;
            document.getElementById('login-link').addEventListener('click', function(e) {
                e.preventDefault();
                setFormContent('login');
            });
        } else {
            formTitle.textContent = 'Login';
            form.innerHTML = `
                <h2 id="form-title">Login</h2>
                <div class="input-field">
                    <input type="text" required>
                    <label>Enter your email</label>
                </div>
                <div class="input-field">
                    <input type="password" required>
                    <label>Enter your password</label>
                </div>
                <button type="submit">Log In</button>
                <div class="register">
                    <p>Don't have an account? <a id="register-link" href="#">Register</a></p>
                </div>
            `;
            document.getElementById('register-link').addEventListener('click', function(e) {
                e.preventDefault();
                setFormContent('register');
            });
        }
        form.style.opacity = 1;
        form.style.transform = 'translateY(0)';
    }, 500);
}

document.getElementById('register-link').addEventListener('click', function(e) {
    e.preventDefault();
    setFormContent('register');
});