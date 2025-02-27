-- SYNTAX TEST "Packages/Spreadsheet Formula/Google Sheets Query Language.sublime-syntax"

select *
--^^^^ keyword.other.dml.google
--     ^ constant.other.wildcard.asterisk.google

select dept, salary
--^^^^ keyword.other.dml.google
--     ^^^^ meta.column-name.google
--         ^ punctuation.separator.sequence.google
--           ^^^^^^ meta.column-name.google

select max(salary)
--^^^^ keyword.other.dml.google
--     ^^^ meta.function-call.google support.function.aggregate.google
--        ^^^^^^^^ meta.function-call.arguments.google
--        ^ punctuation.section.arguments.begin.google
--         ^^^^^^ meta.column-name.google
--               ^ punctuation.section.arguments.end.google

select `email address`, name, `date`
--^^^^ keyword.other.dml.google
--     ^^^^^^^^^^^^^^^ meta.string.google string.quoted.backtick.google
--     ^ punctuation.definition.string.begin.google
--      ^^^^^^^^^^^^^ meta.column-name.google
--                   ^ punctuation.definition.string.end.google
--                    ^ punctuation.separator.sequence.google
--                      ^^^^ meta.column-name.google
--                          ^ punctuation.separator.sequence.google
--                            ^^^^^^ meta.string.google string.quoted.backtick.google
--                            ^ punctuation.definition.string.begin.google
--                             ^^^^ meta.column-name.google
--                                 ^ punctuation.definition.string.end.google

select lunchTime, name
--^^^^ keyword.other.dml.google
--     ^^^^^^^^^ meta.column-name.google
--              ^ punctuation.separator.sequence.google
--                ^^^^ meta.column-name.google

where name contains 'John'
--^^^ keyword.other.dml.google
--    ^^^^ meta.column-name.google
--         ^^^^^^^^ keyword.operator.logical.google
--                  ^^^^^^ meta.string.google string.quoted.single.google
--                  ^ punctuation.definition.string.begin.google
--                       ^ punctuation.definition.string.end.google

where dept starts with 'engineering'
--^^^ keyword.other.dml.google
--    ^^^^ meta.column-name.google
--         ^^^^^^^^^^^ keyword.operator.logical.google
--                     ^^^^^^^^^^^^^ meta.string.google string.quoted.single.google
--                     ^ punctuation.definition.string.begin.google
--                                 ^ punctuation.definition.string.end.google

where role ends with 'y'
--^^^ keyword.other.dml.google
--    ^^^^ meta.column-name.google
--         ^^^^^^^^^ keyword.operator.logical.google
--                   ^^^ meta.string.google string.quoted.single.google
--                   ^ punctuation.definition.string.begin.google
--                     ^ punctuation.definition.string.end.google

where country matches '.*ia'
--^^^ keyword.other.dml.google
--    ^^^^^^^ meta.column-name.google
--            ^^^^^^^ keyword.operator.logical.google
--                    ^^^^^^ meta.string.google string.quoted.single.google
--                    ^ punctuation.definition.string.begin.google - source source - string string - meta.string meta.string
--                     ^^^^ source.regexp.embedded
--                         ^ punctuation.definition.string.end.google - source source - string string - meta.string meta.string

-- NOTE: Google documentation does not have fre% in quotes
where name like 'fre%'
--^^^ keyword.other.dml.google
--    ^^^^ meta.column-name.google
--         ^^^^ keyword.operator.logical.google
--              ^^^^^^ meta.string.google string.quoted.single.google
--              ^ punctuation.definition.string.begin.google
--                  ^ constant.other.wildcard.number-sign.google
--                   ^ punctuation.definition.string.end.google

where salary >= 600
--^^^ keyword.other.dml.google
--    ^^^^^^ meta.column-name.google
--           ^^ keyword.operator.comparison.google
--              ^^^ meta.number.integer.decimal.google constant.numeric.value.google
where dept != 'Eng' and date '2005-01-21' < hireDate
--^^^ keyword.other.dml.google
--    ^^^^ meta.column-name.google
--         ^^ keyword.operator.comparison.google
--            ^^^^^ meta.string.google string.quoted.single.google
--            ^ punctuation.definition.string.begin.google
--                ^ punctuation.definition.string.end.google
--                  ^^^ keyword.operator.logical.google
--                      ^^^^ storage.type.google
--                           ^^^^^^^^^^^^ meta.string.google string.quoted.single.google
--                           ^ punctuation.definition.string.begin.google
--                            ^^^^^^^^^^ constant.other.date.google
--                                      ^ punctuation.definition.string.end.google
--                                        ^ keyword.operator.comparison.google
--                                          ^^^^^^^^ meta.column-name.google
where (dept<>'Eng' and isSenior=true) or (dept='Sales') or seniorityStartTime is null
--^^^ keyword.other.dml.google
--    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.group.google
--    ^ punctuation.section.group.begin.google
--     ^^^^ meta.column-name.google
--         ^^ keyword.operator.comparison.google
--           ^^^^^ meta.string.google string.quoted.single.google
--           ^ punctuation.definition.string.begin.google
--               ^ punctuation.definition.string.end.google
--                 ^^^ keyword.operator.logical.google
--                     ^^^^^^^^ meta.column-name.google
--                             ^ keyword.operator.comparison.google
--                              ^^^^ constant.language.boolean.true.google
--                                  ^ punctuation.section.group.end.google
--                                    ^^ keyword.operator.logical.google
--                                       ^^^^^^^^^^^^^^ meta.group.google
--                                       ^ punctuation.section.group.begin.google
--                                        ^^^^ meta.column-name.google
--                                            ^ keyword.operator.comparison.google
--                                             ^^^^^^^ meta.string.google string.quoted.single.google
--                                             ^ punctuation.definition.string.begin.google
--                                                   ^ punctuation.definition.string.end.google
--                                                    ^ punctuation.section.group.end.google
--                                                      ^^ keyword.operator.logical.google
--                                                         ^^^^^^^^^^^^^^^^^^ meta.column-name.google
--                                                                            ^^ keyword.operator.logical.google
--                                                                               ^^^^ constant.language.null.google

select name where salary > 700
--^^^^ keyword.other.dml.google
--     ^^^^ meta.column-name.google
--          ^^^^^ keyword.other.dml.google
--                ^^^^^^ meta.column-name.google
--                       ^ keyword.operator.comparison.google
--                         ^^^ meta.number.integer.decimal.google constant.numeric.value.google

select dept, max(salary) group by dept
--^^^^^^^^^^^^^^^^^^^^^^^ meta.block.clause.select.google - meta.block.clause meta.block.clause
--                       ^^^^^^^^^^^^^ meta.block.clause.group-by.google - meta.block.clause meta.block.clause
--^^^^ keyword.other.dml.google
--     ^^^^ meta.column-name.google
--         ^ punctuation.separator.sequence.google
--           ^^^ meta.function-call.google support.function.aggregate.google
--              ^^^^^^^^ meta.function-call.arguments.google
--              ^ punctuation.section.arguments.begin.google
--               ^^^^^^ meta.column-name.google
--                     ^ punctuation.section.arguments.end.google
--                       ^^^^^^^^ keyword.other.dml.google
--                                ^^^^ meta.column-name.google

select lunchTime, avg(salary), count(age) group by isSenior,lunchTime
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.clause.select.google - meta.block.clause meta.block.clause
--                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.clause.group-by.google - meta.block.clause meta.block.clause
--^^^^ keyword.other.dml.google
--     ^^^^^^^^^ meta.column-name.google
--              ^ punctuation.separator.sequence.google
--                ^^^ meta.function-call.google support.function.aggregate.google
--                   ^^^^^^^^ meta.function-call.arguments.google
--                   ^ punctuation.section.arguments.begin.google
--                    ^^^^^^ meta.column-name.google
--                          ^ punctuation.section.arguments.end.google
--                           ^ punctuation.separator.sequence.google
--                             ^^^^^ meta.function-call.google support.function.aggregate.google
--                                  ^^^^^ meta.function-call.arguments.google
--                                  ^ punctuation.section.arguments.begin.google
--                                   ^^^ meta.column-name.google
--                                      ^ punctuation.section.arguments.end.google
--                                        ^^^^^^^^ keyword.other.dml.google
--                                                 ^^^^^^^^ meta.column-name.google
--                                                         ^ punctuation.separator.sequence.google
--                                                          ^^^^^^^^^ meta.column-name.google

select sum(salary) pivot dept
--^^^^^^^^^^^^^^^^^ meta.block.clause.select.google - meta.block.clause meta.block.clause
--                 ^^^^^^^^^^ meta.block.clause.pivot.google - meta.block.clause meta.block.clause
--^^^^ keyword.other.dml.google
--     ^^^ meta.function-call.google support.function.aggregate.google
--        ^^^^^^^^ meta.function-call.arguments.google
--        ^ punctuation.section.arguments.begin.google
--         ^^^^^^ meta.column-name.google
--               ^ punctuation.section.arguments.end.google
--                 ^^^^^ keyword.other.dml.google
--                       ^^^^ meta.column-name.google

select dept, sum(salary)
--^^^^^^^^^^^^^^^^^^^^^^ meta.block.clause.select.google - meta.block.clause meta.block.clause
--^^^^ keyword.other.dml.google
--     ^^^^ meta.column-name.google
--         ^ punctuation.separator.sequence.google
--           ^^^ meta.function-call.google support.function.aggregate.google
--              ^^^^^^^^ meta.function-call.arguments.google
--              ^ punctuation.section.arguments.begin.google
--               ^^^^^^ meta.column-name.google
--                     ^ punctuation.section.arguments.end.google
  group by dept
--^^^^^^^^^^^^^ meta.block.clause.group-by.google - meta.block.clause meta.block.clause
--^^^^^^^^ keyword.other.dml.google
--         ^^^^ meta.column-name.google
  pivot lunchTime
--^^^^^^^^^^^^^^^ meta.block.clause.pivot.google - meta.block.clause meta.block.clause
--^^^^^ keyword.other.dml.google
--      ^^^^^^^^^ meta.column-name.google


select sum(salary), max(lunchTime)
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.clause.select.google - meta.block.clause meta.block.clause
--^^^^ keyword.other.dml.google
--     ^^^ meta.function-call.google support.function.aggregate.google
--        ^^^^^^^^ meta.function-call.arguments.google
--        ^ punctuation.section.arguments.begin.google
--         ^^^^^^ meta.column-name.google
--               ^ punctuation.section.arguments.end.google
--                ^ punctuation.separator.sequence.google
--                  ^^^ meta.function-call.google support.function.aggregate.google
--                     ^^^^^^^^^^^ meta.function-call.arguments.google
--                     ^ punctuation.section.arguments.begin.google
--                      ^^^^^^^^^ meta.column-name.google
--                               ^ punctuation.section.arguments.end.google
  pivot dept
--^^^^^^^^^^ meta.block.clause.pivot.google - meta.block.clause meta.block.clause
--^^^^^ keyword.other.dml.google
--      ^^^^ meta.column-name.google

order by dept, salary desc
--^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.clause.order-by.google - meta.block.clause meta.block.clause
--^^^^^^ keyword.other.dml.google
--       ^^^^ meta.column-name.google
--           ^ punctuation.separator.sequence.google
--             ^^^^^^ meta.column-name.google
--                    ^^^^ keyword.other.google

select dept, max(salary) group by dept order by max(salary)
--^^^^^^^^^^^^^^^^^^^^^^^ meta.block.clause.select.google - meta.block.clause meta.block.clause
--                       ^^^^^^^^^^^^^^ meta.block.clause.group-by.google - meta.block.clause meta.block.clause
--                                     ^^^^^^^^^^^^^^ meta.block.clause.order-by.google - meta.block.clause meta.block.clause
--^^^^ keyword.other.dml.google
--     ^^^^ meta.column-name.google
--         ^ punctuation.separator.sequence.google
--           ^^^ meta.function-call.google support.function.aggregate.google
--              ^^^^^^^^ meta.function-call.arguments.google
--              ^ punctuation.section.arguments.begin.google
--               ^^^^^^ meta.column-name.google
--                     ^ punctuation.section.arguments.end.google
--                       ^^^^^^^^ keyword.other.dml.google
--                                ^^^^ meta.column-name.google
--                                     ^^^^^^^^ keyword.other.dml.google
--                                              ^^^ meta.function-call.google support.function.aggregate.google
--                                                 ^^^^^^^^ meta.function-call.arguments.google
--                                                 ^ punctuation.section.arguments.begin.google
--                                                  ^^^^^^ meta.column-name.google
--                                                        ^ punctuation.section.arguments.end.google

limit 100
--^^^^^^^ meta.block.clause.limit.google - meta.block.clause meta.block.clause
--^^^ keyword.other.dml.google
--    ^^^ meta.number.integer.decimal.google constant.numeric.value.google

offset 10
--^^^^^^^ meta.block.clause.offset.google - meta.block.clause meta.block.clause
--^^^^ keyword.other.dml.google
--     ^^ meta.number.integer.decimal.google constant.numeric.value.google
limit 30 offset 210
--^^^^^^^ meta.block.clause.limit.google - meta.block.clause meta.block.clause
--       ^^^^^^^^^^ meta.block.clause.offset.google - meta.block.clause meta.block.clause
--^^^ keyword.other.dml.google
--    ^^ meta.number.integer.decimal.google constant.numeric.value.google
--       ^^^^^^ keyword.other.dml.google
--              ^^^ meta.number.integer.decimal.google constant.numeric.value.google

label dept 'Department', name "Employee Name", location 'Employee Location'
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.clause.label.google - meta.block.clause meta.block.clause
--^^^ keyword.other.dml.google
--    ^^^^ meta.column-name.google
--         ^^^^^^^^^^^^ meta.string.google string.quoted.single.google
--         ^ punctuation.definition.string.begin.google
--                    ^ punctuation.definition.string.end.google
--                     ^ punctuation.separator.sequence.google
--                       ^^^^ meta.column-name.google
--                            ^^^^^^^^^^^^^^^ meta.string.google string.quoted.double.google
--                            ^ punctuation.definition.string.begin.google
--                                          ^ punctuation.definition.string.end.google
--                                           ^ punctuation.separator.sequence.google
--                                             ^^^^^^^^ meta.column-name.google
--                                                      ^^^^^^^^^^^^^^^^^^^ meta.string.google string.quoted.single.google
--                                                      ^ punctuation.definition.string.begin.google
--                                                                        ^ punctuation.definition.string.end.google

format salary '#,##0.00', hireDate 'dd-MMM-yyyy', isSenior 'Yes!:Not yet'
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.clause.format.google - meta.block.clause meta.block.clause
--^^^^ keyword.other.dml.google
--     ^^^^^^ meta.column-name.google
--            ^^^^^^^^^^ meta.string.google string.quoted.single.google
--            ^ punctuation.definition.string.begin.google
--                     ^ punctuation.definition.string.end.google
--                      ^ punctuation.separator.sequence.google
--                        ^^^^^^^^ meta.column-name.google
--                                 ^^^^^^^^^^^^^ meta.string.google string.quoted.single.google
--                                 ^ punctuation.definition.string.begin.google
--                                             ^ punctuation.definition.string.end.google
--                                              ^ punctuation.separator.sequence.google
--                                                ^^^^^^^^ meta.column-name.google
--                                                         ^^^^^^^^^^^^^^ meta.string.google string.quoted.single.google
--                                                         ^ punctuation.definition.string.begin.google
--                                                                      ^ punctuation.definition.string.end.google

select empSalary - empTax
--^^^^^^^^^^^^^^^^^^^^^^^ meta.block.clause.select.google - meta.block.clause meta.block.clause
--^^^^ keyword.other.dml.google
--     ^^^^^^^^^ meta.column-name.google
--               ^ keyword.operator.arithmetic.google
--                 ^^^^^^ meta.column-name.google

select 2 * (max(empSalary) / max(empTax))
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.clause.select.google - meta.block.clause meta.block.clause
--^^^^ keyword.other.dml.google
--     ^ meta.number.integer.decimal.google constant.numeric.value.google
--       ^ keyword.operator.arithmetic.google
--         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.group.google
--         ^ punctuation.section.group.begin.google
--          ^^^ meta.function-call.google support.function.aggregate.google
--             ^^^^^^^^^^^ meta.function-call.arguments.google
--             ^ punctuation.section.arguments.begin.google
--              ^^^^^^^^^ meta.column-name.google
--                       ^ punctuation.section.arguments.end.google
--                         ^ keyword.operator.arithmetic.google
--                           ^^^ meta.function-call.google support.function.aggregate.google
--                              ^^^^^^^^ meta.function-call.arguments.google
--                              ^ punctuation.section.arguments.begin.google
--                               ^^^^^^ meta.column-name.google
--                                     ^ punctuation.section.arguments.end.google
--                                      ^ punctuation.section.group.end.google

-- date "2008-03-18" is a date literal
where startDate < date "2008-03-18"
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.clause.where.google - meta.block.clause meta.block.clause
--^^^ keyword.other.dml.google
--    ^^^^^^^^^ meta.column-name.google
--              ^ keyword.operator.comparison.google
--                ^^^^ storage.type.google
--                     ^^^^^^^^^^^^ meta.string.google string.quoted.double.google
--                     ^ punctuation.definition.string.begin.google
--                      ^^^^^^^^^^ constant.other.date.google
--                                ^ punctuation.definition.string.end.google

-- 30 is a numeric literal
limit 30
--^^^^^^ meta.block.clause.limit.google - meta.block.clause meta.block.clause
--^^^ keyword.other.dml.google
--    ^^ meta.number.integer.decimal.google constant.numeric.value.google

-- '#,##0.00' and 'not yet:of course!' are both string literals
format salary '#,##0.00', isSenior 'not yet:of course!'
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.clause.format.google - meta.block.clause meta.block.clause
--^^^^ keyword.other.dml.google
--     ^^^^^^ meta.column-name.google
--            ^^^^^^^^^^ meta.string.google string.quoted.single.google
--            ^ punctuation.definition.string.begin.google
--                     ^ punctuation.definition.string.end.google
--                      ^ punctuation.separator.sequence.google
--                        ^^^^^^^^ meta.column-name.google
--                                 ^^^^^^^^^^^^^^^^^^^^ meta.string.google string.quoted.single.google
--                                 ^ punctuation.definition.string.begin.google
--                                                    ^ punctuation.definition.string.end.google

-- https://stackoverflow.com/a/55506375/241211
select * where Col1 matches '.*(yes|no).*'
--             ^^^^ variable.language.google
