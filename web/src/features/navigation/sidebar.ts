export function sideBar() {
  // sidebar html contents
  const sideBar = `
    <div
        id="navbar"
        class="bg-primary-900 fixed flex h-full w-40 flex-col justify-between rounded-r-2xl py-5 shadow-xl shadow-black/50"
      >
        <div>
          <!-- Header -->
          <div>
            <h1
              class="mb-3 text-center text-2xl font-bold text-white uppercase"
            >
              Finpal
            </h1>
            <h4
              class="mb-5 text-center text-sm text-white uppercase opacity-75"
              id="userName"
            ></h4>
          </div>
          <!-- Navigation -->
          <ul class="flex flex-col ">
            <li
                           class="flex cursor-pointer items-center gap-2.5 border-b border-black/10 border-white/10 pl-4 py-2 text-white hover:bg-black/10 transition-colors ease-in-out duration-500"

            >
              <img src="/assets/nvb-home.png" alt="home icon" class="h-5 w-5" />
              <a
                href="/web/src/features/authentication/login/login.html"
                class="flex h-full w-full p-4"
                >Home</a
              >
            </li>
            <li
                           class="flex cursor-pointer items-center gap-2.5 border-b border-black/10 border-white/10 pl-4 py-2 text-white hover:bg-black/10 transition-colors ease-in-out duration-500"

            >
              <img
                src="/assets/nvb-receipt.png"
                alt="receipts icon"
                class="h-5 w-5"
              />
              <a
                href="/web/src/features/receipts/receipts.html"
                class="flex h-full w-full p-4"
                >Receipts</a
              >
            </li>
            <li
                           class="flex cursor-pointer items-center gap-2.5 border-b border-black/10 border-white/10 pl-4 py-2 text-white hover:bg-black/10 transition-colors ease-in-out duration-500"

            >
              <img
                src="/assets/nvb-analysis.png"
                alt="analysis icon"
                class="h-5 w-5"
              />
              <a href="#" class="flex h-full w-full p-4">Analysis</a>
            </li>
            <li
                           class="flex cursor-pointer items-center gap-2.5 border-b border-black/10 border-white/10 pl-4 py-2 text-white hover:bg-black/10 transition-colors ease-in-out duration-500"

            >
              <img
                src="/assets/nvb-reports.png"
                alt="reports icon"
                class="h-5 w-5"
              />
              <a href="#" class="flex h-full w-full p-4">Reports</a>
            </li>
            <li
                           class="flex cursor-pointer items-center gap-2.5 border-b border-black/10 border-white/10 pl-4 py-2 text-white hover:bg-black/10 transition-colors ease-in-out duration-500"

            >
              <img
                src="/assets/nvb-settings.png"
                alt="settings icon"
                class="h-5 w-5"
              />
              <a href="#" class="flex h-full w-full p-4">Settings</a>
            </li>
          </ul>
        </div>

        <div>
          <!-- Footer -->
          <footer class="flex items-center justify-center">
            <img src="/assets/finpal.png" alt="logo" class="mt-4 h-20 w-20" />
          </footer>
        </div>
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
