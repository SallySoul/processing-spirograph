#!/usr/bin/env sh

# Ensure target dir exists
#rm -rf target/web
mkdir -p target/web

# Install index.html and processing.min.js
cp src_web/index.html src_web/processing.min.js target/web

# Build Spirograph.pde
cat Spirographs/* > target/web/Spirograph.pde
