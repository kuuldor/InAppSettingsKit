//
//  IASKAppSettingsViewController.h
//  http://www.inappsettingskit.com
//
//  Copyright (c) 2009:
//  Luc Vandal, Edovia Inc., http://www.edovia.com
//  Ortwin Gentz, FutureTap GmbH, http://www.futuretap.com
//  All rights reserved.
//
//  It is appreciated but not required that you give credit to Luc Vandal and Ortwin Gentz,
//  as the original authors of this code. You can give credit in a blog post, a tweet or on
//  a info page of your app. Also, the original authors appreciate letting them know if you use this code.
//
//  This code is licensed under the BSD license that is available at: http://www.opensource.org/licenses/bsd-license.php
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

#import "IASKSettingsStore.h"
#import "IASKViewController.h"
#import "IASKSpecifier.h"

@class IASKSettingsReader;
@class IASKAppSettingsViewController;

@protocol IASKSettingsDelegate
- (void)settingsViewControllerDidEnd:(IASKAppSettingsViewController* _Nonnull)sender;

@optional
#pragma mark - UITableView header customization
- (CGFloat) settingsViewController:(id<IASKViewController> _Nonnull)settingsViewController
                         tableView:(UITableView * _Nonnull)tableView
         heightForHeaderForSection:(NSInteger)section;
- (UIView * _Nonnull) settingsViewController:(id<IASKViewController> _Nonnull)settingsViewController
                          tableView:(UITableView * _Nonnull)tableView
            viewForHeaderForSection:(NSInteger)section;

#pragma mark - UITableView cell customization
- (CGFloat)tableView:(UITableView* _Nonnull)tableView heightForSpecifier:(IASKSpecifier* _Nonnull)specifier;
- (UITableViewCell* _Nonnull)tableView:(UITableView* _Nonnull)tableView cellForSpecifier:(IASKSpecifier* _Nonnull)specifier;

#pragma mark - mail composing customization
- (NSString* _Nullable) settingsViewController:(id<IASKViewController> _Nonnull)settingsViewController
         mailComposeBodyForSpecifier:(IASKSpecifier* _Nonnull) specifier;

- (UIViewController<MFMailComposeViewControllerDelegate>* _Nonnull) settingsViewController:(id<IASKViewController> _Nonnull)settingsViewController
                                     viewControllerForMailComposeViewForSpecifier:(IASKSpecifier* _Nonnull) specifier;

- (void) settingsViewController:(id<IASKViewController> _Nonnull) settingsViewController
          mailComposeController:(MFMailComposeViewController* _Nonnull)controller
            didFinishWithResult:(MFMailComposeResult)result
                          error:(NSError* _Nullable)error;

#pragma mark - respond to button taps
- (void)settingsViewController:(IASKAppSettingsViewController* _Nonnull)sender buttonTappedForKey:(NSString* _Nonnull)key __attribute__((deprecated)); // use the method below with specifier instead
- (void)settingsViewController:(IASKAppSettingsViewController* _Nonnull)sender buttonTappedForSpecifier:(IASKSpecifier* _Nonnull)specifier;
- (void)settingsViewController:(IASKAppSettingsViewController* _Nonnull)sender tableView:(UITableView * _Nonnull)tableView didSelectCustomViewSpecifier:(IASKSpecifier* _Nonnull)specifier;

- ( NSString * _Nullable )settingsViewController:(IASKAppSettingsViewController* _Nonnull)sender subtitleForSpecifier:(IASKSpecifier* _Nonnull)specifier;

@end


@interface IASKAppSettingsViewController : UITableViewController <IASKViewController, UITextFieldDelegate, MFMailComposeViewControllerDelegate>

@property (nonatomic, assign) IBOutlet id _Nullable delegate;
@property (nonatomic, copy) NSString * _Nullable file;
@property (nonatomic, assign) BOOL showCreditsFooter;
@property (nonatomic, assign) IBInspectable BOOL showDoneButton;
@property (nonatomic, retain) NSSet * _Nullable hiddenKeys;
@property (nonatomic) IBInspectable BOOL neverShowPrivacySettings;

- (void)synchronizeSettings;
- (void)dismiss:(id _Nullable)sender;
- (void)setHiddenKeys:(NSSet* _Nullable)hiddenKeys animated:(BOOL)animated;
- (void)setSettingsStorePath:(NSString * _Nonnull) filePath;
@end
