#include <MAUtil/Moblet.h>
#include <MAUtil/util.h>
#include <maapi.h>
#include <conprint.h>

extern "C" int MAMain()
{
	maSetColor(0xFF0000);
	maUpdateScreen();

	maSensorStart(SENSOR_TYPE_PROXIMITY, 100);
	int lastTime = 0;
	while (true) {
		MAEvent event;


		while(maGetEvent(&event)) {

			if (EVENT_TYPE_SENSOR == event.type) {
				char buffer[50], buffer1[50];
				maSetColor(0xFF0000);
				sprintf(buffer, "Proximity value: %f", event.sensor.values[0]);
				if (lastTime != 0) {
					sprintf(buffer1, "Delta time : %d ", maGetMilliSecondCount() - lastTime);
				}
				lastTime = maGetMilliSecondCount();

				maSetColor(0x000000);
				maFillRect(0, 0, 1000, 1000);

				maSetColor(0xFFFFFF);
				maFontSetCurrent(maFontLoadDefault(FONT_TYPE_SANS_SERIF, FONT_STYLE_NORMAL, 50));
				maDrawText(10, 10, "Proximity Test");
				maDrawText(10, 50, buffer);
				maDrawText(10, 90, buffer1);
				maUpdateScreen();
			}

		}
	}
};
