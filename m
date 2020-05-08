Return-Path: <SRS0=HYMc=6W=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852DFC47257
	for <linux-doc@archiver.kernel.org>; Fri,  8 May 2020 06:40:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5271120870
	for <linux-doc@archiver.kernel.org>; Fri,  8 May 2020 06:40:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ARzHXfMt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbgEHGkW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 May 2020 02:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727889AbgEHGkV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 May 2020 02:40:21 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2CEC05BD09
        for <linux-doc@vger.kernel.org>; Thu,  7 May 2020 23:40:21 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id b6so292520plz.13
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2020 23:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cqKLrad562FQwghELBGLStRGtw4lwT2qr64qzOycGEI=;
        b=ARzHXfMtCypZrxvF85mfdVA/KP8ufpi4gPXaLVOYgNUIU61qwjqLN7fQ5sAMsfOrvh
         mjdyxFyWjrCuP7yH1sI47OqQ0SXQTCs5R1wxNReQuEZklKLVNgdfzlza+QMwwEhDOKC9
         SASqIO1879iv+QvLzBVO4qYr07B7P7U5q1pkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cqKLrad562FQwghELBGLStRGtw4lwT2qr64qzOycGEI=;
        b=pjant0yBrRV2+pAyxzh8Pj0jcMEnJOLRM3jc/1nM1qKUlWbs8EE5TPJSNIfDn/l+WN
         pR7EqGtAWi93ojshgTa+vgbO8D2kKVye29QY/5g8PaA0jZPgza9h57FTY7PRWKm0oBVA
         sMYfr7I9Lq3I1+fRXYB8tVPUUdim5laAenA9zuW++S20KEYg810+rj06sTppE+omHPz8
         Q25HMqJ9OKwY2TvFls/plTRiTUimk8Ip0H/NHrS1P5l81/H7rZaIalh3GkMvsEWQIDKt
         3PLz32WQiPHgN99Oug4Ox2chAMbeqEtinPYAC8EwAs7OJkQNNKR1A0fRv4gabDuAwiWy
         J5Ug==
X-Gm-Message-State: AGi0PuY4xCcWWh8IcdrPe33w5Yry8/cS4J7KE+bLCMf1QgX3Qe4RCQ8s
        SaiuPmTdR6ctRYCYVh4yJ3Wy2w==
X-Google-Smtp-Source: APiQypLiORqo7LA6/jRy+SiU1pTTL3uX0VuwjBVR/lnJgE/kkJAZVbD3aWdNHul8G866o7w6pioCJg==
X-Received: by 2002:a17:90a:d17:: with SMTP id t23mr4455269pja.77.1588920020669;
        Thu, 07 May 2020 23:40:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h14sm1490829pjc.46.2020.05.07.23.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 23:40:16 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/12] pstore/zone: Provide way to skip "broken" zone for MTD devices
Date:   Thu,  7 May 2020 23:40:01 -0700
Message-Id: <20200508064004.57898-10-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508064004.57898-1-keescook@chromium.org>
References: <20200508064004.57898-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: WeiXiong Liao <liaoweixiong@allwinnertech.com>

One requirement to support MTD devices in pstore/zone is having a
way to declare certain regions as broken. Add this support to
pstore/zone.

The MTD driver should return -ENOMSG when encountering a bad region,
which tells pstore/zone to skip and try the next one.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Link: https://lore.kernel.org/r/1585126506-18635-9-git-send-email-liaoweixiong@allwinnertech.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/blk.c             | 10 ++++--
 fs/pstore/zone.c            | 65 ++++++++++++++++++++++++++++++-------
 include/linux/pstore_blk.h  |  3 +-
 include/linux/pstore_zone.h | 12 ++++---
 4 files changed, 71 insertions(+), 19 deletions(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 5db811b7018d..e33e58afd4cb 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -101,9 +101,12 @@ static struct bdev_info {
  *		means error.
  * @write:	The same as @read, but the following error number:
  *		-EBUSY means try to write again later.
+ *		-ENOMSG means to try next zone.
  * @panic_write:The write operation only used for panic case. It's optional
- *		if you do not care panic log. The parameters and return value
- *		are the same as @read.
+ *		if you do not care panic log. The parameters are relative
+ *		value to storage.
+ *		On success, the number of bytes should be returned, others
+ *		excluding -ENOMSG mean error. -ENOMSG means to try next zone.
  */
 struct psblk_device {
 	unsigned long total_size;
@@ -315,6 +318,9 @@ static ssize_t psblk_blk_panic_write(const char *buf, size_t size,
 	/* size and off must align to SECTOR_SIZE for block device */
 	ret = blkdev_panic_write(buf, off >> SECTOR_SHIFT,
 			size >> SECTOR_SHIFT);
+	/* try next zone */
+	if (ret == -ENOMSG)
+		return ret;
 	return ret ? -EIO : size;
 }
 
diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index 36d78c63bd20..43d44d016039 100644
--- a/fs/pstore/zone.c
+++ b/fs/pstore/zone.c
@@ -247,6 +247,9 @@ static int psz_zone_write(struct pstore_zone *zone,
 
 	return 0;
 dirty:
+	/* no need to mark dirty if going to try next zone */
+	if (wcnt == -ENOMSG)
+		return -ENOMSG;
 	atomic_set(&zone->dirty, true);
 	/* flush dirty zones nicely */
 	if (wcnt == -EBUSY && !is_on_panic())
@@ -382,7 +385,11 @@ static int psz_recover_oops_meta(struct psz_context *cxt)
 			return -EINVAL;
 
 		rcnt = info->read((char *)buf, len, zone->off);
-		if (rcnt != len) {
+		if (rcnt == -ENOMSG) {
+			pr_debug("%s with id %lu may be broken, skip\n",
+					zone->name, i);
+			continue;
+		} else if (rcnt != len) {
 			pr_err("read %s with id %lu failed\n", zone->name, i);
 			return (int)rcnt < 0 ? (int)rcnt : -EIO;
 		}
@@ -717,24 +724,58 @@ static void psz_write_kmsg_hdr(struct pstore_zone *zone,
 		hdr->counter = 0;
 }
 
+/*
+ * In case zone is broken, which may occur to MTD device, we try each zones,
+ * start at cxt->oops_write_cnt.
+ */
 static inline int notrace psz_oops_write_record(struct psz_context *cxt,
 		struct pstore_record *record)
 {
+	int ret = -EBUSY;
 	size_t size, hlen;
 	struct pstore_zone *zone;
-	unsigned int zonenum;
+	unsigned int i;
 
-	zonenum = cxt->oops_write_cnt;
-	zone = cxt->opszs[zonenum];
-	if (unlikely(!zone))
-		return -ENOSPC;
-	cxt->oops_write_cnt = (zonenum + 1) % cxt->oops_max_cnt;
+	for (i = 0; i < cxt->oops_max_cnt; i++) {
+		unsigned int zonenum, len;
+
+		zonenum = (cxt->oops_write_cnt + i) % cxt->oops_max_cnt;
+		zone = cxt->opszs[zonenum];
+		if (unlikely(!zone))
+			return -ENOSPC;
 
-	pr_debug("write %s to zone id %d\n", zone->name, zonenum);
-	psz_write_kmsg_hdr(zone, record);
-	hlen = sizeof(struct psz_oops_header);
-	size = min_t(size_t, record->size, zone->buffer_size - hlen);
-	return psz_zone_write(zone, FLUSH_ALL, record->buf, size, hlen);
+		/* avoid destorying old data, allocate a new one */
+		len = zone->buffer_size + sizeof(*zone->buffer);
+		zone->oldbuf = zone->buffer;
+		zone->buffer = kzalloc(len, GFP_KERNEL);
+		if (!zone->buffer) {
+			zone->buffer = zone->oldbuf;
+			return -ENOMEM;
+		}
+		zone->buffer->sig = zone->oldbuf->sig;
+
+		pr_debug("write %s to zone id %d\n", zone->name, zonenum);
+		psz_write_kmsg_hdr(zone, record);
+		hlen = sizeof(struct psz_oops_header);
+		size = min_t(size_t, record->size, zone->buffer_size - hlen);
+		ret = psz_zone_write(zone, FLUSH_ALL, record->buf, size, hlen);
+		if (likely(!ret || ret != -ENOMSG)) {
+			cxt->oops_write_cnt = zonenum + 1;
+			cxt->oops_write_cnt %= cxt->oops_max_cnt;
+			/* no need to try next zone, free last zone buffer */
+			kfree(zone->oldbuf);
+			zone->oldbuf = NULL;
+			return ret;
+		}
+
+		pr_debug("zone %u may be broken, try next dmesg zone\n",
+				zonenum);
+		kfree(zone->buffer);
+		zone->buffer = zone->oldbuf;
+		zone->oldbuf = NULL;
+	}
+
+	return -EBUSY;
 }
 
 static int notrace psz_oops_write(struct psz_context *cxt,
diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
index d8f609e60288..828b0763d477 100644
--- a/include/linux/pstore_blk.h
+++ b/include/linux/pstore_blk.h
@@ -14,7 +14,8 @@
  * @start_sect: start sector to block device
  * @sects: sectors count on buf
  *
- * Return: On success, zero should be returned. Others mean error.
+ * Return: On success, zero should be returned. Others excluding -ENOMSG
+ * mean error. -ENOMSG means to try next zone.
  *
  * Panic write to block device must be aligned to SECTOR_SIZE.
  */
diff --git a/include/linux/pstore_zone.h b/include/linux/pstore_zone.h
index 94f441b8b616..ddb3dfea4ea6 100644
--- a/include/linux/pstore_zone.h
+++ b/include/linux/pstore_zone.h
@@ -23,11 +23,15 @@ typedef ssize_t (*psz_write_op)(const char *, size_t, loff_t);
  * @read:	The general read operation. Both of the function parameters
  *		@size and @offset are relative value to storage.
  *		On success, the number of bytes should be returned, others
- *		means error.
- * @write:	The same as @read, but -EBUSY means try to write again later.
+ *		mean error.
+ * @write:	The same as @read, but the following error number:
+ *		-EBUSY means try to write again later.
+ *		-ENOMSG means to try next zone.
  * @panic_write:The write operation only used for panic case. It's optional
- *		if you do not care panic log. The parameters and return value
- *		are the same as @read.
+ *		if you do not care panic log. The parameters are relative
+ *		value to storage.
+ *		On success, the number of bytes should be returned, others
+ *		excluding -ENOMSG mean error. -ENOMSG means to try next zone.
  */
 struct pstore_zone_info {
 	struct module *owner;
-- 
2.20.1

