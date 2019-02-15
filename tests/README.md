Tests and Coverage
================
15 February, 2019 10:42:39

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                        | Coverage (%) |
| :---------------------------- | :----------: |
| plyexperiment                 |     100      |
| [R/methods.R](../R/methods.R) |     100      |
| [R/verbs.R](../R/verbs.R)     |     100      |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                          |  n |  time | error | failed | skipped | warning |
| :-------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-verbs-col.R](testthat/test-verbs-col.R) | 43 | 1.508 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                               | context              | test                                        | status | n |  time |
| :------------------------------------------------- | :------------------- | :------------------------------------------ | :----- | -: | ----: |
| [test-verbs-col.R](testthat/test-verbs-col.R#L26)  | SummarizedExperiment | mutate\_col correctly adds column variables | PASS   | 6 | 0.041 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L39)  | SummarizedExperiment | rename\_col correctly renames columns       | PASS   | 3 | 0.007 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L47)  | SummarizedExperiment | filter\_col correctly chooses columns       | PASS   | 1 | 0.068 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L53)  | SummarizedExperiment | arrange\_col correctly orders columns       | PASS   | 1 | 0.048 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L58)  | SummarizedExperiment | select\_col correctly extracts columns      | PASS   | 2 | 0.006 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L65)  | eSet Generics        | generics are available for eSet             | PASS   | 5 | 0.036 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L80)  | ExpressionSet        | mutate\_col correctly adds column variables | PASS   | 6 | 0.017 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L93)  | ExpressionSet        | rename\_col correctly renames columns       | PASS   | 3 | 0.018 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L101) | ExpressionSet        | filter\_col correctly chooesets columns     | PASS   | 1 | 0.030 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L107) | ExpressionSet        | arrange\_col correctly orders columns       | PASS   | 1 | 0.063 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L112) | ExpressionSet        | select\_col correctly extracts columns      | PASS   | 2 | 0.008 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L124) | MultiAssayExperiment | mutate\_col correctly adds column variables | PASS   | 5 | 0.017 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L136) | MultiAssayExperiment | rename\_col correctly renames columns       | PASS   | 3 | 0.008 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L145) | MultiAssayExperiment | filter\_col correctly choomaes columns      | PASS   | 1 | 0.676 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L151) | MultiAssayExperiment | arrange\_col correctly orders columns       | PASS   | 1 | 0.457 |
| [test-verbs-col.R](testthat/test-verbs-col.R#L156) | MultiAssayExperiment | select\_col correctly extracts columns      | PASS   | 2 | 0.008 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                                       |
| :------- | :------------------------------------------ |
| Version  | R version 3.4.3 Patched (2017-12-09 r73876) |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit)         |
| Running  | macOS Sierra 10.12.6                        |
| Language | en\_AU                                      |
| Timezone | Australia/Adelaide                          |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.1   |
| covr     | 3.2.1   |
| covrpage | 0.0.70  |

</details>

<!--- Final Status : pass --->
