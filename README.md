# Restful-Booker API Testing Portfolio

[![Run API Tests](https://github.com/TarmuHu/restful-booker-api-testing/actions/workflows/test.yml/badge.svg)](https://github.com/TarmuHu/restful-booker-api-testing/actions/workflows/test.yml)

Welcome! This repository serves as a showcase of my API testing capabilities. It is designed to demonstrate comprehensive automated testing methodologies, continuous integration, and clean, independent script execution using Postman and Newman.

## 🚀 Key Skills & Technologies

- **API Testing & Automation:** Postman, Newman
- **Data-Driven Testing (DDT):** Comprehensive CSV-driven test execution.
- **CI/CD Pipeline:** GitHub Actions for automated, scheduled, and on-demand test runs.
- **Reporting:** `newman-reporter-htmlextra` (HTML) and JUnit XML reports.
- **Test Methodologies:** Equivalence Partitioning, Boundary Value Analysis, Data Type Testing, and Security/Negative Testing (e.g., missing tokens, XSS, SQLi).

## 🧠 Testing Strategy

This project was built with a strict adherence to professional QA standards, incorporating advanced Postman techniques to handle edge cases and maintainable test architecture.

- **Data-Driven Edge Cases:** The test suite systematically verifies field-by-field behavior. CSV files are structured with a "Happy Path" at the top, followed by clustered positive and negative test cases for specific fields.
- **Strict "OMIT" Handling:** To differentiate between an empty string (`""`) and a completely missing field, the explicit string `"OMIT"` is used in CSV files. The Pre-request scripts interpret this to actively exclude the key from JSON payloads or omit headers completely.
- **Execution Independence:** Every Postman folder (endpoint) is independently runnable with its respective CSV file. No endpoint relies on the sequential execution of another, ensuring robust and isolated test cases.
- **Negative Testing & Type Coercion:** When testing negative paths, string values (like `"OneHundred"` instead of `100`) are purposefully sent uncoerced to ensure the API's validation correctly handles invalid data types.
- **Clean Test Execution:** Variables created during execution (like `dynamicBody` or `token`) are rigorously cleaned up using `pm.variables.unset()` to avoid side-effects across test runs. Response validations utilize Deep Equality checks for thorough assertions.

## 🛠️ How to Run Local Tests

You can easily run this test suite locally on your machine. The tests execute via Newman and generate visual HTML and JUnit XML reports.

### Prerequisites

- [Node.js](https://nodejs.org/) installed on your machine.

### Execution Steps

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/TarmuHu/restful-booker-tests.git
    cd restful-booker-tests
    ```

    _(Note: adjust URL if necessary based on your actual repository URL)._

2.  **Install dependencies:**

    ```bash
    npm install
    ```

3.  **Run the test suite:**
    ```bash
    npm test
    ```
    _(Note: This executes the `run-tests.sh` bash script, triggering independent test runs for each endpoint)._

### Viewing Test Reports

After execution, test reports are automatically generated in the `reports/` directory.

- Open the `.html` files in any web browser to view the detailed `htmlextra` visual report.

## 📬 About Me & Contact

I am a passionate QA professional focused on building robust, scalable automated test suites.

- **Name:** Tarmu Hu
- **LinkedIn:** [linkedin.com/in/tarmu-hu-2b7948200](https://www.linkedin.com/in/tarmu-hu-2b7948200)
- **Portfolio:** [tarmuhu.github.io/cpsc349-portfolio](https://tarmuhu.github.io/cpsc349-portfolio/index.html)

Thank you for reviewing my project! If you have any questions or would like to discuss my QA approach further, please feel free to reach out.
