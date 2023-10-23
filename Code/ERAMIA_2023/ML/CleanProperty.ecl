IMPORT $;
//
Property := $.modProperty.File;
//
EXPORT CleanProperty := Property($.isCleanFilter);
//
// CleanProperty := Property($.isCleanFilter);
// OUTPUT(CleanProperty);
// COUNT(CleanProperty);          // 575.814 registros
//
//
// OUTPUT(CleanProperty,,'~CLASS::XYZ::OUT::CleanProperty',CSV(SEPARATOR(','), TERMINATOR('\n')),OVERWRITE);
//
