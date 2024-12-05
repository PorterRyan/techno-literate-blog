const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    baseUrl: 'https://www.techno-literate.com',
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
  },
});
