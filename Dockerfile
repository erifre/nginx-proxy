FROM nginxproxy/nginx-proxy:alpine as builder

# Install patch
RUN apk --no-cache add patch

# Copy all patches and patching script
COPY patcher.sh /app/
COPY patches /app/patches

# Patch!
WORKDIR /app
RUN ./patcher.sh

# Use a clean image and copy the build template
FROM nginxproxy/nginx-proxy:alpine

COPY --from=builder /app/nginx.tmpl /app/nginx.tmpl
