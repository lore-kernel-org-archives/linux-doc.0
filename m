Return-Path: <SRS0=LvDp=6X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DB5C47255
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 23:42:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3533217BA
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 23:42:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J+WcAhg/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbgEIXmV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 9 May 2020 19:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727121AbgEIXlJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 9 May 2020 19:41:09 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9812FC05BD0A
        for <linux-doc@vger.kernel.org>; Sat,  9 May 2020 16:41:09 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ms17so5929574pjb.0
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2020 16:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ftIoYymBGMn0ProUbxAIjGCP6irGe3xnecuHwaJ2BU=;
        b=J+WcAhg/8U9d8i8Ni4muSGO+lb3eUiXAVxT5zD8TDMaO8aoOxB6kinmYlTxP+h7lKm
         TJ50PNjQ65bbw1gC2i4iFM3d2fe9cAXhpQd6hKGW9hXdzrcrWDVnGgPazsPx6KEqKBgZ
         3+3hlUICTP72mniDhetLNTRGKir2nXeMEDe7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ftIoYymBGMn0ProUbxAIjGCP6irGe3xnecuHwaJ2BU=;
        b=k/1BEMjefFJb7zBcg1OkwMnj98WPIK6p0V+LoXTz0lvyFXMNm6cwPlUp1oK83EhlCx
         1X9X2PAhcp5hz8E0xJw449AUEEd/K1upl4yu2vzpvCx2G9Fep/uiVoFEgnEZKMd7KEO+
         du2zjQUj+X7fv64mtquAmhgd00G9nToT8+QxcmFg6a4hzqgpGlOgf12vAzonTBPNS7uK
         dN9mH0P7twnQOUT1gRSpkuH/SF4T45/Ch5tm98Dx75pgneFEYs8XPC1RanhCIF+Folyi
         46Dz3TZS/BZx+HqqL8k2tEGek0zSOJCgRJGvHgdwz+2/gy174ivstmBeQcWz9r8b/JoI
         5nig==
X-Gm-Message-State: AGi0PuakdcaBhwuUm8NBTkdi+hSaWkXQW8UhrxFEGL7bOqaIX2TnT24Z
        zmA4QtvsjPRMeQSm0OF1I+y/AQ==
X-Google-Smtp-Source: APiQypJ3GTwxgEPSApk+xqYi+LtJwVmYIA7dZ8lzRZdb4HTWsDJTywZTADz0LsVAiUi/cWbCzeOoAA==
X-Received: by 2002:a17:90a:d14d:: with SMTP id t13mr13970521pjw.175.1589067669158;
        Sat, 09 May 2020 16:41:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r78sm5322903pfr.10.2020.05.09.16.41.06
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
Subject: [PATCH v6 04/18] pstore/platform: Use backend name for console registration
Date:   Sat,  9 May 2020 16:40:49 -0700
Message-Id: <20200509234103.46544-5-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509234103.46544-1-keescook@chromium.org>
References: <20200509234103.46544-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If the pstore backend changes, there's no indication in the logs what
the console is (it always says "pstore"). Instead, pass through the
active backend's name.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/platform.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index bf7fa7b278bd..90d146fbc7d2 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -519,13 +519,15 @@ static void pstore_console_write(struct console *con, const char *s, unsigned c)
 }
 
 static struct console pstore_console = {
-	.name	= "pstore",
 	.write	= pstore_console_write,
 	.index	= -1,
 };
 
 static void pstore_register_console(void)
 {
+	/* Show which backend is going to get console writes. */
+	strscpy(pstore_console.name, psinfo->name,
+		sizeof(pstore_console.name));
 	/*
 	 * Always initialize flags here since prior unregister_console()
 	 * calls may have changed settings (specifically CON_ENABLED).
-- 
2.20.1

