object dmGlobal: TdmGlobal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 235
  Width = 353
  object cntData: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'HostName=localhost'
      'DriverUnit=Data.DBXDataSnap'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'DriverName=DataSnap'
      'Port=211'
      'Filters={}'
      'CommunicationProtocol=tcp/ip'
      'DSAuthenticationUser=proceso'
      'DSAuthenticationPassword=etapas')
    Left = 24
    Top = 16
  end
  object dspGlobal: TDSProviderConnection
    ServerClassName = 'TsmGlobal'
    SQLConnection = cntData
    Left = 88
    Top = 16
  end
  object sknController: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2013White'
    Left = 160
    Top = 16
  end
  object ssmCheckFolio: TSqlServerMethod
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'iFolio'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sTable'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Precision = 4
        Name = 'ReturnParameter'
        ParamType = ptResult
        Size = 4
      end>
    SQLConnection = cntData
    ServerMethodName = 'TsmGlobal.CheckFolio'
    Left = 88
    Top = 64
  end
  object ssmCheckCode: TSqlServerMethod
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sCode'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'sTable'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Precision = 4
        Name = 'ReturnParameter'
        ParamType = ptResult
        Size = 4
      end>
    SQLConnection = cntData
    ServerMethodName = 'TsmGlobal.CheckCode'
    Left = 24
    Top = 64
  end
  object UCMidasConn: TUCMidasConn
    DBMS = dbmsFirebird
    Connection = dspGlobal
    ProviderName = 'dspUser'
    Left = 232
    Top = 64
  end
  object ActionManager: TActionManager
    Left = 232
    Top = 16
    StyleName = 'Platform Default'
    object actSession: TAction
      Category = 'Seguridad'
      Caption = 'Cerrar sesi'#243'n'
    end
    object actChange: TAction
      Category = 'Seguridad'
      Caption = 'Cambiar clave'
    end
    object actUsers: TAction
      Category = 'Seguridad'
      Caption = 'Usuarios'
    end
    object actAlmacen: TAction
      Category = 'Cat'#225'logos'
      Caption = 'Almacenes'
      OnExecute = actExecute
    end
    object actEtapa: TAction
      Category = 'Cat'#225'logos'
      Caption = 'Etapas'
      OnExecute = actExecute
    end
    object actCaptura: TAction
      Caption = 'Captura'
      OnExecute = actExecuteModal
    end
    object actCapturaConsult: TAction
      Category = 'Consultas'
      Caption = 'Cerradas'
      OnExecute = actExecute
    end
  end
  object UserControl: TUserControl
    AdditionalAttributesExplanations = <>
    AllowableAdditionalObjectsCollection = <>
    AllowableMainObjectsContainer.ActionManager = ActionManager
    AllowableMainObjectsContainer.HideNotAllowedObjects = True
    AllowableMainObjectsContainer.RequiredActivators.UsersManagerActivator.Action = actUsers
    AllowableMainObjectsContainer.RequiredActivators.ChangePasswordActivator.Action = actChange
    AllowableMainObjectsContainer.RequiredActivators.LogoffActivator.Action = actSession
    ApplicationId = 'Proceso'
    ApplicationName = 'Proceso'
    CryptographicOptions.AdditionalHashes = <>
    MainAdminUser.Name = 'Administrador'
    MainAdminUser.UserName = 'admin'
    MainAdminUser.Password = 'admin'
    MainAdminUser.Email = 'administracion@promaharin.com'
    LoggingSystem.GeneralLogActive = True
    LoggingSystem.UsersLogActive = True
    Tables.UsersTable.TableName = 'UC_USERS'
    Tables.UsersTable.FieldId = 'ID'
    Tables.UsersTable.FieldRecordChecksum = 'RECORDCHECKSUM'
    Tables.UsersTable.FieldName = 'NAME'
    Tables.UsersTable.FieldUserName = 'USERNAME'
    Tables.UsersTable.FieldPassword = 'PASSWORD'
    Tables.UsersTable.FieldEmail = 'EMAIL'
    Tables.UsersTable.FieldRecordType = 'RECORDTYPE'
    Tables.UsersTable.FieldProfileId = 'PROFILEID'
    Tables.UsersTable.FieldPasswordExpirationDate = 'PASSWORDEXPIRATIONDATE'
    Tables.UsersTable.FieldPasswordExpirationCount = 'PASSWORDEXPIRATIONCOUNT'
    Tables.UsersTable.FieldPasswordValidity = 'PASSWORDVALIDITY'
    Tables.UsersTable.FieldAdditionalAttributes = 'ADDITIONALATTRIBUTES'
    Tables.UsersTable.FieldInactive = 'INACTIVE'
    Tables.UsersTable.FieldExternalId = 'EXTERNALID'
    Tables.RightsTable.TableName = 'UC_RIGHTS'
    Tables.RightsTable.FieldId = 'ID'
    Tables.RightsTable.FieldRecordChecksum = 'RECORDCHECKSUM'
    Tables.RightsTable.FieldUserId = 'USERID'
    Tables.RightsTable.FieldApplicationId = 'APPLICATIONID'
    Tables.RightsTable.FieldComponentName = 'COMPONENTNAME'
    Tables.RightsTable.FieldContainerName = 'CONTAINERNAME'
    Tables.UsersLoggedTable.TableName = 'UC_USERSLOGGED'
    Tables.UsersLoggedTable.FieldId = 'ID'
    Tables.UsersLoggedTable.FieldLogonId = 'LOGONID'
    Tables.UsersLoggedTable.FieldUserId = 'USERID'
    Tables.UsersLoggedTable.FieldApplicationId = 'APPLICATIONID'
    Tables.UsersLoggedTable.FieldMachineName = 'MACHINENAME'
    Tables.UsersLoggedTable.FieldLogonDate = 'LOGONDATE'
    Tables.LogTable.TableName = 'UC_LOG'
    Tables.LogTable.FieldId = 'ID'
    Tables.LogTable.FieldApplicationId = 'APPLICATIONID'
    Tables.LogTable.FieldUserId = 'USERID'
    Tables.LogTable.FieldMessage = 'MESSAGE'
    Tables.LogTable.FieldLogDate = 'LOGDATE'
    Tables.LogTable.FieldLogLevel = 'LOGLEVEL'
    Tables.MessengerTable.TableName = 'UC_MESSENGER'
    Tables.MessengerTable.FieldId = 'ID'
    Tables.MessengerTable.FieldUserIdFrom = 'USERIDFROM'
    Tables.MessengerTable.FieldUserIdTo = 'USERIDTO'
    Tables.MessengerTable.FieldSubject = 'SUBJECT'
    Tables.MessengerTable.FieldMessage = 'MESSAGE'
    Tables.MessengerTable.FieldSendDate = 'SENDDATE'
    Tables.MessengerTable.FieldReceiveDate = 'RECEIVEDATE'
    Tables.MessengerTable.FieldReturnReceipt = 'RETURNRECEIPT'
    Tables.MessengerTable.FieldImportant = 'IMPORTANT'
    Tables.MonitorTable.TableName = 'UC_MONITOR'
    Tables.MonitorTable.FieldId = 'ID'
    Tables.MonitorTable.FieldApplicationId = 'APPLICATIONID'
    Tables.MonitorTable.FieldUserId = 'USERID'
    Tables.MonitorTable.FieldEventDate = 'EVENTDATE'
    Tables.MonitorTable.FieldFormName = 'FORMNAME'
    Tables.MonitorTable.FieldFormCaption = 'FORMCAPTION'
    Tables.MonitorTable.FieldEvent = 'EVENT'
    Tables.MonitorTable.FieldData = 'DATA'
    Tables.MonitorTable.FieldDataSetName = 'DATASETNAME'
    Tables.ParametersTable.TableName = 'UC_PARAMETERS'
    Tables.ParametersTable.FieldId = 'ID'
    Tables.ParametersTable.FieldParamName = 'PARAMNAME'
    Tables.ParametersTable.FieldParamType = 'PARAMTYPE'
    Tables.ParametersTable.FieldParamValue = 'PARAMVALUE'
    DataConnector = UCMidasConn
    OnLoginSuccess = UserControlLoginSuccess
    Left = 160
    Top = 64
  end
  object cdsCaptura: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'USERID'
        ParamType = ptInput
      end>
    ProviderName = 'dspCaptura'
    RemoteServer = dspGlobal
    Left = 24
    Top = 112
  end
  object cccManager: TDSClientCallbackChannelManager
    DSPort = '211'
    CommunicationProtocol = 'tcp/ip'
    ChannelName = 'Proceso'
    ManagerId = '402504.733561.579534'
    Left = 88
    Top = 112
  end
  object dspAlmacen: TDSProviderConnection
    ServerClassName = 'TsmAlmacen'
    SQLConnection = cntData
    Left = 160
    Top = 112
  end
  object cdsAlmacen: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaster'
    RemoteServer = dspAlmacen
    Left = 232
    Top = 112
  end
  object dspEtapa: TDSProviderConnection
    ServerClassName = 'TsmEtapa'
    SQLConnection = cntData
    Left = 160
    Top = 160
  end
  object cdsEtapa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaster'
    RemoteServer = dspEtapa
    Left = 232
    Top = 160
  end
end
