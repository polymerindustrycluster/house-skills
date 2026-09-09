<script setup lang="ts">
import { computed } from 'vue'
import { useNav } from '@slidev/client'

// Footer chrome = the ORIENTATION half of the first-glance contract
// (COMPOSITION.md): section label + page number on every content slide.
// Suppressed on the title and thank-you masters, which carry their own.
const { currentSlideNo, currentSlideRoute, total } = useNav()

const DARK_LAYOUTS = ['pic-section', 'pic-thank-you']
const BARE_LAYOUTS = ['pic-title', 'pic-thank-you']

const fm = computed<Record<string, any>>(() => currentSlideRoute.value?.meta?.slide?.frontmatter ?? {})
const layout = computed(() => String(fm.value.layout ?? ''))
const show = computed(() => fm.value.chrome !== false && !BARE_LAYOUTS.includes(layout.value))
const dark = computed(() => DARK_LAYOUTS.includes(layout.value) || fm.value.dark === true)
const label = computed(() => String(fm.value.label ?? ''))
const page = computed(() => String(currentSlideNo.value).padStart(2, '0'))
</script>

<template>
  <div v-if="show" class="pic-footer" :class="{ 'is-dark': dark }">
    <div v-if="label" class="pic-footer-label">{{ label }}</div>
    <div class="pic-footer-page">{{ page }}<span class="of">/{{ String(total).padStart(2, '0') }}</span></div>
  </div>
</template>

<style scoped>
.of { opacity: .45; font-weight: 400; }
</style>
