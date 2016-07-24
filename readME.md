diff:
mvn liquibase:diff -Dliquibase.referenceDefaultSchemaName=liquibase_sample_test -Dliquibase.referenceDriver=org.postgresql.Driver -Dliquibase.referencePassword=Doom14121991 -Dliquibase.referenceUsername=postgres -Dliquibase.referenceUrl=jdbc:postgresql://localhost/liquibase_sample_test

diffChangeLog: only avaible throught Command line, Ant
  sh liquibase --driver=org.postgresql.Driver --url=jdbc:postgresql://localhost/liquibase_sample_test --username=postgres --password=Doom14121991 --defaultSchemaName=liquibase_sample  diffChangeLog --referenceUsername=postgres --referencePassword=Doom14121991 --referenceUrl=jdbc:postgresql://localhost/liquibase_sample --referenceDefaultSchemaName=liquibase_sample >change.xml