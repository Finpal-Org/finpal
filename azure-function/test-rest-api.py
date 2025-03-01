# Import required libraries
import os
import requests
import json
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Get Azure credentials
endpoint = os.getenv("AZURE_ENDPOINT")
key = os.getenv("AZURE_KEY")

print("Endpoint:", endpoint)
print("Key:", key)

# Function to test the REST API directly
def test_rest_api():
    # First, let's check what models are available
    models_url = f"{endpoint}/formrecognizer/documentModels?api-version=2023-07-31"
    
    headers = {
        "Ocp-Apim-Subscription-Key": key,
        "Content-Type": "application/json"
    }
    
    print("\nChecking available models...")
    try:
        response = requests.get(models_url, headers=headers)
        print(f"Status code: {response.status_code}")
        
        if response.status_code == 200:
            models = response.json()
            print("Available models:")
            print(json.dumps(models, indent=2))
        else:
            print(f"Error response: {response.text}")
    except Exception as e:
        print(f"Error checking models: {e}")
    
    # Now let's try to analyze a receipt using the REST API
    analyze_url = f"{endpoint}/formrecognizer/documentModels/prebuilt-receipt:analyze?api-version=2023-07-31"
    
    # Path to the receipt file
    receipt_path = "assets/receipt1.jpg"
    
    print(f"\nChecking if file exists: {os.path.exists(receipt_path)}")
    
    # Prepare the request todo problem
    with open(receipt_path, "rb") as f:
        receipt_data = f.read()
    
    headers = {
        "Ocp-Apim-Subscription-Key": key,
        "Content-Type": "image/jpeg"
    }
    
    print("\nAnalyzing receipt using REST API...")
    try:
        response = requests.post(analyze_url, headers=headers, data=receipt_data)
        print(f"Status code: {response.status_code}")
        
        if response.status_code == 202:  # Accepted, operation started
            operation_location = response.headers.get("Operation-Location")
            print(f"Operation started at: {operation_location}")
            
            # Poll the operation until it's complete
            if operation_location:
                poll_headers = {
                    "Ocp-Apim-Subscription-Key": key
                }
                
                print("\nPolling operation...")
                operation_response = requests.get(operation_location, headers=poll_headers)
                print(f"Poll status code: {operation_response.status_code}")
                print(f"Poll response: {operation_response.text}")
        else:
            print(f"Error response: {response.text}")
    except Exception as e:
        print(f"Error analyzing receipt: {e}")

if __name__ == "__main__":
    test_rest_api()  #todo problem prolly causility