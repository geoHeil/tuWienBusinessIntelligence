# bi readme

**requriements**

  - docker
  - start the DB
```
docker run -p 3306:3306 --name bi-mysql2 -e MYSQL_ROOT_PASSWORD=bi -d mariadb
```

  - add mysql drivers as described
  - start workbench './data-integration/spoon.sh'
  - start integration './schema-workbench/workbench.sh'
  - connect to the database with localhost:3306, user=root, password=bi

  - create the schema (`CREATE SCHEMA BI_OLTP_4`) manually BEFORE executing any sql  

  - main Kettle folder holding ALL transformations & jobs is in task 1 folder!!


 ## Notes

 **OLTP --> OLAP**
 Transformations
   - cast as timestamp is ambigous. We chose not to use an UNIX-timestamp which is not well defined pre 1970, but rather a mysql TIMESTAMP which works fine