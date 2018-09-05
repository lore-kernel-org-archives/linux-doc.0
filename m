Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CA3747D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 00:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbeIEEaK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 00:30:10 -0400
Received: from mail-it0-f67.google.com ([209.85.214.67]:39439 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbeIEEaK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 00:30:10 -0400
Received: by mail-it0-f67.google.com with SMTP id h1-v6so7195066itj.4;
        Tue, 04 Sep 2018 17:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RtAM8uXb5vNXEITNb25UkvGAdAHHQPFu4G6FF85gd+A=;
        b=B0Hu0f2RROFviwiZ5Kox5VtsxBUOe/vB/QH9QLp9Y1rvd6OZ5S+GbuKZ/v1PVSESMX
         UmyshwmKxaL5cdcfq1UamAhEmb/sNXm+V9OtW9aT5AEfmMoLMeoRgM6/S9IpxyREGved
         5CCOabftcOHM3DOyAJqPZ8/565dduZG1xxx6Z3+cjn1kuyf9/Q0K25MZmLSTEWz/p+V1
         ZXWfsG35DO0oZoM+IBqXM7KcJ8P6yTYaKt8A8xt7fo1LemvsWa++h/on9Mg8ZZIjDMUX
         KlH7X45X3ebwPRttRrfLbPOiibt1K+20EFgl+S4ThkD+VknBLx+3qQuGgD7GQJkyu79T
         b/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RtAM8uXb5vNXEITNb25UkvGAdAHHQPFu4G6FF85gd+A=;
        b=FclYDctYFnjcdmzJXHc+koKCor8K/bO8DyyJuzWTtIcdrPzhFeqCkum42QRaDmhA0Q
         UULJqby3IH8jchwaH6I9NfjcLNPc66l1f+lB/iHajrkRQSEV73FsEjbr0Hl297EJcQuM
         AQIoG0njQ40xAMK3zaVFwcfIPDTZ1frowixFO0XWIt+ZiNNY4H3QAzEP4svj/gFwr8wQ
         clFDfjQLEaEjHh6G+oVcl+/k8+jooOUDvVLIILjeHqUVs4xpndTxzNhMPxWmIiWOC1cX
         tMKmrnyZhkJ+B7kiK20BljEQ76qsg3jkvWG4azY8rnQkgs7BrtFf6sOS4drod1D/D0sD
         QqUw==
X-Gm-Message-State: APzg51BOKuxQ2dxX42wJDOmr24/ey4e8aJS83y2ucjUSouG07ftex62v
        GlRZ5MvEYwX2i1/son6MpBc=
X-Google-Smtp-Source: ANB0VdbTkNL95h8KTvgmKkfUNxSM8x3P0WhQFxTyAHqhKHypaNfUtg3bwjflxan8/QDEvi2F7IsUag==
X-Received: by 2002:a24:43d0:: with SMTP id s199-v6mr2046480itb.28.1536105762252;
        Tue, 04 Sep 2018 17:02:42 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id m13-v6sm285687itm.40.2018.09.04.17.02.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 04 Sep 2018 17:02:41 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     linux1394-devel@lists.sourceforge.net
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        linux-doc@vger.kernel.org, linux-scsi@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v4 4/5] FireWire: add a Documentation driver-api chapter
Date:   Tue,  4 Sep 2018 17:02:24 -0700
Message-Id: <20180905000225.10733-5-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.7
In-Reply-To: <20180905000225.10733-1-rd.dunlab@gmail.com>
References: <20180905000225.10733-1-rd.dunlab@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Add a basic Firewire/IEEE 1394 driver API chapter to the Linux
kernel documentation.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux-doc@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/driver-api/firewire.rst |   33 ++++++++++++++++++++++++
 Documentation/driver-api/index.rst    |    1 
 2 files changed, 34 insertions(+)

--- /dev/null
+++ linux-next-20180904/Documentation/driver-api/firewire.rst
@@ -0,0 +1,33 @@
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
+
--- linux-next-20180904.orig/Documentation/driver-api/index.rst
+++ linux-next-20180904/Documentation/driver-api/index.rst
@@ -29,6 +29,7 @@ available subsections can be seen below.
    iio/index
    input
    usb/index
+   firewire
    pci
    spi
    i2c
