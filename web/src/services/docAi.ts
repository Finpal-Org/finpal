/**
 * TODO: (developer): Uncomment these variables before running the sample.
 */
const projectId = "finpal-451711";
const location = "eu"; // Format is 'us' or 'eu'
const processorId = "a9d26931cb6e448d"; // Create processor in Cloud Console
// const filePath = "C:/Users/unrankedalzahrani/Documents/receipt1.pdf"; //todo currently not usable
const filePath = "web/src/receipts/test-data/receipt1.pdf";
// enpoint : https://eu-documentai.googleapis.com/v1/projects/547101394128/locations/eu/processors/a9d26931cb6e448d:process

// whats this?
const { DocumentProcessorServiceClient } =
  require("@google-cloud/documentai").v1;

// Instantiates a client | apiEndpoint regions available: eu-documentai.googleapis.com, us-documentai.googleapis.com (Required if using eu based processor)
const client = new DocumentProcessorServiceClient({
  apiEndpoint: "eu-documentai.googleapis.com",
});

export async function quickStart(): Promise<void> {
  try {
    if (!projectId || !location || !processorId) {
      throw new Error(
        "Missing required configuration: projectId, location, or processorId",
      );
    }

    // The full resource name of the processor
    const name = `projects/${projectId}/locations/${location}/processors/${processorId}`;

    // Read the file into memory with error handling
    const fs = require("fs").promises;
    let imageFile;
    try {
      imageFile = await fs.readFile(filePath);
    } catch (error: unknown) {
      if (error instanceof Error) {
        throw new Error(`Failed to read file: ${error.message}`);
      } else {
        throw new Error("Failed to read file: Unknown error");
      }
    }

    if (!imageFile) {
      throw new Error("No file content found");
    }

    // Convert the image data to a Buffer and base64 encode it.
    // File → Buffer (container for binary)
    // Buffer → Base64 (binary to text)
    // from img -> text
    const encodedImage = Buffer.from(imageFile).toString("base64");

    const request = {
      name,
      rawDocument: {
        content: encodedImage,
        mimeType: "application/pdf",
      },
    };

    // Recognizes text entities in the PDF document
    const [result] = await client.processDocument(request);
    const { document } = result;

    // Get all of the document text as one big string
    const { text } = document;

    type textSegments = {
      startIndex: string;
      endIndex: string;
    };

    // Extract text segments
    const getText = (textAnchor: {
      //this is ts shape, arr of testSeg objs
      textSegments: textSegments[];
    }) => {
      if (!textAnchor.textSegments || textAnchor.textSegments.length === 0) {
        return "";
      }

      // First shard in document doesn't have startIndex property
      const startIndex = textAnchor.textSegments[0].startIndex || 0;
      const endIndex = textAnchor.textSegments[0].endIndex;

      //substring from startIndex to endIndex
      return text.substring(startIndex, endIndex);
    };

    // Read the text recognition output from the processor
    console.log("The document contains the following paragraphs:");
    const [page1] = document.pages;
    const { paragraphs } = page1;

    // for each paragraph, get the text
    for (const paragraph of paragraphs) {
      const paragraphText = getText(paragraph.layout.textAnchor);
      console.log(`paragraph Text: \n ${paragraphText}`);
    }

    // Add error checking for document processing result
    if (
      !result ||
      !document ||
      !document.pages ||
      document.pages.length === 0
    ) {
      throw new Error("Invalid document processing result");
    }
  } catch (error: unknown) {
    if (error instanceof Error) {
      console.error("Error in quickStart:", error.message);
      throw error;
    }
    // If it's not an Error object, convert it to one
    throw new Error(
      typeof error === "string" ? error : "An unknown error occurred",
    );
  }
}

// Update the execution block with better error handling
try {
  console.log("Starting document processing...");
  await quickStart();
  console.log("Document processed successfully!");
} catch (error: unknown) {
  if (error instanceof Error) {
    console.error("Failed to process document:", {
      message: error.message,
      stack: error.stack,
    });
  } else {
    console.error("Failed to process document:", {
      message: "An unknown error occurred",
      error: String(error),
    });
  }
}
