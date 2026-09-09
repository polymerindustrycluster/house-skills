<script setup lang="ts">
withDefaults(defineProps<{
  message?: string
  from?: string
  links?: { label: string, value: string }[]
}>(), { message: 'Thank you.' })
</script>

<template>
  <div class="slidev-layout pic-slide pic-dark pic-thank-you-slide">
    <PicLogo white />

    <div class="pic-ty-stack">
      <h1 class="ty">{{ message }}</h1>
      <p v-if="from" class="from">{{ from }}</p>
    </div>

    <div v-if="links && links.length" class="pic-ty-links">
      <span v-for="l in links" :key="l.label"><span class="lbl">{{ l.label }}</span>{{ l.value }}</span>
    </div>

    <div class="pic-swoosh"><div class="blade b1" /><div class="blade b2" /></div>
  </div>
</template>
