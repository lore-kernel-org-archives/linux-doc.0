Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F78C4742C
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 11:18:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACEA522263
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 11:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vk6+oKa7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbgKPKSb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Nov 2020 05:18:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:53146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728833AbgKPKSa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 16 Nov 2020 05:18:30 -0500
Received: from mail.kernel.org (ip5f5ad5de.dynamic.kabel-deutschland.de [95.90.213.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56E8F223BD;
        Mon, 16 Nov 2020 10:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605521908;
        bh=EAj0xVYWs3FsfInNBauQLPfygCTx6jDekPYSVvGokbU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vk6+oKa7UZLkVFJGns+Wgsr12vJ/Z8C4HL9DISG1Xi2fEp3gZU8sdY5y+/2BuVg5c
         cheb+nE54vXfu5g2maX6Hr/7MwHEdAYuPtWEAW56lyTCYl8bLArNGfN6rbDphdEE/z
         dnpq1N7e00lB+oV8Kz7ahGNxTy2mtB5BnmahGi3w=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kebac-00FwEJ-Ag; Mon, 16 Nov 2020 11:18:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Linux Doc Mailing List" <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/27] pstore/zone: fix a kernel-doc markup
Date:   Mon, 16 Nov 2020 11:18:09 +0100
Message-Id: <9edb17caef717d196f149638bd9e98e4de725316.1605521731.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605521731.git.mchehab+huawei@kernel.org>
References: <cover.1605521731.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The documented struct is psz_head and not psz_buffer.

Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 fs/pstore/zone.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index 3ce89216670c..46a1610c06fa 100644
--- a/fs/pstore/zone.c
+++ b/fs/pstore/zone.c
@@ -6,41 +6,41 @@
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/mount.h>
 #include <linux/printk.h>
 #include <linux/fs.h>
 #include <linux/pstore_zone.h>
 #include <linux/kdev_t.h>
 #include <linux/device.h>
 #include <linux/namei.h>
 #include <linux/fcntl.h>
 #include <linux/uio.h>
 #include <linux/writeback.h>
 #include "internal.h"
 
 /**
- * struct psz_head - header of zone to flush to storage
+ * struct psz_buffer - header of zone to flush to storage
  *
  * @sig: signature to indicate header (PSZ_SIG xor PSZONE-type value)
  * @datalen: length of data in @data
  * @start: offset into @data where the beginning of the stored bytes begin
  * @data: zone data.
  */
 struct psz_buffer {
 #define PSZ_SIG (0x43474244) /* DBGC */
 	uint32_t sig;
 	atomic_t datalen;
 	atomic_t start;
 	uint8_t data[];
 };
 
 /**
  * struct psz_kmsg_header - kmsg dump-specific header to flush to storage
  *
  * @magic: magic num for kmsg dump header
  * @time: kmsg dump trigger time
  * @compressed: whether conpressed
-- 
2.28.0

