% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chart_volume.R
\name{volume}
\alias{volume}
\title{Chart the trading volume}
\usage{
volume(...)
}
\arguments{
\item{...}{For internal use. Please ignore.}
}
\value{
An \link{invisible} \code{\link[plotly:plot_ly]{plotly::plot_ly()}}-object.
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}

A high-level \code{\link[plotly:plot_ly]{plotly::plot_ly()}}-function.
The function adds a subchart with the trading \code{trading}.
}
\examples{
# script start;

# 1) charting weekly
# BTC using candlesticks
# and indicators
cryptoQuotes::chart(
  ticker     = BTC,
  main       = cryptoQuotes::kline(),
  sub        = list(
    cryptoQuotes::volume(),
    cryptoQuotes::macd()
  ),
  indicator = list(
    cryptoQuotes::bollinger_bands(),
    cryptoQuotes::sma(),
    cryptoQuotes::alma()
  ),
  options = list(
    dark       = TRUE,
    deficiency = FALSE
  )
)

# script end;
}
\seealso{
Other chart indicators: 
\code{\link{add_event}()},
\code{\link{alma}()},
\code{\link{bollinger_bands}()},
\code{\link{chart}()},
\code{\link{dema}()},
\code{\link{donchian_channel}()},
\code{\link{ema}()},
\code{\link{evwma}()},
\code{\link{fgi}()},
\code{\link{hma}()},
\code{\link{lsr}()},
\code{\link{macd}()},
\code{\link{rsi}()},
\code{\link{sma}()},
\code{\link{smi}()},
\code{\link{vwap}()},
\code{\link{wma}()},
\code{\link{zlema}()}

Other subchart indicators: 
\code{\link{add_event}()},
\code{\link{fgi}()},
\code{\link{lsr}()},
\code{\link{macd}()},
\code{\link{rsi}()},
\code{\link{smi}()}
}
\author{
Serkan Korkmaz
}
\concept{chart indicators}
\concept{subchart indicators}
