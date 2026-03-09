import PowerProfiles from "gi://AstalPowerProfiles"

export function PowerWidget() {
  const power = PowerProfiles.get_default()

  return (
    <box class="card" vertical>
      <label class="title" label="Power Profile" />

      <label
        setup={(self) => {
          self.hook(power, () => {
            self.label = power.active_profile
          })
        }}
      />
    </box>
  )
}
