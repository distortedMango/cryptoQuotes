# script: test-infer_interval
# author: Serkan Korkmaz, serkor1@duck.com
# date: 2024-05-24
# objective: Test the infer_interval-function
# and assert that it infers the intervals passed
# into the function.
# script start;

testthat::test_that(
  desc = "
  All inferred intervals corresponds
  to the actual passed intervals
  ",
  code = {

    # 1) extract exchanges
    exchanges <- suppressMessages(
      cryptoQuotes::available_exchanges(
        type = "ohlc"
      )
    )

    for (exchange in exchanges) {

      for (lgl in c(TRUE, FALSE)) {

        # 0) extract intervals
        # based on exchange and
        # market
        intervals <- suppressMessages(
          cryptoQuotes::available_intervals(
            source = exchange,
            futures = lgl
          )
        )

        # 1) check if its a character
        # vector
        testthat::expect_true(
          inherits(
            intervals,
            "character"
          )
        )

        # 2) create a vector
        # of TRUE/FALSE values
        # based on the inferred interval
        lgl_vector <- vapply(
          X   = intervals,
          FUN = function(x) {

            # 2.1) Generate
            # date intervals using default_dates
            date_interval <- cryptoQuotes:::default_dates(
              interval =  x,
              length   = 2
            )

            # 2.2) extrapolate
            # the dates between from and
            # to.
            dates <- seq(
              from       = date_interval$from,
              to         = date_interval$to,
              # Add 1 if the interval is days as
              # the default_date adds 1 day if chosen
              # to avoid errors due to conversion
              # on API level
              length.out = 2 + as.numeric(x == "1d" | x == "3d")
            )[1:2]

            # 2.3) assert that
            # the passed interval x is
            # equal to the inferred interval
            setequal(
              x = x,
              y = cryptoQuotes:::infer_interval(
                x = xts::xts(
                  x        = seq_len(2),
                  order.by = dates
                )

              )
            )

          },
          FUN.VALUE = logical(1)
        )


        testthat::expect_true(
          all(
            lgl_vector
          )
        )
      }

    }

  }
)

# script end;



