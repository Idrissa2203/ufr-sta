// Menu hamburger
document.addEventListener('DOMContentLoaded', function() {
    const hamburger = document.querySelector('.hamburger');
    const navMenu = document.querySelector('.nav-menu');

    if (hamburger) {
        hamburger.addEventListener('click', function() {
            navMenu.classList.toggle('active');
            });
    }
});

// Auto-dismiss flash messages après 5 secondes
setTimeout(function() {
    const flashMessages = document.querySelectorAll('.flash');
    flashMessages.forEach(function(msg) {
        msg.style.transition = 'opacity 0.5s';
        msg.style.opacity = '0';
        setTimeout(function() {
            msg.remove();
        }, 500);
    });
}, 5000);