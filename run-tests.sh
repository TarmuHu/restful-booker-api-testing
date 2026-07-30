#!/bin/bash

# 1. Define collection file
COLLECTION="restful-booker.postman_collection.json"

FAILED=0

# 2. Create reports directory
mkdir -p reports

# 3. Run newman for a specific folder
run_newman() {
    folder="$1"
    data_file="$2"

    # 3.1 Generate safe file name for reports
    safe_name=$(echo "$folder" | tr ' /:' '-')
    echo "=== Running tests for: $folder ==="

    if [ -n "$data_file" ]; then
        npx newman run "$COLLECTION" --folder "$folder" -d "$data_file" \
            -r cli,htmlextra,junitfull \
            --reporter-htmlextra-export "reports/${safe_name}-report.html" \
            --reporter-junitfull-export "reports/${safe_name}-report.xml" || FAILED=1
    else
        npx newman run "$COLLECTION" --folder "$folder" \
            -r cli,htmlextra,junitfull \
            --reporter-htmlextra-export "reports/${safe_name}-report.html" \
            --reporter-junitfull-export "reports/${safe_name}-report.xml" || FAILED=1
    fi
    echo ""
}

# 4. Run all tests independently
run_newman "01. POST /auth" "01-post-auth.csv"
run_newman "02. POST /booking" "02-post-booking.csv"
run_newman "03. GET /booking" "03-get-booking.csv"
run_newman "04. GET /booking/:id" "04-get-booking-id.csv"
run_newman "05. PUT /booking/:id" "05-put-booking.csv"
run_newman "06. PATCH /booking/:id" "06-patch-booking.csv"
run_newman "07. DELETE /booking/:id" "07-delete-booking.csv"
run_newman "08. GET /ping" ""

# 5. Check test results
if [ $FAILED -ne 0 ]; then
    echo "Error: Some tests failed."
    exit 1
else
    echo "Success: All tests passed."
    exit 0
fi
