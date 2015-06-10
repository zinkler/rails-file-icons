require "rails-file-icons/engine"

module Icon

  KNOWN_EXTENSIONS = %w{
    3gp 7z ace ai aif aiff amr asf asx bat bin bmp bup cab cbr cda cdl cdr chm
    dat divx dll dmg doc docx dss dvf dwg eml eps exe fla flv gif gz hqx htm html
    ifo indd iso jar jpeg jpg lnk log m4a m4b m4p m4v mcd mdb mid mov mp2 mp3 mp4
    mpeg mpg msi mswmm ogg pdf png pps ppt pptx ps psd pst ptb pub qbb qbw qxd ram
    rar rm rmvb rtf sea ses sit sitx ss swf tgz thm tif tmp torrent ttf txt
    vcd vob wav wma wmv wps xls xlsx xpi zip
    }.inject({}) do |known_extensions, ext|
      known_extensions[ext] = "assets/fileicons/file_extension_#{ext}.png"
      known_extensions
    end

  def self.for_filename filename
    for_ext File.extname(filename)
  end

  def self.for_ext file_extension
    ext = file_extension.start_with?('.') ? file_extension[1..-1] : file_extension
    KNOWN_EXTENSIONS[ext.downcase] || 'assets/fileicons/file_extension_unknown.png'
  end
end