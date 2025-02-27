import { quickStart } from "../../services/docAi";

export function receipts() {
  // Create a simple status message element
  const createStatusMessage = () => {
    const statusDiv = document.createElement("div");
    statusDiv.id = "status-message";
    statusDiv.className = "mt-2 text-sm";
    return statusDiv;
  };

  // Add status message after file input
  const fileInput = document.getElementById("upload-file");
  if (fileInput) {
    const statusMessage = createStatusMessage();
    fileInput.parentNode?.appendChild(statusMessage);
  }

  // Update status message helper
  const updateStatus = (message: string, isError = false) => {
    const statusElement = document.getElementById("status-message");
    if (statusElement) {
      statusElement.textContent = message;
      statusElement.className = `mt-2 text-sm ${isError ? "text-red-500" : "text-green-500"}`;
    }
  };

  // Handle file upload
  const onReceiptUpload = async (event: Event) => {
    const fileInput = event.target as HTMLInputElement;
    const file = fileInput.files?.[0];

    if (!file) {
      updateStatus("Please select a file", true);
      return;
    }

    try {
      updateStatus("Processing receipt...");
      const arrayBuffer = await file.arrayBuffer();
      const buffer = Buffer.from(arrayBuffer);

      await quickStart();
      updateStatus("Receipt processed successfully!");
    } catch (error: unknown) {
      if (error instanceof Error) {
        updateStatus(`Error: ${error.message}`, true);
      } else {
        updateStatus("An unknown error occurred", true);
      }
    }
  };

  // // Add event listener when the DOM is loaded
  // document.addEventListener("DOMContentLoaded", () => {
  //   const uploadInput = document.getElementById("upload-file");
  //   if (uploadInput) {
  //     uploadInput.addEventListener("change", onReceiptUpload);
  //   }
  // });

  // Call processor on page load
  document.addEventListener("DOMContentLoaded", async () => {
    try {
      console.log("Starting receipt processing...");
      await quickStart();
      console.log("Receipt processing complete!");
    } catch (error) {
      console.error("Failed to process receipt:", error);
    }
  });
}
