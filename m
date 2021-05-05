Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1476DC43460
	for <linux-doc@archiver.kernel.org>; Wed,  5 May 2021 12:10:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2D2A6139A
	for <linux-doc@archiver.kernel.org>; Wed,  5 May 2021 12:10:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbhEEMLZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 May 2021 08:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233650AbhEEMKJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 May 2021 08:10:09 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029D4C06137C
        for <linux-doc@vger.kernel.org>; Wed,  5 May 2021 05:08:11 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id b3so972609plg.11
        for <linux-doc@vger.kernel.org>; Wed, 05 May 2021 05:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E/l5PYpsuyoULbb5Y0KN2TZxQ7IWOqPBaysmrn6lojw=;
        b=TRx29EBQOGEDroSFz0NTKkFaosOyiENiZ7R8tLhWwuVcbbDZi1ZgB5keqMy2cNHLzU
         9f5gk9pmqWigYBTo7YiS8/d5b3CoEpBQDRqPTdPnRUgOevlBBrzWf7UN8l0oBbYLvhha
         2RUopSckTc4fdN3Jk1DKQRv2xOZtEEO/nlzs4V3+uHjYNSw2F+hXjnCGNVf45rabzUZK
         w6Lg5rzKjMLoo6HMhSaQy5KwPoIr1YVBoSIsPWw/rsAE14xt48DNcIoivSPO/KIgujzH
         xV/Q96DMyiGMBrM3bVp5zOojwzjTIDBzesu5zviiAlFPPNXvhoG/I9Nd0gMcFRq4urR3
         4vwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E/l5PYpsuyoULbb5Y0KN2TZxQ7IWOqPBaysmrn6lojw=;
        b=jeFr9lcSWDWKC5MV2I9OKh9M18mDrAcsgw3Zmk6mLg/moPByoiGEzBhWiCWnqL0/ea
         vy3+D4MFcAzeggsM+fyOUcKs4A+oR2G0T2o4OjndsHylFf47JAfobAWuywHDhSLy5plj
         cBXRGUpI994yGPFCzjuDJBrprqDLF6QbUqYuGwEik8+gmc3Q/kDQHpltMSWAiLjghDdu
         HuGWc9H+tbwxDIlLGEc7jhB2DZyov8HQ8frz/EL/pPlc/KI+2rd4N1zkFGeWKVwWno61
         0cABAti7MSQirPQ51uiRzG+HxqtUh4Mc3Eq8gkMWuqCRP0G/wLO6sITMkXTbXLM9AJyC
         VAsQ==
X-Gm-Message-State: AOAM530dnGV3YT8d/9OIrJnO9lz1zcQsKeOUCMN9LafL2Qx+SLkSmenf
        xSXg2Ni2B9Jm45afnQbQJP4=
X-Google-Smtp-Source: ABdhPJzXdkqYbo3UMRUtjVmZWqc38LQ86MyQTk7CcS7wn0BVnh/KZxxQV5qKtEcVwFJen5cwuWoOJw==
X-Received: by 2002:a17:90a:dc0a:: with SMTP id i10mr33230947pjv.172.1620216490526;
        Wed, 05 May 2021 05:08:10 -0700 (PDT)
Received: from WRT-WX9.. ([141.164.41.4])
        by smtp.gmail.com with ESMTPSA id j7sm14177959pfc.164.2021.05.05.05.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 05:08:10 -0700 (PDT)
From:   Changbin Du <changbin.du@gmail.com>
To:     Eric Van Hensbergen <ericvh@gmail.com>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 3/3] 9p: doc: add v9fsroot description
Date:   Wed,  5 May 2021 20:07:48 +0800
Message-Id: <20210505120748.8622-4-changbin.du@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505120748.8622-1-changbin.du@gmail.com>
References: <20210505120748.8622-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This documentation is modified from cifs/cifsroot.rst.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 Documentation/filesystems/v9fs/index.rst    |  1 +
 Documentation/filesystems/v9fs/v9fsroot.rst | 52 +++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 Documentation/filesystems/v9fs/v9fsroot.rst

diff --git a/Documentation/filesystems/v9fs/index.rst b/Documentation/filesystems/v9fs/index.rst
index a1e45b89e2a2..65e1ceb04c9c 100644
--- a/Documentation/filesystems/v9fs/index.rst
+++ b/Documentation/filesystems/v9fs/index.rst
@@ -9,3 +9,4 @@ v9fs
    :numbered:
 
    9p
+   v9fsroot
diff --git a/Documentation/filesystems/v9fs/v9fsroot.rst b/Documentation/filesystems/v9fs/v9fsroot.rst
new file mode 100644
index 000000000000..ce6b3c85e301
--- /dev/null
+++ b/Documentation/filesystems/v9fs/v9fsroot.rst
@@ -0,0 +1,52 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================================
+Mounting root file system via v9fs (9p.ko)
+==========================================
+
+:Author: Changbin Du <changbin.du@gmail.com>
+
+The CONFIG_9P_FS_ROOT option enables experimental root file system
+support for v9fs.
+
+It introduces a new kernel command-line option called 'v9fsroot='
+which will tell the kernel to mount the root file system by
+utilizing the 9p protocol.
+
+
+Kernel command line
+===================
+
+::
+
+    root=/dev/v9fs
+
+This is just a virtual device that basically tells the kernel to mount
+the root file system via 9p protocol.
+
+::
+
+    v9fsroot=<path>[,options]
+
+Enables the kernel to mount the root file system via 9p specified in this
+option.
+
+path
+	Could be a remote file server, Plan 9 From User Space applications
+	or mount tag of virtio transport.
+
+options
+	Optional mount options.
+
+Examples
+========
+Test it under QEMU on a kernel built with CONFIG_9P_FS_ROOT and
+CONFIG_IP_PNP options enabled::
+
+    # qemu-system-x86_64 -enable-kvm -cpu host -m 1024 \
+    -virtfs local,path=$rootfs_dir,mount_tag=r,security_model=passthrough,id=r \
+    -kernel /path/to/linux/arch/x86/boot/bzImage -nographic \
+    -append "root=/dev/v9fs v9fsroot=r,trans=virtio rw console=ttyS0 3"
+
+The above example mounts v9fs with tag 'r' as rootfs in qemu guest via
+virtio transport.
-- 
2.30.2

