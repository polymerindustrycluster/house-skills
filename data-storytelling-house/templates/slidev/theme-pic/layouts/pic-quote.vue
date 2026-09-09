<script setup lang="ts">
withDefaults(defineProps<{
  /** the sound bite. One sentence, said once, nothing else on the slide. */
  quote?: string
  who?: string
  where?: string
  /** dark-surface master (--brand-dark-surface). Never the brand accent behind white text. */
  dark?: boolean
  /** px. Hero sound bites run 120-152; attributed member quotes run 56-72. */
  size?: number
}>(), { dark: false, size: 120 })
</script>

<template>
  <div class="slidev-layout pic-slide pic-quote-slide" :class="{ 'pic-dark': dark, 'is-bare': !(who || where || $slots.default) }">
    <PicLogo :white="dark" />

    <div class="pic-quote-mark">&ldquo;</div>

    <div class="pic-quote-body">
      <p :style="{ fontSize: `${size}px` }">{{ quote }}</p>
    </div>

    <!-- edge-to-edge band anchors an attribution or the restated Big Idea. With neither, the
         band is dropped and the quote is centred (is-bare) — an empty band is a dead strip. -->
    <div v-if="who || where || $slots.default" class="pic-quote-band" />
    <div v-if="who || where || $slots.default" class="pic-quote-foot">
      <div v-if="who || where" class="pic-quote-attr">
        <div class="swatch" />
        <div>
          <div v-if="who" class="who">{{ who }}</div>
          <div v-if="where" class="where">{{ where }}</div>
        </div>
      </div>
      <slot />
    </div>
  </div>
</template>
