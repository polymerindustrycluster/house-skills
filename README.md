# house-skills

Two agent skills that carry the method behind the [Polymer Industry Cluster evidence
room](https://polymerindustrycluster.github.io/evidence-room/): how we write data
journalism for strangers on the web, and how we turn the same evidence into a talk for a
room. They are written for coding agents (Claude Code, Codex and the like) but they are
plain Markdown, and a person can read them as a style guide.

| skill | for | not for |
|-|-|-|
| `data-journalism-house` | a published, gate-checked data article: pitch gate, storyboard, chart law, uncertainty language, methodology box, a four-layer review gauntlet | slide decks, talks, anything with an assembled audience |
| `data-storytelling-house` | a talk, deck, board or funder ask, briefing, teach-back: Duarte-school craft (Big Idea gate, sparkline, STAR moment, new-bliss close) | anything published to a URL for anonymous readers |

The routing test between them is the audience, not the word "story". An assembled,
addressable room goes to storytelling. Strangers on the web go to journalism, even when the
request says "data story".

## Install

Copy either folder into your agent's skills directory (for Claude Code,
`~/.claude/skills/`). Each folder is self-contained: a `SKILL.md` entry point and a
`references/` directory it reads on demand.

## What is deliberately not here

These skills were built inside a larger private harness, and they refer to parts of it by
name. You get the doctrine and the checklists. You do not get:

- **The gate suite.** The journalism skill talks about a cold-open gate, a contrast gate, a
  furniture gate, a caveat budget. Those run as scripts in the evidence-room repository's
  `tools/` directory, which is public; the skill tells you what each one checks so you can
  build your own.
- **`pic-charts`**, the chart theme the storytelling skill routes figure requests to. It is
  a private matplotlib package. Any chart library with direct labels and takeaway titles
  will do.
- **The cross-model council.** Several gates say a finding was "refuted by a four-family
  council" or "red-teamed". That is our practice of sending a draft to several unrelated
  language models with instructions to break it. The skill describes the practice; the
  tooling is ours.
- **A retrieval index over the Duarte books.** The storytelling skill's Duarte reference is
  a cited paraphrase. Where it says to read the book, read the book.

## Versioning

The canonical copies live in the maintainers' private tree and are edited there. This
repository is a snapshot, re-cut and tagged when the doctrine changes, not on every edit.
Cite a tag, not `main`.

## Reporting an error

Open an issue naming the file, the line, and what you think it fails against. Worked
incidents in the text refer to published evidence-room pages; if one of those pages has been
corrected since, say so and we will update the example.

## Licence

[CC BY 4.0](LICENSE). Attribute to the Polymer Industry Cluster, Greater Akron Chamber.
The Duarte material is paraphrase with page citations to the books named in the file;
the books remain their author's.
