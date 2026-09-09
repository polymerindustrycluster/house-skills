<script setup lang="ts">
interface Stat {
  /** small uppercase label above the numeral */
  eyebrow?: string
  value: string
  /** trailing unit, set smaller (M, +, %) */
  unit?: string
  label?: string
}

defineProps<{
  eyebrow?: string
  headline?: string
  /** ONE dominant numeral, 180px. Hero numerals carry the slide. */
  hero?: Stat
  /** at most two supporting stats. Density ceiling: <=5 numerals per slide. */
  stats?: Stat[]
  /** one caveat line, ink-650 */
  note?: string
}>()
</script>

<template>
  <div class="slidev-layout pic-slide pic-stat-grid-slide">
    <PicLogo />

    <div class="pic-hdr">
      <span v-if="eyebrow" class="pic-eyebrow">{{ eyebrow }}</span>
      <h1 class="pic-h1">{{ headline }}</h1>
    </div>

    <div class="pic-stats">
      <div v-if="hero" class="pic-stat-hero">
        <span v-if="hero.eyebrow" class="pic-eyebrow-sm">{{ hero.eyebrow }}</span>
        <div class="v">{{ hero.value }}<span v-if="hero.unit" class="u">{{ hero.unit }}</span></div>
        <div v-if="hero.label" class="l">{{ hero.label }}</div>
      </div>

      <div class="pic-stat-side">
        <div v-for="s in stats" :key="s.value" class="pic-stat">
          <span v-if="s.eyebrow" class="pic-eyebrow-sm">{{ s.eyebrow }}</span>
          <div class="v">{{ s.value }}<span v-if="s.unit" class="u">{{ s.unit }}</span></div>
          <div v-if="s.label" class="l">{{ s.label }}</div>
        </div>
      </div>
    </div>

    <div v-if="note" class="pic-stat-note">{{ note }}</div>
  </div>
</template>
