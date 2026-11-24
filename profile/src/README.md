# Profile artwork: source

`banner.html` draws the two pictures of the organization profile (`../assets/hero-*.png` and
`../assets/order-*.png`), each in a light and a dark version. Colours, radii and type follow the live site's
v5 "Tide Pool" tokens (`frontend/v5/assets/css/tokens.css` in the site repository).

To render them again:

1. Put `mona-sans.woff2` (the variable font, `wght` 200 to 900 and `wdth` 75 to 125, from
   <https://github.com/github/mona-sans>) in `fonts/` next to `banner.html`. The font file is not kept here.
2. Run `bash render.sh ../assets` with a headless Chromium (set `CHROME` to its path if it is not Playwright's
   `chromium_headless_shell-1247`). It writes four PNG files, 1760 px wide, with transparent corners.

The profile `README.md` loads the pictures by their raw addresses in this repository
(`raw.githubusercontent.com/Clawhunt-Site/.github/main/profile/assets/`). Keep the file names when you replace a
picture, or change the addresses in `../README.md` too.
