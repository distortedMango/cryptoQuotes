# script: Kraken Unit Test
# author: Serkan Korkmaz, serkor1@duck.com
# date: 2024-05-18
# objective: This unit test is a sample of of the functions
# available in the package for CI/CD. Most tests fails on Github
# because of georestrictions - and this makes the library prone to
# bugs and errors for future contributions. This unit test is a sample test
# to filter errorneous pushses from contributors from the get go.
#
# All tests has to be done locally - but this is an initial security measure
# script start;

# 1) SPOT
testthat::test_that(
  desc = "Test get_quote() for Kraken (SPOT)",
  code = {

    # 0) skip if offline
    # and on github
    testthat::skip_if_offline()

    # 1) get available tickers
    testthat::expect_no_condition(
      ticker <- cryptoQuotes::available_tickers(
        source  = "kraken",
        futures = FALSE
      )
    )

    # 2) get quote from kraken
    testthat::expect_no_condition(
      output <- get_quote(
        ticker   = sample(ticker,size = 1),
        source   = "kraken",
        interval = "1d",
        futures  = FALSE
      )
    )


    # 2) test wether the
    # ohlc is logical
    testthat::expect_true(
      all(
        output$high >= output$low,
        output$open >= output$low,
        output$open <= output$high,
        output$close >= output$low,
        output$close <= output$high
      )
    )


    # 3) test if dates are reasonable
    # within range
    date_range <- as.numeric(
      format(
        range(
          zoo::index(output)
        ),
        format = "%Y"
      )
    )

    testthat::expect_true(
      object = all(
        min(date_range) >= 2000,
        max(date_range) <= as.numeric(format(Sys.Date(), "%Y"))
      )
    )

  }
)





# 2) Futures
testthat::test_that(
  desc = "Test get_quote() for Kraken (FUTURES)",
  code = {

    # 0) skip if offline
    # and on github
    testthat::skip_if_offline()

    # 1) get available tickers
    testthat::expect_no_condition(
      ticker <- cryptoQuotes::available_tickers(
        source  = "kraken",
        futures = TRUE
      )
    )

    # 2) get quote from kraken
    testthat::expect_no_condition(
      output <- get_quote(
        ticker   = sample(ticker,size = 1),
        source   = "kraken",
        interval = "1d",
        futures  = TRUE
      )
    )


    # 2) test wether the
    # ohlc is logical
    testthat::expect_true(
      all(
        output$high >= output$low,
        output$open >= output$low,
        output$open <= output$high,
        output$close >= output$low,
        output$close <= output$high
      )
    )


    # 3) test if dates are reasonable
    # within range
    date_range <- as.numeric(
      format(
        range(
          zoo::index(output)
        ),
        format = "%Y"
      )
    )

    testthat::expect_true(
      object = all(
        min(date_range) >= 2000,
        max(date_range) <= as.numeric(format(Sys.Date(), "%Y"))
      )
    )

  }
)

# 2) Long-Short Ration
testthat::test_that(
  desc = "Test get_lsr() for Kraken (FUTURES)",
  code = {

    # 0) skip if offline
    # and on github
    testthat::skip_if_offline()

    # 1) get available tickers
    testthat::expect_no_condition(
      ticker <- cryptoQuotes::available_tickers(
        source  = "kraken",
        futures = TRUE
      )
    )

    # 2) get quote from kraken
    testthat::expect_no_condition(
      output <- get_lsratio(
        ticker   = sample(ticker,size = 1),
        source   = "kraken",
        interval = "2d"
      )
    )


    # 3) test if dates are reasonable
    # within range
    date_range <- as.numeric(
      format(
        range(
          zoo::index(output)
        ),
        format = "%Y"
      )
    )

    testthat::expect_true(
      object = all(
        min(date_range) >= 2000,
        max(date_range) <= as.numeric(format(Sys.Date(), "%Y"))
      )
    )

  }
)

# 3) Open Interest
testthat::test_that(
  desc = "Test open_interest() for Kraken (FUTURES)",
  code = {

    # 0) skip if offline
    # and on github
    testthat::skip_if_offline()

    # 1) get available tickers
    testthat::expect_no_condition(
      ticker <- cryptoQuotes::available_tickers(
        source  = "kraken",
        futures = TRUE
      )
    )

    # 2) get quote from kraken
    testthat::expect_no_condition(
      output <- get_openinterest(
        ticker   = sample(ticker,size = 1),
        source   = "kraken",
        interval = "2d"
      )
    )


    # 3) test if dates are reasonable
    # within range
    date_range <- as.numeric(
      format(
        range(
          zoo::index(output)
        ),
        format = "%Y"
      )
    )

    testthat::expect_true(
      object = all(
        min(date_range) >= 2000,
        max(date_range) <= as.numeric(format(Sys.Date(), "%Y"))
      )
    )

  }
)

# script end;
