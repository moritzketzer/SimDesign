% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/util.R
\name{timeFormater}
\alias{timeFormater}
\title{Format time string to suitable numeric output}
\usage{
timeFormater(time, output = "sec")
}
\arguments{
\item{time}{a character string to be formatted. If a numeric vector is supplied
then this will be interpreted as minutes due to character coercion.}

\item{output}{type of numeric output to convert time into.
Currently supported are \code{'sec'} for seconds (default),
\code{'min'} for minutes, \code{'hour'}, and \code{'day'}}
}
\description{
Format time input string into suitable numeric output metric (e.g., seconds).
Input follows the \code{SBATCH} utility specifications.
Accepted time formats include \code{"minutes"},
\code{"minutes:seconds"}, \code{"hours:minutes:seconds"},
\code{"days-hours"}, \code{"days-hours:minutes"} and
\code{"days-hours:minutes:seconds"}.
}
\details{
For example, \code{time = "60"} indicates a maximum time of 60 minutes,
\code{time = "03:00:00"} a maximum time of 3 hours,
\code{time = "4-12"} a maximum of 4 days and 12 hours, and
\code{time = "2-02:30:00"} a maximum of 2 days, 2 hours and 30 minutes.
}
\examples{

# Test cases (outputs in seconds)
timeFormater("4-12")        # day-hours
timeFormater("4-12:15")     # day-hours:minutes
timeFormater("4-12:15:30")  # day-hours:minutes:seconds

timeFormater("30")          # minutes
timeFormater("30:30")       # minutes:seconds
timeFormater("4:30:30")     # hours:minutes:seconds

# output in hours
timeFormater("4-12", output = 'hour')
timeFormater("4-12:15", output = 'hour')
timeFormater("4-12:15:30", output = 'hour')

timeFormater("30", output = 'hour')
timeFormater("30:30", output = 'hour')
timeFormater("4:30:30", output = 'hour')

# numeric input is understood as minutes
timeFormater(42)               # seconds
timeFormater(42, output='min') # minutes

}
