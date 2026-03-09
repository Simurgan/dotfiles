import Bluetooth from "gi://AstalBluetooth"

export function BluetoothWidget() {
  const bt = Bluetooth.get_default()

  return (
    <box class="card" vertical>
      <label class="title" label="Bluetooth" />
      <label label={bt?.enabled ? "Enabled" : "Disabled"} />
    </box>
  )
}
