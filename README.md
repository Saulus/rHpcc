rHpcc
=====

Interface between HPCC and R rHpcc is an R package providing an Interface between R and HPCC. 
Familiarity with ECL (Enterprise Control Language) is a must to use this package. HPCC is a massive parallel-processing computing platform that solves Big Data problems. 
ECL is the Enterprise Control Language designed specifically for huge data projects using the HPCC platform. 
Its extreme scalability comes from a design that allows you to leverage every query you create for re-use in subsequent queries as needed. 
To do this, ECL takes a dictionary approach to building queries wherein each ECL definition defines an Attribute. 
Each previously defined Attribute can then be used in succeeding ECL Attribute definitions as the language extends itself as you use it.

Depends: R (>= 2.11.0), methods, RCurl, XML.
URL: http://hpccsystems.com


This Fork
===== 
added basic http authentication

Bugfixing (some already done; probably a lot more to do)

As the Package is very poorly documented and most functions are working in a limited setting only I suggest to better access HPCC results from R via JSON:
1. write and publish ECL queries that take simple parameters
2. get output of queries via json, accessing http://IP:8002/WsEcl/submit/query/thor/[query]/json   



Testset:
=====
library("rhpcc");
library("XML")
library("yaml")
library("RCurl")

hpcc.begin()
countprofil_file <- 'eha::profiles::countprofil_sp.csv'
countprofil_rec <- 'RECORD
    UNSIGNED4 COL;
    UNSIGNED4 ROW;
    DECIMAL9_2 VAL;
END;'
filetype="CSV(HEADING(1),SEPARATOR(';'))"

dsCP <- hpcc.dataset(countprofil_file,filetype,layoutname=countprofil_rec)
dsCPmax <- hpcc.max(dsCP,'VAL')
hpcc.output(dsCP,10,TRUE)
hpcc.execute()