function invertedPyramid(rows) {
    console.log("Inverted Pyramid");
    for (let i = rows; i >= 1; i--) { // Start from 'rows' and decrease to 1
        let space = " ".repeat(rows - i); // Adjust spaces dynamically
        let stars = "*".repeat(2 * i - 1); // Create stars for the current row
        console.log(space + stars); // Combine spaces and stars
    }
    console.log("\n");
}

invertedPyramid(5);

O/P
*********
 *******
  *****
   ***
    *

SQUARE:
function square(rows) {
    console.log("square");
    for (let i = 1; i <= rows; i++) {
        let space = "".repeat(rows);
        let stars = "*".repeat(rows)
        console.log(space+stars); 
    }
    console.log("\n");
}
square(3);
O/P
***
***
***

Hollow Square:
function HollowSquare(rows) {
    console.log("square");
    for (let i = 1; i <= rows; i++) {
        let row;
        if (i === 1 || i === rows) {
            row = "*".repeat(rows);
        } else {
            row = "*" + " ".repeat(rows - 2) + "*";
        }
        console.log(row);
    }
    console.log("\n");
}
HollowSquare(5);

O/P:
*****
*   *
*   *
*   *
*****

Inverted Triangle:
function InvertedTriangle(rows){
    console.log("InvertedTriangle")
    
    for(let i = rows; i>= 1;i--){
        console.log("*".repeat(i))
    }
}
InvertedTriangle(5)
O/P
*****
****
***
**
*

