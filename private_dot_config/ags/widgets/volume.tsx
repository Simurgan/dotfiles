import WirePlumber from "gi://AstalWirePlumber"

export function VolumeWidget() {
  const wp = WirePlumber.get_default()
  const speaker = wp.default_speaker

  return (
    <box class="card" vertical>
      <label class="title" label="Volume" />

      <slider
        hexpand
        drawValue
        setup={(self) => {
          self.value = speaker.volume

          self.connect("change-value", (_, __, value) => {
            speaker.volume = value
          })
        }}
      />
    </box>
  )
}
