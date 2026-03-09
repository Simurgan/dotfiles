import Battery from "gi://AstalBattery"

export function BatteryWidget() {
  const bat = Battery.get_default()

  return (
    <box class="card" vertical>
      <label class="title" label="Battery" />
      <label
        setup={(self) => {
          self.hook(bat, () => {
            self.label = `${Math.round(bat.percentage * 100)}%`
          })
        }}
      />
    </box>
  )
}
