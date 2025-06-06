-- tailwindcss setup to use classRegex for tailwind classes
return {
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          "tw`([^`]*)",
        },
      },
    },
  }
}
