//
//  EventsViewController.swift
//  TestPixelsmatter
//
//  Created by Oleg Granchenko on 06.08.2020.
//  Copyright © 2020 Oleg Granchenko. All rights reserved.
//

import UIKit

final class EventsViewController: UITableViewController {
    
    private  var events: Event?  {
        guard let fileURL = Bundle.main.url(forResource: "events", withExtension: "json"), let data = try? Data(contentsOf: fileURL) else {
            print("Failed to read teachers file")
            return nil
        }
        
        return (try? JSONDecoder().decode(Event.self, from: data))
    }
    
    private lazy var activeObjs: [Events] = {
        var active: [Events] = []
        guard let ev = events else {
            return []
        }
        
        for (idx, val) in ev.events.enumerated() {
            guard val.active == true else {
                continue
            }
            active.append(ev.events[idx])
        }
        
        return active
    }()
}


// MARK: - Table view data source

extension EventsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return activeObjs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as? EventsTableViewCell else {
            print("This type of cell is not defined")
            return UITableViewCell()
        }
        
        cell.setEvent(activeObjs[indexPath.row])
        
        return cell
    }
}
