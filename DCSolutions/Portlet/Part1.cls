Class DCSolutions.Portlet.Part1 Extends %DeepSee.Component.Portlet.abstractPortlet
{

Method %DrawHTML()
{
    Set ..renderFlag = ..renderFlag + 1
}

ClientMethod renderContents() [ Language = javascript ]
{
	var html=[]
	
	html[html.length]="Testing"
	
	this.getEnclosingDiv().innerHTML = html.join('');
}

}