require 'joe_utils'


include FilesHelper

LOCALES_LOCATION = 'src/main/resources/languages/'
COMMON_NAME = 'mps-installer_%s.UTF8.nsh'


LANGUAGES = ['cs-CZ', 'da-DK', 'de-DE', 'en-US', 'es-US', 'fr-FR', 'hu-HU', 'it-IT', 'ja-JP', 'pl-PL', 'pt-BR', 'pt-PT', 'ro-RO', 'ru-RU', 'sk-SK', 'tr-TR', 'zh-CN']

LANGUAGES.each do |code|
  text = load_file_text(COMMON_NAME % code)

end