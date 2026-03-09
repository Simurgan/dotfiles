import Network from "gi://AstalNetwork"

export function WifiWidget() {
  const net = Network.get_default()

  return (
    <box class="card" vertical>
      <label class="title" label="WiFi" />

      <label
        setup={(self) => {
          self.hook(net, () => {
            const wifi = net.wifi
            self.label = wifi?.ssid ?? "Disconnected"
          })
        }}
      />
    </box>
  )
}
