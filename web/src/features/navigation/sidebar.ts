export function sideBar() {
  // sidebar html contents
  const sideBar = `
 
    <div class="fixed h-full w-[150px] bg-green-500 py-5" id="navbar">
      <!-- Header -->
      <h2 class="mb-6 text-center text-white uppercase">Finpal</h2>
      <h4 class="mb-5 text-center text-sm text-white uppercase" id="userName">
        <!-- todo put username here from auth  {{displayName}}-->

      </h4>

      <!-- Navigation -->
      <ul class="flex flex-col gap-6">
        <li
          class="flex items-center gap-2.5  border-b border-black/10 border-white/10 p-4 text-white hover:bg-black/30"
        >
          <img src="/assets/nvb-home.png" alt="home icon" class="h-5 w-5" />
          <a href="#">Home</a>
        </li>
        <li
          class="flex items-center gap-2.5  border-b border-black/10 border-white/10 p-4 text-white hover:bg-black/30"
        >
          <img
            src="/assets/nvb-receipt.png"
            alt="receipts icon"
            class="h-5 w-5"
          />
          <a href="#">Receipts</a>
        </li>
        <li
          class="flex items-center gap-2.5  border-b border-black/10 border-white/10 p-4 text-white hover:bg-black/30"
        >
          <img
            src="/assets/nvb-analysis.png"
            alt="analysis icon"
            class="h-5 w-5"
          />
          <a href="#">Analysis</a>
        </li>
        <li
          class="flex items-center gap-2.5  border-b border-black/10 border-white/10 p-4 text-white hover:bg-black/30"
        >
          <img
            src="/assets/nvb-reports.png"
            alt="reports icon"
            class="h-5 w-5"
          />
          <a href="#">Reports</a>
        </li>
        <li
          class="flex items-center gap-2.5  border-b border-black/10 border-white/10 p-4 text-white hover:bg-black/30"
        >
          <img
            src="/assets/nvb-settings.png"
            alt="settings icon"
            class="h-5 w-5"
          />
          <a href="#">Settings</a>
        </li>
      </ul>

      <!-- Footer -->
      <footer class="flex items-center justify-center">
        <img src="/assets/finpal.png" alt="logo" class="mt-4 h-20 w-20" />
      </footer>
    </div>
  `;
  // create div container
  const sideBarContainer: HTMLElement | null =
    document.getElementById("sideBar");
  //move sidebar inside container
  if (sideBarContainer) {
    sideBarContainer.innerHTML = sideBar;
    //add container to html body
    document.body.prepend(sideBarContainer);
  }
}
