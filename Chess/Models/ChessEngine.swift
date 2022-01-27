//
//  ChessEngine.swift
//  Chess
//
//  Created by Flavius on 27.01.2022.
//

import Foundation
import UIKit

struct ChessEngine {
    var pieces: Set<ChessPiece> = Set<ChessPiece>()
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        
        guard let candidatePiece = pieceAt(col: fromCol, row: fromRow),
              !(fromCol == toCol && fromRow == toRow)
        else {
            return
        }
        
        if let targetPiece = pieceAt(col: toCol, row: toRow) {
            guard !(targetPiece.isWhite && candidatePiece.isWhite) else {
                return
            }
            pieces.remove(candidatePiece)
            pieces.remove(targetPiece)
            pieces.insert(ChessPiece(col: toCol, row: toRow, image: candidatePiece.image, isWhite: candidatePiece.isWhite))
            return
        }
        
        pieces.remove(candidatePiece)
        pieces.insert(ChessPiece(col: toCol, row: toRow, image: candidatePiece.image, isWhite: candidatePiece.isWhite))
        
    }
    
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        for piece in pieces {
            if col == piece.col && row == piece.row {
                return piece
            }
        }
        return nil
    }
    
    mutating func initializeGame() {
        pieces.removeAll()
        
        var imagePiece: UIImage
        var isWhite = false
        for row in 0..<8 {
            for col in 0..<8 {
                switch row {
                case 0:
                    isWhite = false
                    switch col {
                    case 0, 7:
                        imagePiece = Piece.roockBlack
                    case 1, 6:
                        imagePiece = Piece.knightBlack
                    case 2, 5:
                        imagePiece = Piece.bishopBlack
                    case 3:
                        imagePiece = Piece.queenBlack
                    case 4:
                        imagePiece = Piece.kingBlack
                    default:
                        continue
                    }
                case 1:
                    imagePiece = Piece.pawnBlack
                    isWhite = false
                case 6:
                    imagePiece = Piece.pawnWhite
                    isWhite = true
                case 7:
                    isWhite = true
                    switch col {
                    case 0, 7:
                        imagePiece = Piece.roockWhite
                    case 1, 6:
                        imagePiece = Piece.knightWhite
                    case 2, 5:
                        imagePiece = Piece.bishopWhite
                    case 3:
                        imagePiece = Piece.queenWhite
                    case 4:
                        imagePiece = Piece.kingWhite
                    default:
                        continue
                    }
                    
                default:
                    continue
                }
                pieces.insert(ChessPiece(col: col, row: row, image: imagePiece, isWhite: isWhite))
            }
        }
    }
}
