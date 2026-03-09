import { execAsync } from "ags/process"

export const brightnessUp = () => execAsync("brightnessctl set 5%+")
export const brightnessDown = () => execAsync("brightnessctl set 5%-")

export const wifiToggle = () => execAsync("nmcli radio wifi off || nmcli radio wifi on")

export const bluetoothToggle = () =>
  execAsync("bluetoothctl power off || bluetoothctl power on")
