
function showLoading() {
    const overlay = document.getElementById('loadingOverlay');
    
    // Show the overlay (it's visible by default)
    
    // Hide after 3 seconds with fade effect
    setTimeout(() => {
        overlay.style.opacity = '0';
        setTimeout(() => {
            overlay.style.display = 'none';
        }, 500); // Matches the CSS transition time
    }, 3000);
}

// Start loading when page opens
window.addEventListener('load', showLoading);

// Toggle password visibility
function togglePasswordVisibility() {
    const passwordInput = document.getElementById('password');
    const eyeIcon = document.querySelector('.toggle-password');
    
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        eyeIcon.classList.remove('fa-eye');
        eyeIcon.classList.add('fa-eye-slash');
    } else {
        passwordInput.type = 'password';
        eyeIcon.classList.remove('fa-eye-slash');
        eyeIcon.classList.add('fa-eye');
    }
}

// Form submission handler
document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();
    const rememberMe = document.getElementById('remember').checked;
    
    // Basic validation
    if (!username || !password) {
        alert('Please enter both username and password');
        return;
    }
    
    // Here you would typically make an AJAX call to your backend
    console.log('Login attempt with:', { username, password, rememberMe });
    
    // Simulate successful login (replace with actual authentication)
    setTimeout(() => {
        alert('Login successful! Redirecting to dashboard...');
        // window.location.href = 'dashboard.html'; // Redirect on success
    }, 1000);
});

// Social login handlers
document.querySelector('.social-btn.google').addEventListener('click', function() {
    console.log('Google login clicked');
    // Implement Google OAuth here
});

document.querySelector('.social-btn.microsoft').addEventListener('click', function() {
    console.log('Microsoft login clicked');
    // Implement Microsoft OAuth here
});