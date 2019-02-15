#!/usr/bin/python
# -*- coding:utf-8 -*-

import epd2in7
import time
from PIL import Image,ImageDraw,ImageFont
import traceback

try:
    epd = epd2in7.EPD()
    epd.init()

    print "read bmp file"
    Himage = Image.open('2in7.bmp')
    epd.display(epd.getbuffer(Himage))
    time.sleep(2)
    
    epd.sleep()
        
except:
    print 'traceback.format_exc():\n%s' % traceback.format_exc()
    exit()

