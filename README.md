\# Placement Database Management System (PDMS)



An automated, enterprise-grade relational database management system designed to centralize and optimize the university campus placement ecosystem. By replacing traditional manual spreadsheets and paper-based coordination, the system connects Students, Recruiters, and Training and Placement Officers (TPOs) through synchronous role-based access control and real-time process tracking.



\---



\## 🌟 Core Features \& Capabilities



\* \*\*Automated Eligibility Checks:\*\* Uses backend verification functions to instantly validate student credentials (minimum CPI constraints, branch restrictions, and backlog limits) against employer requirements before allowing job applications\[cite: 2].

\* \*\*Student Self-Analytics Dashboard:\*\* Provides custom tracking metrics detailing total applications submitted, round shortlists, peer skill-gap analysis, and individual selection ratios\[cite: 2].

\* \*\*Mentoring \& Guidance Tracking:\*\* Maps students to faculty or alumni mentors, storing session timelines, topics covered, and targeted career readiness feedback\[cite: 2].

\* \*\*Role-Based Access Control (RBAC):\*\* Secures data integrity at the database level—restricting students to personal profile management, enabling recruiters to post jobs/shortlist candidates, and giving TPOs administrative control over placement schedules\[cite: 2].



\---



\## ⚙️ Technologies Used



\* \*\*Database Engine:\*\* PostgreSQL / MySQL

\* \*\*Language:\*\* SQL

\* \*\*Architecture Diagramming:\*\* Draw.io\[cite: 2]

\* \*\*Version Control:\*\* Git \& GitHub



\---



\## 📊 Database Design \& Concepts



The underlying schema is built to model intricate campus workflow dependencies while enforcing rigid constraints\[cite: 1, 2].



\* \*\*Total Relations:\*\* 16 highly structured tables\[cite: 1].

\* \*\*Normalization Level:\*\* Fully optimized to \*\*BCNF\*\* (Boyce-Codd Normal Form) to eliminate data redundancy and anomalies\[cite: 1].

\* \*\*Advanced Concepts Implemented:\*\* Generalization/Specialization (ISA Hierarchy)\[cite: 1], Compound \& Composite Keys\[cite: 1], Referential Integrity Constraints\[cite: 1], Database Views, Stored Procedures, and Automated Database Triggers.



\### Relational Schema Layout

\* `User` / `Student` / `Alumni` / `Company` (Core Entity Profiles)\[cite: 1]

\* `Phone\_No` / `Document` (Multi-valued attribute handlers using compound keys)\[cite: 1]

\* `Job\_Posting` / `Job\_Eligibility` / `Branch\_Allowed` / `Programme\_Allowed` (Automated criteria filtering layers)\[cite: 1]

\* `Application` / `Status` / `Placement\_Drive` / `Mentoring` (Workflow tracking \& scheduling metrics)\[cite: 1]



\---



\## 📂 Project Structure



```text

DBMS/

├── README.md                           # Professional project documentation

├── ER\_Diagram.drawio.png               # Conceptual entity-relationship layout

├── PDMS\_Relational\_Schema (1).pdf      # Relational schemas \& constraint mappings

├── SRS.pdf                             # Software Requirements Specification document

└── SQL/                                # Database source scripts

&#x20;   ├── 01\_create\_tables.sql            # Table structures, primary \& foreign keys

&#x20;   ├── 02\_Insert\_data.sql              # Mock production setup records

&#x20;   ├── 03\_views.sql                    # Pre-compiled student self-analytics views

&#x20;   ├── 04\_sample\_queries.sql           # Evaluation scripts \& query scenarios

&#x20;   ├── 05\_procedures.sql               # Stored functions for automated checking

&#x20;   └── 06\_triggers.sql                 # Real-time event \& status notification handling

