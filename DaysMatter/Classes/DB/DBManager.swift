//
//  DBManager.swift
//  DaysMatter
//
//  Created by eric on 2020/3/11.
//  Copyright © 2020 eric. All rights reserved.
//

import UIKit
import GRDB

class DBManager: NSObject {
    static let `default` = DBManager()
    var dbQueue:DatabaseQueue?
    
    private override init() {
        super.init()
        setupDBQueue()
    }
    private func setupDBQueue() {
        do {
            let databaseURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("daysMatter.sqlite")
            dbQueue = try AppDatabase.openDatabase(atPath: databaseURL.path)
            try dbQueue?.inDatabase({ (db) in
                try db.alter(table: "PlanModel") { (t) in
                    t.add(column: "recentlyStartTime", .double)
                    t.add(column: "isScholarLord", .boolean)
                }
            })
            print("\(databaseURL)")
        }catch {
            print("openDatabase error")
        }
    }
}
