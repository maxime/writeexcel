require 'digest/md5'

class Workbook < BIFFWriter
   BOF = 11
   EOF = 4
   SheetName = "Sheet"

   attr_accessor :date_system
   attr_reader :formats, :xf_index, :worksheets

   ###############################################################################
   #
   # new()
   #
   # Constructor. Creates a new Workbook object from a BIFFwriter object.
   #
   def initialize(filename)
      super
      @filename              = filename
#      @parser                = $parser 
      @tempdir               = nil
      @v1904                 = 0 
      @activesheet           = 0 
      @firstsheet            = 0 
      @selected              = 0 
      @xf_index              = 0 
      @fileclosed            = 0 
      @biffsize              = 0 
      @sheetname             = "Sheet" 
      @url_format            = '' 
      @codepage              = 0x04E4 
      @worksheets            = [] 
      @sheetnames            = [] 
      @formats               = [] 
      @palette               = [] 

      @using_tmpfile         = 1 
      @filehandle            = "" 
      @temp_file             = "" 
      @internal_fh           = 0 
      @fh_out                = "" 

      @str_total             = 0 
      @str_unique            = 0 
      @str_table             = {} 
      @str_array             = [] 
      @str_block_sizes       = [] 
      @extsst_offsets        = [] 
      @extsst_buckets        = 0 
      @extsst_bucket_size    = 0 

      @ext_ref_count         = 0 
      @ext_refs              = {} 

      @mso_clusters          = [] 
      @mso_size              = 0 

      @hideobj               = 0 
      @compatibility         = 0 

      @add_doc_properties    = 0 
#      @localtime             = [localtime()] 

      # Add the in-built style formats and the default cell format.
      add_format(:type => 1)                        #  0 Normal
      add_format(:type => 1)                        #  1 RowLevel 1
      add_format(:type => 1)                        #  2 RowLevel 2
      add_format(:type => 1)                        #  3 RowLevel 3
      add_format(:type => 1)                        #  4 RowLevel 4
      add_format(:type => 1)                        #  5 RowLevel 5
      add_format(:type => 1)                        #  6 RowLevel 6
      add_format(:type => 1)                        #  7 RowLevel 7
      add_format(:type => 1)                        #  8 ColLevel 1
      add_format(:type => 1)                        #  9 ColLevel 2
      add_format(:type => 1)                        # 10 ColLevel 3
      add_format(:type => 1)                        # 11 ColLevel 4
      add_format(:type => 1)                        # 12 ColLevel 5
      add_format(:type => 1)                        # 13 ColLevel 6
      add_format(:type => 1)                        # 14 ColLevel 7
      add_format()                                  # 15 Cell XF
      add_format(:type => 1, :num_format => 0x2B)   # 16 Comma
      add_format(:type => 1, :num_format => 0x29)   # 17 Comma[0]
      add_format(:type => 1, :num_format => 0x2C)   # 18 Currency
      add_format(:type => 1, :num_format => 0x2A)   # 19 Currency[0]
      add_format(:type => 1, :num_format => 0x09)   # 20 Percent

      # Add the default format for hyperlinks
      @url_format = add_format(:color => 'blue', :underline => 1) 

      # Convert the filename to a filehandle to pass to the OLE writer when the
      # file is closed. If the filename is a reference it is assumed that it is
      # a valid filehandle.
      #
      if filename.kind_of?(String) && filename != ''
         @fh_out      = open(filename, "wb")
         @internal_fh = 1
      else
         print "Workbook#new - filename required."
         exit
      end

      # Set colour palette.
      set_palette_xl97

      _initialize
      get_checksum_method
   end


   ###############################################################################
   #
   # _initialize()
   #
   # Open a tmp file to store the majority of the Worksheet data. If this fails,
   # for example due to write permissions, store the data in memory. This can be
   # slow for large files.
   #
   # TODO: Move this and other methods shared with Worksheet up into BIFFWriter.
   #
   def _initialize
      basename = 'spreadsheetwriteexcelworkbook'

      begin
         if !@tempdir.nil
            if @tempdir == ''
               fh = Tempfile.new(basename)
            else
               fh = Tempfile.new(basename, @tempdir)
            end
         end
      # failed. store temporary data in memory.
      rescue
         @using_tmpfile = 0
      # if the temp file creation was successful
      else
         @filehandle = fh
      end
   end

   ###############################################################################
   #
   # _get_checksum_method.
   #
   # Check for modules available to calculate image checksum. Excel uses MD4 but
   # MD5 will also work.
   #
   # ------- cxn03651 add -------
   # md5 can use in ruby. so, @checksum_method is always 3.
   
   def get_checksum_method
      @checksum_method = 3
   end

   ###############################################################################
   #
   # add_format(%properties)
   #
   # Add a new format to the Excel workbook. This adds an XF record and
   # a FONT record. Also, pass any properties to the Format::new().
   #
   def add_format(*args)
       format = Format.new(@xf_index, args)
       @xf_index += 1
       @formats.push format # Store format reference
       return format
   end

   ###############################################################################
   #
   # set_palette_xl97()
   #
   # Sets the colour palette to the Excel 97+ default.
   #
   def set_palette_xl97
      @palette = [
         [0x00, 0x00, 0x00, 0x00],   # 8
         [0xff, 0xff, 0xff, 0x00],   # 9
         [0xff, 0x00, 0x00, 0x00],   # 10
         [0x00, 0xff, 0x00, 0x00],   # 11
         [0x00, 0x00, 0xff, 0x00],   # 12
         [0xff, 0xff, 0x00, 0x00],   # 13
         [0xff, 0x00, 0xff, 0x00],   # 14
         [0x00, 0xff, 0xff, 0x00],   # 15
         [0x80, 0x00, 0x00, 0x00],   # 16
         [0x00, 0x80, 0x00, 0x00],   # 17
         [0x00, 0x00, 0x80, 0x00],   # 18
         [0x80, 0x80, 0x00, 0x00],   # 19
         [0x80, 0x00, 0x80, 0x00],   # 20
         [0x00, 0x80, 0x80, 0x00],   # 21
         [0xc0, 0xc0, 0xc0, 0x00],   # 22
         [0x80, 0x80, 0x80, 0x00],   # 23
         [0x99, 0x99, 0xff, 0x00],   # 24
         [0x99, 0x33, 0x66, 0x00],   # 25
         [0xff, 0xff, 0xcc, 0x00],   # 26
         [0xcc, 0xff, 0xff, 0x00],   # 27
         [0x66, 0x00, 0x66, 0x00],   # 28
         [0xff, 0x80, 0x80, 0x00],   # 29
         [0x00, 0x66, 0xcc, 0x00],   # 30
         [0xcc, 0xcc, 0xff, 0x00],   # 31
         [0x00, 0x00, 0x80, 0x00],   # 32
         [0xff, 0x00, 0xff, 0x00],   # 33
         [0xff, 0xff, 0x00, 0x00],   # 34
         [0x00, 0xff, 0xff, 0x00],   # 35
         [0x80, 0x00, 0x80, 0x00],   # 36
         [0x80, 0x00, 0x00, 0x00],   # 37
         [0x00, 0x80, 0x80, 0x00],   # 38
         [0x00, 0x00, 0xff, 0x00],   # 39
         [0x00, 0xcc, 0xff, 0x00],   # 40
         [0xcc, 0xff, 0xff, 0x00],   # 41
         [0xcc, 0xff, 0xcc, 0x00],   # 42
         [0xff, 0xff, 0x99, 0x00],   # 43
         [0x99, 0xcc, 0xff, 0x00],   # 44
         [0xff, 0x99, 0xcc, 0x00],   # 45
         [0xcc, 0x99, 0xff, 0x00],   # 46
         [0xff, 0xcc, 0x99, 0x00],   # 47
         [0x33, 0x66, 0xff, 0x00],   # 48
         [0x33, 0xcc, 0xcc, 0x00],   # 49
         [0x99, 0xcc, 0x00, 0x00],   # 50
         [0xff, 0xcc, 0x00, 0x00],   # 51
         [0xff, 0x99, 0x00, 0x00],   # 52
         [0xff, 0x66, 0x00, 0x00],   # 53
         [0x66, 0x66, 0x99, 0x00],   # 54
         [0x96, 0x96, 0x96, 0x00],   # 55
         [0x00, 0x33, 0x66, 0x00],   # 56
         [0x33, 0x99, 0x66, 0x00],   # 57
         [0x00, 0x33, 0x00, 0x00],   # 58
         [0x33, 0x33, 0x00, 0x00],   # 59
         [0x99, 0x33, 0x00, 0x00],   # 60
         [0x99, 0x33, 0x66, 0x00],   # 61
         [0x33, 0x33, 0x99, 0x00],   # 62
         [0x33, 0x33, 0x33, 0x00]    # 63
     ]
     return 0
   end


=begin
   def initialize(file)
      super

      @file       = file
      @format     = Format.new

      @active_sheet = 0
      @first_sheet  = 0
      @biffsize     = 0
      @date_system  = 1900
      @xf_index     = 16

      @worksheets = []
      @formats    = []

      @url_format = add_format(:color=>"blue", :underline=>1)
   end

   def close
      store_workbook
   end

   def add_worksheet(name=nil)
      index = @worksheets.length

      if name.nil?
         name = SheetName + (index + 1).to_s
      end
      
      args = [name,index, @active_sheet, @first_sheet, @url_format]
      ws = Worksheet.new(*args)
      @worksheets[index] = ws
      return ws
   end

   def calc_sheet_offsets
      offset = @datasize
      @worksheets.each{ |sheet|
         offset += BOF + sheet.name.length
      }

      offset += EOF

      @worksheets.each{ |sheet|
         sheet.offset = offset
         offset += sheet.datasize
      }

      @biffsize = offset
   end

   def store_workbook
      @worksheets.each{ |sheet|
         sheet.close
      }

      store_bof(0x0005)
      store_window1
      store_date_system
      store_all_fonts
      store_all_num_formats
      store_all_xfs
      store_all_styles
      calc_sheet_offsets

      @worksheets.each{ |sheet|
         store_boundsheet(sheet.name, sheet.offset)
      }

      store_eof
      store_ole_file
   end
   
   def store_ole_file
      OLEWriter.open(@file){ |ole|
         ole.set_size(@biffsize)
         ole.write_header
         ole.print(@data)
         @worksheets.each{ |sheet|
            ole.print(sheet.data)
         }
      }
   end

   def store_window1
      record    = 0x003D
      length    = 0x0012

      xWn       = 0x0000
      yWn       = 0x0000
      dxWn      = 0x25BC
      dyWn      = 0x1572

      grbit     = 0x0038
      ctabsel   = 0x0001
      wTabRatio = 0x0258

      itabFirst = @first_sheet
      itabCur   = @active_sheet

      header = [record,length].pack("vv")
      fields = [xWn,yWn,dxWn,dyWn,grbit,itabCur,itabFirst,ctabsel,wTabRatio]
      data   = fields.pack("vvvvvvvvv")

      append(header,data)
   end

   def store_all_fonts
      font = @format.font_biff
      for n in 1..5
         append(font)
      end

      fonts = Hash.new(0)
      index = 6
      key = @format.font_key
      fonts[key] = 0

      @formats.each{ |format|
         key = format.font_key
         if fonts.has_key?(key)
            format.font_index = fonts[key]
         else
            fonts[key] = index
            format.font_index = index
            index += 1
            append(format.font_biff)
         end
      }
   end

   def store_xf(style)
      name   = 0x00E0
      length = 0x0010

      ifnt      = 0x0000
      ifmt      = 0x0000
      align     = 0x0020
      icv       = 0x20C0
      fill      = 0x0000
      brd_line  = 0x0000
      brd_color = 0x0000

      header = [name, length].pack("vv")
      fields = [ifnt,ifmt,style,align,icv,fill,brd_line,brd_color]
      data   = fields.pack("vvvvvvvv")

      append(header, data);
   end

   def store_all_num_formats
      index = 164

      num_formats_hash = {}
      num_formats_array = []

      @formats.each{ |format|
         num_format = format.num_format
         next if num_format.kind_of?(Numeric)
         if num_formats_hash.has_key?(num_format)
            format.num_format = num_formats_hash[num_format]
         else
            num_formats_hash[num_format] = index
            format.num_format = index
            num_formats_array.push(num_format)
            index += 1
         end
      }

      index = 164
      num_formats_array.each{ |num_format|
         store_num_format(num_format,index)
         index += 1
      }
   end

   def store_all_xfs
      xf = @format.xf_biff(0xFFF5)
      for n in 1..15
         append(xf)
      end

      xf = @format.xf_biff(0x0001)
      append(xf)
         
      @formats.each{ |format|
         xf = format.xf_biff(0x0001)
         append(xf)
      }
   end

   def store_style
      record = 0x0293
      length = 0x0004

      ixfe    = 0x8000
      builtin = 0x00
      iLevel  = 0xff

      header = [record, length].pack("vv")
      data   = [ixfe, builtin, iLevel].pack("vCC")

      append(header, data)
   end

   alias store_all_styles store_style

   def store_boundsheet(sheet_name, offset)
      name   = 0x0085
      length = 0x07 + sheet_name.length

      grbit = 0x0000
      cch   = sheet_name.length

      header = [name, length].pack("vv")
      data   = [offset, grbit, cch].pack("VvC")

      append(header, data, sheet_name)
   end

   def store_num_format(format, ifmt)
      record = 0x041E
      cch    = format.length
      length = 0x03 + cch

      header = [record, length].pack("vv")
      data   = [ifmt, cch].pack("vC")

      append(header, data, format)
   end

   def store_date_system
      record = 0x0022
      length = 0x0002
      
      f1904 = 0
      f1904 = 1 if @date_system == 1904

      header = [record, length].pack("vv")
      data   = [f1904].pack("v")

      append(header, data)
   end

=end
end

=begin
= Notes on the difference between Workbook.pm and workbook.rb
---deprecated methods
   I generally elminated any deprecated methods.  That means no 'write'
   methods.
---date_system
   This is the 1904 attribute.  However, since a number can't be a method,
   this doesn't work very well for attribute_accessor.  Besides, date_system
   is more descriptive.
=end
