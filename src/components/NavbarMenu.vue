<script setup>

</script>

<template>
    <div class="container-fluid position-relative p-0">
        <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0 shadowed-l lb-bg-primary">
            <a href="index.html" class="navbar-brand p-0">
              <figure class="col-7">
                <img class="w-50" src="" alt="upp logo">
              </figure>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">
                    <a href="index.html" class="nav-item nav-link fs-5">Home</a>
                    <a href="about.html" class="nav-item nav-link fs-5">About</a>
                    <a href="service.html" class="nav-item nav-link fs-5">Services</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle fs-5" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu m-0">
                            <a href="appointment.html" class="dropdown-item fs-6">Appointment</a>
                            <a href="feature.html" class="dropdown-item fs-6">Features</a>
                            <a href="blog.html" class="dropdown-item fs-6">Our Blog</a>
                            <a href="team.html" class="dropdown-item fs-6">Our Team</a>
                            <a href="testimonial.html" class="dropdown-item fs-6">Testimonial</a>
                        </div>
                    </div>
                    <a href="contact.html" class="nav-item nav-link fs-5">Contact Us</a>
                </div>
            </div>
        </nav>
      </div>
</template>

<style scoped>
.navbar .dropdown-toggle::after {
  content: "\f282";
  display: inline-block;
  font-family: bootstrap-icons !important;
  font-size: var(--copyright-font-size);
  font-style: normal;
  font-weight: normal !important;
  font-variant: normal;
  text-transform: none;
  line-height: 1;
  vertical-align: -.125em;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  position: relative;
  left: 2px;
  border: 0;
}
</style>
