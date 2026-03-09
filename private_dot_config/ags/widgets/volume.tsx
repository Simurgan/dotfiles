import { execAsync } from "ags/process"

const DEFAULT_SINK = "@DEFAULT_AUDIO_SINK@"

async function getVolume() {
  const output = await execAsync(`wpctl get-volume ${DEFAULT_SINK}`)
  const match = output.match(/([0-9]+(?:\.[0-9]+)?)/)

  if (!match) return 0

  return Math.max(0, Math.min(1, Number(match[1])))
}

function setVolume(value: number) {
  const percent = Math.round(Math.max(0, Math.min(1, value)) * 100)

  return execAsync(`wpctl set-volume ${DEFAULT_SINK} ${percent}%`)
}

export function VolumeWidget() {
  return (
    <box class="card" vertical>
      <label class="title" label="Volume" />

      <slider
        hexpand
        drawValue
        setup={(self) => {
          const refresh = () => {
            void getVolume().then((value) => {
              self.value = value
            })
          }

          refresh()
          const interval = setInterval(refresh, 2000)

          self.connect("change-value", (_, __, value) => {
            void setVolume(value)
          })

          self.connect("destroy", () => {
            clearInterval(interval)
          })
        }}
      />
    </box>
  )
}
