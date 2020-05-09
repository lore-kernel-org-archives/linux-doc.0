Return-Path: <SRS0=LvDp=6X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40B0C47255
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 23:41:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81C96217BA
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 23:41:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dC2YQTRr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728301AbgEIXlv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 9 May 2020 19:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728611AbgEIXlW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 9 May 2020 19:41:22 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C03EC05BD09
        for <linux-doc@vger.kernel.org>; Sat,  9 May 2020 16:41:22 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id z6so2292643plk.10
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2020 16:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P5XQ7GZyxsmkQxM/m7MTAmrg4kL6aqAimSpckGQ7Uxg=;
        b=dC2YQTRrR7cNSjW2IR6bIn6gclMTxQTeCYX8luWgsRahd9W4nwBdLnxTsbkrUmt+0w
         B48Rw+TkJw5l6XGPwWREYieWjvYnF3lE0uQE8kTstg06uxQFoe+Mv1A8YSppAPE+LvRV
         bqB1ESekL1VlwAGoQ7C/a5xM8OUxPGWp8JlWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P5XQ7GZyxsmkQxM/m7MTAmrg4kL6aqAimSpckGQ7Uxg=;
        b=DmD+VZrWMEsDB3hK4TTwnuj8TeOEID9kNlHAgPWvV6hmRkcMsSyGwfUykh0DkpYrm3
         UPRFJGMedhNrrcLUZUvj08G2PjTQ7tkXP3bX3i1bEcjkrMWAV30vXZhMpCmJkaCfgQpD
         20706zC6Ou60AY+ZvnXJk1j/2Kre6Su73iL9+WAzI7d8Rt4jZ0ooTgRQzVYBY612UChx
         HoSrbC+U9HO/xBudbQxzPUItUcOmlj3SVJbJ0g6c1yhhkG+n4R+Of4QjKVH03i75AdGR
         4ZztNOxVuhNGWs3elvMG2LexgehUVQlj+elldO96SsDaM5wkpnMnDFGX2I67OBK1p455
         CInw==
X-Gm-Message-State: AGi0PuZFjcpFA8ZvTgwRgaYwS5YlDPiOLMswEopFSPAzNV8DjQ2HU/x/
        fEvzqKGDSYcBX9xwsV60bLCPZg==
X-Google-Smtp-Source: APiQypLGN//WZ3gwqGjno7ilyV13FVtSWzqaFNexRdyfXWXHXZvObDnQKZ0zfqBRlONfIXonNzIkmA==
X-Received: by 2002:a17:90a:d517:: with SMTP id t23mr13674448pju.210.1589067681838;
        Sat, 09 May 2020 16:41:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o40sm5921986pjb.18.2020.05.09.16.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 16:41:18 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Rob Herring <robh@kernel.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: [PATCH v6 15/18] pstore/blk: Provide way to query pstore configuration
Date:   Sat,  9 May 2020 16:41:00 -0700
Message-Id: <20200509234103.46544-16-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509234103.46544-1-keescook@chromium.org>
References: <20200509234103.46544-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: WeiXiong Liao <liaoweixiong@allwinnertech.com>

In order to configure itself, the MTD backend needs to be able to query
the current pstore configuration. Introduce pstore_blk_usr_info() for
this purpose.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Link: https://lore.kernel.org/r/1585126506-18635-10-git-send-email-liaoweixiong@allwinnertech.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/blk.c            | 37 ++++++++++++++++++++++++++++++-------
 include/linux/pstore_blk.h | 10 ++++++++++
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 884b51e5879f..134c5e0c67c1 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -93,6 +93,17 @@ static struct bdev_info {
 	sector_t start_sect;
 } g_bdev_info;
 
+#define check_size(name, alignsize) ({				\
+	long _##name_ = (name);					\
+	_##name_ = _##name_ <= 0 ? 0 : (_##name_ * 1024);	\
+	if (_##name_ & ((alignsize) - 1)) {			\
+		pr_info(#name " must align to %d\n",		\
+				(alignsize));			\
+		_##name_ = ALIGN(name, (alignsize));		\
+	}							\
+	_##name_;						\
+})
+
 /**
  * struct psblk_device - back-end pstore/blk driver structure.
  *
@@ -148,13 +159,11 @@ static int psblk_register_do(struct psblk_device *dev)
 		dev->flags = UINT_MAX;
 
 #define verify_size(name, alignsize, enabled) {				\
-		long _##name_ = (enabled) ? (name) : 0;			\
-		_##name_ = _##name_ <= 0 ? 0 : (_##name_ * 1024);	\
-		if (_##name_ & ((alignsize) - 1)) {			\
-			pr_info(#name " must align to %d\n",		\
-					(alignsize));			\
-			_##name_ = ALIGN(name, (alignsize));		\
-		}							\
+		long _##name_;						\
+		if (enabled)						\
+			_##name_ = check_size(name, alignsize);		\
+		else							\
+			_##name_ = 0;					\
 		name = _##name_ / 1024;					\
 		pstore_zone_info->name = _##name_;			\
 	}
@@ -508,6 +517,20 @@ int psblk_blkdev_info(dev_t *devt, sector_t *nr_sects, sector_t *start_sect)
 }
 EXPORT_SYMBOL_GPL(psblk_blkdev_info);
 
+/* get information of pstore/blk */
+int pstore_blk_usr_info(struct pstore_blk_info *info)
+{
+	strncpy(info->device, blkdev, 80);
+	info->max_reason = max_reason;
+	info->kmsg_size = check_size(kmsg_size, 4096);
+	info->pmsg_size = check_size(pmsg_size, 4096);
+	info->ftrace_size = check_size(ftrace_size, 4096);
+	info->console_size = check_size(console_size, 4096);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pstore_blk_usr_info);
+
 static void __exit pstore_blk_exit(void)
 {
 	mutex_lock(&pstore_blk_lock);
diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
index 121b70e314a8..8aae922caa27 100644
--- a/include/linux/pstore_blk.h
+++ b/include/linux/pstore_blk.h
@@ -27,4 +27,14 @@ int  register_pstore_blk(unsigned int major, unsigned int flags,
 void unregister_pstore_blk(unsigned int major);
 int  psblk_blkdev_info(dev_t *devt, sector_t *nr_sects, sector_t *start_sect);
 
+struct pstore_blk_info {
+	char device[80];
+	enum kmsg_dump_reason max_reason;
+	unsigned long kmsg_size;
+	unsigned long pmsg_size;
+	unsigned long console_size;
+	unsigned long ftrace_size;
+};
+int pstore_blk_usr_info(struct pstore_blk_info *info);
+
 #endif
-- 
2.20.1

