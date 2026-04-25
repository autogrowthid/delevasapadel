/* assets/js/main.js */
document.addEventListener('DOMContentLoaded', () => {
    
    // Sticky Header functionality
    const header = document.querySelector('.header');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            header.classList.add('header--scrolled');
        } else {
            header.classList.remove('header--scrolled');
        }
    });

    // Smooth Scrolling for navigation links
    const navLinks = document.querySelectorAll('.header__nav-link');
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            const targetSection = document.querySelector(targetId);
            
            if (targetSection) {
                // Calculation to offset sticky header height
                const headerHeight = header.offsetHeight;
                const targetPosition = targetSection.getBoundingClientRect().top + window.scrollY - headerHeight;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Dummy functionality for all buttons requiring action
    const actionButtons = document.querySelectorAll('.js-action-btn');
    actionButtons.forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            const actionType = btn.textContent.trim();
            console.log(`Action Triggered: ${actionType}`);
            alert(`[System Mock] Modul untuk fitur "${actionType}" akan segera terintegrasi dengan backend Padel Booking.`);
        });
    });

});
