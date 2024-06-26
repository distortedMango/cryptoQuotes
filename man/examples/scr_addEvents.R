# script start;

# 1) Generate random events
# of buys and sells and convert
# to data.frame
#
# Note: tibbles, data.tables are also supported
# but only base R is shown here to avoid
# too many dependencies
set.seed(1903)
event_data <- cryptoQuotes::ATOM[
  sample(
    x = 1:nrow(cryptoQuotes::ATOM),
    size = 2
  )
]

# 1.1) Extract the index
# from the event data
index <- zoo::index(
  event_data
)

# 1.2) Convert the coredata
# into a data.frame
event_data <- as.data.frame(
  zoo::coredata(
    event_data
  )
)

# 1.3) Add the index into the data.frame
# case insensitive
event_data$index <- index

# 1.4) add events to the data.
# here we use Buys and Sells.
event_data$event <- rep(
  x = c('Buy', 'Sell'),
  lenght.out = nrow(event_data)
)

# 1.5) add colors based
# on the event; here buy is colored
# darkgrey, and if the position is closed
# with profit the color is green
event_data$color <- ifelse(
  event_data$event == 'Buy',
  yes = 'darkgrey',
  no  = ifelse(
    test = subset(
        x = event_data,
        event == 'Buy')$close < subset(x = event_data, event == 'Sell')$close,
    yes  = 'green',
    no   = 'red'
  )
)

# 1.6) modify the event to add
# closing price at each event
event_data$event <- paste0(
  event_data$event, ' @', event_data$close
)

# 2) Chart the the klines
# and add the buy and sell events
cryptoQuotes::chart(
  ticker     = cryptoQuotes::ATOM,
  main       = cryptoQuotes::kline(),
  sub        = list(
    cryptoQuotes::volume()
  ),
  indicator = list(
    cryptoQuotes::bollinger_bands()
  ),
  event_data = event_data,
  options = list(
    dark = TRUE,
    deficiency = FALSE
  )
)

# script end;
