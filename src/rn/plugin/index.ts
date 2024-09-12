import { registerPlugin } from '@capacitor/core';

interface SetDevBundleUrlOptions {
  url: string;
}

export interface RnPlugin {
  /**
   * iOS and Android only
   * This method will open the RN view
   *
   * @param options
   */
  openView(): Promise<void>;
}

const RN = registerPlugin<RnPlugin>('RnPlugin');

export default RN;
