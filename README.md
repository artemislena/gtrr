---
title: "GTRR"
is_draft: true
---

# GTRR

The Global Transgender Resources Registry ‒ A collaboratively made registry of webpages in Markdown containing useful information for transgender people around the world

For the post introducing the project, see [here](https://fantasycookie17.cf/posts/2021/03/gtrr.html).

## Contributing guidelines
* You may use both English and/or the native language of the country.
* Put things into the appropriate path, e.g. `country/region/city/` or `country/`.
* When linking to things within the registry, use relative paths, not absolute paths.
* Don't be a bigot; don't spread hate. Try to follow the [code of conduct](https://fantasycookie17.cf/coc.html). Note: it contains some things specific to chatrooms on Matrix; these can be safely ignored.
* Be honest. Don't be shy to include criticism of inviduals or organizations, if said criticism mirrors your experiences.
* Please follow the file format requirements as specified below.
* You agree to the content you submit to be licensed under CC0.

## File format
The files are written in [Markdown](https://commonmark.org), and compiled by [Cobalt](https://cobalt-org.github.io). As for the latter, a specific "frontmatter" is expected to be present at the top of the page:

For cities and certain regions without any further division, something like this would suffice:
```yaml
---
title: "Name of the region or city (in the language the page is written in)"
---
```

For larger regions and countries, use this:
```yaml
---
title: "Name as above"
layout: gtrr.liquid
---
```