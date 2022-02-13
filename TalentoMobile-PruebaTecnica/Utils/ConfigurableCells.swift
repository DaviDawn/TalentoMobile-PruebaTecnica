//
//  ConfigurableCells.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 13/2/22.
//

import UIKit

public protocol ConfigurableCell {
    associatedtype DataType
    static var defaultIdentifier: String { get }
    func configure(data: DataType)
}

public extension ConfigurableCell where Self: UITableViewCell {
    static var defaultIdentifier: String {
        return String(describing: self)
    }
}

public protocol CellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView)
}

public class TableCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UITableViewCell {
    
    public static var reuseId: String { return String(describing: CellType.self) }
    
    let item: DataType
    
    public init(item: DataType) {
        self.item = item
    }
    
    public func configure(cell: UIView) {
        guard let cell = cell as? CellType else {
            fatalError()
        }
        cell.configure(data: item)
    }
}
