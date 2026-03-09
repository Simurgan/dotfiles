import app from "ags/gtk4/app"
import { MediaWidget } from "../widgets/media"

export function MediaPopup() {
  return (
    <window
      name="Media"
      application={app}
      visible={false}
      class="popup"
    >
      <MediaWidget />
    </window>
  )
}
