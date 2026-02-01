/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class',
  content: [
    './hugo_stats.json',
    './layouts/**/*.html',
    './content/**/*.md',
  ],
  theme: {
    extend: {
      colors: {
        'automation-blue': '#2563eb',
        'automation-green': '#10b981',
      },
    },
  },
  plugins: [],
}
