export function receipts() {
  // sidebar html contents
  const receipts = `
      <section
      class="mx-20 flex h-screen min-h-full flex-col items-center gap-10 border-red-500"
    >
      <!-- #1 -->
      <div class="receipt m-20 flex gap-10 border-red-500">
        <span>Title</span><span>Img</span><span>Details</span>
      </div>
      <!-- #2 -->
      <div class="receipt flex gap-10 border-red-500">
        <span>Title</span><span>Img</span><span>Details</span>
      </div>
    </section>
  `;
  // create div container
  const receiptsContainer: HTMLElement | null =
    document.getElementById("receipts-container");
  //move sidebar inside container
  if (receiptsContainer) {
    receiptsContainer.innerHTML = receipts;
    //add container to html body
    document.body.prepend(receiptsContainer);
  }
}
