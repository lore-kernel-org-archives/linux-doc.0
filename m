Return-Path: <SRS0=r+xA=6Y=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6829C38A2A
	for <linux-doc@archiver.kernel.org>; Sun, 10 May 2020 20:24:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACFD420737
	for <linux-doc@archiver.kernel.org>; Sun, 10 May 2020 20:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Knmx1HZJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729276AbgEJUYo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 10 May 2020 16:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729186AbgEJUYn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 10 May 2020 16:24:43 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92665C061A0E
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2020 13:24:43 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id e6so6722557pjt.4
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2020 13:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BH7oPYzXzVGddb2eusJn7dvCiiIlEUY0aB5rJA7D8Lo=;
        b=Knmx1HZJZicNN2kyPSHXezy3IlidaxBgWVCKCEjmfFjqIIogaiilJAI6UQevUw+SzJ
         uxC1dHSDC2qeSRqPIKDp1GL2b47FC87gSdWL1tQCvqNJT+ecQn4XXHgGL5d4Ik6FXWoG
         Joq2ga7Uv9c5LsCL30Z7U4ze5fpY94V4y9JSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BH7oPYzXzVGddb2eusJn7dvCiiIlEUY0aB5rJA7D8Lo=;
        b=VUqVKwXZN6cGQh0CAr02TcTMs6aCzipQTdIV/wLYzzwCqurnR40mHxmAGjpzwFZ9Uv
         sdsOgLP9gnZjUbuTzCYoSIccn+CPmsnP68uAOhV4bIROtmDJHLbm8vsfq2nfQtfdXCTQ
         yLTvRZ54g7fpKRNhyDkgnCErrVVyyDZPWmIk05ZP9F09+jrn1O1GCrYEaeOroCxEflpO
         2DagmevXEv/d/uuD36D1kKIGzzmCF5iIG7hqd6OiXzNgdDIauPoM/mu/FVyIksu/XAvW
         ZUOrdR6ubVsZTBvuspvGlGl7EitVhbS0J7h1N7UzVy5UUblB4wwVX892gLZwaNmyEnRP
         Hm/Q==
X-Gm-Message-State: AGi0Pua8u4ZEEkm6z2dLVgDfyGeuJjCXidKoiO9OBzSzKoEp4pYiAaPG
        8S7WbKLfZ62Z0vYYT6+dg3lFfQ==
X-Google-Smtp-Source: APiQypLOl1TXjmfLr/xQcK1xr2OabtzKZy6naN7IKAuzLaAUHxg4zhucy0rFHWqKNS4VPSsObsMKkw==
X-Received: by 2002:a17:902:c194:: with SMTP id d20mr12212723pld.256.1589142282837;
        Sun, 10 May 2020 13:24:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h12sm6246248pgi.5.2020.05.10.13.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 13:24:41 -0700 (PDT)
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
Subject: [PATCH v7 01/18] pstore/ram: Move dump_oops to end of module_param list
Date:   Sun, 10 May 2020 13:24:19 -0700
Message-Id: <20200510202436.63222-2-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510202436.63222-1-keescook@chromium.org>
References: <20200510202436.63222-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When reading "modinfo" details, dump_oops was before max_reason, which
seems odd given dump_oops is now considered deprecated. Move it to the
very end instead.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/ram.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 198d04cceb3e..7f956053f4e5 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -57,11 +57,6 @@ module_param(mem_type, uint, 0400);
 MODULE_PARM_DESC(mem_type,
 		"set to 1 to try to use unbuffered memory (default 0)");
 
-static int ramoops_dump_oops = -1;
-module_param_named(dump_oops, ramoops_dump_oops, int, 0400);
-MODULE_PARM_DESC(dump_oops,
-		 "set to 1 to dump oopses & panics, 0 to only dump panics (deprecated: use max_reason instead)");
-
 static int ramoops_max_reason = KMSG_DUMP_OOPS;
 module_param_named(max_reason, ramoops_max_reason, int, 0400);
 MODULE_PARM_DESC(max_reason,
@@ -74,6 +69,11 @@ MODULE_PARM_DESC(ramoops_ecc,
 		"ECC buffer size in bytes (1 is a special value, means 16 "
 		"bytes ECC)");
 
+static int ramoops_dump_oops = -1;
+module_param_named(dump_oops, ramoops_dump_oops, int, 0400);
+MODULE_PARM_DESC(dump_oops,
+		 "(deprecated: use max_reason instead) set to 1 to dump oopses & panics, 0 to only dump panics");
+
 struct ramoops_context {
 	struct persistent_ram_zone **dprzs;	/* Oops dump zones */
 	struct persistent_ram_zone *cprz;	/* Console zone */
-- 
2.20.1

