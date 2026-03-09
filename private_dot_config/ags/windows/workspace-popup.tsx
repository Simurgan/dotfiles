import app from "ags/gtk4/app"
import { WorkspaceWidget } from "../widgets/workspaces"

export function WorkspacePopup() {
  return (
    <window
      name="WorkspaceOverview"
      application={app}
      visible={false}
      class="popup"
    >
      <WorkspaceWidget />
    </window>
  )
}
