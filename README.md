# EFCore-Issue-17936
This repo is meant to reproduce behavior as described in issue [17936](https://github.com/dotnet/efcore/issues/17936). I'm looking to test the performance difference between using an outer/cross apply vs a join with a windowed function.

A DACPAC for the database along with object scripts can be found in the [EFScenario-Database](https://github.com/MoMack20/EFCore-Issue-17936/tree/main/EFScenario-database) folder. The indexes are also defined with the table definitions.

SQL debug outputs can be found in the [EFCore-Issue-17936/SqlDebugOutput](https://github.com/MoMack20/EFCore-Issue-17936/tree/main/EFCore-Issue-17936/SqlDebugOutput) folder. The files include the SQL code generated for the 2 scenarios (windowed function vs outer apply), query plans, and IO/time statistics.

This program runs each query 5 times consecutively and prints the average to the debug console. I have EF logging is turned on by default.

### Results
- Average Windowed Time: 910.6ms
- Average Windowed with extra where Time: 853.6ms
- Average Apply Time: 93ms
