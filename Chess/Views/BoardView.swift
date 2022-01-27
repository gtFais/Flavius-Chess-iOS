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
    

    override func draw(_ rect: CGRect) {
        print(bounds.width)
        cellSide = bounds.width * ratio / 8
        originX = bounds.width * (1 - ratio) / 2
        originY = bounds.height * (1 - ratio) / 2
        drawBoard()
        drawPieces()
    }
    
    func drawPieces() {
        for piece in shadowPieces {
            let pieceImage = piece.image
            pieceImage.draw(in: CGRect(x: originX + CGFloat(piece.col) * cellSide, y: originY + CGFloat(piece.row) * cellSide, width: cellSide, height: cellSide))
        }
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
