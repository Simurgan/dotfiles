import Network from "gi://AstalNetwork"

export function WifiWidget() {
  const net = Network.get_default()
  const ssid = net?.wifi?.ssid ?? "Disconnected"

  return (
    <box class="card" vertical>
      <label class="title" label="WiFi" />
      <label label={ssid} />
    </box>
  )
}
