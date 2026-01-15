# andrewphunter-site

Personal site for Andrew Hunter — a minimal, timeless archive of writing on architecture, delivery systems, and engineering leadership.

## Stack

- **Hugo** (Extended) — Static site generator
- **PaperMod** — Clean, fast theme
- **Pagefind** — Static search

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
  principles/        # Core principles
  about/             # About page
  contact/           # Contact info
  search/            # Pagefind search
```

## Features

- Auto light/dark theme (follows system)
- No comments, analytics, or tracking
- RSS feed at `/index.xml`
- Sitemap at `/sitemap.xml`
- robots.txt enabled
- Mobile-friendly, fast, SEO-optimized

## License

Content is copyright Andrew Hunter. Code structure is MIT.
