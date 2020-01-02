Return-Path: <SRS0=24Yb=2X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D99C2D0DD
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jan 2020 04:14:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E4E521734
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jan 2020 04:14:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Zg9cDaV7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbgABEO4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Jan 2020 23:14:56 -0500
Received: from mail-pj1-f47.google.com ([209.85.216.47]:35735 "EHLO
        mail-pj1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgABEOz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Jan 2020 23:14:55 -0500
Received: by mail-pj1-f47.google.com with SMTP id s7so2822301pjc.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jan 2020 20:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9bbgsowQ5+lVOhOfUqtpuA+e3E167ANrpnE8X0bKC0g=;
        b=Zg9cDaV7N19Y6I1moTjZo1qON5h298DxtazReyg3Tekyjukt9pkNmMwXrK/LX1mN96
         lGehPsG3zUAAyzO7hAFvIuzDx6XQTM4sfgAK1Laa6jawdO9Xb58WzPnQoTDNIXFXdVTP
         K5imQ66p5cfelyTKPQDlRujHbHkUeKPVPH4oG5hSd9ZvF2o4LaRroJvDEckQL4H8AHu2
         QyiaNcfBK7NL/a2mU8UuboY7NxfXGumoYMbr5mKIvnBdkOymyWMN/4iO0vBVHE1PE1+C
         jYSEbwBkXNYqrV1h17Nm+3JeMlRKsfvZqwuRSilbEDvIIWd+R/8kLoqSYeCdrt1XjkQu
         hLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9bbgsowQ5+lVOhOfUqtpuA+e3E167ANrpnE8X0bKC0g=;
        b=ACu/fUKHFyzui5PWWRI99Xum49ieVJgv9029MrbbBWq1+hCHbiF+2hjav9lnQewVDm
         y8LcraFkKZzGmeZ+zRY7TLWwT/m3gBaLgh6liMbrWbEDLB+KC3YN0eRejw5L+u+KSdP6
         9OHDD64Ph0iLa0PN9I1EQqLdye/fV9Muhbp/0svvk8YPoXIokxa+xNuwHD6Mg2s+Zzzk
         xNmKMF4YbyoFbbTv12K0fb+BA5DLWpacwR6NHcQoUzEAR+TJvo1XyDIMAdImTnZyX1HY
         Uw7YZdCXPtwgM6yRCWbAqbLMN/sYQcpsXwZR1IY9Y2OPKARP716ZJPtCMBQS2WnEaBXO
         73pw==
X-Gm-Message-State: APjAAAXareSxjBiQa8XzzI65OnWZywzWghL5IPUsPp9BFDJuo66sY4os
        9n8tN/BXKjCYgs43x1lWWAyCVw==
X-Google-Smtp-Source: APXvYqxYkibkbhh0PBASLRj78qLynYNXvqwFv8n47/PTpSXnRACFhCipit9e0okQQfgdKbYOdlmtOQ==
X-Received: by 2002:a17:902:7484:: with SMTP id h4mr80682969pll.74.1577938493386;
        Wed, 01 Jan 2020 20:14:53 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
        by smtp.gmail.com with ESMTPSA id i127sm63870336pfc.55.2020.01.01.20.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2020 20:14:53 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, anup@brainfault.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH 2/2] Documentation/features: support gcov on RISC-V
Date:   Thu,  2 Jan 2020 12:14:45 +0800
Message-Id: <20200102041445.98195-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102041445.98195-1-zong.li@sifive.com>
References: <20200102041445.98195-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Change status to "ok" for RISC-V architecture.
Lightly tested on QEMU and Hifive Unleashed board, seems to work as
expected.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 Documentation/features/debug/gcov-profile-all/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/debug/gcov-profile-all/arch-support.txt b/Documentation/features/debug/gcov-profile-all/arch-support.txt
index 059d58a549c7..6fb2b0671994 100644
--- a/Documentation/features/debug/gcov-profile-all/arch-support.txt
+++ b/Documentation/features/debug/gcov-profile-all/arch-support.txt
@@ -23,7 +23,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: | TODO |
-- 
2.24.1

