//
//  AppDelegate.h
//  RACDemo
//
//  Created by MacKun on 2016/12/6.
//  Copyright © 2016年 com.soullon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

