# docker-md2html

Dockerized version of [markdown2html-converter](https://github.com/magiclen/markdown2html-converter) for generating basic self-contained HTML from GFM.

Example generation of HTML:

    docker run --rm -v "$(pwd):/data" njaldwin/md2html --no-mathjax --no-cjk-fonts --force --title "md2html" README.md

Example `Dockerfile` to serve HTML generated from a markdown file:

```Dockerfile
FROM njaldwin/md2html AS builder
COPY README.md /data/
RUN markdown2html-converter --no-mathjax --no-cjk-fonts --force --title "md2html" /data/README.md

FROM nginx:1.21.4-alpine
COPY --from=builder /data/README.html /usr/share/nginx/html/index.html
```
