Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28A0C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 18 Nov 2022 17:16:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242515AbiKRRQi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Nov 2022 12:16:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242525AbiKRRQd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Nov 2022 12:16:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE18942E8
        for <linux-doc@vger.kernel.org>; Fri, 18 Nov 2022 09:16:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 10217B8243B
        for <linux-doc@vger.kernel.org>; Fri, 18 Nov 2022 17:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D29C433B5;
        Fri, 18 Nov 2022 17:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668791771;
        bh=5YPCMtSudsRWbegWUYgcmmhxe/oN7JAwlQaeo32XQ2E=;
        h=From:To:Cc:Subject:Date:From;
        b=Hvr0aRSi5Ym/Vx37FB8oFTXjD3VJVmDw/+Ty65nQblavVuPbV2kvWda0oNqdYYPP7
         GuA0j0/8JaDpkc2aCnc0X5Qod0GA0BlZaklZUGWyKs0o4FhJNZAxFqX6RNrMt6QcMv
         gmOtGU35th8XhGywEKpja4AH8SCFQfBtduXQhSNyr438jpT1ZbSMrR0YoWogslAcYo
         OOG3BaWhf5O1TpHAc7j33Tq8fuIHQ0QCWEkRTTPzE03umtwfEhy50l8uZlsDbHrI9o
         oM5mEzYcne1LvEBiwU32MkmI5bD94zyNzg7DQQV1VnOx/LIblDS1B9tzV6lMvHa6Zm
         Zch6LUjrowEBg==
From:   =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>
Cc:     =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v2] Documentation: riscv: Document the sv57 VM layout
Date:   Fri, 18 Nov 2022 18:15:56 +0100
Message-Id: <20221118171556.1612190-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Björn Töpel <bjorn@rivosinc.com>

RISC-V has been supporting the "sv57" address translation mode for a
while, but is has not been added to the VM layout documentation. Let
us fix that.

Signed-off-by: Björn Töpel <bjorn@rivosinc.com>
---
v2: * Cosmestics (Alex)
    * Corrected kasan address (Alex)
---
 Documentation/riscv/vm-layout.rst | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index 5b36e45fef60..3be44e74ec5d 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -97,3 +97,39 @@ RISC-V Linux Kernel SV48
    ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
    ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
   __________________|____________|__________________|_________|____________________________________________________________
+
+
+RISC-V Linux Kernel SV57
+------------------------
+
+::
+
+ ========================================================================================================================
+      Start addr    |   Offset   |     End addr     |  Size   | VM area description
+ ========================================================================================================================
+                    |            |                  |         |
+   0000000000000000 |   0        | 00ffffffffffffff |   64 PB | user-space virtual memory, different per mm
+  __________________|____________|__________________|_________|___________________________________________________________
+                    |            |                  |         |
+   0100000000000000 | +64     PB | feffffffffffffff | ~16K PB | ... huge, almost 64 bits wide hole of non-canonical
+                    |            |                  |         | virtual memory addresses up to the -64 PB
+                    |            |                  |         | starting offset of kernel mappings.
+  __________________|____________|__________________|_________|___________________________________________________________
+                                                              |
+                                                              | Kernel-space virtual memory, shared between all processes:
+  ____________________________________________________________|___________________________________________________________
+                    |            |                  |         |
+   ff1bfffffee00000 | -57     PB | ff1bfffffeffffff |    2 MB | fixmap
+   ff1bffffff000000 | -57     PB | ff1bffffffffffff |   16 MB | PCI io
+   ff1c000000000000 | -57     PB | ff1fffffffffffff |    1 PB | vmemmap
+   ff20000000000000 | -56     PB | ff5fffffffffffff |   16 PB | vmalloc/ioremap space
+   ff60000000000000 | -40     PB | ffdeffffffffffff |   32 PB | direct mapping of all physical memory
+   ffdf000000000000 |  -8     PB | fffffffeffffffff |    8 PB | kasan
+  __________________|____________|__________________|_________|____________________________________________________________
+                                                              |
+                                                              | Identical layout to the 39-bit one from here on:
+  ____________________________________________________________|____________________________________________________________
+                    |            |                  |         |
+   ffffffff00000000 |  -4     GB | ffffffff7fffffff |    2 GB | modules, BPF
+   ffffffff80000000 |  -2     GB | ffffffffffffffff |    2 GB | kernel
+  __________________|____________|__________________|_________|____________________________________________________________
-- 
2.37.2

