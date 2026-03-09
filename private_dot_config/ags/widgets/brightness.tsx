import { brightnessUp, brightnessDown } from "../lib/exec"

export function BrightnessWidget() {
  return (
    <box class="card" vertical>
      <label class="title" label="Brightness" />

      <box spacing={6}>
        <button class="button" onClicked={brightnessDown}>-</button>
        <button class="button" onClicked={brightnessUp}>+</button>
      </box>
    </box>
  )
}
