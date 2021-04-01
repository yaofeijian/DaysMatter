//
//  BaseTableViewCell.swift
//  yyTools
//
//  Created by hj on 2019/2/19.
//  Copyright © 2019年 yy. All rights reserved.
//

import UIKit

//protocol BaseTableViewCellProtocol {
//    associatedtype T
//
////    optional func update(_ data:T)
//}

class BaseTableViewCell: UITableViewCell {
    /// 在初始化的时候会自动执行一次
    func setupUI() {
        
    }
    
    /// 在初始化的时候会自动执行一次
    func layout() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
        self.layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
