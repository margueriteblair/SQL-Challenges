1. SELECT company.company_code, company.founder, COUNT(DISTINCT lead_manager_code), COUNT(DISTINCT senior_manager_code),COUNT(DISTINCT manager_code), COUNT(DISTINCT employee_code) FROM company INNER JOIN employee ON employee.company_code = company.company_code 
GROUP BY company.company_code, company.founder
ORDER BY company.company_code;

2. select TRUNCATE(ABS(MIN(lat_n)-MAX(lat_n)) + ABS(MIN(long_w)-MAX(long_w)), 4) from station;

3. select TRUNCATE(ROUND(ABS(MIN(lat_n)-MAX(lat_n)) + ABS(MIN(long_w)-MAX(long_w)),4), 4) from station;