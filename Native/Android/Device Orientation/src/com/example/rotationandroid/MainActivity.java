package com.example.rotationandroid;

import android.support.v7.app.ActionBarActivity;
import android.support.v7.app.ActionBar;
import android.support.v4.app.Fragment;
import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.Spinner;
import android.widget.TextView;
import android.os.Build;

public class MainActivity extends ActionBarActivity implements SensorEventListener, OnItemSelectedListener {

	private boolean isRecording = false;
	private SensorManager mSensorManager = null;
	private Sensor mSensorRotationVector = null;
	private long lastTimestamp = 0;
	private int interval;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        getActionBar().hide();
        
        mSensorManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
        mSensorRotationVector = mSensorManager.getDefaultSensor(Sensor.TYPE_ROTATION_VECTOR);
        
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this, R.array.intervals, 
        		android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        ((Spinner)findViewById(R.id.interval)).setAdapter(adapter);
        
        ((Spinner)findViewById(R.id.interval)).setOnItemSelectedListener(this);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    public void buttonRecordData(View view) {
    	if (!isRecording) {
    		isRecording = true;
    		Log.d("INTERVAL_REGISTERED", Integer.toString(interval));
    		mSensorManager.registerListener(this, mSensorRotationVector, interval);
    	}
    	else {
    		isRecording = false;
    		mSensorManager.unregisterListener(this, mSensorRotationVector);
    	}
    }


	@Override
	public void onAccuracyChanged(Sensor arg0, int arg1) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void onSensorChanged(SensorEvent event) {
		
		CheckBox printData = (CheckBox)findViewById(R.id.printData);
		CheckBox printInterval = (CheckBox)findViewById(R.id.printTime);
		if (printData.isChecked()) {
			((TextView)findViewById(R.id.rotationX)).setText(String.format("%.5f",event.values[0]));
			((TextView)findViewById(R.id.rotationY)).setText(String.format("%.5f", event.values[1]));
			((TextView)findViewById(R.id.rotationZ)).setText(String.format("%.5f", event.values[2]));
		}
		if (printInterval.isChecked()) {
			if (lastTimestamp != 0) {
				((TextView)findViewById(R.id.delta)).setText(
						Float.toString((event.timestamp - lastTimestamp) / 1000000));
			}
			lastTimestamp = event.timestamp;
		}
		
	}

	@Override
	public void onItemSelected(AdapterView<?> parent, View view, int pos,
			long id) {
		// TODO Auto-generated method stub
		String selected = parent.getItemAtPosition(pos).toString();
		interval = Integer.parseInt(selected) * 1000;
		Log.d("INTERVAL", Integer.toString(interval));
	}


	@Override
	public void onNothingSelected(AdapterView<?> arg0) {
		// TODO Auto-generated method stub
		
	}

}
