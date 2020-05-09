Return-Path: <SRS0=LvDp=6X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D35AC47255
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 23:41:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56A7C21775
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 23:41:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H0ooAmPd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgEIXlI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 9 May 2020 19:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726026AbgEIXlI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 9 May 2020 19:41:08 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39ECBC061A0C
        for <linux-doc@vger.kernel.org>; Sat,  9 May 2020 16:41:08 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a7so5932883pju.2
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2020 16:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vvhNGN1Tx7s0Ij5sTylqbBedyOwoifzYhuoj8ucg/Ng=;
        b=H0ooAmPdOnapSGPHZq/JoxyQ1BBnzIg6/APNOlEOdF53LNG2ryW77WrExYmk/+cJbL
         ocPPOf/KndgfNJG6+JAci2tYH4tC2bOJci/5Lfh9vV42LoV7ItrQzyvO/egv602h4IYR
         44pWuSf0/6C1Ip/2mi66naX+2bIyxcoqS3O2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vvhNGN1Tx7s0Ij5sTylqbBedyOwoifzYhuoj8ucg/Ng=;
        b=hprLcJWvnqhWYbX6DF8ATC/BPrOhvTJhdw1NYwKWL0ocq+laA+5nIEa3e/rv4ihsic
         TpcrL18hVX+i7sQONe/EhE2xEZoZCCMCrPR3oX2kGXZaW3WFmyw+Mi4RTyGcYNsoV4XM
         35auP5twRquzPcFDUKYVT4AxTM+jEt5VV1pwT057oZayAgQb0E1eejWL4KUI4yt4W1HB
         0CQkaytbTR3YNx5sb2MGP7vjgb+7cRZmAiaddSQ9xbOWIfZnYs0ltxUAWslxB3q7CPaR
         ENIJewJ9P+kfhHv8TCXNv3/Q0imaFsEuQQk65QRD45pOIp4vVowsanh9YxI0bsP9fcss
         mfaQ==
X-Gm-Message-State: AGi0PuZ9J1HelOyz+TjjGWgkkKGG2RTHRbw6r+xYBBV5F9PgjoUbV7xw
        zeoKseK+4V2oiTfYt284PbXnlA==
X-Google-Smtp-Source: APiQypKUo7xwJzfdA6JNrqY2anP42ipln3vKspwjI3YKTI0dVWxv2sJ8STuGNonpxRA/NpDIUAjXyQ==
X-Received: by 2002:a17:902:32b:: with SMTP id 40mr8608904pld.73.1589067667755;
        Sat, 09 May 2020 16:41:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l1sm5722419pjr.17.2020.05.09.16.41.06
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
Subject: [PATCH v6 03/18] pstore/platform: Move module params after declarations
Date:   Sat,  9 May 2020 16:40:48 -0700
Message-Id: <20200509234103.46544-4-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509234103.46544-1-keescook@chromium.org>
References: <20200509234103.46544-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It is easier to see how module params are used if they're near the
variables they use.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/platform.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index e7bf22f01928..bf7fa7b278bd 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -77,12 +77,17 @@ static DEFINE_MUTEX(psinfo_lock);
 struct pstore_info *psinfo;
 
 static char *backend;
+module_param(backend, charp, 0444);
+MODULE_PARM_DESC(backend, "specific backend to use");
+
 static char *compress =
 #ifdef CONFIG_PSTORE_COMPRESS_DEFAULT
 		CONFIG_PSTORE_COMPRESS_DEFAULT;
 #else
 		NULL;
 #endif
+module_param(compress, charp, 0444);
+MODULE_PARM_DESC(compress, "compression to use");
 
 /* Compression parameters */
 static struct crypto_comp *tfm;
@@ -853,11 +858,5 @@ static void __exit pstore_exit(void)
 }
 module_exit(pstore_exit)
 
-module_param(compress, charp, 0444);
-MODULE_PARM_DESC(compress, "Pstore compression to use");
-
-module_param(backend, charp, 0444);
-MODULE_PARM_DESC(backend, "Pstore backend to use");
-
 MODULE_AUTHOR("Tony Luck <tony.luck@intel.com>");
 MODULE_LICENSE("GPL");
-- 
2.20.1

