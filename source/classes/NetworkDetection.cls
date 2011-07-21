public with sharing class NetworkDetection {

	public String isImageLoaded {get; set;}
	
	public void setImageLoaded(){
		/*Apply parameter value indicating if image was loaded from page to isImageLoaded string. The
		reason this value is a string instead of a boolean is that we need to track 3 values. Null, client 
		side validation has not yet occured, show authorization in progress message. True, image loaded, 
		show success message. False, image did not load, show failure message.*/
		isImageLoaded = ApexPages.currentPage().getParameters().get('imageLoaded');
		
		/*If a boolean value is really needed you could always do something like this...
		if(isImageLoaded == 'true'){
			someOtherBoolean = true;
		}else{
			someOtherBoolean = false;
		}
		...but I'd like to think the one line of logic code for this entire class is pretty slick and you get the authorization
		in progress message with very little code*/
	}
	
	//--------------TEST METHOD----------------
	static testMethod void test(){
		//Set current test page to NetworkDetection
		Test.setCurrentPageReference(new PageReference('Page.networkDetection')); 
		
		//Set the imageLoadedParamter to 'true'
		ApexPages.currentPage().getParameters().put('imageLoaded', 'true');
		
		//Start test and call setImageLoaded method
		Test.startTest();
		NetworkDetection controller = new NetworkDetection();
		controller.setImageLoaded();
		Test.stopTest();
		
		//Assert value from parameter was properly assigned to isImageLoaded variable	
		system.assertEquals(controller.isImageLoaded,'true');
	}
}