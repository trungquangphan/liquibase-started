        LIQUIBASE GET STARTED
This project contains the example code to execute the most used functions in Liquibase, and is located into different branch:
- master: introduce some basic concepts like: changelog, changeset, change, preconditions.
- diff: introduce the powerful functionality that generate the changelog automatically.
- rollback: introduce tag, how to use tag to rollback the application state.
- profile: use maven plugin to build profile that helps us to trigger liquibase on different environment.


1. The database changesets are able to be executed from Liquibase maven plugin by running:
    **mvn liquibase:[goal] liquibase_parameter**
    
    For example, if you want to migrate the database to the current state of your changelog file, run this:
    mvn liquibase:update
2. To generate the changelog automatically, please checkout the diff branch. It configures the executions to trigger Liquibase to 2 database.
 The diffChangeLog is not support by Liquibase Maven Plugin, thus you should execute the Liquibase shell script from the installed folder of Liquibase.
 - Diff goal: show the difference between 2 databse in report mode:
 sh liquibase --driver=org.postgresql.Driver --url=jdbc:postgresql://localhost/liquibase_sample_test --username=postgres --password=Doom14121991 --defaultSchemaName=liquibase_sample  diff --referenceUsername=postgres --referencePassword=Doom14121991 --referenceUrl=jdbc:postgresql://localhost/liquibase_sample --referenceDefaultSchemaName=liquibase_sample
 
 - DiffChangeLog: show the difference between 2 database in changelog mode:
 sh liquibase --driver=org.postgresql.Driver --url=jdbc:postgresql://localhost/liquibase_sample_test --username=postgres --password=Doom14121991 --defaultSchemaName=liquibase_sample  diffChangeLog --referenceUsername=postgres --referencePassword=Doom14121991 --referenceUrl=jdbc:postgresql://localhost/liquibase_sample --referenceDefaultSchemaName=liquibase_sample
 To write the result to file, run this:
 sh liquibase --driver=org.postgresql.Driver --url=jdbc:postgresql://localhost/liquibase_sample_test --username=postgres --password=Doom14121991 --defaultSchemaName=liquibase_sample  diffChangeLog --referenceUsername=postgres --referencePassword=Doom14121991 --referenceUrl=jdbc:postgresql://localhost/liquibase_sample --referenceDefaultSchemaName=liquibase_sample >change.xml

3. Tag: mark all changesets so far with a given tag name.
 - The tagging should be performed by the sysadmin who controls the release phrase.
mvn liquibase:tag -Dliquibase.tag=initial
 - Create a changeset at the end of the last changelog to tag database before releasing.
The second way helps us know the tag that is being applied to the current release.

- Rollback by tag:
    mvn liquibase:rollback -Dliquibase.rollbackTag=initial
- Rollback by number of changeset:
    mvn liquibase:rollback -Dliquibase.rollbackCount=1
- Rollback by date:
    mvn liquibase:rollback -Dliquibase.rollbackDate=2016-07-24T11:46:48

4. Profile:
- To execute goal update on db of local env:
 mvn liquibase:update@liquibase-update -Plocal
- To execute goal update on db test of local env:
 mvn liquibase:update@liquibase-update-test  -Plocal
