% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chart_rsi.R
\name{rsi}
\alias{rsi}
\title{Chart the Relative Strength Index (RSI)}
\usage{
rsi(
 price       = "close",
 n           = 14,
 maType      = "SMA",
 upper_limit = 80,
 lower_limit = 20,
 color       = '#4682b4',
 ...
)
}
\arguments{
\item{price}{Price series that is coercible to xts or matrix.}

\item{n}{Number of periods for moving averages.}

\item{maType}{Either:
\enumerate{
  \item A function or a string naming the function to be called.
  \item A \emph{list} with the first component like (1) above, and
    additional parameters specified as \emph{named} components.
    See Examples.
}}

\item{upper_limit}{A \link{numeric}-vector of \link{length} 1. 80 by default.
Sets the upper limit of the \link[TTR:RSI]{TTR::RSI}.}

\item{lower_limit}{A \link{numeric}-vector of \link{length} 1. 20 by default.
Sets the lower limit of the \link[TTR:RSI]{TTR::RSI}.}

\item{color}{A \link{character}-vector of \link{length} 1. "#4682b4" by default.}

\item{...}{For internal use. Please ignore.}
}
\value{
An \link{invisible} \code{\link[plotly:plot_ly]{plotly::plot_ly()}}-object.
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}

A high-level \code{\link[plotly:plot_ly]{plotly::plot_ly()}}- and \code{\link[plotly:add_trace]{plotly::add_lines()}}-function that
interacts with the \code{\link[TTR:RSI]{TTR::RSI()}}-function.
The function adds a subchart with a \code{\link[TTR:RSI]{TTR::RSI()}}-indicator.
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
\code{\link{sma}()},
\code{\link{smi}()},
\code{\link{volume}()},
\code{\link{vwap}()},
\code{\link{wma}()},
\code{\link{zlema}()}

Other subchart indicators: 
\code{\link{add_event}()},
\code{\link{fgi}()},
\code{\link{lsr}()},
\code{\link{macd}()},
\code{\link{smi}()},
\code{\link{volume}()}

Other momentum indicators: 
\code{\link{macd}()},
\code{\link{smi}()}
}
\author{
Serkan Korkmaz
}
\concept{chart indicators}
\concept{momentum indicators}
\concept{subchart indicators}
