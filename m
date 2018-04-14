Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5A0237DE78
	for <lwn-linux-doc@archive.lwn.net>; Sat, 14 Apr 2018 01:27:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751133AbeDNB1u (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 21:27:50 -0400
Received: from mail-it0-f66.google.com ([209.85.214.66]:33075 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750904AbeDNB1u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 21:27:50 -0400
Received: by mail-it0-f66.google.com with SMTP id x144-v6so6713358itc.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 18:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nOL1+5+jAHoxVYy12MDdVEcZzaXRKwYFBuWIpZggL34=;
        b=PU0RLAWgksM2kGmF3gT8SvZLyM2YbPhFh+7uLTnZ18frQUvat+PW8DiFxsLQX0LNxu
         BQrkwsjx9A1EB9sGETNykz2Nq3xAeLRZR3x0SArmMARS5o7/AP4QYQ8xqh7nyQYltMLN
         ujoRufCZInDvSrglpJrUAWJVLTEfca3RV0N7snZXklU/qgXgARWYyp6icRB8wP+WwJCw
         +uzpUd8Lt5SxVVI5wZAMBpUsFdTC2q5EEdwI5sAgmCt1c7mHcEkpU7RuxtC5GVIHOsS8
         RNfx6/7kOTsHbMaHie5nKG4i+oNhxX7zv+2abX09ts/XLodxIUTy3frsN7DsFFNLLCm6
         5vHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nOL1+5+jAHoxVYy12MDdVEcZzaXRKwYFBuWIpZggL34=;
        b=G4381W1BVs2SvPjmmAhqVjUh6GxgGAlDZxCNaJgi12TgA3Jaj5TOqq+o214nGpCyIg
         TZ7Dg/O7IXCTcz2/ZuDQX76MYz8XE531DVp1vN2N1S65lz22xX45WJcqRQ1PNMiHPkLF
         EV5Jf/9di23oBNr0xg4/d17UgJrv0r/ra/Zownk4ykzU+QyEusx3r9fSubCYsRvByxcD
         uvjfwC14iRs47ZGwwfyle2eGjsXvCHTbjniYkGEA7VtudiEqpOvGuX6zLY/UTcXeskcK
         nw341lMfzHZ1bERCCSkdc4aLamr8qQ4wDPxWsa/88NDxb7i4Q/XIwhUTzqnzuDZ4V8ul
         4PWA==
X-Gm-Message-State: ALQs6tB/aNmHZkGVbyQDTjHrHhaFW7sDKIPCIUx2AN4c+o5GeAorV03H
        cS/weg4wOxKD/nsHXHxzxifSIQ==
X-Google-Smtp-Source: AIpwx48iivnwV8a15vc+NzPAZUpE4EromUjjtqBCYwiDmZYhwkkArVJFfAdw18lDn+4sIT2GGRmF9w==
X-Received: by 2002:a24:610c:: with SMTP id s12-v6mr8226207itc.102.1523669269859;
        Fri, 13 Apr 2018 18:27:49 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id g16-v6sm271257ita.0.2018.04.13.18.27.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 18:27:48 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     linux1394-devel@lists.sourceforge.net
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 4/5] FireWire: add a Documentation driver-api chapter
Date:   Fri, 13 Apr 2018 18:27:21 -0700
Message-Id: <20180414012722.17420-5-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180414012722.17420-1-rd.dunlab@gmail.com>
References: <20180414012722.17420-1-rd.dunlab@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Add a basic Firewire/IEEE 1394 driver API chapter to the Linux
kernel documentation.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
To: linux1394-devel@lists.sourceforge.net
Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
---

v2: drop final blank line;
    in Cc:, change tab to space;

 Documentation/driver-api/firewire.rst |   32 ++++++++++++++++++++++++
 Documentation/driver-api/index.rst    |    1 
 2 files changed, 33 insertions(+)

--- /dev/null
+++ linux-next-20180413/Documentation/driver-api/firewire.rst
@@ -0,0 +1,32 @@
+===========================================
+Firewire (IEEE 1394) driver Interface Guide
+===========================================
+
+Introduction and Overview
+=========================
+
+TBD
+
+Firewire char device data structures
+====================================
+
+.. kernel-doc:: include/uapi/linux/firewire-cdev.h
+    :internal:
+
+Firewire device probing and sysfs interfaces
+============================================
+
+.. kernel-doc:: drivers/firewire/core-device.c
+    :export:
+
+Firewire core transaction interfaces
+====================================
+
+.. kernel-doc:: drivers/firewire/core-transaction.c
+    :export:
+
+Firewire Isochronous I/O interfaces
+===================================
+
+.. kernel-doc:: drivers/firewire/core-iso.c
+   :export:
--- linux-next-20180413.orig/Documentation/driver-api/index.rst
+++ linux-next-20180413/Documentation/driver-api/index.rst
@@ -27,6 +27,7 @@ available subsections can be seen below.
    iio/index
    input
    usb/index
+   firewire
    pci
    spi
    i2c
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
