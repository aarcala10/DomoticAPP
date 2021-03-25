//
//  RoomCell.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 24/3/21.
//

import UIKit

class RoomCell: UITableViewCell {
    
    static let cellId = "RoomCell"
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var roomImage: UIImageView!
    @IBOutlet weak var roomName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpData(room: Room) {
        roomName.text = room.name
        roomImage.image = UIImage(imageLiteralResourceName: room.name)
    }
    
    func setUpViews() {
        setView(view: containerView)
        roomImage.makeRounded()
        
    }
    
    func setView(view: UIView){
        
        view.layer.cornerRadius = 8
        view.layer.backgroundColor = UIColor.systemGray4.cgColor
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 2
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
    }
}
