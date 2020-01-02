Return-Path: <SRS0=24Yb=2X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34352C2D0DE
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jan 2020 03:10:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0635621655
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jan 2020 03:10:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Vi6uFeK8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbgABDKP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Jan 2020 22:10:15 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36823 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbgABDKP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Jan 2020 22:10:15 -0500
Received: by mail-pj1-f65.google.com with SMTP id n59so2765360pjb.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Jan 2020 19:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i3ZeFLW0tZfqHlZISm5iQNQKhwN5szM40SC3+DB7Jec=;
        b=Vi6uFeK8FQWUpxh9kg+TRm+rbSbuHhbmk1YAT+cd52UcYzvsmrZ4GP4Q+iXx/+ldGu
         GbwH1UiGd0FdOoOGsVNn0BtoWIJRdm8OGWDbrjqbD7hAZ6d/dpy7pauLt2E6Qjc+NdLM
         tUuercAKxUjqHbyY+vqAijC3hOLEGrrwfuGQ8aW9dSNUw+j/Xx8RHX0T/YChcH9rX8XI
         qRoIXCaB1kdarijD5CqXfyhZfESddv2UA3Yk7legVOaMGMAJrNWhbmH0QW3kqx2Sc/XS
         xQLqrlvoCKY90UGMZPbHw/fBPqyGuwLse8b66izIFK4Izf5MkUE4onLL2qm6S2dq8U9j
         b+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i3ZeFLW0tZfqHlZISm5iQNQKhwN5szM40SC3+DB7Jec=;
        b=NE0MB8FBgzfskMzR/3SZTEbpXpyWipmqCnqo1eU50aKIEMP7kubO/LqO45cwo2yv/w
         KSX6yjXS6+1PboY3VAc8dSPVFze9HArNPdITh9PqI9+PzQ4srIdFqQxxSCes99Qq1f85
         Rp3S1D3xk4TT6Mq25A1wmgFVz0bc9ZFu+6UQOt23dd5ByPX1kAwTa8ntCdqgs5KiK7Kk
         rSeqhSUA37DohAOGHNJMa6JfI0U3g/8e0/1mtyYg/AWrWI1279Y2HOIBuVNzdzEi8Ogx
         9rggNqR0CtpjUlEWiA+9kbshaP4SgSGFiIuSs8QMB5gqd6hfW0ut0UBvTNSBE+xSAtN7
         XSGA==
X-Gm-Message-State: APjAAAUD/0IvYIKlqW/f46B5U/z7q93ecQjRHkZSy+eq+4wKKNdlWLxl
        PkwgS3LczN8MCsL6HEVqVy8SAA==
X-Google-Smtp-Source: APXvYqz6/qqGIg9+6XCIhwTyqx31euuHN1nfJJLRxO61z1RD9MygdXVLOHdb/HUCTEAi+bfmk9MVoQ==
X-Received: by 2002:a17:90a:1a0d:: with SMTP id 13mr17092503pjk.129.1577934614654;
        Wed, 01 Jan 2020 19:10:14 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
        by smtp.gmail.com with ESMTPSA id r2sm56108919pgv.16.2020.01.01.19.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2020 19:10:14 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH] riscv: gcov: enable gcov for RISC-V
Date:   Thu,  2 Jan 2020 11:09:54 +0800
Message-Id: <20200102030954.41225-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch enables GCOV code coverage measurement on RISC-V.
Lightly tested on QEMU and Hifive Unleashed board, seems to work as
expected.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 Documentation/features/debug/gcov-profile-all/arch-support.txt | 2 +-
 arch/riscv/Kconfig                                             | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

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
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d8efbaa78d67..a31169b02ec0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -64,6 +64,7 @@ config RISCV
 	select SPARSEMEM_STATIC if 32BIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
+	select ARCH_HAS_GCOV_PROFILE_ALL
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
-- 
2.24.1

