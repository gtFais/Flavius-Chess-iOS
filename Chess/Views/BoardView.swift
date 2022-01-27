//
//  BoardView.swift
//  Chess
//
//  Created by Flavius on 27.01.2022.
//

import UIKit



class BoardView: UIView {
    
    let ratio: CGFloat = 0.8
    var originX: CGFloat = 0
    var originY: CGFloat = 0
    var cellSide: CGFloat = -1
    
    var shadowPieces: Set<ChessPiece> = Set<ChessPiece>()
    
    var chessDelegate: ChessDelegate? = nil
    
    var fromCol: Int = -10000
    var fromRow: Int = -10000
    
    var movingImage: UIImage? = nil
    var movingPieceX: CGFloat = -1
    var movingPieceY: CGFloat = -1

    override func draw(_ rect: CGRect) {
        cellSide = bounds.width * ratio / 8
        originX = bounds.width * (1 - ratio) / 2
        originY = bounds.height * (1 - ratio) / 2
        drawBoard()
        drawPieces()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        
        fromCol = Int((fingerLocation.x - originX) / cellSide)
        fromRow = Int((fingerLocation.y - originY) / cellSide)
        
        if let movingPiece = chessDelegate?.getPieceAt(col: fromCol, row: fromRow) {
            movingImage = movingPiece.image
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        
        let toCol: Int = Int((fingerLocation.x - originX) / cellSide)
        let toRow: Int = Int((fingerLocation.y - originY) / cellSide)
        
        if let chessDelegate = chessDelegate {
            chessDelegate.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
        movingImage = nil
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        print(fingerLocation)
        movingPieceX = fingerLocation.x
        movingPieceY = fingerLocation.y
        setNeedsDisplay()
    }
    
    func drawPieces() {
        for piece in shadowPieces {
            if fromCol == piece.col && fromRow == piece.row {
                continue
            }
            let pieceImage = piece.image
            pieceImage.draw(in: CGRect(x: originX + CGFloat(piece.col) * cellSide, y: originY + CGFloat(piece.row) * cellSide, width: cellSide, height: cellSide))
        }
        movingImage?.draw(in: CGRect(x: movingPieceX - cellSide/2, y: movingPieceY - cellSide/2, width: cellSide, height: cellSide))
    }
    
    func drawBoard() {
        var color = UIColor.lightGray
        for row in 0..<8 {
            color = (color == UIColor.lightGray) ? UIColor.darkGray : UIColor.lightGray
            for col in 0..<8 {
                color = (color == UIColor.lightGray) ? UIColor.darkGray : UIColor.lightGray
                drawSquare(col: col, row: row, color: color)
            }
        }
    }
    
    func drawSquare(col: Int, row: Int, color: UIColor) {
        let path = UIBezierPath(rect: CGRect(x: originX + CGFloat(col) * cellSide, y: originY + CGFloat(row) * cellSide, width: cellSide, height: cellSide))
        color.setFill()
        path.fill()
        
        
    }

}
