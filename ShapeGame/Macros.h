//
//  Macros.h
//  ShapeGame
//
//  Created by Jakub Vodak on 4/26/15.
//  Copyright (c) 2015 h2ocompany. All rights reserved.
//

////////////////////////////////////////////////////////////////
// Colors

#define RGBA_R(c) ((((c)>>16) & 0xff) * 1.f/255.f)
#define RGBA_G(c) ((((c)>> 8) & 0xff) * 1.f/255.f)
#define RGBA_B(c) ((((c)>> 0) & 0xff) * 1.f/255.f)
#define RGBA_A(c) ((((c)>>24) & 0xff) * 1.f/255.f)

#define UIColorWithARGB(c)	[UIColor colorWithRed:RGBA_R(c) green:RGBA_G(c) blue:RGBA_B(c) alpha:RGBA_A(c)]
#define UIColorWithRGB(c)	[UIColor colorWithRed:RGBA_R(c) green:RGBA_G(c) blue:RGBA_B(c) alpha:1.0]
#define UIColorWithRGBValues(r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]
#define UIColorWithRGBAValues(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a/255.0f]

////////////////////////////////////////////////////////////////
// WeakSelf

#define DEFINE_WEAK_SELF       __weak __typeof__(self) weakSelf = self

////////////////////////////////////////////////////////////////
// Screen

#define IS_IPHONE_4 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)480) < DBL_EPSILON)
#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)568) < DBL_EPSILON)
#define IS_IPHONE_6 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) < DBL_EPSILON)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
