# GTRR

The Global Transgender Resources Registry ‒ A collaboratively made registry of webpages in Markdown containing useful information for transgender people around the world

For the post introducing the project, see [here](https://artemislena.eu/posts/2021/03/gtrr.html). The official instance is [here](https://gtrr.artemislena.eu).

## Contributing guidelines
* You may use English and/or the native language of the country.
* Put things into the appropriate path, e.g. `country/region/city/` or `country/`.
* When linking to things within the registry, use relative paths, not absolute paths.
* Don't be a bigot; don't spread hate. Try to follow the [code of conduct](https://artemislena.eu/coc.html).
* Be honest. Don't be shy to include criticism of inviduals or organizations, if said criticism mirrors your experiences.
* Please follow the file format requirements as specified below.
* You agree to the content you submit to be licensed under CC0.

## File format and style
The files are written in [Markdown](https://commonmark.org), and compiled by [Cobalt](https://cobalt-org.github.io).

### Frontmatter
If your file is written in a different language than English, please include a frontmatter like this at the top of your file:
```yaml
---
data: {lang: "de"}
---
```
Substitute `de` with the common two-letter shortcode of the language you used.

### Names of categories
To unify the categories in which entities are put, please refer to this probably non-exhaustive list:
* Accessoires (e.g. packers, binders, padding, tucking equipment)
* Legal situation
* Hair removal
* Health insurances
* Holistic clinics
* Hormone therapy
* Psychotherapy and indications
* Support groups and resources
* Surgery
* Voice
* Other (e.g. events, bars)

Feel free to translate them to your native language, and ideally adjust the sorting accordingly. If something's missing, feel free to suggest to add it via the usual routes of contribution.

### Language
You may use either English or a native language of the country you're writing about.
Use inclusive, gender-neutral language where possible and appropriate. Some languages may require special characters that would be recognized by Markdown, e.g. an asterisk (`*`) to do so; these need to be escaped by a 
backslash (`\`), i.e. `\*`.

### Non-recommended options
You may specifically disrecommend certain people and institutions. If you decide to link to their website, please set `rel="nofollow"` on the `<a>` then (in case you're not experienced enough with Markdown/HTML to do that, just ask us).
