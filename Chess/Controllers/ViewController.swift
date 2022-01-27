//
//  ViewController.swift
//  Chess
//
//  Created by Flavius on 27.01.2022.
//

import UIKit

class ViewController: UIViewController {
    var chessEngine: ChessEngine = ChessEngine()

    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        chessEngine.initializeGame()
        boardView.shadowPieces = chessEngine.pieces
    }


}

