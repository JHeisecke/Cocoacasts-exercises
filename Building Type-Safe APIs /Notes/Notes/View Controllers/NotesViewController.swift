//
//  NotesViewController.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import UIKit

internal final class NotesViewController: UIViewController {

    // MARK: - Properties

    private let viewModel: NotesViewModel

    // MARK: - Initialization

    init?(coder: NSCoder, viewModel: NotesViewModel) {
        self.viewModel = viewModel
        
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func createNote(_ sender: Any) {
        viewModel.createNote(.example)
    }

    @IBAction func updateNote(_ sender: Any) {
        viewModel.updateNote(.example)
    }

    @IBAction func deleteNote(_ sender: Any) {
        viewModel.deleteNote(.example)
    }

}
