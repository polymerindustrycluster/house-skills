<script setup lang="ts">
defineProps<{
  eyebrow?: string
  headline?: string
  subtitle?: string
  date?: string
  meta?: string
}>()
</script>

<template>
  <div class="slidev-layout pic-slide pic-title-slide">
    <PicLogo />

    <div class="pic-title-wrap">
      <span v-if="eyebrow" class="pic-eyebrow">{{ eyebrow }}</span>
      <h1 class="pic-title-xl">{{ headline }}</h1>
      <p v-if="subtitle" class="pic-lead">{{ subtitle }}</p>
      <div class="pic-rule" />
    </div>

    <div v-if="date" class="pic-title-date">{{ date }}</div>
    <div v-if="meta" class="pic-title-meta">{{ meta }}</div>

    <div class="pic-swoosh"><div class="blade b1" /><div class="blade b2" /></div>
  </div>
</template>
