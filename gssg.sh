#!/bin/bash

# Define urls and https
from_url=gholg.github.io
to_url=gholg.github.io

# Copy blog content
wget --recursive --no-host-directories --adjust-extension --timeout=30 --no-parent --convert-links ${from_url}/

# Copy 404 page
wget --no-host-directories --adjust-extension --timeout=30 --no-parent --convert-links --content-on-error --timestamping ${from_url}/404.html

# Copy sitemaps
wget --recursive --no-host-directories --adjust-extension --timeout=30 --no-parent --convert-links ${from_url}/sitemap.xsl
wget --recursive --no-host-directories --adjust-extension --timeout=30 --no-parent --convert-links ${from_url}/sitemap.xml
wget --recursive --no-host-directories --adjust-extension --timeout=30 --no-parent --convert-links ${from_url}/sitemap-pages.xml
wget --recursive --no-host-directories --adjust-extension --timeout=30 --no-parent --convert-links ${from_url}/sitemap-posts.xml
wget --recursive --no-host-directories --adjust-extension --timeout=30 --no-parent --convert-links ${from_url}/sitemap-authors.xml
wget --recursive --no-host-directories --adjust-extension --timeout=30 --no-parent --convert-links ${from_url}/sitemap-tags.xml

# Small fix for images' srcset property
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e 's,srcset="../content,srcset="../content,g' {} +; 
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e 's,jpeg,jpeg,g' {} +;
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e 's,jpeg,jpeg,g' {} +;
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e 's,jpeg,jpeg,g' {} +;
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e 's,jpg,jpg,g' {} +;
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e 's,jpg,jpg,g' {} +;
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e 's,jpg,jpg,g' {} +;
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e 's,png,png,g' {} +;
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e 's,png,png,g' {} +;
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e 's,png,png,g' {} +;

# Replace localhost with real domain
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e "s,http://${from_url},https://${to_url},g" {} +; 
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e "s,${from_url},${to_url},g" {} +
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e 's,https://www.gravatar.com,https://www.gravatar.com,g' {} +
