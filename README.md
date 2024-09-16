# Impact of Market Shocks on Markowitz Optimised Portfolio

## Project Overview

This project examines the effects of market shocks on a Markowitz-optimized portfolio. The Markowitz model, or mean-variance optimization, is a foundational approach to portfolio selection that aims to maximize returns for a given level of risk. However, it is based on historical data and assumes market conditions remain stable over time. This research investigates how sudden market events—commonly referred to as "market shocks"—disrupt the performance of an optimized portfolio.

### Main Findings:
- **Market shocks** significantly alter the risk-return dynamics, often resulting in suboptimal performance of the portfolio initially designed under normal conditions.
- A **re-optimization post-shock** can partially mitigate losses, though the extent of recovery varies depending on the nature and magnitude of the shock.
- The study demonstrates the importance of incorporating **stress testing** and **shock scenarios** when using Markowitz optimization in volatile markets.

### Key Figure:
The main figure in this study highlights the comparative performance of a portfolio before and after a significant market shock (e.g., a financial crisis, sudden interest rate change). The chart compares the efficient frontiers under normal and shock conditions, illustrating the shift in optimal risk-return trade-offs.

---

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

**Data**
The data used in this project comes from publicly available sources like Yahoo Finance, accessible through the yfinance library. The notebook provides instructions to automatically download the required stock prices.

**Conclusion**
This research highlights the vulnerability of traditionally optimized portfolios in the face of unexpected market shocks. The results stress the importance of dynamically updating portfolio allocations and incorporating scenario analysis in investment strategies.
   
