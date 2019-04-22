Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C04FB7D917
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Apr 2019 13:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbfDVN2P (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Apr 2019 09:28:15 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:36878 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727400AbfDVN2O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Apr 2019 09:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=MVBAgUCCqKQZvtn4DuRf7rnnovGqQeoCCXxErkAZhyg=; b=Z/6EE2hzdLGwHFjSJmzyt67glT
        ibq1odvbkSuACU39OsxzVFFH/5drrtTv/HKHZdwOydFD4TXiS3HJcdgmLXrttOfEmQfFWPVhqcS9Y
        zMv4I3jWP9Bb3EsJ3SaHHHDS9pOBXtEjc9wQJPd+T1DsZk72BHYerbQA6dTmbhCRyn0kRSobsNXhm
        gMPnHXbLeLaPScxoY8fNrBjx2elBIgkIN18z7t7jYAJYFdwBTDuz++Bp/8aQyrKg21Oxh2ih4TAAz
        VF98HT7S6x8XPYnhOVvhJq4cd+3kqKZghQPVG27IYA0PBBpRvlDlVB0KFI9xYvBnEDrn94RLVV9qY
        EmEvHxJA==;
Received: from 179.176.125.229.dynamic.adsl.gvt.net.br ([179.176.125.229] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hIYzV-0005Hr-7x; Mon, 22 Apr 2019 13:28:13 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hIYzT-0005lc-28; Mon, 22 Apr 2019 10:28:11 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Rodolfo Giometti <giometti@enneenne.com>
Subject: [PATCH v2 27/79] docs: pps.txt: convert to ReST and rename to pps.rst
Date:   Mon, 22 Apr 2019 10:27:16 -0300
Message-Id: <d6ffab20421f56b72a596cc99197667ea6da99ff.1555938376.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1555938375.git.mchehab+samsung@kernel.org>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This file is already in a good shape: just its title and
adding some literal block markups is needed for it to be
part of the document.

While it has a small chapter with sysfs stuff, most of
the document is focused on driver development.

As it describes a kernel API, move it to the driver-api
directory.

In order to avoid conflicts, let's add an :orphan: tag
to it, to be removed when added to the driver-api book.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 .../{pps/pps.txt => driver-api/pps.rst}       | 67 ++++++++++---------
 MAINTAINERS                                   |  2 +-
 2 files changed, 36 insertions(+), 33 deletions(-)
 rename Documentation/{pps/pps.txt => driver-api/pps.rst} (89%)

diff --git a/Documentation/pps/pps.txt b/Documentation/driver-api/pps.rst
similarity index 89%
rename from Documentation/pps/pps.txt
rename to Documentation/driver-api/pps.rst
index 99f5d8c4c652..1456d2c32ebd 100644
--- a/Documentation/pps/pps.txt
+++ b/Documentation/driver-api/pps.rst
@@ -1,8 +1,10 @@
+:orphan:
 
-			PPS - Pulse Per Second
-			----------------------
+======================
+PPS - Pulse Per Second
+======================
 
-(C) Copyright 2007 Rodolfo Giometti <giometti@enneenne.com>
+Copyright (C) 2007 Rodolfo Giometti <giometti@enneenne.com>
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
@@ -88,7 +90,7 @@ Coding example
 --------------
 
 To register a PPS source into the kernel you should define a struct
-pps_source_info as follows:
+pps_source_info as follows::
 
     static struct pps_source_info pps_ktimer_info = {
 	    .name         = "ktimer",
@@ -101,12 +103,12 @@ pps_source_info as follows:
     };
 
 and then calling the function pps_register_source() in your
-initialization routine as follows:
+initialization routine as follows::
 
     source = pps_register_source(&pps_ktimer_info,
 			PPS_CAPTUREASSERT | PPS_OFFSETASSERT);
 
-The pps_register_source() prototype is:
+The pps_register_source() prototype is::
 
   int pps_register_source(struct pps_source_info *info, int default_params)
 
@@ -118,7 +120,7 @@ pps_source_info which describe the capabilities of the driver).
 
 Once you have registered a new PPS source into the system you can
 signal an assert event (for example in the interrupt handler routine)
-just using:
+just using::
 
     pps_event(source, &ts, PPS_CAPTUREASSERT, ptr)
 
@@ -134,13 +136,13 @@ Please see the file drivers/pps/clients/pps-ktimer.c for example code.
 SYSFS support
 -------------
 
-If the SYSFS filesystem is enabled in the kernel it provides a new class:
+If the SYSFS filesystem is enabled in the kernel it provides a new class::
 
    $ ls /sys/class/pps/
    pps0/  pps1/  pps2/
 
 Every directory is the ID of a PPS sources defined in the system and
-inside you find several files:
+inside you find several files::
 
    $ ls -F /sys/class/pps/pps0/
    assert     dev        mode       path       subsystem@
@@ -148,7 +150,7 @@ inside you find several files:
 
 
 Inside each "assert" and "clear" file you can find the timestamp and a
-sequence number:
+sequence number::
 
    $ cat /sys/class/pps/pps0/assert
    1170026870.983207967#8
@@ -175,11 +177,11 @@ and the userland tools available in your distribution's pps-tools package,
 http://linuxpps.org , or https://github.com/redlab-i/pps-tools.
 
 Once you have enabled the compilation of pps-ktimer just modprobe it (if
-not statically compiled):
+not statically compiled)::
 
    # modprobe pps-ktimer
 
-and the run ppstest as follow:
+and the run ppstest as follow::
 
    $ ./ppstest /dev/pps1
    trying PPS source "/dev/pps1"
@@ -204,26 +206,27 @@ nor affordable. The cheap way is to load a PPS generator on one of the
 computers (master) and PPS clients on others (slaves), and use very simple
 cables to deliver signals using parallel ports, for example.
 
-Parallel port cable pinout:
-pin	name	master      slave
-1	STROBE	  *------     *
-2	D0	  *     |     *
-3	D1	  *     |     *
-4	D2	  *     |     *
-5	D3	  *     |     *
-6	D4	  *     |     *
-7	D5	  *     |     *
-8	D6	  *     |     *
-9	D7	  *     |     *
-10	ACK	  *     ------*
-11	BUSY	  *           *
-12	PE	  *           *
-13	SEL	  *           *
-14	AUTOFD	  *           *
-15	ERROR	  *           *
-16	INIT	  *           *
-17	SELIN	  *           *
-18-25	GND	  *-----------*
+Parallel port cable pinout::
+
+	pin	name	master      slave
+	1	STROBE	  *------     *
+	2	D0	  *     |     *
+	3	D1	  *     |     *
+	4	D2	  *     |     *
+	5	D3	  *     |     *
+	6	D4	  *     |     *
+	7	D5	  *     |     *
+	8	D6	  *     |     *
+	9	D7	  *     |     *
+	10	ACK	  *     ------*
+	11	BUSY	  *           *
+	12	PE	  *           *
+	13	SEL	  *           *
+	14	AUTOFD	  *           *
+	15	ERROR	  *           *
+	16	INIT	  *           *
+	17	SELIN	  *           *
+	18-25	GND	  *-----------*
 
 Please note that parallel port interrupt occurs only on high->low transition,
 so it is used for PPS assert edge. PPS clear edge can be determined only
diff --git a/MAINTAINERS b/MAINTAINERS
index 5badbf8fa37b..be3d80397956 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12543,7 +12543,7 @@ M:	Rodolfo Giometti <giometti@enneenne.com>
 W:	http://wiki.enneenne.com/index.php/LinuxPPS_support
 L:	linuxpps@ml.enneenne.com (subscribers-only)
 S:	Maintained
-F:	Documentation/pps/
+F:	Documentation/driver-api/pps.rst
 F:	Documentation/devicetree/bindings/pps/pps-gpio.txt
 F:	Documentation/ABI/testing/sysfs-pps
 F:	drivers/pps/
-- 
2.20.1

