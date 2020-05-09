Return-Path: <SRS0=LvDp=6X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0944C47255
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 23:41:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A916121775
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 23:41:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PA3J3jqx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgEIXlN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 9 May 2020 19:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726026AbgEIXlK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 9 May 2020 19:41:10 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C99AC061A0C
        for <linux-doc@vger.kernel.org>; Sat,  9 May 2020 16:41:10 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t7so2309259plr.0
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2020 16:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a6bXV7bt3FJwO+6h7hS9wdbWbj+cKT2R8klgQdvy5V4=;
        b=PA3J3jqxZhR7QLeqwjId3MPNynQJYjylfFHuFHDO93eKIYh0iQYwhqZLfhDgt0tNPx
         NxHMmZui4QlIyuKxLjsRMXG4PNIvSBqEGu3OoFLfiibivil4eA41JBZI/UtGxAjYryLj
         xFanC6zXk4byjitJUGh5BrMI4F3rjAjk6STjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a6bXV7bt3FJwO+6h7hS9wdbWbj+cKT2R8klgQdvy5V4=;
        b=hidnNMZvl7ESAs6dRBBBGZtUUz3acVx3DQmPRAER+5JaGEv0agRBpPp9q5uEd2RtEJ
         wCwZXNwy5O/EOxY0M8rKl5Y34zwxHk0DuEYmHQAXG+MLPXGmMptR07rZl6BE5t9Q/0JE
         c5CY8RTLfSAS1QyEuVLZE6CgyfH5WdsYgkKAq+DXH8ez3BgoEpCLD41Cdb0e3RKAOCMy
         9BcxQ7fPmc2YeRnTQ6rS8rEJ1GfLIDFgTsfAwuS/zSOK8LLaN9YY83QYFFWO31uw2Ov6
         U9JUpbrBuI4tlCM5NU2yEfqtRygcmFT7tiyYgzGF0MOK79NAq/ql0UUgA+oxMeRy8/l5
         rOIA==
X-Gm-Message-State: AGi0PuYS7+7oK+eT0nlYKXvUrifyRhyIneTIPQDagrfExsjH4wYWopzI
        wABLpbaRMKCEmlHNBDmmknN20Q==
X-Google-Smtp-Source: APiQypIYGFFNE4CP/IEMoDRh7mGwo0o4z+2NMypaNjHCF3aRnPBRNu9ocJUCntHiguWss1r6vpDHyg==
X-Received: by 2002:a17:90a:8b82:: with SMTP id z2mr14034741pjn.124.1589067669999;
        Sat, 09 May 2020 16:41:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n23sm5722167pjq.18.2020.05.09.16.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 16:41:06 -0700 (PDT)
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
Subject: [PATCH v6 02/18] pstore/platform: Switch pstore_info::name to const
Date:   Sat,  9 May 2020 16:40:47 -0700
Message-Id: <20200509234103.46544-3-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509234103.46544-1-keescook@chromium.org>
References: <20200509234103.46544-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In order to more cleanly pass around backend names, make the "name" member
const. This means the module param needs to be dynamic (technically, it
was before, so this actually cleans up a minor memory leak if a backend
was specified and then gets unloaded.)

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/platform.c   | 3 ++-
 include/linux/pstore.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index b882919b8784..e7bf22f01928 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -626,7 +626,7 @@ int pstore_register(struct pstore_info *psi)
 	 * Update the module parameter backend, so it is visible
 	 * through /sys/module/pstore/parameters/backend
 	 */
-	backend = psi->name;
+	backend = kstrdup(psi->name, GFP_KERNEL);
 
 	pr_info("Registered %s as persistent store backend\n", psi->name);
 
@@ -669,6 +669,7 @@ void pstore_unregister(struct pstore_info *psi)
 	free_buf_for_compression();
 
 	psinfo = NULL;
+	kfree(backend);
 	backend = NULL;
 	mutex_unlock(&psinfo_lock);
 }
diff --git a/include/linux/pstore.h b/include/linux/pstore.h
index 16a1fdafc167..eb93a54cff31 100644
--- a/include/linux/pstore.h
+++ b/include/linux/pstore.h
@@ -176,7 +176,7 @@ struct pstore_record {
  */
 struct pstore_info {
 	struct module	*owner;
-	char		*name;
+	const char	*name;
 
 	struct semaphore buf_lock;
 	char		*buf;
-- 
2.20.1

