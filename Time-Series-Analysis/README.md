# Time Series Analysis

Implementations of time series modeling and forecasting applied to 
real financial data — covering univariate and multivariate approaches 
for analyzing temporal dependencies and volatility in sequential data.

## Implementations

### Currency Exchange Rate Forecasting 
Analysis of USD/EUR, USD/GBP, USD/AUD, and USD/NZD exchange rates 
(2014–2019):

- Stationarity testing and differencing
- ARIMA model selection via AIC and EACF
- 8-week ahead forecasting with 95% confidence intervals
- VAR(2) multivariate modeling across four currency pairs
- MAPE comparison: univariate vs. multivariate forecasting performance

### Volatility Modeling and Rolling Forecasting
Applied to economic growth rate time series:

- ARIMA order selection via AIC iteration
- ARMA-GARCH modeling for conditional volatility estimation
- Rolling 40-point forecast with out-of-sample evaluation
- Ljung-Box, Jarque-Bera, and ARCH diagnostic tests
- MAPE and Precision Measure accuracy assessment

## Methods Covered

- ARIMA — autoregressive integrated moving average modeling
- GARCH — generalized autoregressive conditional heteroscedasticity
- VAR — vector autoregression for multivariate time series
- EACF — extended autocorrelation function for order selection
- AIC/BIC — information criteria for model selection
- Rolling forecasting with out-of-sample evaluation

## Libraries

R · forecast · tseries · vars · rugarch · fGarch · ggplot2

## Relevance to Decision Intelligence Systems

Time series forecasting underpins demand prediction in systems. The distribution-shift failures documented 
in correlation and ARIMA-based models under novel conditions — 
such as the COVID-19 demand collapse — directly illustrate why 
causally robust AI frameworks are necessary for reliable production 
deployment in high-variability environments such as airline booking 
and pricing systems.
