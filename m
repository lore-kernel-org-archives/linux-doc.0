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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003A3C433E0
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 00:31:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5F2264EB1
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 00:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhBIAbn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Feb 2021 19:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhBIAbl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 19:31:41 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4C1C061786;
        Mon,  8 Feb 2021 16:31:01 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id e9so625194pjj.0;
        Mon, 08 Feb 2021 16:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QOOh5dLw37gMZp7x5AliAAZBeNFL0+F+aQQe2h7KyGk=;
        b=ZLHJz3wzy42rNqQLwuHR+UDRCbVepcqNnyFFPsonC8msMWOIn57vGXWPbOp72tsBpZ
         ZXhUlLAcoJsD+uC7nrEMd185YxnC4pPcM+2dSCXF6g+EHzQte9kxjLk8deSUkF6IWAOa
         yaSq//r7sK6NMV0F8Y/x3Or8/8BJhYj9uYlttS8/g2iFrnctDrNKr5v1tqU2iKoLZKRH
         e0sP0pIS4E8g14r8WSQ7QaJ7hriwopiiBLcTg371M+KbDu0nCYuQXuP+dA1TzOnTZkE5
         +/dpTqPuFgU7GAoyExWHcIx+amFj/GyPpQQlHj37INKsfkjwo9yZjfvlnWNmLNtJyQFc
         sYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QOOh5dLw37gMZp7x5AliAAZBeNFL0+F+aQQe2h7KyGk=;
        b=nO1cjXHG9rg5pijDpGMkt02JcOUWCDH36XMvgvmGcdCaLzptt+mCDbVE4KHKVicI0F
         ORbHbr2r4YknHGQfoxz8E25DPjWBym9Da02bnLj41qgT6t/BqpRTtbn1qKGVNlWI8zvM
         wUpBoewm+ZrkEAyi4ut+tFPS0yoZkq6+xaymYC4kfKomrsiW9WDnC9b6KzLokH+ZwWvq
         AeB5c2dAwhCY5VvjMdW6YM2Py0XPXt7t6ia0yzJ4FmB8SCdOTMxEJrTLY1FSAzygV7MB
         PYTs1w6kXV+KYP6UUEozT551nYy3DQalpldBOXlc3ES3fmJhzCblQTAw7IP/Sc0q4BHf
         10CA==
X-Gm-Message-State: AOAM532dyerbpdvi7a1034a36yrQhcs2VEJErkdrC5TgE/23RKQvCvJl
        39QDPxHW8iBmvxiPwU9H5uyT0IlKKBg=
X-Google-Smtp-Source: ABdhPJwjwZE/1HR+1b/pK0JjUgfEN4RPdG3oou5b8kHuJWclq4YROiL6lUI5kTLRXfMl7hOGc/5CAQ==
X-Received: by 2002:a17:90a:470b:: with SMTP id h11mr1371748pjg.186.1612830660028;
        Mon, 08 Feb 2021 16:31:00 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id z11sm447296pjn.5.2021.02.08.16.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 16:30:59 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org, corbet@lwn.net
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH] Documentation/admin-guide: kernel-parameters: Update nohlt section
Date:   Mon,  8 Feb 2021 16:30:45 -0800
Message-Id: <20210209003047.2231924-1-f.fainelli@gmail.com>
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

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a10b545c2070..83c37e23e1e2 100644
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
+			implementation, requires CONFIG_GENERIC_IDLE_POLL_SETUP
+			to be effective. This is useful on platforms where the
+			sleep(SH) or wfi(ARM,ARM64) instructions do not work
+			correctly or when doing power measurements to evalute
+			the impact of the sleep instructions. This is also
+			useful when using JTAG debugger.
 
 	no_file_caps	Tells the kernel not to honor file capabilities.  The
 			only way then for a file to be executed with privilege
-- 
2.25.1

