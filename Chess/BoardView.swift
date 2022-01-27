//
//  BoardView.swift
//  Chess
//
//  Created by Flavius on 27.01.2022.
//

import UIKit

class BoardView: UIView {
    
    let originX: CGFloat = 23
    let originY: CGFloat = 37
    let cellSide: CGFloat = 41
    

    override func draw(_ rect: CGRect) {
        drawBoard()
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
