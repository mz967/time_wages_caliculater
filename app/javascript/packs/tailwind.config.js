module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/views/home/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/packs/*.js',
    './app/javascript/**/*.js',
    './app/javascript/**/**/*.js',
    './app/javascript/pages/*.js',
    './app/javascript/pages/*.vue',
    './app/javascript/pages/**/*.vue',
    './app/javascript/pages/**/**/*.vue',
    './app/javascript/pages/*.vue',
    './app/javascript/components/*.vue',,
    './app/javascript/*.vue'
  ],
  preserveHtmlElements: false,
  options: {
    defaultExtractor: (content) => {
      const contentWithoutStyleBlocks = content.replace(/<style[^]+?<\/style>/gi, '')
      return contentWithoutStyleBlocks.match(/[A-Za-z0-9-_/:]*[A-Za-z0-9-_/]+/g) || []
    },
    whitelist: [ /-(leave|enter|appear)(|-(to|from|active))$/, /^(?!cursor-move).+-move$/, /^router-link(|-exact)-active$/ ],
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [
    function({ addUtilities }) {
      const newUtilities = {
        ".text-shadow": {
          textShadow: "0px 2px 3px darkgrey"
        },
        ".text-shadow-md": {
          textShadow: "0px 3px 3px darkgrey"
        },
        ".text-shadow-lg": {
          textShadow: "0px 5px 3px darkgrey"
        },
        ".text-shadow-xl": {
          textShadow: "0px 7px 3px darkgrey"
        },
        ".text-shadow-2xl": {
          textShadow: "0px 10px 3px darkgrey"
        },
        ".text-shadow-none": {
          textShadow: "none"
        }
      };

      addUtilities(newUtilities);
    }
  ]

}
