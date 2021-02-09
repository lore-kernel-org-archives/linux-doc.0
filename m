Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51C7C433E0
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 17:25:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A140064DF2
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 17:25:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbhBIRYq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Feb 2021 12:24:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233029AbhBIRYg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Feb 2021 12:24:36 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E83C06174A;
        Tue,  9 Feb 2021 09:23:54 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id o63so12895102pgo.6;
        Tue, 09 Feb 2021 09:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RFVknN5dERN41og2aHl0XoYuNNJGuTwr49EdvhAcYF0=;
        b=ndt9MHp6FFgpH6qFQZRVxB+1tx1ZTvVGIZ3hw2tgEWNYbwS+T4wRjKhzllXOw309yK
         v5I756QuhI/YBfZKWB5Pn5rFX0CkOUBIFXXZz1rM0jgZ8Fq7zWTZw+FoHVfQcclY6jDW
         HltM2+C6rmxDXPpcaUwEw+vxRD1CSIXti9aYye6tG4/5BV4jMnYBwv102DnO6PtMDDLH
         OlvO9mQbjqP0PK522JKFMYXFlw0MXLTN70NXaRu5N6/GdzodsjtaLJlbAiRkAkSc7uJY
         tGnyO1lpB1CIkkr/kbedLZ1S1BczwwJDposXGEGtaxTuMRbczrA7IyJHKGEtASzt4UDP
         OM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RFVknN5dERN41og2aHl0XoYuNNJGuTwr49EdvhAcYF0=;
        b=l7E/BirbF/ya7AFDtTC1jbc6VslA0l0q8/J1nk/gen6CxHXVA6jpxmsnJXWEI61i71
         /kiaIoFP9ksmjL2YT1RONUEE8o41br77NVEEsde+Oe8QlrFfRBvVH7ShWXPMzwuxQfQk
         YZJKnJ40ztUXRTHVJlXkFispzt1gPwytinMfkbBNJ6TEunFMqK5p6uF3GCop2C0EgMVm
         jt4cvs6SCgJHm0rVWn3zGXHRWXJo1CH14c0U1PtDtUb09PylFY9cAMXUr5zkF8ZKwWEq
         1QR575zpAMY6xUYO1TIWuyU+HyBw3mkg+VGKj+2iYj7P+0DptRYIz21WLQnUwiElitXs
         Y0EA==
X-Gm-Message-State: AOAM530ZkOotOmHJodR4Hu3vwjdSelWn8Y6McoPLze4IHiNUnEDpYXiX
        T9GhQ9M9f+WYfk7chmn+bk95iXYxQ/k=
X-Google-Smtp-Source: ABdhPJxbB1oIcwXpTxFcUO8kXJIxUwESY1nA4Zn8PwOV1SYOFlZ7O7zbKUX6jZaav5uzasobawp4Ow==
X-Received: by 2002:a63:1c12:: with SMTP id c18mr23169278pgc.356.1612891433165;
        Tue, 09 Feb 2021 09:23:53 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 9sm22564940pfo.1.2021.02.09.09.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 09:23:52 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org, corbet@lwn.net
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH v2] Documentation/admin-guide: kernel-parameters: Update nohlt section
Date:   Tue,  9 Feb 2021 09:23:48 -0800
Message-Id: <20210209172349.2249596-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update the documentation regarding "nohlt" and indicate that it is not
only for bugs, but can be useful to disable the architecture specific
sleep instructions. ARM, ARM64, SuperH and Microblaze all use
CONFIG_GENERIC_IDLE_POLL_SETUP which takes care of honoring the
"hlt"/"nohlt" parameters.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v2:

- used ';' after requires CONFIG_GENERIC_IDLE_POLL_SETUP (Randy)

 Documentation/admin-guide/kernel-parameters.txt | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a10b545c2070..0ea023242327 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3266,9 +3266,14 @@
 			parameter, xsave area per process might occupy more
 			memory on xsaves enabled systems.
 
-	nohlt		[BUGS=ARM,SH] Tells the kernel that the sleep(SH) or
-			wfi(ARM) instruction doesn't work correctly and not to
-			use it. This is also useful when using JTAG debugger.
+	nohlt		[ARM,ARM64,MICROBLAZE,SH] Forces the kernel to busy wait
+			in do_idle() and not use the arch_cpu_idle()
+			implementation; requires CONFIG_GENERIC_IDLE_POLL_SETUP
+			to be effective. This is useful on platforms where the
+			sleep(SH) or wfi(ARM,ARM64) instructions do not work
+			correctly or when doing power measurements to evalute
+			the impact of the sleep instructions. This is also
+			useful when using JTAG debugger.
 
 	no_file_caps	Tells the kernel not to honor file capabilities.  The
 			only way then for a file to be executed with privilege
-- 
2.25.1

