#!/bin/sh
set -e

/app/tailscaled \
  --tun=userspace-networking \
  --netfilter-mode=off \
  --state=/var/lib/tailscale/tailscaled.state \
  --socket=/var/run/tailscale/tailscaled.sock &

sleep 3

/app/tailscale up \
  --authkey=${TAILSCALE_AUTHKEY} \
  --ssh \
  --hostname=koyeb-app \
  --accept-dns=false
