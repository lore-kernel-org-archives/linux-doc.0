Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C685AC0015E
	for <linux-doc@archiver.kernel.org>; Sun,  6 Aug 2023 10:12:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbjHFKM0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 6 Aug 2023 06:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjHFKMY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Aug 2023 06:12:24 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311F1131
        for <linux-doc@vger.kernel.org>; Sun,  6 Aug 2023 03:12:23 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fe426b86a8so27571985e9.3
        for <linux-doc@vger.kernel.org>; Sun, 06 Aug 2023 03:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691316741; x=1691921541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stuJqaNoc8+CyrTaBzMymqInJJyNxuySrxbp3ccLMSM=;
        b=BvUibkjXpSn53ss6d2zWo3GHot1opOycwPZLmgg5RX03G6KJzC2uUYMo7Ej1fmktPN
         n1TE2pKhI+mHYJfzop9rxOhvuDM81/U6vmE74ewiMKl4X4FSfQQvHEqlqh7fcZ/L2r03
         scb0mhJCHjZcxPW4ammn5glclltGIvkWPapubBJM+ds7HjObw6hRGkM3+ggBs8XG6q0+
         PU9DnBiea1oKKox9Bnv/vj7cY78J3oljrMclWguKcWyoJ/8znocnA20Wt4StxGjiyzJD
         +/I3T+OIJTtL+u3qaY0bBofAHKSmP5yohxv+ffm4YZOKDzwEuhBmVakVqfrFZkZfF7MY
         MhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691316741; x=1691921541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stuJqaNoc8+CyrTaBzMymqInJJyNxuySrxbp3ccLMSM=;
        b=HDQw0z403vgHndkAtSaAZNAhT3mtb9yRJbv2uh1XKzjQbfb87TZvxU0Y3oJY6+Cjlv
         Gu2RFQGy3a7HMQvhPqCcG242sTx7uN21p483TJUhF+O9zLny7H9kKn4kPWwsnKvuuiX7
         uBq6UEBja5TZaX9fC3Ygpb9JYdkPIRc41+7uhouJOcAsY4wDEydjWUQqCGJV4GAqGzOT
         biwLUTh6msk5n3I2KNN7gceomgwMUIX4jz2XXB/G5sbPjEG21ll8znCXfe2yMe4WS+uw
         q+j5DeH38fBlGKz0+N5FBpPhcevU1SixAL8M8iTGQuBEySTVYcnuq6ITdOEt86PspXoY
         MqWg==
X-Gm-Message-State: AOJu0Yz63g4WkHO3MtN7dDUMa7YDiZb2ig0PSDf/G8Qr1PgIZsoqXxUN
        PFphe0hmrnjqztLqsn7UKQHIOQ==
X-Google-Smtp-Source: AGHT+IHFd/KlMS3CBCtwj91xL7Xwekc7eD/+pg68NTNAiQoIDYiivoLT70Bf8C7dD+yRl6RV03H1Kg==
X-Received: by 2002:a7b:cc99:0:b0:3fe:1f98:deb7 with SMTP id p25-20020a7bcc99000000b003fe1f98deb7mr4690456wma.35.1691316741571;
        Sun, 06 Aug 2023 03:12:21 -0700 (PDT)
Received: from loic-ThinkPad-T470p.. ([2a01:e0a:82c:5f0:2a5f:dd16:fb77:b314])
        by smtp.gmail.com with ESMTPSA id a14-20020adfed0e000000b003177f57e79esm7209115wro.88.2023.08.06.03.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 03:12:20 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     brauner@kernel.org, viro@zeniv.linux.org.uk, corbet@lwn.net
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, hch@infradead.org,
        rdunlap@infradead.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3] init: Add support for rootwait timeout parameter
Date:   Sun,  6 Aug 2023 12:12:17 +0200
Message-Id: <20230806101217.164068-1-loic.poulain@linaro.org>
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
 v3: Use kstrtoint instead of deprecated simple_strtoul

 .../admin-guide/kernel-parameters.txt         |  4 ++++
 init/do_mounts.c                              | 24 +++++++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

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
index 1aa015883519..98190bf34a9f 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -18,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/ramfs.h>
 #include <linux/shmem_fs.h>
+#include <linux/ktime.h>
 
 #include <linux/nfs_fs.h>
 #include <linux/nfs_fs_sb.h>
@@ -71,12 +72,25 @@ static int __init rootwait_setup(char *str)
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
+	if (kstrtoint(str, 0, &root_wait) || root_wait < 0) {
+		pr_warn("ignoring invalid rootwait value\n");
+		/* fallback to indefinite wait */
+		root_wait = -1;
+	}
+
+	return 1;
+}
+
+__setup("rootwait=", rootwait_timeout_setup);
+
 static char * __initdata root_mount_data;
 static int __init root_data_setup(char *str)
 {
@@ -384,14 +398,20 @@ void __init mount_root(char *root_device_name)
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

