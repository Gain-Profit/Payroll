object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 358
  Top = 174
  Height = 415
  Width = 427
  object xConn: TmySQLDatabase
    ConnectOptions = []
    Params.Strings = (
      'Port=3306'
      'TIMEOUT=30')
    Left = 24
    Top = 16
  end
  object Qexe: TmySQLQuery
    Database = xConn
    Left = 88
    Top = 16
  end
  object QShow: TmySQLQuery
    Database = xConn
    Left = 24
    Top = 72
  end
  object sm: TsSkinManager
    Active = False
    InternalSkins = <>
    MenuSupport.ExtraLineFont.Charset = DEFAULT_CHARSET
    MenuSupport.ExtraLineFont.Color = clWindowText
    MenuSupport.ExtraLineFont.Height = -11
    MenuSupport.ExtraLineFont.Name = 'MS Sans Serif'
    MenuSupport.ExtraLineFont.Style = []
    SkinInfo = 'N/A'
    ThirdParty.ThirdEdits = 
      'TEdit'#13#10'TMemo'#13#10'TMaskEdit'#13#10'TLabeledEdit'#13#10'THotKey'#13#10'TListBox'#13#10'TCheck' +
      'ListBox'#13#10'TRichEdit'#13#10'TDateTimePicker'
    ThirdParty.ThirdButtons = 'TButton'
    ThirdParty.ThirdBitBtns = 'TBitBtn'
    ThirdParty.ThirdCheckBoxes = 'TCheckBox'#13#10'TRadioButton'#13#10'TGroupButton'
    ThirdParty.ThirdGroupBoxes = 'TGroupBox'#13#10'TRadioGroup'
    ThirdParty.ThirdListViews = 'TListView'
    ThirdParty.ThirdPanels = 'TPanel'
    ThirdParty.ThirdGrids = 'TStringGrid'#13#10'TDrawGrid'
    ThirdParty.ThirdTreeViews = 'TTreeView'
    ThirdParty.ThirdComboBoxes = 'TComboBox'#13#10'TColorBox'
    ThirdParty.ThirdWWEdits = ' '
    ThirdParty.ThirdVirtualTrees = ' '
    ThirdParty.ThirdGridEh = ' '
    ThirdParty.ThirdPageControl = 'TPageControl'
    ThirdParty.ThirdTabControl = 'TTabControl'
    ThirdParty.ThirdToolBar = 'TToolBar'
    ThirdParty.ThirdStatusBar = 'TStatusBar'
    ThirdParty.ThirdSpeedButton = 'TSpeedButton'
    Left = 208
    Top = 16
  end
end
