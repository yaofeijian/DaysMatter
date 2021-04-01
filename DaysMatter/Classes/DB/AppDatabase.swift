import GRDB

/// A type responsible for initializing the application database.
///
/// See AppDelegate.setupDatabase()
struct AppDatabase {
    
    /// Creates a fully initialized database at path
    static func openDatabase(atPath path: String) throws -> DatabaseQueue {
        // Connect to the database
        // See https://github.com/groue/GRDB.swift/blob/master/README.md#database-connections
        let dbQueue = try DatabaseQueue(path: path)
        
        // Define the database schema
        try migrator.migrate(dbQueue)
        
        return dbQueue
    }
    
    /// The DatabaseMigrator that defines the database schema.
    ///
    /// See https://github.com/groue/GRDB.swift/blob/master/README.md#migrations
    static var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        
        migrator.registerMigration("createClock") { db in
            try db.create(table: "planModel") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("type", .integer).notNull().indexed()
                t.column("status", .integer).notNull()
                t.column("category", .text).notNull().indexed()
                t.column("notificationSoundStyle",.integer).notNull()
                t.column("colorStyle",.integer).notNull()
                t.column("colorPatch",.integer)
                t.column("remark",.text)
                t.column("countdownDuringTime",.integer)
                t.column("runningTime",.double)
                t.column("recentlyPauseTime",.double)
                t.column("planCompleteTime",.double)
                t.column("createTime",.double)
                t.column("updateTime",.double)
            }
        }
        return migrator
    }
}

