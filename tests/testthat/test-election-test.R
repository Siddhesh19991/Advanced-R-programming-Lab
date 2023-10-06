# test_that("multiplication works", {
#   expect_equal(2 * 2, 4)
# })

test_that("election rejects input",{
  expect_error(election("Sweden"))
  expect_error(election(123))
})

test_that("correct setup of the class",{
  expect_true(class(election)[1] == "refObjectGenerator")
})


test_that("correct class",{
  election_test<-election()
  expect_true(class(election_test)[1]=="election")
})


test_that("Data is extracted",{
  election_test<-election()
  expect_true(is.data.frame(election_test$election_data)==TRUE)
})

