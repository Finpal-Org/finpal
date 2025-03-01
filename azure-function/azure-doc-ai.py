# import libraries
import os
#REST api imports
import requests
import time
#ENV 
from dotenv import load_dotenv

load_dotenv()

#Endpoint & Key from azur
endpoint = os.getenv("AZURE_ENDPOINT")
key = os.getenv("AZURE_KEY")


def analyze_receipt():
    # Path to the receipt file - make sure this is the correct path and a < 4mb size  
    receipt_path = "assets/receipt1.jpg"
        
    # Open the receipt file in binary mode ,todo why is it needed?
    with open(receipt_path, "rb") as f:
        # Read the file content
        receipt_data = f.read()
        
        print(f"File size: {len(receipt_data) / (1024 * 1024):.2f} MB")
                
       
        #exact url from azure docs
        analyze_url = f"{endpoint}/formrecognizer/documentModels/prebuilt-receipt:analyze?api-version=2023-07-31"
        #these are info azure needs to be passed in post request
        headers = {
            "Ocp-Apim-Subscription-Key": key,
            "Content-Type": "image/jpeg"
        }
        
        print("\nAnalyzing receipt using direct REST API...")
        try:
            # Step 1: Send the image to Azure for analysis
            response = requests.post(analyze_url, headers=headers, data=receipt_data)
            print(f"Status code: {response.status_code}")
            
            if response.status_code == 202:  # operation Accepted, operation started
                # Get the operation-location URL to check the operation status (ticket number) 
                operation_location = response.headers.get("Operation-Location")
                print(f"Operation started at: {operation_location}")
                
                # Step 2: Poll until the analysis is complete 
                if operation_location:
                    poll_headers = {
                        "Ocp-Apim-Subscription-Key": key
                    }
                    #(repeated checking)
                    print("\nPolling operation...")
                    for _ in range(10):  # Poll up to 10 times, doesnt actually drain request
                        time.sleep(2)  # Wait 2 seconds between polls
                        #result?
                        operation_response = requests.get(operation_location, headers=poll_headers)
                        print(f"Poll status code: {operation_response.status_code}")
                        
                        if operation_response.status_code == 200:#operation result returned
                            # result in json? TODO: extract need fields only from this complex result
                            result = operation_response.json()
                            status = result.get("status")
                            print(f"Operation status: {status}")

                            if status == "succeeded":
                                print("Analysis succeeded!")
                                extracted= extracted_result(result)
                                print("Results:", extracted) #show results
                                break
                            elif status == "failed":
                                print("Analysis failed:", extracted)
                                break
                        else:
                            print(f"Error response: {operation_response.text}")
                            break
            else:
                print(f"Error response: {response.text}")
        except Exception as e:
            print(f"Error with REST API call: {e}")


def extracted_result(result):
    #extract only needed fields from azure results
    extracted = {}


    try: 
        #navigate to doc fields (todo , {})
        documents = result.get("analyzeResult",{}).get("documents",[])
        if not documents:
            return{"error": "No docs found in azure result"}

        #1st document (the Result)
        fields = documents[0].get("fields",{})

        # 1.Needed fields & mapping names (renaming azure's naming to our preffered naming)
        field_mapping = {
            #left is our name: right is azure's naming
            "merchantName" : "MerchantName",
            "address": "MerhcnatAddress",
            "phone": "MerchantPhoneNumber",
            "date": "TransactionDate",
            "time": "TransactionTime",
            "total":"Total",
            "subtotal": "Subtotal",
            "receiptType": "ReceiptType",
            "country": "CountryRegion"
        }

        # 2. extract value & confidence fields
        for our_field, azure_field in field_mapping.items():
            if azure_field in fields: #if u found azure field
                field_obj= fields[azure_field] #azure field added to field_obj 

                extracted[our_field]={  #in extracted , match extracted field data from azure(value,confidence) to our_field 
                    "value":field_obj.get("content",""),
                    "confidence": field_obj.get("confidence",0)
                }

        # 3. COMPLEX ITEM HANDLING todo skip
        # if "Items" in fields:


    #exception
    except Exception as e:
        return {"error": f"Extracting fields error: {str(e)}" }

    return extracted
# end of extracted_result   


# Run the function when script is executed directly
if __name__ == "__main__":
    analyze_receipt()