AI Impact on Student Learning and Academic Performance

------------------------------------------------ Project Overview ---------------------------------------------------

This project analyzes the impact of Artificial Intelligence (AI) tools on students' academic performance, study habits, anxiety levels, skill retention, and burnout risk using SQL.

The dataset contains information about students from different academic disciplines, their AI usage patterns, subscription status, GPA, study hours, AI dependency levels, and learning outcomes.

The objective of this project is to identify how AI usage influences student behavior and academic performance through data cleaning, transformation, and exploratory analysis.

------------------------------------------------------- Tools Used --------------------------------------------------

MySQL
SQL
Data Cleaning
Aggregation Functions
Conditional Aggregation
Data Analysis

-------------------------------------------------- Data Cleaning Performed ---------------------------------------------

Column Standardization

Renamed lengthy column names for easier querying and readability.

Examples:
Student_ID → s_id
Major_category → course
Weekly_GenAI_Hours → weekly_AI_use
Prompt_Engineering_skill → prompt_skill

---------------------------------------------------- Data Standardization ----------------------------------------------

Removed leading and trailing spaces using TRIM()
Converted categorical values to lowercase using LOWER()
Checked for NULL and empty values
Assigned student ID as Primary Key

------------------ Business Questions Explored ----------------------------

1. Which academic disciplines use AI most frequently for summarizing and reading?

Analyzed the number of students using AI for summarization across different courses.

2. Does a paid AI subscription reduce exam anxiety?

Compared average anxiety levels between subscribed and non-subscribed students.

3. Does a paid subscription increase AI dependency?

Evaluated AI dependency levels among subscribed and non-subscribed students.

4. Does a paid subscription improve academic performance?

Compared post-semester GPA between subscribed and non-subscribed students.

5. Which AI use cases are associated with the highest GPA outcomes?

Compared average post-semester GPA across various AI use cases.

6. Does AI dependency affect skill retention?

Analyzed skill retention scores across different levels of perceived AI dependency.

7. Which study years show the highest AI tool adoption?

Measured AI tool diversity across courses and academic years.

8. Does burnout risk increase with AI dependency?

Compared average AI dependency levels across burnout risk categories.

-------------------------------------------- Key Findings -----------------------------------------------------------------

AI Subscription and Academic Performance

Paid subscriptions showed little impact on overall GPA improvement.
Subscription status did not significantly change academic performance across most disciplines.

AI Dependency

Medical students demonstrated the highest levels of AI dependency.
Subscription status increased dependency in medical, STEM, and arts disciplines.

Skill Retention

Moderate AI usage appeared beneficial for STEM students.
Extremely high AI dependency was associated with lower skill retention.
Humanities students showed the strongest decline in skill retention as AI dependency increased.
Medical students showed relatively stable skill retention regardless of dependency levels.

AI Tool Adoption

Junior medical students displayed the highest AI tool diversity, averaging approximately four tools.
Sophomore arts students also demonstrated high AI tool adoption.
Business freshmen exhibited the lowest tool diversity.

Burnout Risk

Students with higher burnout risk showed higher average AI dependency.
This suggests a positive association between AI dependency and burnout risk.

--------------------------------------------------- SQL Concepts Used -------------------------------------------------------------

ALTER TABLE
UPDATE
CASE WHEN
GROUP BY
ORDER BY
Aggregate Functions
   -COUNT()
   -AVG()
Conditional Aggregation
Data Cleaning Techniques
Primary Keys

 ----------------------------------------------- Future Improvements -------------------------------------------------------

* Build an interactive Power BI dashboard.
* Perform statistical testing on identified relationships.
* Add advanced SQL concepts such as Window Functions and CTEs.
* Conduct predictive analysis using Python and Machine Learning.

------------------------------------------------- Conclusion --------------------------------------------------------------

The analysis suggests that AI can support learning when used in moderation. However, excessive dependency on AI tools is associated with lower skill retention and higher burnout risk. The impact varies significantly across academic disciplines, highlighting the importance of responsible AI adoption in education.
