<template>
  <div class="wrapper">
    <!-- Background Content -->
    <img src="/nav.png" alt="" style="width: 100%" />
    <div :class="{ 'blur-bg': showPopup }" class="container">index page</div>

    <!-- Popup (appears above the blurred background) -->
    <div v-if="showPopup" class="popup">
      <div class="">🚧 Website Under Construction 🚧</div>
      <br />
      <div class="">
        Elphinstone College is now a constituent college of Dr. Homi Bhabha
        State University.
      </div>
      <br />
      <div class=""></div>
      Our website is currently under construction. You will be redirected to
      <a href="https://hbsu.ac.in/page/341/elphinstone-college"
        >Elphinstone College</a
      >
      for updates and information. Thank you for your patience!
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";

const showPopup = ref(false);

onMounted(() => {
  setTimeout(() => {
    showPopup.value = true;

    // Redirect user after 3 seconds
    setTimeout(() => {
      window.location.href = "https://hbsu.ac.in/page/341/elphinstone-college"; // Change URL here
    }, 3000);
  }, 1000);
});
</script>

<style>
/* Wrapper to position elements correctly */
.wrapper {
  position: relative;
}

/* Background container */
.container {
  position: relative;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  transition: 0.3s ease-in-out;
}

/* Blur effect only on background */
.blur-bg {
  filter: blur(5px);
}

/* Popup styling */
.popup {
  position: fixed; /* Keep it above the blur */
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  color: black;
  padding: 15px 20px;
  border-radius: 8px;
  font-size: 18px;
  text-align: center;
  z-index: 10; /* Ensures it stays above the blurred background */
}
</style>
