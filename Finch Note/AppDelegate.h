//
//  AppDelegate.h
//  Finch Note
//
//  Created by narango on 1/31/13.
//  Copyright (c) 2013 narango. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class NoteWindowController;

@interface AppDelegate : NSObject <NSApplicationDelegate>{
    NoteWindowController * noteWindowController;
}

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

@end
