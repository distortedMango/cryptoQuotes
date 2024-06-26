% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_quote.R
\name{get_quote}
\alias{get_quote}
\title{Get the Open, High, Low, Close and Volume data on a cryptocurrency pair}
\usage{
get_quote(
 ticker,
 source   = 'binance',
 futures  = TRUE,
 interval = '1d',
 from     = NULL,
 to       = NULL
)
}
\arguments{
\item{ticker}{A \link{character}-vector of \link{length} 1.
See \code{\link[=available_tickers]{available_tickers()}} for available tickers.}

\item{source}{A \link{character}-vector of \link{length} 1. \code{binance} by default.
See \code{\link[=available_exchanges]{available_exchanges()}} for available exchanges.}

\item{futures}{A \link{logical}-vector of \link{length} 1. \link{TRUE} by default.
Returns futures market if \link{TRUE}, spot market otherwise.}

\item{interval}{A \link{character}-vector of \link{length} 1. \verb{1d} by default.
See \code{\link[=available_intervals]{available_intervals()}} for available intervals.}

\item{from}{An optional \link{character}-, \link{date}- or
\link{POSIXct}-vector of \link{length} 1. \link{NULL} by default.}

\item{to}{An optional \link{character}-, \link{date}- or
\link{POSIXct}-vector of \link{length} 1. \link{NULL} by default.}
}
\value{
An \link{xts}-object containing,

\item{index}{<\link{POSIXct}> The time-index}
\item{open}{<\link{numeric}> Opening price}
\item{high}{<\link{numeric}> Highest price}
\item{low}{<\link{numeric}> Lowest price}
\item{close}{<\link{numeric}> Closing price}
\item{volume}{<\link{numeric}> Trading volume}

\strong{Sample output}

\if{html}{\out{<div class="sourceCode">}}\preformatted{#>                        open    high     low   close   volume
#> 2024-05-12 02:00:00 60809.2 61849.4 60557.3 61455.8 104043.9
#> 2024-05-13 02:00:00 61455.7 63440.0 60750.0 62912.1 261927.1
#> 2024-05-14 02:00:00 62912.2 63099.6 60950.0 61550.5 244345.3
#> 2024-05-15 02:00:00 61550.5 66440.0 61316.1 66175.4 365031.7
#> 2024-05-16 02:00:00 66175.4 66800.0 64567.0 65217.7 242455.3
#> 2024-05-17 02:00:00 65217.7 66478.5 65061.2 66218.8  66139.1
}\if{html}{\out{</div>}}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#stable}{\figure{lifecycle-stable.svg}{options: alt='[Stable]'}}}{\strong{[Stable]}}

Get a quote on a cryptocurrency pair from the \code{\link[=available_exchanges]{available_exchanges()}} in
various \code{\link[=available_intervals]{available_intervals()}} for any
actively traded \code{\link[=available_tickers]{available_tickers()}}.
}
\details{
\subsection{On time-zones and dates}{

Values passed to \code{from} or \code{to} must be coercible by \code{\link[=as.Date]{as.Date()}},
or \code{\link[=as.POSIXct]{as.POSIXct()}}, with a format of either \code{"\%Y-\%m-\%d"} or
\code{"\%Y-\%m-\%d \%H:\%M:\%S"}. By default all dates are passed and
returned with \code{\link[=Sys.timezone]{Sys.timezone()}}.
}

\subsection{On returns}{

If only \code{from} is provided 200 pips are returned up to \code{Sys.time()}.
If only \code{to} is provided 200 pips up to the specified date is returned.
}
}
\examples{
\dontrun{
  # script start;

  # get quote on
  # BTCUSDT pair from
  # Binance in 30m
  # intervals from the
  # last 24 hours
  tail(
    BTC <- cryptoQuotes::get_quote(
      ticker   = 'BTCUSDT',
      source   = 'binance',
      interval = '30m',
      futures  = FALSE,
      from     = Sys.Date() - 1
    )
  )

  # script end;
}
}
\seealso{
Other get-functions: 
\code{\link{get_fgindex}()},
\code{\link{get_fundingrate}()},
\code{\link{get_lsratio}()},
\code{\link{get_openinterest}()}
}
\author{
Serkan Korkmaz
}
\concept{get-functions}
