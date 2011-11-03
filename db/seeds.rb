# -*- coding: utf-8 -*-

State.create([
        {:name => 'Federado'}, 
        {:name => 'No Federado'}, 
        {:name => 'Baja'}
])

Category.create([
        {:name => 'Mini'}, 
        { :name => 'PreBenjamin'}, 
        {:name => 'Benjamin'}, 
        {:name => 'Alevin'},
        {:name => 'Infantil'}, 
        {:name => 'Junior'}, 
        {:name => 'Absoluto'}, 
        {:name => 'Master'}
])
                          
Country.create([
        {:name => 'España', :iso_code => 'ES'},
        {:name => 'Albania', :iso_code => 'AL'},
        {:name => 'Algeria', :iso_code => 'DZ'},
        {:name => 'Samoa', :iso_code => 'AS'},
        {:name => 'Andorra', :iso_code => 'AD'},
        {:name => 'Angola', :iso_code => 'AO'},
        {:name => 'Anguilla', :iso_code => 'AI'},
        {:name => 'Antarctica', :iso_code => 'AQ'},
        {:name => 'Antigua y Barbuda', :iso_code => 'AG'},
        {:name => 'Argentina', :iso_code => 'AR'},
        {:name => 'Armenia', :iso_code => 'AM'},
        {:name => 'Aruba', :iso_code => 'AW'},
        {:name => 'Australia', :iso_code => 'AU'},
        {:name => 'Austria', :iso_code => 'AT'},
        {:name => 'Azerbaijan', :iso_code => 'AZ'},
        {:name => 'Bahamas', :iso_code => 'BS'},
        {:name => 'Bahrain', :iso_code => 'BH'},
        {:name => 'Bangladesh', :iso_code => 'BD'},
        {:name => 'Barbados', :iso_code => 'BB'},
        {:name => 'Belarus', :iso_code => 'BY'},
        {:name => 'Belgium', :iso_code => 'BE'},
        {:name => 'Belize', :iso_code => 'BZ'},
        {:name => 'Benin', :iso_code => 'BJ'},
        {:name => 'Bermuda', :iso_code => 'BM'},
        {:name => 'Bhutan', :iso_code => 'BT'},
        {:name => 'Bolivia', :iso_code => 'BO'},
        {:name => 'Bosnia y Herzegovina', :iso_code => 'BA'},
        {:name => 'Botswana', :iso_code => 'BW'},
        {:name => 'Bouvet Island', :iso_code => 'BV'},
        {:name => 'Brasil', :iso_code => 'BR'},
        {:name => 'British Indian Ocean Territory', :iso_code => 'IO'},
        {:name => 'Brunei Darussalam', :iso_code => 'BN'},
        {:name => 'Bulgaria', :iso_code => 'BG'},
        {:name => 'Burkina Faso', :iso_code => 'BF'},
        {:name => 'Burundi', :iso_code => 'BI'},
        {:name => 'Cambodia', :iso_code => 'KH'},
        {:name => 'Camerun', :iso_code => 'CM'},
        {:name => 'Canada', :iso_code => 'CA'},
        {:name => 'Cabo Verde', :iso_code => 'CV'},
        {:name => 'Islas Cayman', :iso_code => 'KY'},
        {:name => 'Chad', :iso_code => 'TD'},
        {:name => 'Chile', :iso_code => 'CL'},
        {:name => 'China', :iso_code => 'CN'},
        {:name => 'Colombia', :iso_code => 'CO'},
        {:name => 'Comoros', :iso_code => 'KM'},
        {:name => 'Congo', :iso_code => 'CG'},
        {:name => 'Cook Islands', :iso_code => 'CK'},
        {:name => 'Costa Rica', :iso_code => 'CR'},
        {:name => 'Croatia', :iso_code => 'HR'},
        {:name => 'Cuba', :iso_code => 'CU'},
        {:name => 'Republica Checa', :iso_code => 'CZ'},
        {:name => 'Dinamarca', :iso_code => 'DK'},
        {:name => 'Djibouti', :iso_code => 'DJ'},
        {:name => 'Dominica', :iso_code => 'DM'},
        {:name => 'Republica Dominicana', :iso_code => 'DO'},
        {:name => 'Ecuador', :iso_code => 'EC'},
        {:name => 'Egipto', :iso_code => 'EG'},
        {:name => 'El Salvador', :iso_code => 'SV'},
        {:name => 'Guinea Ecuatorial', :iso_code => 'GQ'},
        {:name => 'Eritrea', :iso_code => 'ER'},
        {:name => 'Estonia', :iso_code => 'EE'},
        {:name => 'Etiopia', :iso_code => 'ET'},
        {:name => 'Falkland Islands (Malvinas)', :iso_code => 'FK'},
        {:name => 'Fiji', :iso_code => 'FJ'},
        {:name => 'Finlandia', :iso_code => 'FI'},
        {:name => 'Francia', :iso_code => 'FR'},
        {:name => 'Gabon', :iso_code => 'GA'},
        {:name => 'Gambia', :iso_code => 'GM'},
        {:name => 'Georgia', :iso_code => 'GE'},
        {:name => 'Alemania', :iso_code => 'DE'},
        {:name => 'Ghana', :iso_code => 'GH'},
        {:name => 'Gibraltar', :iso_code => 'GI'},
        {:name => 'Grecia', :iso_code => 'GR'},
        {:name => 'Guam', :iso_code => 'GU'},
        {:name => 'Guatemala', :iso_code => 'GT'},
        {:name => 'Guinea', :iso_code => 'GN'},
        {:name => 'Guinea-Bissau', :iso_code => 'GW'},
        {:name => 'Guyana', :iso_code => 'GY'},
        {:name => 'Haiti', :iso_code => 'HT'},
        {:name => 'Honduras', :iso_code => 'HN'},
        {:name => 'Hong Kong', :iso_code => 'HK'},
        {:name => 'Hungria', :iso_code => 'HU'},
        {:name => 'Islandia', :iso_code => 'IS'},
        {:name => 'India', :iso_code => 'IN'},
        {:name => 'Indonesia', :iso_code => 'ID'},
        {:name => 'Iran', :iso_code => 'IR'},
        {:name => 'Iraq', :iso_code => 'IQ'},
        {:name => 'Ireland', :iso_code => 'IE'},
        {:name => 'Israel', :iso_code => 'IL'},
        {:name => 'Italia', :iso_code => 'IT'},
        {:name => 'Jamaica', :iso_code => 'JM'},
        {:name => 'Japon', :iso_code => 'JP'},
        {:name => 'Jordan', :iso_code => 'JO'},
        {:name => 'Kazakhstan', :iso_code => 'KZ'},
        {:name => 'Kenya', :iso_code => 'KE'},
        {:name => 'Kiribati', :iso_code => 'KI'},
        {:name => 'Korea', :iso_code => 'KR'},
        {:name => 'Kuwait', :iso_code => 'KW'},
        {:name => 'Kyrgyzstan', :iso_code => 'KG'},
        {:name => 'Latvia', :iso_code => 'LV'},
        {:name => 'Lebanon', :iso_code => 'LB'},
        {:name => 'Liberia', :iso_code => 'LR'},
        {:name => 'Lituania', :iso_code => 'LT'},
        {:name => 'Luxemburgo', :iso_code => 'LU'},
        {:name => 'Macao', :iso_code => 'MO'},
        {:name => 'Madagascar', :iso_code => 'MG'},
        {:name => 'Malaysia', :iso_code => 'MY'},
        {:name => 'Maldives', :iso_code => 'MV'},
        {:name => 'Mali', :iso_code => 'ML'},
        {:name => 'Malta', :iso_code => 'MT'},
        {:name => 'Mauritania', :iso_code => 'MR'},
        {:name => 'Mexico', :iso_code => 'MX'},
        {:name => 'Monaco', :iso_code => 'MC'},
        {:name => 'Mongolia', :iso_code => 'MN'},
        {:name => 'Montenegro', :iso_code => 'ME'},
        {:name => 'Marruecos', :iso_code => 'MA'},
        {:name => 'Mozambique', :iso_code => 'MZ'},
        {:name => 'Namibia', :iso_code => 'NA'},
        {:name => 'Nepal', :iso_code => 'NP'},
        {:name => 'Paises Bajos', :iso_code => 'NL'},
        {:name => 'Nueva Zelanda', :iso_code => 'NZ'},
        {:name => 'Nicaragua', :iso_code => 'NI'},
        {:name => 'Niger', :iso_code => 'NE'},
        {:name => 'Nigeria', :iso_code => 'NG'},
        {:name => 'Noruega', :iso_code => 'NO'},
        {:name => 'Oman', :iso_code => 'OM'},
        {:name => 'Pakistan', :iso_code => 'PK'},
        {:name => 'Panama', :iso_code => 'PA'},
        {:name => 'Paraguay', :iso_code => 'PY'},
        {:name => 'Peru', :iso_code => 'PE'},
        {:name => 'Polonia', :iso_code => 'PL'},
        {:name => 'Portugal', :iso_code => 'PT'},
        {:name => 'Puerto Rico', :iso_code => 'PR'},
        {:name => 'Qatar', :iso_code => 'QA'},
        {:name => 'Reunion', :iso_code => 'RE'},
        {:name => 'Romania', :iso_code => 'RO'},
        {:name => 'Russian Federation', :iso_code => 'RU'},
        {:name => 'Rwanda', :iso_code => 'RW'},
        {:name => 'Samoa', :iso_code => 'WS'},
        {:name => 'San Marino', :iso_code => 'SM'},
        {:name => 'Sao Tome y Principe', :iso_code => 'ST'},
        {:name => 'Arabia Saudi', :iso_code => 'SA'},
        {:name => 'Senegal', :iso_code => 'SN'},
        {:name => 'Serbia', :iso_code => 'RS'},
        {:name => 'Seychelles', :iso_code => 'SC'},
        {:name => 'Sierra Leona', :iso_code => 'SL'},
        {:name => 'Singapur', :iso_code => 'SG'},
        {:name => 'Eslovaquia', :iso_code => 'SK'},
        {:name => 'Eslovenia', :iso_code => 'SI'},
        {:name => 'Solomon Islands', :iso_code => 'SB'},
        {:name => 'Somalia', :iso_code => 'SO'},
        {:name => 'South Africa', :iso_code => 'ZA'},
        {:name => 'Suecia', :iso_code => 'SE'},
        {:name => 'Suiza', :iso_code => 'CH'},
        {:name => 'Togo', :iso_code => 'TG'},
        {:name => 'Tonga', :iso_code => 'TO'},
        {:name => 'Trinidad y Tobago', :iso_code => 'TT'},
        {:name => 'Tunisia', :iso_code => 'TN'},
        {:name => 'Turquia', :iso_code => 'TR'},
        {:name => 'Tuvalu', :iso_code => 'TV'},
        {:name => 'Uganda', :iso_code => 'UG'},
        {:name => 'Ucraine', :iso_code => 'UA'},
        {:name => 'Reuno Unido', :iso_code => 'GB'},
        {:name => 'Estados Unidos', :iso_code => 'US'},
        {:name => 'Uruguay', :iso_code => 'UY'},
        {:name => 'Uzbekistan', :iso_code => 'UZ'},
        {:name => 'Viet Nam', :iso_code => 'VN'},
        {:name => 'Yemen', :iso_code => 'YE'},
        {:name => 'Zambia', :iso_code => 'ZM'},
        {:name => 'Zimbabwe', :iso_code => 'ZW'}
])

TrialCategory.create([
        {:name => "Talla", :description => "Altura del nadador en cm", :type_value => "cm"},
        {:name => "Peso", :description => "Peso del nadador en kg", :type_value => "kg"},
        {:name => "Envergadura", :description => "Envergadura del nadador en cm", :type_value => "cm"},
        {:name => "Presión Arterial", :description => "Presión arterial sistólica y diastólica en mmHg", :type_value => "mmHg"},
        {:name => "FC Basal", :description => "Media de la FCBasal de una semana en p/m", :type_value => "p/m"}, 
        {:name => "Flotabilidad", :description => "Capacidad de flotar del nadador (referencia de puntos corporales)", :type_value => ""}, 
        {:name => "Test 30 minutos", :description => "Capacidad de resistencia básica del nadador (referencia umbral) en metros" , :type_value => "m"},
        {:name => "Test 2000 metros", :description => "Capacidad de resistencia básica del nadador (referencia umbral) en min/seg", :type_value => "min/seg/cent"}, 
        {:name => "Test 25 metros", :description => "Velocidad máxima de nado en 25m a estilo crol en seg", :type_value => "min/seg/cent"},
        {:name => "Potencia MMII", :description => "Fuerza de los miembros inferiores en cm", :type_value => "cm"},
        {:name => "Hidrodinámica", :description => "Capacidad o resistencia hidrodinámica que ofrece el nadador en cm", :type_value => "cm"},
        {:name => "Test 300 metros piernas", :description => "Resistencia aeróbica máxima en miebros inferiores del nadador en min/seg", :type_value => "min/seg/cent"}
])

CompetitionSet.create([
        {:name => "50 Libre"},
        {:name => "100 Libre"},
        {:name => "200 Libre"},
        {:name => "400 Libre"},
        {:name => "800 Libre"},
        {:name => "1500 Libre"},
        {:name => "3000 Libre"},
        {:name => "50 Mariposa"},
        {:name => "100 Mariposa"},
        {:name => "200 Mariposa"},
        {:name => "50 Espalda"},
        {:name => "100 Espalda"},
        {:name => "200 Espalda"},
        {:name => "50 Braza"},
        {:name => "100 Braza"},
        {:name => "200 Braza"}
])