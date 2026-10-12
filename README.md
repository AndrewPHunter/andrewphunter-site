# andrewphunter-site

Personal site for Andrew Hunter — a minimal, timeless archive of writing on architecture, delivery systems, and engineering leadership.

## Stack

- **Hugo** (Extended) — Static site generator
- **Andrew** — Local editorial theme in `themes/andrew`
- **Hugo JSON index** — Client-side search; Pagefind index also built for deployment

## Local Development

```bash
# Check Hugo version (needs Extended)
hugo version

# Run local dev server
hugo server

# Build for production
hugo --minify
```

## Cloudflare Pages Deployment

### Build Configuration

- **Build command:** `hugo --minify && npx -y pagefind --site public`
- **Build output directory:** `public`

### Environment Variables

Set in Cloudflare Pages dashboard:

| Variable | Value |
|----------|-------|
| `HUGO_VERSION` | `0.154.2` |

## Structure

```
content/
  _index.md          # Home page
  writing/           # Blog posts (reverse chronological)
  series/            # Generated series taxonomy pages
  about/             # About page
  contact/           # Contact info
  search/            # Pagefind search
```

## Features

- Plainsight family design: navy framing, ivory reading surfaces, brass accents
- Self-hosted Plex Serif and Plex Mono; font license in `static/fonts/OFL.txt`
- Responsive homepage illustration processed by Hugo into WebP sizes
- No comments, analytics, or tracking
- RSS feed at `/index.xml`
- Sitemap at `/sitemap.xml`
- robots.txt enabled
- Mobile-friendly, fast, SEO-optimized

## License

Content is copyright Andrew Hunter. Code structure is MIT.

## Design

The design context is recorded in `.impeccable.md`. The custom theme shares its
palette and typography with Plainsight Systems, Cradle, and Serenity. The original
PaperMod submodule is retained but inactive.

The homepage source artwork is `assets/images/writing-desk.png`, generated for
this site in the family’s night-workshop illustration style. Hugo creates responsive
WebP variants at build time. Prose, canonical URLs, RSS, and series ordering remain
content-driven. Navigation works without JavaScript; search provides archive links
when JavaScript is unavailable.

For a local preview on an alternate port:

```bash
hugo server --port 1317 --disableFastRender
```

Brand asset sources are `assets/images/writing-desk-icon.png` and
`assets/images/writing-desk-social.png`. Browser icons (16/32/48px ICO and 96px
PNG), the 180px Apple touch icon, and 192/512px manifest icons are committed in
`static/`. The SVG URL is retained as a compatibility wrapper for the new artwork.
Hugo exports the social card as a fingerprinted 1200×630 JPEG; article-specific
sharing images still take precedence. `static/images/social-card.png` carries
the same artwork for the legacy fallback URL.
