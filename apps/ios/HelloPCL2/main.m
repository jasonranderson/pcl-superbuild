/*========================================================================= 

Program:   Visualization Toolkit 

Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen 
All rights reserved. 
See Copyright.txt or http://www.kitware.com/Copyright.htm for details. 

This software is distributed WITHOUT ANY WARRANTY; without even 
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
PURPOSE.  See the above copyright notice for more information. 

=========================================================================*/ 

#import <UIKit/UIKit.h> 
#import "AppDelegate.h" 

int main(int argc, char *argv[]) 
{
    @autoreleasepool { 
        // int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class])); 
        int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([kiwiAppDelegate class])); 
        return retVal; 
    } 
} 

// #import <UIKit/UIKit.h>
// 
// int main(int argc, char *argv[]) 
// {
// 
//     NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
//     int retVal = UIApplicationMain(argc, argv, nil, nil);
//     [pool release];
//     return retVal;
// }
