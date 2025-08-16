module.exports = {
  darkMode: 'class',
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.{erb,haml,html,slim,rb}'
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          DEFAULT: '#0C4A6E',
          light: '#0ea5e9',
          dark: '#075985'
        },
        secondary: {
          DEFAULT: '#D97706',
          light: '#FBBF24',
          dark: '#B45309'
        }
      },
      fontFamily: {
        sans: ['Inter', 'Helvetica', 'Arial', 'sans-serif']
      }
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography')
  ]
}