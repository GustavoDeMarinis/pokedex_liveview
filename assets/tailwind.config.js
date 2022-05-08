// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
module.exports = {
  content: ["./js/**/*.js", "../lib/*_web.ex", "../lib/*_web/**/*.*ex"],
  theme: {
    colors: {
      stone: {
        100: "#f5f5f4",
        200: "#e7e5e4",
        300: "#d6d3d1",
        400: "#919191",
        500: "#78716c",
        600: "#57534e",
        700: "#44403c",
        800: "#313131",
        900: "#1c1917",
      },
      white: "#fff",
      babyblue: "#30a7d7",
    },
    extend: {
      fontFamily: {
        sans: "Flexo Light",
      },
    },
  },
  plugins: [require("@tailwindcss/forms")],
};
