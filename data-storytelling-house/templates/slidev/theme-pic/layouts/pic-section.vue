<script setup lang="ts">
withDefaults(defineProps<{
  number?: string
  eyebrow?: string
  headline?: string
}>(), { eyebrow: 'Section' })
</script>

<template>
  <div class="slidev-layout pic-slide pic-dark pic-section-slide">
    <PicLogo white />

    <div class="pic-section-band" />

    <div v-if="number" class="pic-section-num">{{ number }}</div>

    <div class="pic-section-label">
      <span v-if="eyebrow" class="pic-eyebrow">{{ eyebrow }}</span>
      <h2>{{ headline }}</h2>
      <div class="pic-section-sub pic-body"><slot /></div>
    </div>
  </div>
</template>
