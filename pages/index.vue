<template>
  <div class="wrapper">
    <!-- Background Content -->
    <img src="/nav.png" alt="" style="width: 100%" />
    <div class="" style="text-align: center">
      <!-- image -->
      <div class="">
        <img src="/logo.png" alt="" />
      </div>
      <!-- content -->
      <div class="" style="font-size: 1.5rem">
        <span>Elphinstone College (estd. 1856) </span>
        <br />
        <span>156, Mahatma Gandhi Road, Mantralaya, Fort, Mumbai</span>
      </div>
    </div>
    <div :class="{ 'blur-bg': showPopup }" class="container">index page</div>

    <div v-if="showPopup" class="popup">
      <div class="">
        {{ college.name }} is now a constituent college of <br />
        Dr. Homi Bhabha State University, Mumbai.
      </div>
      <br />
      <div class=""></div>
      You are being redirected to
      <a :href="college.link">{{ college.name }}</a>
      official website.

      <br />
      <div class="countdown">
        {{ countdown }}
        <br />
        <button class="pause" @click="toggleCountdown">
          {{ isPaused ? "Resume" : "Pause" }}
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { COLLEGE } from "@/constants";
import { ref, onMounted } from "vue";

let college = COLLEGE;
const showPopup = ref(false);
let countdown = ref(8);
let intervalId = null; // Store the interval ID
let isPaused = ref(false); // Track pause state
let redirectStopped = ref(false); // Prevent redirection when paused

const startCountdown = () => {
  intervalId = setInterval(() => {
    if (countdown.value > 0) {
      countdown.value -= 1;
    } else {
      clearInterval(intervalId);
      if (!redirectStopped.value) {
        window.location.href = COLLEGE.link; // Redirect only if not paused
      }
    }
  }, 1000);
};

onMounted(() => {
  startCountdown(); // Start countdown on mount

  setTimeout(() => {
    showPopup.value = true;
  }, 1000);
});

const toggleCountdown = () => {
  if (isPaused.value) {
    // Resume countdown
    redirectStopped.value = false; // Allow redirection again if resumed
    startCountdown();
  } else {
    // Pause countdown and stop redirection
    clearInterval(intervalId);
    redirectStopped.value = true;
  }
  isPaused.value = !isPaused.value; // Toggle state
};
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

.pause {
  padding: 1rem;
  font-size: 1.3rem;
  text-transform: capitalize;
  margin: 0;
}
/* Blur effect only on background */
.blur-bg {
  filter: blur(5px);
}

/* Popup styling */
.popup {
  position: absolute; /* Keep it above the blur */
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  color: black;
  padding: 2rem;
  border-radius: 8px;
  font-size: 1.5rem;
  text-align: center;
  z-index: 10; /* Ensures it stays above the blurred background */
  border: 3px solid black;
}
.countdown {
  font-size: 5rem;
  font-weight: bold;
  text-shadow: 2px 2px 10px rgba(255, 255, 255, 0.5);
  transition: transform 0.2s ease-in-out;
}
.countdown.scale {
  transform: scale(1.2);
}
</style>
