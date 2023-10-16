document.addEventListener('DOMContentLoaded', function () {
    const header = document.querySelector('.js-header');
    if (header) {
        window.addEventListener('scroll', function () {
            if (this.scrollY > 0) {
                header.classList.add('bg-reveal');
            } else {
                header.classList.remove('bg-reveal');
            }
        });
    }
});
