# Impact of Market Shocks on Markowitz Optimised Portfolio

## Project Overview

This project examines the effects of market shocks on a Markowitz-optimized portfolio. The Markowitz model, or mean-variance optimization, is a foundational approach to portfolio selection that aims to maximize returns for a given level of risk. It assumes that market conditions remain stable over time. This research investigates how sudden market events—commonly referred to as "market shocks" affects the performance of optimized portfolios.

### Main Findings:
- None of the analysed models (neither the minimum variance strategy nor maximum Sharpe strategy) consistently derive stable positive results when compared using key metrics (returns, volatilities and Sharpe ratios).
- Each model exhibits trade-offs in performance, further confirming the difficulty of managing portfolios of large-cap stocks in times of market distress.
- The maximum Sharpe ratio strategy generated higher returns and higher Sharpe ratios, however at the cost of increased volatility.
- The minimum variance portfolio achieved on average the lowest volatility, however it also generated mostly negative retuns.
- Outperforming the benchmark - the equally weighted portfolio - proved to be challenging also in course of market turbulence.
- Inclusion of alternative financial instruments such as commodity derivated may result in improved portfolio performance, especially during market distress.


## Reproducing the Findings

### Requirements

To reproduce the results presented in this study, you will need to set up a Jupyter Notebook environment. The project primarily uses Python with the following key libraries:

- `pandas` for data manipulation
- `numpy` for numerical operations
- `matplotlib` and `seaborn` for visualization
- `scipy` for statistical computations
- `yfinance` for fetching historical stock data
- `cvxopt` or `PyPortfolioOpt` for implementing Markowitz optimization

### Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/market-shocks-portfolio.git
   cd market-shocks-portfolio
   ```

2. **Install the required packages: You can install the dependencies using pip**:
   ```bash
   pip install -r requirements.txt
   ```
3. Fetch historical data: The code will use yfinance to download stock data. Ensure you have an active internet connection when running the notebooks.
4. Run the Jupyter Notebook: Launch Jupyter Notebook and open the main notebook:
   ```bash
   jupyter notebook
   ```
In the notebook, follow the steps to:

Build a Markowitz-optimized portfolio using historical data.
Simulate market shocks based on predefined or random events (e.g., price crashes, volatility spikes).
Evaluate the performance of the portfolio post-shock and re-optimize it if necessary.
Main Results: The main results, figures, and tables will be generated as part of the notebook execution.
Re-Optimization: Use the post-shock data to rerun the Markowitz optimization and compare the newly optimized portfolio with the original one.

**Use of branches**
NB: You will have to work only with the `Dev` branch. DO NOT MERGE directly to the `main` branch. Since we are using a free version of github, there is a missing feature of locking a `main` branch from merges and pushes directly (except for the admins of the repo). All direct PRs to `main` from other branches except for `dev` will be discarded. 

**Data**
The data used in this project comes from publicly available sources like Yahoo Finance, accessible through the yfinance library. The notebook provides instructions to automatically download the required stock prices.

**Docker**
deploy docker on the container and install volume
use commands:
docker build -t main .
docker run -p 8888:8888 main

**Conclusion**
This research highlights the vulnerability of traditionally optimized portfolios in the face of unexpected market shocks. The results stress the importance of dynamically updating portfolio allocations and incorporating scenario analysis in investment strategies.
   
