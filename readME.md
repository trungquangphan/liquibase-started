- diff: Show the difference between 2 DB in report mode
mvn liquibase:diff -Dliquibase.referenceDefaultSchemaName=liquibase_sample_test -Dliquibase.referenceDriver=org.postgresql.Driver -Dliquibase.referencePassword=Doom14121991 -Dliquibase.referenceUsername=postgres -Dliquibase.referenceUrl=jdbc:postgresql://localhost/liquibase_sample_test
sh liquibase --driver=org.postgresql.Driver --url=jdbc:postgresql://localhost/liquibase_sample_test --username=postgres --password=Doom14121991 --defaultSchemaName=liquibase_sample  diff --referenceUsername=postgres --referencePassword=Doom14121991 --referenceUrl=jdbc:postgresql://localhost/liquibase_sample --referenceDefaultSchemaName=liquibase_sample

- diffChangeLog: only avaible throught Command line, Ant.
  sh liquibase --driver=org.postgresql.Driver --url=jdbc:postgresql://localhost/liquibase_sample_test --username=postgres --password=Doom14121991 --defaultSchemaName=liquibase_sample  diffChangeLog --referenceUsername=postgres --referencePassword=Doom14121991 --referenceUrl=jdbc:postgresql://localhost/liquibase_sample --referenceDefaultSchemaName=liquibase_sample >change.xml
  Notice: To apply the created changelog file, you have to delete the changes that you did manually in DB.


- Tag: mark all changesets so far with a given tag name.
The tagging should be performed by the sysadmin who controls the release phrase.
+ mvn liquibase:tag -Dliquibase.tag=initial
+ Create a changeset at the end of the last changelog to tag database before releasing.

Question: which one do you prefer?
The second way helps us know the tag that is being applied to the current release.

- Rollback by tag:
    mvn liquibase:rollback -Dliquibase.rollbackTag=initial
- Rollback by number of changeset:
    mvn liquibase:rollback -Dliquibase.rollbackCount=1
- Rollback by date:
 mvn liquibase:rollback -Dliquibase.rollbackDate=2016-07-24T11:46:48


WARNING: 
- In case you want to add column with nullable=false.
You have to add change: addDefaultValue.Why?
In case the table is empty, the changset will run correctly. Then you insert data during the using of application.
For some reason, you rollback the db to the previous version which doesn't contain the changeset addColumn + notnull constraint.
And you migrate the db again, run again the changeset add column + notnull constrain again
--> Cannot execute the changeset :(

- Rollback notice
    Liquibase doesn't generate rollback statement for the changeset refactorings that use rawSQL, or they are such as "dropTable", "insertData"
    You have to notice this cases to create the rollback statement by yourself by adding the tag rollback inside that changeset.

- Profile:
    + To execute goal update on db of local env:
     mvn liquibase:update@liquibase-update -Plocal
    + To execute goal update on db test of local env:
     mvn liquibase:update@liquibase-update-test  -Plocal
