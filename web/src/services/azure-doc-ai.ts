// import { AnonymousCredential, BlobServiceClient } from "@azure/storage-blob";
// import DocumentIntelligence, {
//   isUnexpected,
//   getLongRunningPoller,
// } from "@azure-rest/ai-document-intelligence";
// import { azureKey, azureEndPoint } from "./azure-secure.ts";
// import { AzureKeyCredential } from "@azure/core-auth";
// // import { StorageSharedKeyCredential } from "@azure/storage-blob";

// // Key & Endpoint (hidden)
// const key = azureKey;
// const endpoint = azureEndPoint;

// // receipt location
// const receiptUrl =
//   "https://raw.githubusercontent.com/Azure-Samples/cognitive-services-REST-api-samples/master/curl/form-recognizer/rest-api/receipt.png";

// // Local Azurite URL
// const localUrl = "http://127.0.0.1:10000/devstoreaccount1";

// const connectionString =
//   "DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://127.0.0.1:10000/devstoreaccount1;";

// const blobServiceClient =
//   BlobServiceClient.fromConnectionString(connectionString);

// // async function StoreReceiptLocally(receiptUrl: string) {
// //   try {
// //     // 1. Create client with direct local URL (browser-friendly)

// //     // 2. Create a container for client
// //     const containerName = "receipts";
// //     const containerClient = blobServiceClient.getContainerClient(containerName);
// //     await containerClient.createIfNotExists();

// //     //3. use blob blocks for small chunks of data
// //     const blobName = `receipt-${Date.now()}.png`; //todo png?
// //     const blockBlobClient = containerClient.getBlockBlobClient(blobName);

// //     // 4. Download from URL and upload to local storage
// //     const response = await fetch(receiptUrl); //fetch receipt via url
// //     const blob = await response.blob(); // convert response into blob
// //     await blockBlobClient.uploadData(blob); //upload blob to local storage

// //     // 5. Return the local URL
// //     return blockBlobClient.url;
// //   } catch (error) {
// //     console.error("Error Locally storing receipt: " + error);
// //     throw error;
// //   }
// // }

// async function main() {
//   // endpoint / new key
//   const client = DocumentIntelligence(endpoint, new AzureKeyCredential(key));

//   // get client response-
//   const initialResponse = await client
//     .path("/documentModels/{modelId}:analyze", "prebuilt-receipt")
//     // post this info to azure
//     .post({
//       contentType: "application/json",
//       body: {
//         // URL to the receipt image to extract data from it
//         urlSource: receiptUrl,
//       },
//     });

//   // throw unexpected error
//   if (isUnexpected(initialResponse)) {
//     throw initialResponse.body.error;
//   }

//   // poller response
//   const poller = await getLongRunningPoller(client, initialResponse);

//   // result (wait for poller) -> in analyze result
//   const result = await poller.pollUntilDone(); // TODO: poll is the problem

//   const analyzeResult = result.body.analyzeResult;

//   // get documents of results
//   const documents = analyzeResult?.documents;

//   //get first result in documents
//   const document = documents && documents[0];

//   // log result fields
//   if (document) {
//     console.log(document.fields);
//   } else {
//     console.log("Expected atleast 1 receipt in result");
//   }

//   console.log(
//     "Extracted Receipts:",
//     document.doctype,
//     `(confidance: ${document.confidence || "<undefined>"})`,
//   );
//   console.log("Fields: ", document.fields);
// }

// //1. Call Cors authentation first
// // enableCors().catch(console.error);

// //2. Call the local storage (azurite)
// // StoreReceiptLocally(receiptUrl);
// //   .then((url) => console.log("Receipt stored at:", url))
// //   .catch((error) => console.error("Failed to store receipt:", error));

// // TODO: dummy data same format json as this receipt (to not drain limit )
// //3. Call Azure doc ai extraction
// // main().catch((error) => {
// //   console.log("Failed to extract: ", error);
// // });

// export { main };
