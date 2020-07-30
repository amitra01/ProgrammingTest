import Foundation

/*
Below function computes the best time and price to buy and the best time and price to sell a stock in order to earn the maximum profit.
The function takes an array of stock prices and an array of time as input.
The function returns a tuple containing the maximum profit, the buying time, the buying price, the selling time and the selling price.
 */

func findMaximumProfit(prices: [Double], times: [String]) -> (maxProfit: Double, buyingTime: String, buyingPrice: Double, sellingTime: String, sellingPrice: Double) {
    
    // Variables to temporarily hold values while iterating through the price array
    var tempProfit = 0.0
    var tempIndexOfMinimumBuyingPrice = 0
    var tempMinBuyingPrice = prices[tempIndexOfMinimumBuyingPrice]
    var tempIndexOfMaximumSellingPrice = 0
    var tempMaxSellingPrice = 0.0
    
    // Variables to hold final values after evaluating "buying time is less than selling time" criteria
    var indexOfMinimumBuyingPrice = 0
    var minimumBuyingPrice = 0.0
    var indexOfMaximumSellingPrice = 0
    var maximumSellingPrice = 0.0
    var maximumProfit = 0.0
    
    for index in 1..<prices.count {
        if (prices[index] < prices[tempIndexOfMinimumBuyingPrice]) { // update minimum value
            tempMinBuyingPrice = prices[index]
            tempIndexOfMinimumBuyingPrice = index
        } else if ((prices[index] - tempMinBuyingPrice)).round(to: 1) > tempProfit { // update maximum profit
            tempProfit = (prices[index] - tempMinBuyingPrice).round(to: 1)
            tempMaxSellingPrice = prices[index]
            tempIndexOfMaximumSellingPrice = index
        }
        
        // Check to ensure buying time is always less than the selling time
        if (tempIndexOfMinimumBuyingPrice < tempIndexOfMaximumSellingPrice) {
            indexOfMinimumBuyingPrice = tempIndexOfMinimumBuyingPrice
            indexOfMaximumSellingPrice = tempIndexOfMaximumSellingPrice
            minimumBuyingPrice = tempMinBuyingPrice
            maximumSellingPrice = tempMaxSellingPrice
            maximumProfit = (maximumSellingPrice - minimumBuyingPrice).round(to: 1)
        }
    }
    return (maximumProfit, times[indexOfMinimumBuyingPrice], minimumBuyingPrice, times[indexOfMaximumSellingPrice], maximumSellingPrice)
}

// Extension on Double to round off the price difference to one decimal place
extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

// Checking the Output for the given dataset
let timeOfDay = ["09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00"]
let stockPrices = [1.2, 1.3, 1.4, 1.5, 1.6, 1.4, 1.2, 1.0, 0.8, 0.9, 1.1, 1.3, 1.4, 1.2, 1.1, 0.7, 1.3]
print(findMaximumProfit(prices: stockPrices, times: timeOfDay))

// Output: (buyingTime: "13:00", buyingPrice: 0.8, sellingTime: "15:00", sellingPrice: 1.4, maxProfit: 0.6)


/*
 Q1) What can you say about the algorithm you chose in comparison to any others available?
 
 A1)
The algorithm above uses a single pass approach to compare the buying price and selling price inorder to find the maximum difference between the two while making sure the buying time is less than the selling time. The solution has a time complexity of O(n)
 
The above could have also been accomplished using two nested 'for-loops' to compare the buying and selling prices.This would have increased the time complexity to O(n2). Although this approach would work fine for smaller datasets, it would hamper the performance when scaling the application for larger datasets.
 
 In the quoted example with 10000 stocks changing prices every second, an algorithm with nested 'for-loops' would be inefficient given the large size of the data.
 
 Q2) While working through the program, have you noticed any ambiguities in the requirements? If so, how have you dealt with them? Would this differ for how you would deal with ambiguities in requirements in a real-life situation? IF so, how?
 
 A2)
 The number of times that a stock can be bought or sold is not mentioned. The abolve solution has been written assuming there can only be a single transaction ie, a stock can be bought or sold only once.
 Also there could be more than one pair of buying and selling prices returning the maximum profit. In the above solution the first such pair detected by the algorithm is returned as the output.
 
 In a real-life scenario, I would get the ambiguities clarified and get sign-offs first before starting work on the implementation.
 */

