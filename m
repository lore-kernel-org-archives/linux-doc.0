Return-Path: <SRS0=LvDp=6X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700D5C54E4A
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 23:42:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DA8F21775
	for <linux-doc@archiver.kernel.org>; Sat,  9 May 2020 23:42:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UniSr7am"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgEIXlJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 9 May 2020 19:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726320AbgEIXlJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 9 May 2020 19:41:09 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCBFC05BD0A
        for <linux-doc@vger.kernel.org>; Sat,  9 May 2020 16:41:08 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id e6so5918985pjt.4
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2020 16:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BH7oPYzXzVGddb2eusJn7dvCiiIlEUY0aB5rJA7D8Lo=;
        b=UniSr7amz9GtvTZ3gNf0nCaC6CAuwsYMTWMdmRh5DoJfNsF/WyWVrlQtjp3jsIuOt0
         h+tjUZVl42fYv4WcZ5oGufdIKYuCZfD8BZ9mDkiHTOiBaL8hYcCuWOzEMWmGxOXmI+xW
         Ebyr3kfvu1QQ3T+7M0deAJEw2Y5H53WKIISyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BH7oPYzXzVGddb2eusJn7dvCiiIlEUY0aB5rJA7D8Lo=;
        b=Irp7gkUZE9T+km3n+Un9zhPMpfxLr3vg3h/zUoCEPE7t4THTHUXEuYXNs5GaUMp5Lc
         KzlJf+O+5m/0dCII5h6Ji7RHYnbSCHTfzAkI1lwoOv9KDOIXuyWyPWo8S4qihKPdYZpX
         QGNZ1MUI3MEox/m5h+8aqCVnyPxAPu584t1z1NxvVe0Er7ZPGqPlEHGYmueg60c96tAl
         dknPypDarwjEA+PLWsKFFrzy3jjT6cHU06df12aIjuZ3VtxjfI09DrShc40f6zmiuznE
         N0o67dnNeWSBS1QJBxdGuD2ARk6c4i/r1+GpxvDQXT9NH1uS0H0n+XYAI3AaaJDmnuHq
         YZKQ==
X-Gm-Message-State: AGi0PubwtLkUzM61SJYQ5x3KX+8Bz6RCH/RFQEb1nqL8HEJObcsyJIsk
        cFiYGLGeHzCTbjkGPB/SRgddgg==
X-Google-Smtp-Source: APiQypK15qi0ZKxUvetpLu0eCL68R0LMHd+TRd7RVmybuxclXGoJ7hR0ZH4TIAZAl+JKB3vSh67M6Q==
X-Received: by 2002:a17:90a:1b67:: with SMTP id q94mr13615379pjq.84.1589067668421;
        Sat, 09 May 2020 16:41:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z190sm5455053pfz.84.2020.05.09.16.41.06
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
Subject: [PATCH v6 01/18] pstore/ram: Move dump_oops to end of module_param list
Date:   Sat,  9 May 2020 16:40:46 -0700
Message-Id: <20200509234103.46544-2-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509234103.46544-1-keescook@chromium.org>
References: <20200509234103.46544-1-keescook@chromium.org>
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

