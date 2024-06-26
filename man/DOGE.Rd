% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DOGE.R
\docType{data}
\name{DOGE}
\alias{DOGE}
\title{USDT Denominated DOGECOIN (DOGEUSDT) 1-Minute Intervals}
\format{
An \code{\link[xts:xts]{xts::xts()}}-object  with 61 rows and 5 columns,

\describe{
\item{index}{<\link{POSIXct}> The time-index}
\item{open}{<\link{numeric}> Opening price}
\item{high}{<\link{numeric}> Highest price}
\item{low}{<\link{numeric}> Lowest price}
\item{close}{<\link{numeric}> Closing price}
\item{volume}{<\link{numeric}> Trading volume}
}
}
\usage{
DOGE
}
\description{
This dataset contains time-series data for the DOGECOIN (DOGE)
denominated in USDT (Tether), captured in 1-minute intervals.
The data spans 2022-01-14 07:00:00 CET to 2022-01-14 08:00:00 CET.
}
\examples{
# Load the dataset
data("DOGE")

# chart
chart(
  ticker = DOGE,
  main = kline(),
  sub = list(volume())
)
}
\keyword{datasets}
