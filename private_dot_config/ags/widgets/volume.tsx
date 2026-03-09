import { execAsync } from "ags/process"

const DEFAULT_SINK = "@DEFAULT_AUDIO_SINK@"

const volumeUp = () => execAsync(`wpctl set-volume ${DEFAULT_SINK} 5%+`)
const volumeDown = () => execAsync(`wpctl set-volume ${DEFAULT_SINK} 5%-`)

export function VolumeWidget() {
  return (
    <box class="card" vertical>
      <label class="title" label="Volume" />
      <box spacing={6}>
        <button class="button" onClicked={volumeDown}>-</button>
        <button class="button" onClicked={volumeUp}>+</button>
      </box>
    </box>
  )
}
