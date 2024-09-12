package com.jnesis.rncap;

import android.content.Intent;

import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

import java.util.HashMap;
import java.util.Map;

@CapacitorPlugin(name = "RnPlugin")
public class RnPlugin extends Plugin {

    @PluginMethod()
    public void openView(PluginCall call) {
        Intent intent = new Intent(this.getActivity(), ReactNativeHelloWorldActivity.class);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

        this.getContext().startActivity(intent);
    }

  /**
   * Empty function to avoid error
   * @param call
   */
  @PluginMethod()
    public void setDevBundleUrl(PluginCall call) {
        call.resolve();
    }
}
