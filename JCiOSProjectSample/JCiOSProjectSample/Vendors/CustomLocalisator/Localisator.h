//
//  Localisator.h
//  CustomLocalisator
//
//  Created by Michael Azevedo on 05/03/2014.
//

#import <Foundation/Foundation.h>

#define LOCALIZATION(text) [[Localisator sharedInstance] localizedStringForKey:(text)]
#define LANGUAGENAME_EN         @"en"
#define LANGUAGENAME_CN         @"zh-Hans"
//#define LANGUAGENAME_HK         @"zh-Hant-HK"
//#define LANGUAGENAME_TW         @"zh-Hant-TW"



static NSString * const kNotificationLanguageChanged = @"kNotificationLanguageChanged";



@interface Localisator : NSObject

@property (nonatomic, readonly) NSArray* availableLanguagesArray;
@property (nonatomic, assign) BOOL saveInUserDefaults;
@property (copy) NSString * currentLanguage;

+ (Localisator*)sharedInstance;
-(NSString *)localizedStringForKey:(NSString*)key;
-(BOOL)setLanguage:(NSString*)newLanguage;

@end
