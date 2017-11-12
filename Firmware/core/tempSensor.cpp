#include "tempSensor.h"
#include "Average.h"
#include "HAL.h"
#include "config.h"
#include "settings.h"

namespace core {
namespace tempSensor {

float calcTemperature(int raw_reading) {
    return settings.tipParams.offset + settings.tipParams.gain * static_cast<float>(raw_reading);
}

float getAveragedTemperature() {
    libs::Average<float, config::tempAverages> temperatureAverage;

    for (size_t i = 0; i < temperatureAverage.size(); ++i) {
        uint16_t raw_reading = HAL::Tip::readRaw();
        float temperature = calcTemperature(raw_reading);
        temperatureAverage.put(temperature);
    }
    return temperatureAverage.get();
}

}  // namespace tempSensor
}  // namespace core
