//
//  ViewController.m
//  pictureInPicture
//
//  Created by jia yu on 2022/7/18.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>

@interface ViewController ()<AVPlayerViewControllerDelegate>{
    AVPlayerViewController *v1;
    UIButton *playButton;
}

@end

@implementation ViewController
-(void)play{
    if (nil == v1){
        v1 = [[AVPlayerViewController alloc] init];
        v1.allowsPictureInPicturePlayback = YES;
        v1.delegate = self;
    }

    NSString *file = [NSBundle.mainBundle pathForResource:@"aaa" ofType:@"mp4"];
    if (nil == file){
        return;
    }
    AVPlayer *a = [[AVPlayer alloc] initWithURL:[NSURL fileURLWithPath:file]];
    [v1 setPlayer:a];
    
    [self presentViewController:v1 animated:YES completion:^{
        [a play];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //官方文档
    //https://developer.apple.com/library/archive/documentation/WindowsViews/Conceptual/AdoptingMultitaskingOniPad/QuickStartForPictureInPicture.html
    
    
    playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [playButton addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [playButton setFrame:CGRectMake(0.f, 0.f, 300.f, 80.f)];
    [playButton setTitle:@"Play" forState:UIControlStateNormal];
    [self.view addSubview:playButton];
    playButton.backgroundColor = [UIColor blueColor];
    playButton.layer.masksToBounds = YES;
    playButton.layer.cornerRadius = 8.f;
    [AVAudioSession.sharedInstance setCategory:AVAudioSessionCategoryPlayback error:nil];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [playButton setCenter:self.view.center];
}



#pragma mark - AVPlayerViewControllerDelegate
/*!
     @method        playerViewController:willBeginFullScreenPresentationWithAnimationCoordinator:
     @param        playerViewController
                 The player view controller.
     @param        coordinator
                 An object conforming to UIViewControllerTransitionCoordinator.
     @abstract    Informs the delegate that AVPlayerViewController is about to start displaying its contents full screen.
     @discussion    This method will not be called if a playerViewController is embedded inside a view controller that is being presented. If the receiver is embedded in a parent view controller, its content will be presented in a new full screen view controller and perhaps in a new window. Use the coordinator to determine whether the playerViewController or its full screen counterpart is being transitioned. Transitions can be interrupted -- use a completion block of one of the coordinator's animation methods to determine whether it has completed.
 */
- (void)playerViewController:(AVPlayerViewController *)playerViewController willBeginFullScreenPresentationWithAnimationCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator API_AVAILABLE(ios(12.0)){
    return;
}

/*!
     @method        playerViewController:willEndFullScreenPresentationWithAnimationCoordinator:
     @param        playerViewController
                 The player view controller.
    @param        coordinator
                An object conforming to UIViewControllerTransitionCoordinator.
    @abstract    Informs the delegate that AVPlayerViewController is about to stop displaying its contents full screen.
    @discussion    See the discussion of -[AVPlayerViewControllerDelegatePrivate playerViewController:willBeginFullScreenPresentationWithAnimationCoordinator:].
 */
- (void)playerViewController:(AVPlayerViewController *)playerViewController willEndFullScreenPresentationWithAnimationCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator API_AVAILABLE(ios(12.0)){
    return;
}

/*!
 @method        playerViewController:restoreUserInterfaceForFullScreenExitWithCompletionHandler:
 @param            playerViewController
                 The player view controller.
 @param            completionHandler
                 The completion handler the delegate must call after restoring the interface for an exit full screen transition.
 @abstract        The delegate can implement this method to restore the user interface before exiting fullscreen.
 */
- (void)playerViewController:(AVPlayerViewController *)playerViewController restoreUserInterfaceForFullScreenExitWithCompletionHandler:(void (^)(BOOL restored))completionHandler API_AVAILABLE(ios(15.0)){
    return;
}

/*!
    @method        playerViewControllerWillStartPictureInPicture:
    @param        playerViewController
                The player view controller.
    @abstract    Delegate can implement this method to be notified when Picture in Picture will start.
 */
- (void)playerViewControllerWillStartPictureInPicture:(AVPlayerViewController *)playerViewController{
    return;
}

/*!
    @method        playerViewControllerDidStartPictureInPicture:
    @param        playerViewController
                The player view controller.
    @abstract    Delegate can implement this method to be notified when Picture in Picture did start.
 */
- (void)playerViewControllerDidStartPictureInPicture:(AVPlayerViewController *)playerViewController{
    return;
}

/*!
    @method        playerViewController:failedToStartPictureInPictureWithError:
    @param        playerViewController
                The player view controller.
    @param        error
                An error describing why it failed.
    @abstract    Delegate can implement this method to be notified when Picture in Picture failed to start.
 */
- (void)playerViewController:(AVPlayerViewController *)playerViewController failedToStartPictureInPictureWithError:(NSError *)error{
    return;
}

/*!
    @method        playerViewControllerWillStopPictureInPicture:
    @param        playerViewController
                The player view controller.
    @abstract    Delegate can implement this method to be notified when Picture in Picture will stop.
 */
- (void)playerViewControllerWillStopPictureInPicture:(AVPlayerViewController *)playerViewController{
    return;
}

/*!
    @method        playerViewControllerDidStopPictureInPicture:
    @param        playerViewController
                The player view controller.
    @abstract    Delegate can implement this method to be notified when Picture in Picture did stop.
 */
- (void)playerViewControllerDidStopPictureInPicture:(AVPlayerViewController *)playerViewController{
    return;
}

/*!
    @method        playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:
    @param        playerViewController
                The player view controller.
    @abstract    Delegate can implement this method and return NO to prevent player view controller from automatically being dismissed when Picture in Picture starts.
 */
- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(AVPlayerViewController *)playerViewController{
    return YES;
}

/*!
    @method        playerViewController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:
    @param        playerViewController
                The player view controller.
    @param        completionHandler
                The completion handler the delegate needs to call after restore.
    @abstract    Delegate can implement this method to restore the user interface before Picture in Picture stops.
 */
- (void)playerViewController:(AVPlayerViewController *)playerViewController restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(void (^)(BOOL restored))completionHandler{
    return;
}

@end
