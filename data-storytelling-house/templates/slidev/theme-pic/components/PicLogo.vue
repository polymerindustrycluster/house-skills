<script setup lang="ts">
import { computed } from 'vue'
import { useSlideContext } from '@slidev/client'

// The mark comes from the DECK, never from the theme: a brand pack supplies it. In the deck's
// headmatter (files live under the deck's public/ folder):
//   brandLogo: /brand/logo-color.svg
//   brandLogoWhite: /brand/logo-white.svg   # used on dark surfaces; falls back to brandLogo
//   brandName: Your Organisation            # the image's alt text
// With no brandLogo the component renders nothing, so a deck without a mark still composes.
const props = withDefaults(defineProps<{ white?: boolean, small?: boolean }>(), {
  white: false,
  small: false,
})
const { $slidev } = useSlideContext()
const configs = computed<Record<string, any>>(() => (($slidev as any)?.configs ?? {}) as Record<string, any>)
const src = computed<string>(() => {
  const color = String(configs.value.brandLogo ?? '')
  const white = String(configs.value.brandLogoWhite ?? '')
  return props.white ? (white || color) : color
})
const alt = computed(() => String(configs.value.brandName ?? ''))
</script>

<template>
  <div v-if="src" class="pic-logo" :class="{ 'pic-logo--sm': props.small }">
    <img :src="src" :alt="alt">
  </div>
</template>
