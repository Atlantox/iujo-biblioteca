const OnAppearAnimation = (elementId, animation) => {
    const myObserver = new IntersectionObserver(entries => {
        entries.forEach(entry => {
            // If the element is visible
            if (entry.isIntersecting) {
            // Add the animation class
                var targetElement = document.getElementById(elementId);
                targetElement.classList.remove(animation);
            }
        });
    });
    
    const myChainer = document.getElementById(elementId)
    myObserver.observe(myChainer);
}

export default OnAppearAnimation