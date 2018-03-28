Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 001D47DD31
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Mar 2018 16:07:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751434AbeC1QH7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Mar 2018 12:07:59 -0400
Received: from mail-pf0-f196.google.com ([209.85.192.196]:43714 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751166AbeC1QH6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Mar 2018 12:07:58 -0400
Received: by mail-pf0-f196.google.com with SMTP id j2so1144625pff.10;
        Wed, 28 Mar 2018 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ItM+uD+gVrAW3cprfTfFIBVA9gSw5HM/18HzoFvXwjk=;
        b=SKDPTclkMobUi6UINL4EzQWgdXB1aMqw26PRz/M8aZpK1BanN98mzLYHaKaR5E0gCX
         0gSUM7gT897+yu4DKjmfVRkB0qOyBSk77aU2QAshhkdKFXH/JrCR5469Vik4bSQqZ6io
         twrVG/6nuYxDQYg4q9bpZYn1px4eO/LwNDr+cc89ZRZHFRj4kQAlAbPomM5VTYDVZrIM
         puoVbPrf9KoMQjs93BRYbUI3cVzNawbgOTNyhUnRGMw9Qh5kssVeCGXpe0a4QJecpCis
         MssqoVwDTVTnCRBPPXx938xj7L1y+WAfO8sC/o7qPZtnwHO3q4gDFHlbKNQ9SYI7X/Jd
         Qb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ItM+uD+gVrAW3cprfTfFIBVA9gSw5HM/18HzoFvXwjk=;
        b=RVL3oX8x2+CLz4RII0XTGDKgDEY5tzQ2D+Z6oI2STvp5i0bdyW/wOrXQi7gMZ3dO+D
         h3abQo4Bk0I4tGQGr/PcH4WKNAzK4MhAIhaQYipIF0+b1m+hC4MU1VHdNCz7ZCPqSZO3
         9sq7ic/eZ2cGMHmTjvA6aEeXoxitWFSfbfz8vuk5SD9uxk1/KnGYny0HEt02ZkQnttff
         occySWeC6JniZw3UldGXPQRH0WCB8NZCbhIFJe3FGP5K570NcYJAAPusWfksLZNq9L0n
         9r29+S7aEJtV/tdjcjmI5lgh93RWU5/h+0Ci8MbfDHi+gDY9rsvlEMZdoJRtbQ4kBUUx
         L5VQ==
X-Gm-Message-State: AElRT7EllKpA8h/mAb82qo991wVcB5+ljmm+X2bnyfpRTVUzI8lGBpX0
        g2njdzHux1dYQDltgHUjONQ=
X-Google-Smtp-Source: AIpwx49BZpSAYgy1OIhDYEZqISCgIjwziQXcOFr1q9S8sCdmUToSgn5+tCVvjeMdlduFLTLj7wQMew==
X-Received: by 10.99.120.74 with SMTP id t71mr3037508pgc.310.1522253277266;
        Wed, 28 Mar 2018 09:07:57 -0700 (PDT)
Received: from arty-430G2 ([2001:470:36:117e:a038:3853:c974:4e7])
        by smtp.gmail.com with ESMTPSA id 85sm8981558pfz.155.2018.03.28.09.07.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Mar 2018 09:07:56 -0700 (PDT)
Received: by arty-430G2 (sSMTP sendmail emulation); Thu, 29 Mar 2018 00:07:52 +0800
From:   Sanjeev Gupta <ghane0@gmail.com>
To:     corbet@lwn.net, gregkh@linuxfoundation.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/usb: Fix dead links and convert others to https
Date:   Thu, 29 Mar 2018 00:07:52 +0800
Message-Id: <20180328160752.17840-1-ghane0@gmail.com>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

All links checked, for those dead, I have replaced with copies on
archive.org.  For some, https is not supported, http has been
kept.

The git log says this was last done by Justin P. Mattock in 2010.
Hi, Justin!

Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>
---
 Documentation/usb/usb-serial.txt | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/usb/usb-serial.txt b/Documentation/usb/usb-serial.txt
index 349f3104fa4f..1c5c1da4f54e 100644
--- a/Documentation/usb/usb-serial.txt
+++ b/Documentation/usb/usb-serial.txt
@@ -83,7 +83,7 @@ HandSpring Visor, Palm USB, and Clié USB driver
   parameters.  e.g. modprobe visor vendor=0x54c product=0x66
   
   There is a webpage and mailing lists for this portion of the driver at:
-  http://sourceforge.net/projects/usbvisor/
+  https://sourceforge.net/projects/usbvisor/
 
   For any questions or problems with this driver, please contact Greg
   Kroah-Hartman at greg@kroah.com
@@ -105,15 +105,16 @@ PocketPC PDA Driver
   kbytes/sec for download/upload to my iPAQ.
 
   This driver is only one of a set of components required to utilize
-  the USB connection. Please visit http://synce.sourceforge.net which
+  the USB connection. Please visit https://synce.sourceforge.net which
   contains the necessary packages and a simple step-by-step howto.
 
   Once connected, you can use Win CE programs like ftpView, Pocket Outlook
   from the PDA and xcerdisp, synce utilities from the Linux side.
 
   To use Pocket IE, follow the instructions given at
-  http://www.tekguru.co.uk/EM500/usbtonet.htm to achieve the same thing
-  on Win98. Omit the proxy server part; Linux is quite capable of forwarding
+  https://web.archive.org/web/20030415065014/http://www.tekguru.co.uk:80/EM500/usbtonet.htm
+  to achieve the same thing on Win98.
+  Omit the proxy server part; Linux is quite capable of forwarding
   packets unlike Win98. Another modification is required at least for the
   iPAQ - disable autosync by going to the Start/Settings/Connections menu
   and unchecking the "Automatically synchronize ..." box. Go to
@@ -184,7 +185,7 @@ Keyspan USA-series Serial Adapters
     functionality.
   
   More information is available at:
-        http://www.carnationsoftware.com/carnation/Keyspan.html
+        https://www.carnationsoftware.com/carnation/Keyspan.html
    
   For any questions or problems with this driver, please contact Hugh
   Blemings at hugh@misc.nu
@@ -436,7 +437,8 @@ Winchiphead CH341 Driver
   also implements an IEEE 1284 parallel port, I2C and SPI, but that is not
   supported by the driver. The protocol was analyzed from the behaviour
   of the Windows driver, no datasheet is available at present.
-  The manufacturer's website: http://www.winchiphead.com/.
+  The manufacturer's website:
+  https://web.archive.org/web/20170911133726/http://winchiphead.com/ .
   For any questions or problems with this driver, please contact
   frank@kingswood-consulting.co.uk.
 
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
