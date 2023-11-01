object DM: TDM
  OnCreate = DataModuleCreate
  Height = 357
  Width = 421
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=test;Data Source=DESKTOP-RQ' +
      '6O32L;Initial File Name="";Server SPN=""'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'SQLNCLI11.1'
    Left = 40
    Top = 8
  end
  object cdsGroups: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGroups'
    AfterPost = cdsGroupsAfterPost
    BeforeDelete = cdsGroupsBeforeDelete
    AfterDelete = cdsGroupsAfterDelete
    Left = 24
    Top = 200
    object cdsGroupsGroupId: TAutoIncField
      DisplayLabel = 'Group Id'
      FieldName = 'GroupId'
      ReadOnly = True
    end
    object cdsGroupsGroupName: TWideStringField
      DisplayLabel = 'Group Name'
      FieldName = 'GroupName'
      Size = 255
    end
  end
  object dspGroups: TDataSetProvider
    DataSet = qryGroups
    Left = 48
    Top = 144
  end
  object cdsStudents: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'GroupId'
    MasterFields = 'GroupId'
    MasterSource = dsGroups
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspStudents'
    BeforePost = cdsStudentsBeforePost
    AfterPost = dataSetStudentsAfterPost
    AfterDelete = cdsStudentsAfterDelete
    Left = 176
    Top = 200
    object cdsStudentsStudentId: TAutoIncField
      DisplayLabel = 'Student Id'
      FieldName = 'StudentId'
      ReadOnly = True
    end
    object cdsStudentsGroupId: TIntegerField
      DisplayLabel = 'Group Id'
      FieldName = 'GroupId'
    end
    object cdsStudentsFirstName: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FirstName'
      Size = 50
    end
    object cdsStudentsLastName: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LastName'
      Size = 50
    end
    object cdsStudentsBirthDate: TDateField
      DisplayLabel = 'Birth Date'
      FieldName = 'BirthDate'
    end
    object cdsStudentsMobile: TStringField
      FieldName = 'Mobile'
    end
    object cdsStudentsEmail: TStringField
      FieldName = 'Email'
      Size = 40
    end
    object cdsStudentsNotes: TStringField
      FieldName = 'Notes'
      Size = 500
    end
  end
  object dspStudents: TDataSetProvider
    DataSet = dataSetStudents
    Left = 216
    Top = 136
  end
  object dsGroups: TDataSource
    AutoEdit = False
    DataSet = cdsGroups
    Left = 88
    Top = 200
  end
  object dsStudents: TDataSource
    DataSet = cdsStudents
    Left = 249
    Top = 200
  end
  object qryGroups: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select GroupId, GroupName'
      'from Groups '
      'order by GroupName ')
    Left = 48
    Top = 88
  end
  object dataSetStudents: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    AfterPost = dataSetStudentsAfterPost
    CommandText = 
      'select StudentId, GroupId, FirstName, LastName, BirthDate, Email' +
      ', Mobile, Notes'#13#10'from Students'#13#10'where GroupId = :GroupId'
    Parameters = <
      item
        Name = 'GroupId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 216
    Top = 88
  end
end
