context("mvmr")
library(TwoSampleMR)

test_that("control", {
	lipids <- mv_extract_exposures(c("ieu-a-299","ieu-a-300","ieu-a-302"), access_token=NULL)
	chd <- extract_outcome_data(lipids$SNP, "ieu-a-7", access_token = NULL)
	control <- mv_harmonise_data(lipids, chd)
	mv_residual(control, intercept=TRUE, instrument_specific=TRUE)$result
	mv_residual(control, intercept=FALSE, instrument_specific=TRUE)$result
	mv_residual(control, intercept=TRUE, instrument_specific=FALSE)$result
	mv_residual(control, intercept=FALSE, instrument_specific=FALSE)$result
	mv_multiple(control, intercept=TRUE, instrument_specific=TRUE)$result
	mv_multiple(control, intercept=FALSE, instrument_specific=TRUE)$result
	mv_multiple(control, intercept=TRUE, instrument_specific=FALSE)$result
	mv_multiple(control, intercept=FALSE, instrument_specific=FALSE)$result
})


test_that("dat", {
	a <- mv_extract_exposures(c("ukb-a-196", "ieu-a-1001"), access_token=NULL)
	b <- extract_outcome_data(a$SNP, "ieu-a-297", access_token = NULL)
	dat <- mv_harmonise_data(a, b)
	mv_residual(dat, intercept=TRUE, instrument_specific=TRUE)$result
	mv_residual(dat, intercept=FALSE, instrument_specific=TRUE)$result
	mv_residual(dat, intercept=TRUE, instrument_specific=FALSE)$result
	mv_residual(dat, intercept=FALSE, instrument_specific=FALSE)$result
	mv_multiple(dat, intercept=TRUE, instrument_specific=TRUE)$result
	mv_multiple(dat, intercept=FALSE, instrument_specific=TRUE)$result
	mv_multiple(dat, intercept=TRUE, instrument_specific=FALSE)$result
	mv_multiple(dat, intercept=FALSE, instrument_specific=FALSE)$result
	mv_ivw(dat)$result
	mv_basic(dat)$result
})



