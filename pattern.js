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

  Inverted Triangke:
