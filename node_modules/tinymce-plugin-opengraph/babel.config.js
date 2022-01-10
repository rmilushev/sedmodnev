module.exports = (api) => {
  api.cache(true)

  return {
    presets: [
      "@babel/env"
    ],
    plugins: [
      ["@babel/plugin-proposal-decorators", { legacy: true }],
    ]
  }
};
