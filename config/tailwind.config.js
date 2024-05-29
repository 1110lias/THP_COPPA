const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        'sans': ['Sansita', ...defaultTheme.fontFamily.sans],
        'serif': ['Scope One', ...defaultTheme.fontFamily.serif],
        'mono': ['Thasadith', ...defaultTheme.fontFamily.mono]
      },
      colors: {
        'white': '#FFFCFC',
        'black': '#171414'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
