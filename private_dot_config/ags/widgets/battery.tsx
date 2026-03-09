import Battery from "gi://AstalBattery"

export function BatteryWidget() {
  const bat = Battery.get_default()
  const percentage = Math.round((bat?.percentage ?? 0) * 100)

  return (
    <box class="card" vertical>
      <label class="title" label="Battery" />
      <label label={`${percentage}%`} />
    </box>
  )
}
