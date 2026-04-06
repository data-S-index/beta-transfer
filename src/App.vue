<script setup>
import { ref, onMounted, onUnmounted } from "vue";

const countdown = ref(10);
let timer = null;

function getRedirectUrl() {
  const { pathname, search, hash } = window.location;
  return `https://scholardata.io${pathname}${search}${hash}`;
}

function redirect() {
  window.location.href = getRedirectUrl();
}

onMounted(() => {
  timer = setInterval(() => {
    countdown.value--;
    if (countdown.value <= 0) {
      clearInterval(timer);
      redirect();
    }
  }, 1000);
});

onUnmounted(() => {
  clearInterval(timer);
});
</script>

<template>
  <div id="page">
    <div id="card">
      <div class="logo-wrap">
        <svg
          width="40"
          height="40"
          viewBox="0 0 40 40"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
        >
          <rect
            width="40"
            height="40"
            rx="10"
            fill="var(--accent)"
            fill-opacity="0.12"
          />
          <path
            d="M20 8C13.373 8 8 13.373 8 20s5.373 12 12 12 12-5.373 12-12S26.627 8 20 8zm0 2a10 10 0 1 1 0 20A10 10 0 0 1 20 10zm-1 4v8l6 3.5-1 1.732-7-4V14h2z"
            fill="var(--accent)"
          />
        </svg>
      </div>

      <h1>Scholar Data has moved</h1>

      <p class="sub">
        We've relocated to our new home at
        <a :href="getRedirectUrl()" class="domain">scholardata.io</a>. You'll be
        redirected automatically.
      </p>

      <div class="timer-ring" :style="{ '--progress': (10 - countdown) / 10 }">
        <svg viewBox="0 0 64 64" class="ring-svg">
          <circle class="ring-track" cx="32" cy="32" r="28" />
          <circle
            class="ring-fill"
            cx="32"
            cy="32"
            r="28"
            :style="{ strokeDashoffset: 175.9 * (countdown / 10) }"
          />
        </svg>
        <span class="timer-number">{{ countdown }}</span>
      </div>

      <button class="skip-btn" @click="redirect">
        Go now
        <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
          <path
            d="M3 8h10M9 4l4 4-4 4"
            stroke="currentColor"
            stroke-width="1.5"
            stroke-linecap="round"
            stroke-linejoin="round"
          />
        </svg>
      </button>

      <p class="note">
        Your current path and any query parameters will be preserved.
      </p>
    </div>
  </div>
</template>

<style scoped>
#page {
  min-height: 100svh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 24px;
  box-sizing: border-box;
}

#card {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 20px;
  max-width: 440px;
  width: 100%;
  text-align: center;
}

.logo-wrap {
  width: 64px;
  height: 64px;
  border-radius: 16px;
  background: var(--accent-bg);
  border: 1px solid var(--accent-border);
  display: flex;
  align-items: center;
  justify-content: center;
}

h1 {
  font-size: 32px;
  letter-spacing: -0.5px;
  margin: 0;
  color: var(--text-h);

  @media (max-width: 480px) {
    font-size: 26px;
  }
}

.sub {
  font-size: 17px;
  color: var(--text);
  line-height: 1.6;
  margin: 0;
}

.domain {
  color: var(--accent);
  text-decoration: none;
  font-weight: 500;

  &:hover {
    text-decoration: underline;
  }
}

.timer-ring {
  position: relative;
  width: 80px;
  height: 80px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 4px 0;
}

.ring-svg {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  transform: rotate(-90deg);
}

.ring-track {
  fill: none;
  stroke: var(--border);
  stroke-width: 4;
}

.ring-fill {
  fill: none;
  stroke: var(--accent);
  stroke-width: 4;
  stroke-linecap: round;
  stroke-dasharray: 175.9;
  transition: stroke-dashoffset 1s linear;
}

.timer-number {
  font-family: var(--mono);
  font-size: 28px;
  font-weight: 600;
  color: var(--text-h);
  line-height: 1;
  position: relative;
  z-index: 1;
}

.skip-btn {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 10px 24px;
  background: var(--accent);
  color: #fff;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  font-weight: 500;
  cursor: pointer;
  transition:
    opacity 0.2s,
    transform 0.1s;
  font-family: var(--sans);

  &:hover {
    opacity: 0.88;
  }
  &:active {
    transform: scale(0.97);
  }
  &:focus-visible {
    outline: 2px solid var(--accent);
    outline-offset: 3px;
  }
}

.note {
  font-size: 13px;
  color: var(--text);
  opacity: 0.7;
  margin: 0;
}
</style>
