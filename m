Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2C55B7D581
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 00:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbeIEEaN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 00:30:13 -0400
Received: from mail-io0-f193.google.com ([209.85.223.193]:44691 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbeIEEaM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 00:30:12 -0400
Received: by mail-io0-f193.google.com with SMTP id 75-v6so4510456iou.11;
        Tue, 04 Sep 2018 17:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7M5GWqeamq1VgnG5EOMnPuqgiB0D8fSS6/42cd9hPpo=;
        b=rKdP8NL95s8D6VPFT9+kJ+hMctHGk0ixIoY/SqejnfWlfWkDNPrILE/EpGfPFw93NB
         eI/Z75KBcOLT1ilLKIz3E8QT4XFbvewAkP/AuiUBr6s/2f374iRIxBq7Cn9w/o+N64+G
         leA9517lOAefpLwtQ8KSNNwwa2OVkjKpfQIl8/anbTuEWzUAwwLTImD3lYaets7dVhPw
         wT5doCCpqwNB3P6zBHlj9Bjmszsd6Lo7XVFRvndFGm5Mmkptsd5rIfaWZ97g6z0wYP9u
         tEqpzqOUSNHnCPcF0YfMjCjooOpKY7w8xoPxue8e2hBnQ9q+2bw73JPU8Sd5RbgD76HF
         Ywcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7M5GWqeamq1VgnG5EOMnPuqgiB0D8fSS6/42cd9hPpo=;
        b=hQAf44/sBwEeFcqiLltAMNFPV/rXLHLLk0Bkh9+zcmi16RiFUBizE5bo7UVmsShmCS
         axf6s8p022rIGW61mrO4iAdOhm5z6Lp4kGZXCyBa5eYYb/zXHjf/Hi0iQ6fVdHUaNBRm
         wHgjr3gDHA7P8hC0JhywwsLZmhI3WjeAx2mNzo1buQQNgKvWy0iqSQ2uH7/Jh1utsqX/
         3PAQ/8AB15p02qno5cFAbfqYGUbzsDcH+/QSi51L8q1j6hXetYY9godgmlltsJ9H4Y9H
         ACz5pX5+sMnPSkrK0QFW9yTI0mSC1sB7ALfEL+zC9EJaOkZ3XIp5zvEpsCfIA9o3Qv2j
         ATrA==
X-Gm-Message-State: APzg51DTQ8o573yiInbUSdp0bVI+caC2QBlJ3HjTgqFNqmPhCrZuyF5d
        p/FFaAO3JG5Yb2B/T8tVtFM=
X-Google-Smtp-Source: ANB0Vdaf2bTHwMlNCJYd3Kw5p3wNHVoAKa9YLSYHEfYt67uHvkoKbMfina8ZQcKPneQeir8clkDzbg==
X-Received: by 2002:a6b:25d2:: with SMTP id l201-v6mr23897869iol.115.1536105764619;
        Tue, 04 Sep 2018 17:02:44 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id m13-v6sm285687itm.40.2018.09.04.17.02.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 04 Sep 2018 17:02:43 -0700 (PDT)
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
Subject: [PATCH v4 5/5] FireWire: add driver-api Introduction section
Date:   Tue,  4 Sep 2018 17:02:25 -0700
Message-Id: <20180905000225.10733-6-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.7
In-Reply-To: <20180905000225.10733-1-rd.dunlab@gmail.com>
References: <20180905000225.10733-1-rd.dunlab@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Replace the Introduction section's TBD with some useful overview text.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
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
 Documentation/driver-api/firewire.rst |   17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

--- linux-next-20180904.orig/Documentation/driver-api/firewire.rst
+++ linux-next-20180904/Documentation/driver-api/firewire.rst
@@ -5,17 +5,32 @@ Firewire (IEEE 1394) driver Interface Gu
 Introduction and Overview
 =========================
 
-TBD
+The Linux FireWire subsystem adds some interfaces into the Linux system to
+ use/maintain+any resource on IEEE 1394 bus.
+
+The main purpose of these interfaces is to access address space on each node
+on IEEE 1394 bus by ISO/IEC 13213 (IEEE 1212) procedure, and to control
+isochronous resources on the bus by IEEE 1394 procedure.
+
+Two types of interfaces are added, according to consumers of the interface. A
+set of userspace interfaces is available via `firewire character devices`. A set
+of kernel interfaces is available via exported symbols in `firewire-core` module.
 
 Firewire char device data structures
 ====================================
 
+.. include:: /ABI/stable/firewire-cdev
+    :literal:
+
 .. kernel-doc:: include/uapi/linux/firewire-cdev.h
     :internal:
 
 Firewire device probing and sysfs interfaces
 ============================================
 
+.. include:: /ABI/stable/sysfs-bus-firewire
+    :literal:
+
 .. kernel-doc:: drivers/firewire/core-device.c
     :export:
 
