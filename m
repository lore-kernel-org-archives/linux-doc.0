Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D2AFA3741
	for <linux-doc@archiver.kernel.org>; Mon, 31 Oct 2022 18:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiJaSDd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Oct 2022 14:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiJaSDU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Oct 2022 14:03:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E52513DD6
        for <linux-doc@vger.kernel.org>; Mon, 31 Oct 2022 11:03:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BDCCF6136A
        for <linux-doc@vger.kernel.org>; Mon, 31 Oct 2022 18:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8D7C433D6;
        Mon, 31 Oct 2022 18:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667239392;
        bh=6hLhv+fhob8SuiCdW0Sjii1D67SU+WLSGSUTJSSJMmQ=;
        h=From:To:Cc:Subject:Date:From;
        b=gHXlioRqoYUBBQqA7T0h2aYS98UB6xYj7IvAk+yDmLFQF7FXS8MRG/AQYw8c2PT9o
         LgYCBXrBJNximFnSiOhvkYFq9Bhm13T84nAMK1E83Rco0SgaPTyFEkhQJQPuR2Dnct
         qJHWpji2JezektP3mBJv8grR7Dy7Cd13c6NaAo1EZ8suBrOe5+Qqq13ByIHEJTEzBb
         hwKMtqvp5dONsMq6xmgxRFi74nwdS3MVitCYmUEbAG/7vYWOFIDkRbsmoMuTX7RYjw
         gIwjuSVI5pOSln/DZtFYdt4R3kBAJXKEkKMh7YrXEcVz5DX5rUm8fLa44bc+5BX50g
         P1oes82KhzntA==
From:   =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org,
        Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc:     =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: riscv: Document the sv57 VM layout
Date:   Mon, 31 Oct 2022 19:02:30 +0100
Message-Id: <20221031180230.1420544-1-bjorn@kernel.org>
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
 Documentation/riscv/vm-layout.rst | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index 5b36e45fef60..35f76798b6e4 100644
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
+   0000000000000000 |    0       | 00ffffffffffffff |   64 PB | user-space virtual memory, different per mm
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
+   ff1bfffffee00000 |  -57    PB | ff1bfffffeffffff |    2 MB | fixmap
+   ff1bffffff000000 |  -57    PB | ff1bffffffffffff |   16 MB | PCI io
+   ff1c000000000000 |  -57    PB | ff1fffffffffffff |    1 PB | vmemmap
+   ff20000000000000 |  -56    PB | ff5fffffffffffff |   16 PB | vmalloc/ioremap space
+   ff60000000000000 |  -40    PB | ffdffffeffffffff |   32 PB | direct mapping of all physical memory
+   ffdfffff00000000 |  - 8    PB | fffffffeffffffff |    8 PB | kasan
+  __________________|____________|__________________|_________|____________________________________________________________
+                                                              |
+                                                              | Identical layout to the 39-bit one from here on:
+  ____________________________________________________________|____________________________________________________________
+                    |            |                  |         |
+   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
+   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
+  __________________|____________|__________________|_________|____________________________________________________________
-- 
2.37.2

