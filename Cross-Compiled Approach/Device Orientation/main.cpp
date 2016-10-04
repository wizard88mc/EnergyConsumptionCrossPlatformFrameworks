#include <MAUtil/Moblet.h>
#include <MAUtil/util.h>
#include <maapi.h>
#include <conprint.h>

extern "C" int MAMain()
{
	maSetColor(0xFFFFFF);
	maFontSetCurrent(maFontLoadDefault(FONT_TYPE_SANS_SERIF, FONT_STYLE_NORMAL, 15));
	maDrawText(10, 10, "Rotation Test");
	maDrawText(10, 50, "Rotation X: 0.0");
	maDrawText(10, 90, "Rotation Y: 0.0");
	maDrawText(10, 130, "Rotation Z: 0.0");
	maDrawText(10, 170, "Delta time: 0.0");
	maUpdateScreen();

	maSensorStart(SENSOR_TYPE_GYROSCOPE, 64);
	//int lastTime = 0;
	while (true) {
		MAEvent event;


		while(maGetEvent(&event)) {

			if (EVENT_TYPE_SENSOR == event.type) {
				char buffer[50], buffer1[50], buffer2[50];//, buffer3[50];
				maSetColor(0xFF0000);
				sprintf(buffer, "Rotation X: %.5f", event.sensor.values[0]);
				sprintf(buffer1, "Rotation Y: %.5f", event.sensor.values[1]);
				sprintf(buffer2, "Rotation Z: %.5f", event.sensor.values[2]);
				/*if (lastTime != 0) {
					sprintf(buffer3, "Delta time: %d ", maGetMilliSecondCount() - lastTime);
				}
				lastTime = maGetMilliSecondCount();*/

				/*maSetColor(0x000000);
				maFillRect(0, 0, 1000, 1000);

				maSetColor(0xFFFFFF);

				maDrawText(10, 10, "Rotation Test");
				maDrawText(10, 50, buffer);
				maDrawText(10, 90, buffer1);
				maDrawText(10, 130, buffer2);
				//maDrawText(10, 170, buffer3);
				maUpdateScreen();*/
			}
		}
	}
};
