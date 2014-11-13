#import <AudioToolbox/AudioServices.h>

%hook TUCallCenter

-(void)handleCallConnected:(id)arg1 {
	NSLog(@"[CallConnect] call connected");
	if ([[NSBundle mainBundle].bundleIdentifier isEqualToString:@"com.apple.springboard"]) {
		AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
	}
	%orig;
}

%end

%ctor {
	if ([[NSBundle bundleWithPath:@"/System/Library/SpringBoardPlugins/IncomingCall.servicebundle"] load]) {
		NSLog(@"[CallConnect] bundle loaded succesfully!");
	}
	else {
		NSLog(@"[CallConnect] bundle did not load succesfully.");
	}
}