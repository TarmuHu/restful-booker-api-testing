#!/bin/bash

# Define collection and data files
COLLECTION="restful-booker.postman_collection.json"

FAILED=0

# Function to run newman for a specific folder and data file
run_newman() {
    folder="$1"
    data_file="$2"
    echo "=========================================================="
    echo "Running tests for: $folder"
    echo "=========================================================="

    if [ -n "$data_file" ]; then
        npx newman run "$COLLECTION" --folder "$folder" -d "$data_file" || FAILED=1
    else
        npx newman run "$COLLECTION" --folder "$folder" || FAILED=1
    fi
    echo ""
}

# Run all test folders independently with their respective CSV data
run_newman "00. OPTIONS /all" ""
run_newman "01. POST /auth" "01-post-auth.csv"
run_newman "02. POST /booking" "02-post-booking.csv"
run_newman "03. GET /booking" "03-get-booking.csv"
run_newman "04. GET /booking/:id" "04-get-booking-id.csv"
run_newman "05. PUT /booking/:id" "05-put-booking.csv"
run_newman "06. PATCH /booking/:id" "06-patch-booking.csv"
run_newman "07. DELETE /booking/:id" "07-delete-booking.csv"
run_newman "08. GET /ping" ""

if [ $FAILED -ne 0 ]; then
    echo "Some tests failed!"
else
    echo "All tests passed successfully!"
fi
