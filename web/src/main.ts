import { sideBar } from "./features/navigation/sidebar";
import { receipts } from "./features/receipts/receipts";

document.addEventListener("DOMContentLoaded", () => {
  // on load / mount initlize the sidebar
  sideBar();
  receipts();
});
