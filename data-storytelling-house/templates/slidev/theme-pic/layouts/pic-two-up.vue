<script setup lang="ts">
defineProps<{
  eyebrow?: string
  headline?: string
  leftLabel?: string
  leftTitle?: string
  rightLabel?: string
  rightTitle?: string
}>()
</script>

<template>
  <div class="slidev-layout pic-slide pic-two-up-slide">
    <PicLogo />

    <div class="pic-hdr">
      <span v-if="eyebrow" class="pic-eyebrow">{{ eyebrow }}</span>
      <h1 class="pic-h1">{{ headline }}</h1>
    </div>

    <div class="pic-cols">
      <div class="pic-col">
        <h3 v-if="leftLabel">{{ leftLabel }}</h3>
        <h4 v-if="leftTitle">{{ leftTitle }}</h4>
        <slot />
      </div>
      <div class="pic-col is-alt">
        <h3 v-if="rightLabel">{{ rightLabel }}</h3>
        <h4 v-if="rightTitle">{{ rightTitle }}</h4>
        <slot name="right" />
      </div>
    </div>
  </div>
</template>
