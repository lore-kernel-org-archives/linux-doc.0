Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560ADC0015E
	for <linux-doc@archiver.kernel.org>; Wed, 26 Jul 2023 15:22:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234492AbjGZPWp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Jul 2023 11:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233974AbjGZPWm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jul 2023 11:22:42 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D3B1BFA
        for <linux-doc@vger.kernel.org>; Wed, 26 Jul 2023 08:22:40 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-307d20548adso5462354f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Jul 2023 08:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690384959; x=1690989759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xiyxJQtngIitM6NvDkSmtJp7dkYh2m7KhsJ3ZxlyPB8=;
        b=pHxhaa21ySaf/Q0o5VjvoZfUVtqSmxNF4ePZCZmuGxVj0og38x9F6VbWo41eaRBbqt
         JcXRT9vpP/Rd6UNAFG1iq6Fdqa+L4N/0n2uSyPAlu0rJnQZFkFwR9HF5rg6xrC+YxMs9
         jUBQa5ZCVQUwECT6kyV37bwh0EexSgz2SmcLdu8TwLep1qhqafMXz9pmipYc8Pt3p8yy
         FbM/3ESOxbO3X0jM2FeYcvpj+JHMjZAPxPLghDQlkP164edn2HqasQrz3WW/DSlmAhmf
         TN5eMZKmHpYfkC6/1GMDu0c0mZVPw1Vg2pFb89aTmbo3nXmrIdjt0ct7jigRI+eS6pkG
         kHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690384959; x=1690989759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiyxJQtngIitM6NvDkSmtJp7dkYh2m7KhsJ3ZxlyPB8=;
        b=K18du2L6JnVQNeWRmJ47aXLBBZknsb8D4770KrDys/BlXN7G648sj8HRLxsABd8yeg
         d0fjSu0M+5MYYHWwOUrc8prnPg2MW+CRCRL4SroaNjkNs2m6Hs5QHm2PvZmaLldl1Mre
         U5Y6lXAYuMHPrbJ+yDn4o1SY8Z6rFeptWhrgd9VDd6rW/VA6G24sRL7oHFk3ThKCYzAm
         mLivmvoGeJ+ZpTUfrTfzHNas6N+ETKJyfL5ibamELGlFm8LBkrNvzBdv730JhxQO17so
         1cbriN10PNnsvKELCSn3etFRYDAgEyRZ8adh054FoewxmdayvfAVJpx4WoeBSk0gQWAC
         g7Ag==
X-Gm-Message-State: ABy/qLah8LdI0AarbHwEH17UlnIBsTY1qZ8RqBjVinbJrPAJwID1mFYH
        4T+ZGVtoFvyeQWoIdGwXm7+4Hg==
X-Google-Smtp-Source: APBJJlFTczgdZQtyu7bi9shz49TW2vyCAL6upXqlApA4QBDQkCprWnQsZplxHs2jnpf5ONSNsPn7rw==
X-Received: by 2002:adf:f452:0:b0:317:6623:e33f with SMTP id f18-20020adff452000000b003176623e33fmr1955488wrp.14.1690384958593;
        Wed, 26 Jul 2023 08:22:38 -0700 (PDT)
Received: from loic-ThinkPad-T470p.. ([2a01:e0a:82c:5f0:8c06:4c96:5858:e8ab])
        by smtp.gmail.com with ESMTPSA id k8-20020a5d4288000000b003176a4394d7sm6356032wrq.24.2023.07.26.08.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 08:22:38 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     brauner@kernel.org, viro@zeniv.linux.org.uk, corbet@lwn.net
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, hch@infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] init: Add support for rootwait timeout parameter
Date:   Wed, 26 Jul 2023 17:22:32 +0200
Message-Id: <20230726152232.932288-1-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add an optional timeout arg to 'rootwait' as the maximum time in
seconds to wait for the root device to show up before attempting
forced mount of the root filesystem.

Use case:
In case of device mapper usage for the rootfs (e.g. root=/dev/dm-0),
if the mapper is not able to create the virtual block for any reason
(wrong arguments, bad dm-verity signature, etc), the `rootwait` param
causes the kernel to wait forever. It may however be desirable to only
wait for a given time and then panic (force mount) to cause device reset.
This gives the bootloader a chance to detect the problem and to take some
measures, such as marking the booted partition as bad (for A/B case) or
entering a recovery mode.

In success case, mounting happens as soon as the root device is ready,
unlike the existing 'rootdelay' parameter which performs an unconditional
pause.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: rebase + reword: add use case example

 .../admin-guide/kernel-parameters.txt         |  4 ++++
 init/do_mounts.c                              | 19 +++++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a1457995fd41..387cf9c2a2c5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5501,6 +5501,10 @@
 			Useful for devices that are detected asynchronously
 			(e.g. USB and MMC devices).
 
+	rootwait=	[KNL] Maximum time (in seconds) to wait for root device
+			to show up before attempting to mount the root
+			filesystem.
+
 	rproc_mem=nn[KMG][@address]
 			[KNL,ARM,CMA] Remoteproc physical memory block.
 			Memory area to be used by remote processor image,
diff --git a/init/do_mounts.c b/init/do_mounts.c
index 1aa015883519..118f2bbe7b38 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -18,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/ramfs.h>
 #include <linux/shmem_fs.h>
+#include <linux/ktime.h>
 
 #include <linux/nfs_fs.h>
 #include <linux/nfs_fs_sb.h>
@@ -71,12 +72,20 @@ static int __init rootwait_setup(char *str)
 {
 	if (*str)
 		return 0;
-	root_wait = 1;
+	root_wait = -1;
 	return 1;
 }
 
 __setup("rootwait", rootwait_setup);
 
+static int __init rootwait_timeout_setup(char *str)
+{
+	root_wait = simple_strtoul(str, NULL, 0);
+	return 1;
+}
+
+__setup("rootwait=", rootwait_timeout_setup);
+
 static char * __initdata root_mount_data;
 static int __init root_data_setup(char *str)
 {
@@ -384,14 +393,20 @@ void __init mount_root(char *root_device_name)
 /* wait for any asynchronous scanning to complete */
 static void __init wait_for_root(char *root_device_name)
 {
+	const ktime_t end = ktime_add_ms(ktime_get_raw(), root_wait * MSEC_PER_SEC);
+
 	if (ROOT_DEV != 0)
 		return;
 
 	pr_info("Waiting for root device %s...\n", root_device_name);
 
 	while (!driver_probe_done() ||
-	       early_lookup_bdev(root_device_name, &ROOT_DEV) < 0)
+	       early_lookup_bdev(root_device_name, &ROOT_DEV) < 0) {
 		msleep(5);
+		if (root_wait > 0 && ktime_after(ktime_get_raw(), end))
+			break;
+	}
+
 	async_synchronize_full();
 
 }
-- 
2.34.1

