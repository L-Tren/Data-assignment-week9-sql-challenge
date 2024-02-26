-- Tables with primary keys

CREATE TABLE Departments (
    dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(18) NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE salaries (
    emp_no INT PRIMARY KEY NOT NULL,
    salary INT NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY NOT NULL,
    title VARCHAR(100) NOT NULL
);

-- Tables with Foreign Keys

CREATE TABLE dept_employee (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no, dept_no)
);
