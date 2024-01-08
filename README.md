# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

## Getting Started

### Prerequisites

For the application to succesfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.
- # Documentation for the `delivery_date` Feature

## Introduction

This document provides comprehensive details about the `delivery_date` feature that was implemented and later reverted in the Web App DevOps Project. This feature aimed to add a delivery date attribute to the orders in the application.

## For Developers

### Overview of the Feature

The `delivery_date` feature was designed to allow users to specify and view the delivery dates for orders. This feature involves changes in the database schema, the backend Python script (`app.py`), and the frontend HTML template (`order.html`).

### Implementation Details

#### Database Schema Changes

- A new column named `delivery_date` of type `DateTime` was added to the `orders` table in the backend database.

#### Backend Changes (`app.py`)

- Order class in `app.py` was modified to include the `delivery_date` attribute.
- Routes handling order creation and display were updated to process the `delivery_date`.

#### Frontend Changes (`order.html`)

- The `order.html` template was updated to include an input field for adding and a table column for displaying the `delivery_date`.


### Troubleshooting

- **Database Connection Issue:**
  - Ensure the correct database credentials and connection strings are used.
  - Verify network accessibility to the Azure SQL Database.
  - Check if the ODBC driver is installed and configured correctly.
### Reverting the Feature

- The feature was reverted due to a change in project requirements. The revert process involved the following steps:
  - Identifying the commit hash prior to the feature implementation.
  - Executing `git revert COMMIT_HASH`.
  - Resolving any merge conflicts and committing the revert.

## Conclusion

While the `delivery_date` feature is currently not part of the application, this documentation serves as a reference for future implementation needs. The feature could be reintroduced or modified based on future project requirements.


## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
