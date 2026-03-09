import PowerProfiles from "gi://AstalPowerProfiles"

export function PowerWidget() {
  const power = PowerProfiles.get_default()

  return (
    <box class="card" vertical>
      <label class="title" label="Power Profile" />
      <label label={power?.active_profile ?? "unknown"} />
    </box>
  )
}
