import app from "ags/gtk4/app"

import { DateTime } from "../widgets/datetime"
import { BatteryWidget } from "../widgets/battery"
import { VolumeWidget } from "../widgets/volume"
import { BrightnessWidget } from "../widgets/brightness"
import { WifiWidget } from "../widgets/wifi"
import { BluetoothWidget } from "../widgets/bluetooth"
import { PowerWidget } from "../widgets/power"

export function Dashboard() {
  return (
    <window
      name="Dashboard"
      application={app}
      visible={false}
      class="popup"
      defaultWidth={420}
    >
      <box vertical spacing={10}>
        <DateTime />
        <BatteryWidget />
        <VolumeWidget />
        <BrightnessWidget />
        <WifiWidget />
        <BluetoothWidget />
        <PowerWidget />
      </box>
    </window>
  )
}
