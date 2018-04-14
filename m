Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A04297E22E
	for <lwn-linux-doc@archive.lwn.net>; Sat, 14 Apr 2018 17:51:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751355AbeDNRve (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 14 Apr 2018 13:51:34 -0400
Received: from mail-pf0-f193.google.com ([209.85.192.193]:42959 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751257AbeDNRv3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 14 Apr 2018 13:51:29 -0400
Received: by mail-pf0-f193.google.com with SMTP id o16so8512585pfk.9;
        Sat, 14 Apr 2018 10:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=z8NMIOVoQH9Ytjk7aHBMmnvfrNjy26FkWGFMwUFFiko=;
        b=MuS9OUH+W8rDgRu/2PtFriOtibkBmlDKzosqMC0e13ClAfLnA2NrV4xrOA7oenXrlK
         7qEtLYAUPeDUaeDJImyR4e8X1DcPiF539SFztwoV1U8TAOb/+ZE0/ee8pOFLUuGtejI0
         IXW78YXu+B13aMGGvS/U6aDkhFCwyL5prpxQEHc15+lfTFWWPCPYiF6L3MgebDbEg59H
         6isT6x8a6YHWeMxulGLeAkF1XgZIxBPW3G4/RbVYwKPk7+YMNX90p5pvzQ6tFkbXHL0v
         UpGv//jKb+VyI+WNoBvbXfhQkuyJUTZgx0vctYOTD/gZmRXpnF6TtebKkTd6HFZpP9e5
         HJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=z8NMIOVoQH9Ytjk7aHBMmnvfrNjy26FkWGFMwUFFiko=;
        b=IjfHm4/onHn8wEPGxhMTX1pdSeT4G47EN4xkrtkIE4PFd7AQcg7j9NgnKJQ98LRKU/
         09kfSWzxV0GN1TBgdpAjNKtZCcC8k2tL+0J9DWadr1eEJPzLKH4ONnS/9WmSw/aPoawr
         lpctsKNPktNxzKgAgYnFjIaTbR6sMFDZoCguX74+He+/xnzVMeDv4fbWHh6kAwjADb3+
         kbusvtsyPnX+0qtGD35w7DehohE8QWhn4+jhm9ZqtVpssTPzXFKSxXprTLG5A8xAQAqa
         wauiMnaiMXbDCAs3U/qRLEVhmz8v9BHKr2hd8kB3mDQwuzQueD8rHa50buXg38Ida1jK
         Yr5A==
X-Gm-Message-State: ALQs6tBqA3J+YZr+gi+BB+L8E55ejsCxtWXmKHqP4ZsoKUT2Cc+UTQ15
        p0t1NKvo10tfYP91w52HbsI=
X-Google-Smtp-Source: AIpwx49WUBq8mwjXbd/Te8B5cIgMpPup/yhPSs014kOksBw3ylqhP8UjB89Moqh570Ln7HbyN6sUZg==
X-Received: by 10.98.137.218 with SMTP id n87mr15930737pfk.48.1523728289315;
        Sat, 14 Apr 2018 10:51:29 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id j3sm17232638pfj.60.2018.04.14.10.51.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 14 Apr 2018 10:51:28 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-scsi@vger.kernel.org,
        target-devel@vger.kernel.org, linux-doc@vger.kernel.org,
        "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 4/4] target: add driver-api document
Date:   Sat, 14 Apr 2018 10:51:06 -0700
Message-Id: <20180414175106.13760-5-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180414175106.13760-1-rd.dunlab@gmail.com>
References: <20180414175106.13760-1-rd.dunlab@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Add a driver-api document for target/iSCSI interfaces.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-scsi@vger.kernel.org
Cc: target-devel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/driver-api/index.rst  |    1 
 Documentation/driver-api/scsi.rst   |    2 
 Documentation/driver-api/target.rst |   64 ++++++++++++++++++++++++++
 3 files changed, 66 insertions(+), 1 deletion(-)

--- linux-next-20180413.orig/Documentation/driver-api/index.rst
+++ linux-next-20180413/Documentation/driver-api/index.rst
@@ -34,6 +34,7 @@ available subsections can be seen below.
    edac
    scsi
    libata
+   target
    mtdnand
    miscellaneous
    w1
--- linux-next-20180413.orig/Documentation/driver-api/scsi.rst
+++ linux-next-20180413/Documentation/driver-api/scsi.rst
@@ -334,5 +334,5 @@ todo
 ~~~~
 
 Parallel (fast/wide/ultra) SCSI, USB, SATA, SAS, Fibre Channel,
-FireWire, ATAPI devices, Infiniband, I2O, iSCSI, Parallel ports,
+FireWire, ATAPI devices, Infiniband, I2O, Parallel ports,
 netlink...
--- /dev/null
+++ linux-next-20180413/Documentation/driver-api/target.rst
@@ -0,0 +1,64 @@
+=================================
+target and iSCSI Interfaces Guide
+=================================
+
+Introduction and Overview
+=========================
+
+TBD
+
+Target core device interfaces
+=============================
+
+.. kernel-doc:: drivers/target/target_core_device.c
+    :export:
+
+Target core transport interfaces
+================================
+
+.. kernel-doc:: drivers/target/target_core_transport.c
+    :export:
+
+Target-supported userspace I/O
+==============================
+
+.. kernel-doc:: drivers/target/target_core_user.c
+    :doc: Userspace I/O
+
+.. kernel-doc:: include/uapi/linux/target_core_user.h
+    :doc: Ring Design
+
+iSCSI helper functions
+======================
+
+.. kernel-doc:: drivers/scsi/libiscsi.c
+   :export:
+
+
+iSCSI boot information
+======================
+
+.. kernel-doc:: drivers/scsi/iscsi_boot_sysfs.c
+   :export:
+
+
+iSCSI transport class
+=====================
+
+The file drivers/scsi/scsi_transport_iscsi.c defines transport
+attributes for the iSCSI class, which sends SCSI packets over TCP/IP
+connections.
+
+.. kernel-doc:: drivers/scsi/scsi_transport_iscsi.c
+   :export:
+
+
+iSCSI TCP interfaces
+====================
+
+.. kernel-doc:: drivers/scsi/iscsi_tcp.c
+   :internal:
+
+.. kernel-doc:: drivers/scsi/libiscsi_tcp.c
+   :export:
+
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
