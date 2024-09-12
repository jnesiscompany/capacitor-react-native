const {getDefaultConfig, mergeConfig} = require("@react-native/metro-config");

/**
 * Metro configuration
 * https://facebook.github.io/metro/docs/configuration
 *
 * @type {import("metro-config").MetroConfig}
 */

const defaultConfig = getDefaultConfig(__dirname);

const config = {
  transformer: {
    getTransformOptions: async () => ({
      transform: {
        experimentalImportSupport: false,
        inlineRequires: true,
      },
    }),
  },
  resolver: {
    assetExts: [
      ...defaultConfig.resolver.assetExts,
      "JPG",
      "bin",
      "gif",
      "lib",
    ]
  },
};

module.exports = mergeConfig(defaultConfig, config);
