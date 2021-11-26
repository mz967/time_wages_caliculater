module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/**/*.html.slim',
    './app/helpers/**/*.rb',
    './app/javascript/packs/**/*.js',
    './app/javascript/packs/**/*.vue'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
