//
//  PersonDiffableDataSource.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/28/21.
//

import UIKit

enum Section {
    case all
}

class PersonDiffableDataSource: UITableViewDiffableDataSource<Section, ProfileInfo> {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
}
