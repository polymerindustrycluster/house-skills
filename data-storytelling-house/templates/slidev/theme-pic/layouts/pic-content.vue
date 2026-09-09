<script setup lang="ts">
withDefaults(defineProps<{
  eyebrow?: string
  headline?: string
  /** two-column body text, as in the reference ContentSlide */
  columns?: number
  /** scale a SHORT list up to fill the content zone (the FILL strategy, not a floating cluster) */
  lead?: boolean
}>(), { columns: 1, lead: false })
</script>

<template>
  <div class="slidev-layout pic-slide pic-content-slide">
    <PicLogo />

    <div class="pic-hdr">
      <span v-if="eyebrow" class="pic-eyebrow">{{ eyebrow }}</span>
      <h1 class="pic-h1">{{ headline }}</h1>
      <div class="pic-rule" />
    </div>

    <div class="pic-content-body" :class="{ 'is-two-col': columns === 2, 'is-lead': lead }">
      <slot />
    </div>
  </div>
</template>
