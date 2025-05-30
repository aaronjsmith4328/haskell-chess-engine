-- Import Map (key, value structure) for chess board --
import qualified Data.Map as Map

-- Setting up the pieces --
-- Color Data Type
data Color = White | Black
    deriving(Eq, Show)

-- PieceType Data Type
data PieceType = Pawn | Knight | Bishop | Rook | Queen | King
    deriving(Eq, Show)

-- Data Piece
data Piece = Piece Color PieceType
    deriving(Eq, Show)

-- Setting up the board --
-- Rank and File
type File = Char -- 'a' to 'h'
type Rank = Int  -- 1 to 8
type Square = (File, Rank)

-- Board Type
type Board = Map.Map Square Piece

-- Initial Board --
-- Construct a list of (Square, Piece) pairs and turn it into a Map
initialBoard :: Board
initialBoard = Map.fromList $
    -- Pawns
    [ ((f, 2), Piece White Pawn) | f <- ['a'..'h'] ] ++
    [ ((f, 7), Piece Black Pawn) | f <- ['a'..'h'] ] ++
    -- Rooks
    [ (('a', 1), Piece White Rook), (('h', 1), Piece White Rook)
    , (('a', 8), Piece Black Rook), (('h', 8), Piece Black Rook) ] ++
    -- Knights
    [ (('b', 1), Piece White Knight), (('g', 1), Piece White Knight)
    , (('b', 8), Piece Black Knight), (('g', 8), Piece Black Knight) ] ++
    -- Bishops
    [ (('c', 1), Piece White Bishop), (('f', 1), Piece White Bishop)
    , (('c', 8), Piece Black Bishop), (('f', 8), Piece Black Bishop) ] ++
    -- Queens
    [ (('d', 1), Piece White Queen), (('d', 8), Piece Black Queen) ] ++
    -- Kings
    [ (('e', 1), Piece White King), (('e', 8), Piece Black King) ]


