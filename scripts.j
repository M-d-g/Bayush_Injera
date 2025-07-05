MELKAMU @MMAGc, [7/5/2025 6:49 AM]
modal.addEventListener('click', function(e) {
                if (e.target === modal) {
                    closeModal();
                }
            });
            
            // Handle video end
            const video = modal.querySelector('video');
            video.addEventListener('ended', () => {
                modal.querySelector('.close-modal').focus();
            });
        });
    });

    // ======================
    // Enhanced Form Validation
    // ======================
    const contactForm = document.getElementById('contact-form');
    if (contactForm) {
        const emailInput = document.getElementById('email');
        const phoneInput = document.getElementById('phone');
        const nameInput = document.getElementById('name');
        
        // Email validation
        emailInput.addEventListener('input', function() {
            if (!this.value.includes('@')) {
                this.setCustomValidity('Please include an @ in the email address.');
            } else {
                this.setCustomValidity('');
            }
        });
        
        // Phone number validation (basic)
        phoneInput.addEventListener('input', function() {
            const phoneRegex = /^[0-9+-\s]+$/;
            if (!phoneRegex.test(this.value)) {
                this.setCustomValidity('Please enter a valid phone number.');
            } else {
                this.setCustomValidity('');
            }
        });
        
        // Form submission
        contactForm.addEventListener('submit', function(e) {
            let isValid = true;
            
            // Validate required fields
            [nameInput, emailInput].forEach(input => {
                if (!input.value.trim()) {
                    input.reportValidity();
                    isValid = false;
                }
            });
            
            if (!isValid) {
                e.preventDefault();
                return;
            }
            
            // Show loading state
            const submitBtn = this.querySelector('button[type="submit"]');
            const originalText = submitBtn.textContent;
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<span class="spinner"></span> Sending...';
            
            // Simulate form submission (replace with actual AJAX call)
            setTimeout(() => {
                submitBtn.textContent = 'Message Sent!';
                setTimeout(() => {
                    submitBtn.textContent = originalText;
                    submitBtn.disabled = false;
                }, 3000);
            }, 1500);
        });
    }

    // ======================
    // Additional Features
    // ======================
    
    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;
            
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                targetElement.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });
    
    // Lazy loading for images
    if ('IntersectionObserver' in window) {
        const lazyImages = document.querySelectorAll('img.lazy');
        
        const imageObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    img.src = img.dataset.src;
                    img.classList.remove('lazy');
                    imageObserver.unobserve(img);
                }

MELKAMU @MMAGc, [7/5/2025 6:49 AM]
});
        });
        
        lazyImages.forEach(img => {
            imageObserver.observe(img);
        });
    }
    
    // Current year in footer
    const yearElement = document.getElementById('current-year');
    if (yearElement) {
        yearElement.textContent = new Date().getFullYear();
    }
});

// Utility function for accessibility
class Util {
    static srOnly() {
        const style = document.createElement('style');
        style.textContent = 
            .sr-only {
                position: absolute;
                width: 1px;
                height: 1px;
                padding: 0;
                margin: -1px;
                overflow: hidden;
                clip: rect(0, 0, 0, 0);
                white-space: nowrap;
                border-width: 0;
            }
        ;
        document.head.appendChild(style);
    }
}

// Initialize accessibility features
Util.srOnly();