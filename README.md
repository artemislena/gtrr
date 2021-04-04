---
title: "GTRR"
is_draft: true
---

# GTRR

The Global Transgender Resources Registry ‒ A collaboratively made registry of webpages in Markdown containing useful information for transgender people around the world

For the post introducing the project, see [here](https://artemislena.eu/posts/2021/03/gtrr.html). The official instance is [here](https://gtrr.artemislena.eu).

## Contributing guidelines
* You may use both English and/or the native language of the country.
* Put things into the appropriate path, e.g. `country/region/city/` or `country/`.
* When linking to things within the registry, use relative paths, not absolute paths.
* Don't be a bigot; don't spread hate. Try to follow the [code of conduct](https://artemislena.eu/coc.html). Note: it contains some things specific to chatrooms on Matrix; these can be safely ignored.
* Be honest. Don't be shy to include criticism of inviduals or organizations, if said criticism mirrors your experiences.
* Please follow the file format requirements as specified below.
* You agree to the content you submit to be licensed under CC0.

## File format and style
The files are written in [Markdown](https://commonmark.org), and compiled by [Cobalt](https://cobalt-org.github.io).

### Frontmatter
Cobalt expects a frontmatter to be present at the top of the file. It should look like something like this:
```yaml
---
title: "Name of the country, region or city"
layout: gtrr.liquid
---
```

### Names of categories
To unify the categories in which entities are put, please refer to this alphabetically sorted, probably non-exhaustive list:
* Endocrinology
* Legal situation
* Hair removal
* Health insurance
* Holistic clinics
* Psychiatry and psychology
* Support and self-help groups and resources
* Surgery
* Voice

Feel free to translate them to your native language, and ideally adjust the sorting accordingly. If something's missing, feel free to suggest to add it via the usual routes of contribution.

### Language
You may use either English or a native language of the country you're writing about.
Use inclusive, gender-neutral language where possible and appropriate. Some languages may require special characters that would be recognized by Markdown, e.g. an asterisk (`*`) to do so; these need to be escaped by a 
backslash (`\`), i.e. `\*`.
