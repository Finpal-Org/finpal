import { defineConfig } from 'vite'

export default defineConfig({
  // Add any specific configuration options you need
  server: {
    port: 3000
  },
  build: {
    target: 'esnext'
  }
}) 