Class DCSolutions.TwoWayJSONAdaptor.TeacherStudent Extends (%Persistent,%JSON.Adaptor)
{
Property ID As %Integer [ Identity ];

Property Teacher As DCSolutions.TwoWayJSONAdaptor.Teacher [ Calculated ];

Property Student As DCSolutions.TwoWayJSONAdaptor.Student [ Calculated ];

XData Student
{
<Mapping xmlns="http://www.intersystems.com/jsonmapping">
    <Property Name="ID"/>
    <Property Name="Teacher" />
  </Mapping>
}

XData Teacher
{
<Mapping xmlns="http://www.intersystems.com/jsonmapping">
    <Property Name="ID"/>
    <Property Name="Student" />
  </Mapping>
}

Method TeacherGet() As DCSolutions.TwoWayJSONAdaptor.Teacher
{
	Set tSQL="SELECT ID FROM DCSolutions_TwoWayJSONAdaptor.Teacher WHERE Students[?"
	Set tRS=##class(%SQL.Statement).%ExecDirect(,tSQL,i%ID)
	Set tSC=tRS.%Next()
	Set tID=tRS.%Get("ID")
	Set tTeacher=##class(DCSolutions.TwoWayJSONAdaptor.Teacher).%OpenId(tID)
	Quit tTeacher
}

Method StudentGet() As DCSolutions.TwoWayJSONAdaptor.Student
{
	Set tSQL="SELECT ID FROM DCSolutions_TwoWayJSONAdaptor.Student WHERE Teachers[?"
	Set tRS=##class(%SQL.Statement).%ExecDirect(,tSQL,i%ID)
	Set tSC=tRS.%Next()
	Set tID=tRS.ID
	Set tStudent=##class(DCSolutions.TwoWayJSONAdaptor.Student).%OpenId(tID)
	Quit tStudent
}

ClassMethod Populate()
{
	w ##class(DCSolutions.TwoWayJSONAdaptor.Student).%DeleteExtent(),!
	w ##class(DCSolutions.TwoWayJSONAdaptor.Teacher).%DeleteExtent(),!
	w ##class(DCSolutions.TwoWayJSONAdaptor.TeacherStudent).%DeleteExtent(),!
	set student1=##class(DCSolutions.TwoWayJSONAdaptor.Student).%New()
	set student2=##class(DCSolutions.TwoWayJSONAdaptor.Student).%New()
	set student1.Name="Peter"
	set student2.Name="Nael"
	set teacher1=##class(DCSolutions.TwoWayJSONAdaptor.Teacher).%New()
	set teacher2=##class(DCSolutions.TwoWayJSONAdaptor.Teacher).%New()
	set teacher3=##class(DCSolutions.TwoWayJSONAdaptor.Teacher).%New()
	set teacher1.Name="Teacher1Name"
	set teacher2.Name="Teacher2Name"
	set teacher3.Name="Teacher3Name"
	set ts1=##class(DCSolutions.TwoWayJSONAdaptor.TeacherStudent).%New()
	w ts1.%Save(),!
	set ts2=##class(DCSolutions.TwoWayJSONAdaptor.TeacherStudent).%New()
	w ts2.%Save(),!
	set ts3=##class(DCSolutions.TwoWayJSONAdaptor.TeacherStudent).%New()
	w ts3.%Save(),!
	set ts4=##class(DCSolutions.TwoWayJSONAdaptor.TeacherStudent).%New()
	w ts4.%Save(),!
	d student1.Teachers.Insert(ts1)
	d teacher1.Students.Insert(ts1)
	d student1.Teachers.Insert(ts2)
	d teacher2.Students.Insert(ts2)
	d student2.Teachers.Insert(ts3)
	d teacher1.Students.Insert(ts3)
	d student2.Teachers.Insert(ts4)
	d teacher3.Students.Insert(ts4)
	w student1.%Save(),!
	w student2.%Save(),!
	w teacher1.%Save(),!
	w teacher2.%Save(),!
	w teacher3.%Save(),!
}

ClassMethod Test()
{
	set student1=##class(DCSolutions.TwoWayJSONAdaptor.Student).%OpenId(1)
	d student1.%JSONExport("Student")
	w !,!
	set student2=##class(DCSolutions.TwoWayJSONAdaptor.Student).%OpenId(2)
	d student2.%JSONExport("Student")
	w !,!
	
	set teacher1=##class(DCSolutions.TwoWayJSONAdaptor.Teacher).%OpenId(1)
	d teacher1.%JSONExport("Teacher")
	w !,!
	set teacher2=##class(DCSolutions.TwoWayJSONAdaptor.Teacher).%OpenId(2)
	d teacher2.%JSONExport("Teacher")
	w !,!
	set teacher3=##class(DCSolutions.TwoWayJSONAdaptor.Teacher).%OpenId(3)
	d teacher3.%JSONExport("Teacher")
	w !,!
}

Storage Default
{
<Data name="TeacherStudentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^DCSolutions7918.TeacherStudentD</DataLocation>
<DefaultData>TeacherStudentDefaultData</DefaultData>
<IdLocation>^DCSolutions7918.TeacherStudentD</IdLocation>
<IndexLocation>^DCSolutions7918.TeacherStudentI</IndexLocation>
<StreamLocation>^DCSolutions7918.TeacherStudentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}