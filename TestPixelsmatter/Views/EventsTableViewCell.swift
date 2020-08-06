//
//  EventsTableViewCell.swift
//  TestPixelsmatter
//
//  Created by Oleg Granchenko on 06.08.2020.
//  Copyright © 2020 Oleg Granchenko. All rights reserved.
//

import UIKit

final class EventsTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    
    func setEvent(_ event: Events) {
        nameLabel.text = event.name
    }
}
