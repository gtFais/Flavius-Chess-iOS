//
//  ChessDelegate.swift
//  Chess
//
//  Created by Flavius on 27.01.2022.
//

import Foundation

protocol ChessDelegate {
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int)
}
