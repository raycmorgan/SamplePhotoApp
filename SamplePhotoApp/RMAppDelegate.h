//
//  RMAppDelegate.h
//  SamplePhotoApp
//
//  Created by Ray Morgan on 5/17/12.
//  Copyright (c) 2012 Rumgr Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
