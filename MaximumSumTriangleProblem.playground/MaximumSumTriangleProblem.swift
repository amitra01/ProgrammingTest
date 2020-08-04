/*
 The below function computes the maximum sum for a triangle of numbers.
 The triangle input is represented as a 2D array of numbers having equal number of rows and columns. Missing elements are padded with 0s to create a lower triangular matrix.
 The maximum sum is returned as the output.
 
 The algorithm starts traversing the triangle from the bottom and works its way upwards through each level.
 
 The iteration starts with each node on the second last row and compares the corresponding adjacent element pairs in the row below to identify the larger number. The node value is then updated with the sum of maximum adjacent element and the existing value of the node.
 
 This is continued until the top level of the triangle is reached, ultimately returning the first element of the array as the final output.
 */
func findMaximumSum(triangle: inout [[Int]]) -> Int {
    let numberOfRows = triangle.count
    for rowIndex in stride(from: numberOfRows - 2, through: 0, by: -1) {
        for columnIndex in 0...rowIndex {
                triangle[rowIndex][columnIndex] += max(triangle[rowIndex + 1][columnIndex], triangle[rowIndex + 1][columnIndex + 1])
        }
    }
    return triangle[0][0]
}

var inputArray = [[3, 0, 0, 0], [7, 4, 0, 0], [2, 4, 6, 0], [8, 5, 9, 3]]
print(findMaximumSum(triangle: &inputArray))

/* Time complexity considerations
 The above function has a time complexity of O(n^2) based on the 2 nested 'for-loops'. This works more efficiently for larger data sets than a brute force approach which tries every possible route (time complexity: O(2^(n-1)).
 
 The triangle of numbers here is represented through a [n x n] array, where n is the maximum number of levels of the triangle. The missing elements at each level are replaced with 0s to create a lower triangular matrix.
*/
