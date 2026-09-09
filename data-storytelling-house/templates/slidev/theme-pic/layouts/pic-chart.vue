<script setup lang="ts">
const props = defineProps<{
  eyebrow?: string
  /** the slide's ASSERTION — a sentence with a verb. Not the chart title. */
  headline?: string
  /** path to a pic-charts bundle image, relative to the deck */
  figure?: string
  /** alt text — take it from the figure's .alt.txt sidecar */
  alt?: string
  /** ONE source line. Required for traceability even when the figure carries its own. */
  source: string
  /** AT MOST ONE limitation sentence. Move the rest to notes/appendix; never delete. */
  limitation?: string
}>()

// A TypeScript-required prop is a build-time warning, not a failure, so the apparatus budget is
// enforced at runtime too: a chart slide without its one source line refuses to render.
if (!props.source || !props.source.trim()) {
  throw new Error('pic-chart: every figure carries ONE source line (COMPOSITION.md apparatus budget) — `source:` is missing on a chart slide.')
}
if (props.limitation && (props.limitation.match(/[.!?](\s|$)/g) ?? []).length > 1) {
  throw new Error('pic-chart: at most ONE limitation sentence per figure — move the rest to the appendix or speaker notes, never delete it.')
}
</script>

<template>
  <div class="slidev-layout pic-slide pic-chart-slide">
    <PicLogo small class="pic-chart-logo" />

    <div class="pic-chart-hdr">
      <span v-if="eyebrow" class="pic-eyebrow">{{ eyebrow }}</span>
      <h1>{{ headline }}</h1>
    </div>

    <div class="pic-chart-panel">
      <img v-if="figure" :src="figure" :alt="`${alt} Source: ${source}`">
    </div>

    <div class="pic-chart-rail">
      <div class="pic-chart-read"><slot /></div>
      <div v-if="source || limitation" class="pic-chart-apparatus">
        <!-- The source is NOT rendered here: a pic-charts bundle burns its own source line into
             the image, and two source lines on one figure breaks the apparatus budget and can
             disagree. The prop stays REQUIRED so the slide still carries the string for
             traceability, and it is exposed to assistive tech on the image below. -->
        <div v-if="limitation" class="lim">{{ limitation }}</div>
      </div>
    </div>
  </div>
</template>
