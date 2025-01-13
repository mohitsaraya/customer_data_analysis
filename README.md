<h2>Overview</h2>
<p>This project focuses on creating and managing a MySQL database to store and analyze customer data. The database consists of a single table, <code>customer</code>, containing detailed information about 17,649 customers. This project was developed by a data analyst to support business decision-making processes, including customer segmentation, targeted marketing, and performance analysis.</p>
<h2>Features</h2>
<ul>
    <li><strong>Comprehensive Data Schema</strong>: The <code>customer</code> table is designed to capture various customer attributes, including demographic, financial, and lifestyle information.</li>
    <li><strong>Scalability</strong>: The table accommodates large datasets efficiently with 17,649 rows of data.</li>
    <li><strong>Query Optimization</strong>: Indexing and structured queries can be implemented for fast data retrieval.</li>
</ul>
<h2>Table Structure</h2>
<p>The <code>customer</code> table is defined as follows:</p>
<pre>
      CREATE TABLE customer (
      customer_Number INT,
      prefix CHAR(5),
      firstName VARCHAR(20),
      lastName VARCHAR(20),
      birthDate DATE,
      maritalStatus CHAR(1),
      gender CHAR(3),
      emailAddress VARCHAR(50),
      income INT,
      totalChildren INT,
      educationLevel VARCHAR(25),
      occupation VARCHAR(25),
      homeOwner CHAR(3)
);</pre>
  <h3>Column Descriptions</h3>
<ul>
    <li><strong>customer_Number</strong>: Unique identifier for each customer.</li>
    <li><strong>prefix</strong>: Prefix (e.g., Mr., Ms., Dr.) associated with the customer.</li>
    <li><strong>firstName</strong>: Customer's first name.</li>
    <li><strong>lastName</strong>: Customer's last name.</li>
    <li><strong>birthDate</strong>: Customer's date of birth.</li>
    <li><strong>maritalStatus</strong>: Marital status of the customer (e.g., 'S' for Single, 'M' for Married).</li>
    <li><strong>gender</strong>: Customer's gender (e.g., 'M', 'F', 'Non').</li>
    <li><strong>emailAddress</strong>: Customer's email address.</li>
    <li><strong>income</strong>: Annual income of the customer.</li>
    <li><strong>totalChildren</strong>: Total number of children the customer has.</li>
    <li><strong>educationLevel</strong>: Highest level of education attained by the customer.</li>
    <li><strong>occupation</strong>: Customer's occupation.</li>
    <li><strong>homeOwner</strong>: Indicates whether the customer owns a home (e.g., 'Yes', 'No').</li>
</ul>
<h2>Dataset Summary</h2>
<ul>
    <li><strong>Total Rows</strong>: 17,649</li>
    <li><strong>Purpose</strong>: The dataset is structured to analyze customer demographics, financial status, and lifestyle preferences, enabling businesses to better understand and serve their customer base.</li>
</ul>
<h2>Usage Instructions</h2>
<ol>
    <li><strong>Setup the Database</strong>:
        <ul>
            <li>Install MySQL on your machine.</li>
            <li>Use the provided <code>CREATE TABLE</code> statement to create the <code>customer</code> table.</li>
            <li>Populate the table with the dataset containing 17,649 rows.</li>
        </ul>
    </li>
    <li><strong>Query Examples</strong>:
        <ul>
            <li>Retrieve all customers:
                <pre>SELECT * FROM customer;</pre>
            </li>
            <li>Filter customers by marital status:
                <pre>SELECT * FROM customer WHERE maritalStatus = 'M';</pre>
            </li>
            <li>Calculate the average income:
                <pre>SELECT AVG(income) AS AverageIncome FROM customer;</pre>
            </li>
        </ul>
    </li>
</ol>

<h2>Project Goals</h2>
<ul>
    <li><strong>Customer Insights</strong>: Gain insights into customer behavior and preferences.</li>
    <li><strong>Data Analysis</strong>: Perform statistical and analytical operations on customer data.</li>
    <li><strong>Decision Support</strong>: Assist businesses in making data-driven decisions.</li>
</ul>

<h2>Basic Descriptive Analysis</h2>
<ol>
    <li>How many unique customers are in the dataset?</li>
    <li>What is the average income of the customers?</li>
    <li>What is the gender distribution in the dataset?</li>
    <li>What is the most common marital status among the customers?</li>
    <li>How many customers own a home versus rent?</li>
</ol>

<h2>Demographic Analysis</h2>
<ol>
    <li>What is the average age of customers (using <code>BirthDate</code>)?</li>
    <li>What is the distribution of education levels among the customers?</li>
    <li>How does the average income vary by gender?</li>
    <li>What is the most common occupation in the dataset?</li>
    <li>How does marital status correlate with the total number of children?</li>
</ol>

<h2>Customer Segmentation</h2>
<ol>
    <li>What is the average number of children for customers grouped by income levels (e.g., low, medium, high)?</li>
    <li>Can customers be segmented into income brackets, and what are the characteristics of each bracket?</li>
    <li>Which education level corresponds to the highest average income?</li>
    <li>Are married customers more likely to own homes than single customers?</li>
</ol>

<h2>Behavioral Patterns</h2>
<ol>
    <li>How does the number of children influence income levels?</li>
    <li>What is the average income of customers with advanced education levels?</li>
    <li>Are male or female customers more likely to own homes?</li>
    <li>Which occupations have the highest percentage of homeowners?</li>
    <li>What is the distribution of birth years in the dataset?</li>
</ol>

<h2>Data Quality and Completeness</h2>
<ol>
    <li>How many records have incomplete or null values for <code>Income</code> or <code>TotalChildren</code>?</li>
    <li>Are there any duplicate entries in the dataset?</li>
</ol>

<h2>Correlations and Insights</h2>
<ol>
    <li>How does age affect income levels across different education groups?</li>
</ol>

<h2>Advanced Analysis</h2>
<ol>
    <li>Which customer profiles (gender, education, income) are most likely to have multiple children?</li>
</ol>
