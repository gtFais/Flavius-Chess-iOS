//
//  ViewController.swift
//  Chess
//
//  Created by Flavius on 27.01.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var chessEngine: ChessEngine = ChessEngine()
    
    @IBOutlet weak var boardView: BoardView!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBAction func resetButton(_ sender: UIButton) {
        chessEngine.initializeGame()
        boardView.shadowPieces = chessEngine.pieces
        determineTurnLabel()
        boardView.setNeedsDisplay()
    }
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "drop", withExtension: "wav")!
        audioPlayer = try? AVAudioPlayer(contentsOf: url)
        
        boardView.chessDelegate = self
        
        chessEngine.initializeGame()
        
        boardView.shadowPieces = chessEngine.pieces
        boardView.setNeedsDisplay()
        
        
    }
    
    func determineTurnLabel() {
        if chessEngine.whitesTurn {
            infoLabel.text = "White"
        } else {
            infoLabel.text = "Black"
        }
    }
    
}

extension ViewController: ChessDelegate {
    
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        chessEngine.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        boardView.shadowPieces = chessEngine.pieces
        boardView.setNeedsDisplay()
        
        audioPlayer.play()
        
        determineTurnLabel()
        
    }
    
    func getPieceAt(col: Int, row: Int) -> ChessPiece? {
        return chessEngine.pieceAt(col: col, row: row)
    }
}
