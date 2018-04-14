Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 68B957E22E
	for <lwn-linux-doc@archive.lwn.net>; Sat, 14 Apr 2018 17:51:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751347AbeDNRvc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 14 Apr 2018 13:51:32 -0400
Received: from mail-pf0-f193.google.com ([209.85.192.193]:35742 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751246AbeDNRv2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 14 Apr 2018 13:51:28 -0400
Received: by mail-pf0-f193.google.com with SMTP id u86so8530790pfd.2;
        Sat, 14 Apr 2018 10:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HC1/mbSgFMiCVG/T5XqpqOwZvWv84wbAlG12UX96Az0=;
        b=Wl8CgjPPVG69tc6x6FDhG7RNu8NuiPdsKrU2OY6183QI30VMP3UNHxuLa9NtxrVnHO
         LNbWKoRrEyubQkHRGW39qUOzs6Vf+dkUEfQkqG7uOz4Eu11INBQTbd0OggAP5P2yUn93
         tK7W/0EJtGiPQMRCEgbREef0gLTJVgF5xszNAvrUGozsyIK34TQq37Q22SCgQwXOSIJI
         xadeV0zC9t3g2mq+m7Y08/RCgxSLG25Y3i8KMqA+RNWYDH5lZoWed/VGUM0DM6VcnNmv
         rp1+RbmcFe1I8jngyGopLwhJnZe/Hs3VJzG5meORccZbUUPYHyevtBvv83CJS+WESJCo
         svlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HC1/mbSgFMiCVG/T5XqpqOwZvWv84wbAlG12UX96Az0=;
        b=X0W9uNQOymosbUCe35RAVKK7qTfePbAfyRyKJ2gLE0ib6UwwljQmhvWhgKbUPH7IP0
         somSk0wwXqvWSBMakSE/Wf0gIjVRXBPomxCHxCt9QNiJGXetcx0csZvjqpEMycw5zBDr
         1+dnhhF1a9ltvTSjQoBgTj0AMukRnbASRqjCdzi21xDEwvpee2++3Oq54Sy9DW2S6gkp
         Sabk6orVSEdsVqzqIMLPSAeaQekCPgXRsxNmXIEJvmgbyDPistZJdrLK64shpEDEn3ob
         KNWC7HMx6Ph7b3mx6MAwpdIMpMokzmkcSJullmx7/DFVu8n0x35mGEjp8R4G9o71XMzD
         deBg==
X-Gm-Message-State: ALQs6tD6aJySjAlR5PlsSPajrHCIlwqIk90IK9zX/GYH3HLPNJoI0M7q
        Pk2VUtCD3d+xwu9WQBM2QqQ=
X-Google-Smtp-Source: AIpwx49sMMVk9xW/86FVNJq6OQJnc3AnW1O1Xz85bxeF3F4/G+XM6yvtzG9oZoysm7LMNvn1FAtKxg==
X-Received: by 10.98.72.74 with SMTP id v71mr15681391pfa.241.1523728287785;
        Sat, 14 Apr 2018 10:51:27 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id j3sm17232638pfj.60.2018.04.14.10.51.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 14 Apr 2018 10:51:26 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-scsi@vger.kernel.org,
        target-devel@vger.kernel.org, linux-doc@vger.kernel.org,
        "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 3/4] target: target_core_user.[ch]: convert comments into DOC:
Date:   Sat, 14 Apr 2018 10:51:05 -0700
Message-Id: <20180414175106.13760-4-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180414175106.13760-1-rd.dunlab@gmail.com>
References: <20180414175106.13760-1-rd.dunlab@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Make documentation on target-supported userspace-I/O design be
usable by kernel-doc by using "DOC:". This is used in the driver-api
Documentation chapter.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-scsi@vger.kernel.org
Cc: target-devel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 drivers/target/target_core_user.c     |    8 ++++++--
 include/uapi/linux/target_core_user.h |   11 ++++++-----
 2 files changed, 12 insertions(+), 7 deletions(-)

--- linux-next-20180413.orig/drivers/target/target_core_user.c
+++ linux-next-20180413/drivers/target/target_core_user.c
@@ -42,7 +42,11 @@
 
 #include <linux/target_core_user.h>
 
-/*
+/**
+ * DOC: Userspace I/O
+ * Userspace I/O
+ * -------------
+ *
  * Define a shared-memory interface for LIO to pass SCSI commands and
  * data to userspace for processing. This is to allow backends that
  * are too complex for in-kernel support to be possible.
@@ -53,7 +57,7 @@
  * See the .h file for how the ring is laid out. Note that while the
  * command ring is defined, the particulars of the data area are
  * not. Offset values in the command entry point to other locations
- * internal to the mmap()ed area. There is separate space outside the
+ * internal to the mmap-ed area. There is separate space outside the
  * command ring for data buffers. This leaves maximum flexibility for
  * moving buffer allocations, or even page flipping or other
  * allocation techniques, without altering the command ring layout.
--- linux-next-20180413.orig/include/uapi/linux/target_core_user.h
+++ linux-next-20180413/include/uapi/linux/target_core_user.h
@@ -9,21 +9,22 @@
 
 #define TCMU_VERSION "2.0"
 
-/*
+/**
+ * DOC: Ring Design
  * Ring Design
  * -----------
  *
  * The mmaped area is divided into three parts:
- * 1) The mailbox (struct tcmu_mailbox, below)
- * 2) The command ring
- * 3) Everything beyond the command ring (data)
+ * 1) The mailbox (struct tcmu_mailbox, below);
+ * 2) The command ring;
+ * 3) Everything beyond the command ring (data).
  *
  * The mailbox tells userspace the offset of the command ring from the
  * start of the shared memory region, and how big the command ring is.
  *
  * The kernel passes SCSI commands to userspace by putting a struct
  * tcmu_cmd_entry in the ring, updating mailbox->cmd_head, and poking
- * userspace via uio's interrupt mechanism.
+ * userspace via UIO's interrupt mechanism.
  *
  * tcmu_cmd_entry contains a header. If the header type is PAD,
  * userspace should skip hdr->length bytes (mod cmdr_size) to find the
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
