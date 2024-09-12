package com.jnesis.rncap;

import android.os.Bundle;

import com.getcapacitor.BridgeActivity;

public class MainActivity extends BridgeActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        registerPlugin(RnPlugin.class);
        super.onCreate(savedInstanceState);
    }
}
