Class DCSolutions.TwoWayJSONAdaptor.Teacher Extends (%Persistent,%JSON.Adaptor)
{

Property Name As %String;

Property Students As list Of DCSolutions.TwoWayJSONAdaptor.TeacherStudent;

XData Teacher
{
<Mapping xmlns="http://www.intersystems.com/jsonmapping">
    <Property Name="Name"/>
    <Property Name="Students"/>
  </Mapping>
}

XData Student
{
<Mapping xmlns="http://www.intersystems.com/jsonmapping">
    <Property Name="Name"/>
  </Mapping>
}

Storage Default
{
<Data name="TeacherDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Students</Value>
</Value>
</Data>
<DataLocation>^DCSolutions.TwoWay7918.TeacherD</DataLocation>
<DefaultData>TeacherDefaultData</DefaultData>
<IdLocation>^DCSolutions.TwoWay7918.TeacherD</IdLocation>
<IndexLocation>^DCSolutions.TwoWay7918.TeacherI</IndexLocation>
<StreamLocation>^DCSolutions.TwoWay7918.TeacherS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}