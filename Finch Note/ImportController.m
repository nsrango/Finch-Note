//
//  ImportController.m
//  Finch Note
//
//  Created by narango on 2/1/13.
//  Copyright (c) 2013 narango. All rights reserved.
//

#import "ImportController.h"
#import "AppDelegate.h"
#import "Entry.h"

@implementation ImportController

- (IBAction)importData:(id)sender {
    
    NSOpenPanel * openDlg = [NSOpenPanel openPanel];
    
    NSArray * fileTypesArray;
    fileTypesArray = [NSArray arrayWithObjects:@"txt",@"wiki",nil];
    
    [openDlg setCanChooseFiles:YES];
    [openDlg setAllowedFileTypes:fileTypesArray];
    [openDlg setAllowsMultipleSelection:YES];
    
    
    if ( [openDlg runModal] == NSOKButton) {
        NSArray *files = [openDlg URLs];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyy-MM-dd HH:mm"];
        
        NSError *error;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\*\\d{2}:\\d{2}\\*" options:NSRegularExpressionCaseInsensitive error:&error];
        
        if (regex == NULL) {
            NSLog(@"what is going on");
        }
        
        int i;
        
        AppDelegate *appDelegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
        NSManagedObjectContext *managedObjectContext = [appDelegate managedObjectContext];
        
        for (i = 0; i <[files count]; i++) {
            NSString *name = [[files objectAtIndex:i] lastPathComponent];
            NSArray *nameParts = [name componentsSeparatedByString:@"."];
            NSString *fileName = [nameParts objectAtIndex:0];
            // if I needed the file date NSDate *fileDate = [dateFormatter dateFromString:fileName];
            // however I don't I'll just deal with everything all at once.

            NSString *file = [NSString stringWithContentsOfFile:[[files objectAtIndex:i] path] encoding:NSUTF8StringEncoding error:NULL];
            
            NSArray* matches = [regex matchesInString:file options:0 range:NSMakeRange(0, [file length])];
            
            NSMutableArray * timesInFile = [[NSMutableArray alloc] init];
            
            for (NSTextCheckingResult* match in matches) {
                NSString *matchText = [file substringWithRange:[match range]];
                [timesInFile addObject:matchText];
            }
            
            
            for (NSString *time in timesInFile) {
                file = [file stringByReplacingOccurrencesOfString:time withString:@"<WONTBETHERE>"];
            }
            
            NSMutableArray *fileEntryTexts = [[file componentsSeparatedByString:@"<WONTBETHERE>"] mutableCopy];
            [fileEntryTexts removeObjectAtIndex:0];
            NSMutableArray *trimmedFileEntryTexts = [NSMutableArray array];
            for (NSString *entryTexts in fileEntryTexts){
                [trimmedFileEntryTexts addObject:[entryTexts stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
            }
            
            NSMutableArray *trimmedTimesInFile = [NSMutableArray array];
            for (NSString *time in timesInFile) {
                [trimmedTimesInFile addObject: [time stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"*"]]];
            }
            
            int j;
            NSDate *entryDate;
            for (j=0; j<[timesInFile count]; j++) {
                entryDate = [dateFormatter dateFromString: [NSString stringWithFormat:@"%@ %@", fileName, [trimmedTimesInFile objectAtIndex:j]]];
                
                Entry *entry = (Entry *)[NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext: managedObjectContext];
                
                [entry setDate: entryDate];
                [entry setText: [trimmedFileEntryTexts objectAtIndex:j]];
                [entry setAutomatic: [NSNumber numberWithBool:NO]];
                [entry setImported: [NSNumber numberWithBool:YES]];
            }
            
            
            
        }
        
    }
}
@end
