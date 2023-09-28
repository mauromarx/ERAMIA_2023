//
// ***** Convertendo dataset para formato CSV
OUTPUT($.modPersons.File,,'~CLASS::XYZ::OUT::Persons_CSV',CSV(SEPARATOR(','), TERMINATOR('\n')),OVERWRITE);
//