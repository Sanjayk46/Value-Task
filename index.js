// Circle color change functionality
function changeColor(color) {
  const circle = document.getElementById('circle');
  circle.style.backgroundColor = color;
}

function resetColor() {
  const circle = document.getElementById('circle');
  circle.style.backgroundColor = ''; // Reset to original color
}

// Real-time color change based on input
const circle = document.getElementById('circle');
const input = document.getElementById('colorInput');
input.addEventListener('input', () => {
  circle.style.backgroundColor = input.value;
});

// Tic Tac Toe functionality
const board = document.getElementById('board');
const statusDisplay = document.getElementById('status');
let currentPlayer = 'X';
let gameActive = true;
let gameState = Array(9).fill("");

// Winning combinations
const winningConditions = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
];

function handleCellClick(event) {
  const cell = event.target;
  const cellIndex = cell.getAttribute('data-index');

  // Ignore clicks if game is over or cell is already taken
  if (gameState[cellIndex] !== "" || !gameActive) return;

  // Update the cell and the game state
  gameState[cellIndex] = currentPlayer;
  cell.textContent = currentPlayer;
  cell.classList.add('taken');

  // Check if the current player has won
  if (checkWinner()) {
    statusDisplay.textContent = `Player ${currentPlayer} Wins!`;
    gameActive = false;
    return;
  }

  // Check for a draw
  if (!gameState.includes("")) {
    statusDisplay.textContent = "It's a Draw!";
    gameActive = false;
    return;
  }

  // Switch turns
  currentPlayer = currentPlayer === 'X' ? 'O' : 'X';
  statusDisplay.textContent = `Player ${currentPlayer}'s Turn`;
}

function checkWinner() {
  return winningConditions.some(condition => {
    const [a, b, c] = condition;
    return (
      gameState[a] === currentPlayer &&
      gameState[a] === gameState[b] &&
      gameState[a] === gameState[c]
    );
  });
}

function resetGame() {
  gameActive = true;
  currentPlayer = 'X';
  gameState = Array(9).fill("");
  statusDisplay.textContent = "Player X's Turn";
  board.innerHTML = ""; // Clear the board
  createBoard(); // Recreate the board
}

function createBoard() {
  for (let i = 0; i < 9; i++) {
    const cell = document.createElement('div');
    cell.classList.add('cell');
    cell.setAttribute('data-index', i);
    cell.addEventListener('click', handleCellClick);
    board.appendChild(cell);
  }
}

// Initialize the game
createBoard();
