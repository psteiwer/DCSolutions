Class DCSolutions.TwoWayJSONAdaptor.Student Extends (%Persistent,%JSON.Adaptor)
{
Property Name As %String;

Property Teachers As list Of DCSolutions.TwoWayJSONAdaptor.TeacherStudent;

XData Student
{
<Mapping xmlns="http://www.intersystems.com/jsonmapping">
    <Property Name="Name"/>
    <Property Name="Teachers"/>
  </Mapping>
}

XData Teacher
{
<Mapping xmlns="http://www.intersystems.com/jsonmapping">
    <Property Name="Name"/>
  </Mapping>
}

}