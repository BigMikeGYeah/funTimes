//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    var note: Note?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            // if note exists, update title and content
            let note = self.note ?? CoreDataHelper.newNote()
            note.title = noteTitleTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
            note.timeValue = Double(timeValueField.text!) ?? 0
            note.modificationTime = Date() as NSDate
            CoreDataHelper.saveNote()
        }
    }

    
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        if let note = note{
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
            timeValueField.text = String(note.timeValue)
        } else {
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
            timeValueField.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var noteContentTextView: UITextView!
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    

    @IBOutlet weak var timeValueField: UITextField!









}

