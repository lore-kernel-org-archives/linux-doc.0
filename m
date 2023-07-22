Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E2CEB64DA
	for <linux-doc@archiver.kernel.org>; Sat, 22 Jul 2023 11:37:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjGVLhP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 Jul 2023 07:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbjGVLhO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Jul 2023 07:37:14 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7236826A5
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 04:37:07 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbea147034so22231215e9.0
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 04:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690025826; x=1690630626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dia79abijhqNuyOI1X7cuUqq5ei10OSh1lyxFY8ZqEI=;
        b=gFee1fF2iHGRz/47PvRpgdT+WGD2XMVbRI8srdPWpV/H/ekYNozwb9X2w7LVg1vhqJ
         dJhrqklruLlhNCN9gBDAU0H1z3leeaE+LMDwDyXzMIvQBbqQs2yqQpqSb3wtDy/Vhu4C
         wPeyOXc4bW50dYHy2+gn9P0XAT9YoOfoFyEo33miDMeQZbfIVrqoqInBJEbGD4UxPbqf
         S/3gIVuW5No5OH8wZE2MwF0L8GweSWBRAp+rFhmLLi/ymXv5NKZ1C1FOwVOyi1VQ/P4E
         34BJHPg2i0pWbYC8Fa9RfQUcOaqipWJCDB2TPdtLBxNakWNze1BE2ThgCD3uk3x/b4jx
         RqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690025826; x=1690630626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dia79abijhqNuyOI1X7cuUqq5ei10OSh1lyxFY8ZqEI=;
        b=K5PtK0tw5qWOsSJDWux+vDtkiv0sth2h8xEzdVc1PNLtQC+JAM+e5c74N+SihZFmOw
         E5sNK8HoBUn1qZ+6C4GrII5J7aEf7albBr3IkBKboI39CiSL4apygfvOlcUP5JYfS9Dy
         +p69tWQW+QjNuu3bIL/ylsoptsXa0tZj4aB4ZsDmBJewsPj3aCtVq7KvreA4tLvN9Rk8
         SnDLfbKeKo5qqZLmFdL1KaEBiS4Cp14Tn4ry9AW9WodLPZuDlG3m5z5SCkmXK44OT/Zs
         KCKN6/CSUcq/9Z5bHoJsLhAbHi0XN4P1pfnxuxxheeMVvw1uoz7XsK0zBNnjEPR1P68J
         ehmA==
X-Gm-Message-State: ABy/qLZLRULWJHYfh+Pz8WrewFI8juIKcd7IzCeX5W9Jxz45K3/S4U4V
        vgr/TOdT05xR3mp4763D9yuAQw==
X-Google-Smtp-Source: APBJJlHdUFYwWBgP9YwVZejWD0BEkyDQp4m0NFOwqwPjXSpnUNHV74dw2XItoce9Xsv4xVzhgDkR1A==
X-Received: by 2002:adf:f3c5:0:b0:314:32b6:af3 with SMTP id g5-20020adff3c5000000b0031432b60af3mr2740008wrp.5.1690025825975;
        Sat, 22 Jul 2023 04:37:05 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id c16-20020adfe750000000b0030fb828511csm6728788wrn.100.2023.07.22.04.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 04:37:05 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Song Shuai <songshuaishuai@tinylab.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Atish Patra <atishp@rivosinc.com>,
        Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 3/3] Documentation: riscv: Update boot image header since EFI stub is supported
Date:   Sat, 22 Jul 2023 13:34:45 +0200
Message-Id: <20230722113445.630714-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230722113445.630714-1-alexghiti@rivosinc.com>
References: <20230722113445.630714-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The EFI stub is supported on RISC-V so update the documentation that
explains how the boot image header was reused to support it.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
- Changes in v5:
  * Rebase on top of docs-next

 Documentation/riscv/boot-image-header.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/riscv/boot-image-header.rst b/Documentation/riscv/boot-image-header.rst
index a4a45310c4c4..df2ffc173e80 100644
--- a/Documentation/riscv/boot-image-header.rst
+++ b/Documentation/riscv/boot-image-header.rst
@@ -28,11 +28,11 @@ header in future.
 Notes
 =====
 
-- This header can also be reused to support EFI stub for RISC-V in future. EFI
-  specification needs PE/COFF image header in the beginning of the kernel image
-  in order to load it as an EFI application. In order to support EFI stub,
-  code0 should be replaced with "MZ" magic string and res3(at offset 0x3c) should
-  point to the rest of the PE/COFF header.
+- This header is also reused to support EFI stub for RISC-V. EFI specification
+  needs PE/COFF image header in the beginning of the kernel image in order to
+  load it as an EFI application. In order to support EFI stub, code0 is replaced
+  with "MZ" magic string and res3(at offset 0x3c) points to the rest of the
+  PE/COFF header.
 
 - version field indicate header version number
 
-- 
2.39.2

