Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680D2EB64D7
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 14:38:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjFZOif (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 10:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbjFZOie (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 10:38:34 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 860AE10C2
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 07:38:32 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f9b4bf99c2so43697925e9.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 07:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687790311; x=1690382311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pQzPxsmpV8ILmUDokZDt4x2j1OZGQdakvLzX04+Ejg=;
        b=uex3RA9qERfNnTukZWjHbvUoE92GRFB/vSd/56SJYlEKAAJOF2wGlzoyFo3yf4A7FF
         8ZBC9aYsVrrNL+HjSWxsFPpv7zb5e08DTroI6Woc8a03XoBhet2OAK6/2JlRryOIeOd3
         I8zI/yrigzMZuoa1Zlpi1pg/KbAe/zkTjZCzFYbA5MTv+E2k183GmHQwYbZH4d/8RKxM
         JYnOoOnOBhieWlLKxAQoXKiQiFFGGXVm8UL/CZsOzQLSSYXhOmr5G1NMtpRzsMCWp490
         AMw2oa2keFry57qcMCFzDn0xN53dGJAe57lsQnHdwyA3ycjoFgAKQdN2+0C18QPEehNu
         cxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687790311; x=1690382311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pQzPxsmpV8ILmUDokZDt4x2j1OZGQdakvLzX04+Ejg=;
        b=i6yzGf3W2Y9ctrr5OL2xRJZ++3RRx3bMS4jCJFLjBxiCsRiQH0/UvrQ9LhVA4yGY5N
         aAKLZBXwbXkSAFeTNnP+hdxabO13lg64VlK1FEM2dK96XCnWB5Wo0UTnv/R014olVQwl
         9iopjJGuVi8phjGVL51CLKDhQXv4cjzpA7e4sB8kQfUj9ahO1By1k1ZaFQz4ONVltOyo
         rhX7viYVNTgp4rY7ckgGJDh/606mUmQglzK1KeGjgQIWtn3QrAR5G3Q/2J8vDuMeukLL
         BZ/tN7rkzdTYNigoca9+BU37dn5WogXpFrAsTzED1kXHaWozBtD5tigGLXbLV4La0RPM
         l09w==
X-Gm-Message-State: AC+VfDyGMteq7AjPHKR37R0/Ls/oOvqZHNkGgRAK1gFFtHxYyiZGwHrH
        7qsWVIo8xyb2lxFKIXHvT8Dz8g==
X-Google-Smtp-Source: ACHHUZ7/qbfak7GDtutZM70XhoxLKa1hwP1sqmQFIrzcjpha6OqsXY/O69sqJLYVDFnJ+mapPWzwAQ==
X-Received: by 2002:a7b:cd97:0:b0:3f9:a6f3:f23c with SMTP id y23-20020a7bcd97000000b003f9a6f3f23cmr18047670wmj.36.1687790311012;
        Mon, 26 Jun 2023 07:38:31 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v2-20020a5d6782000000b00313f5babb18sm1644944wru.9.2023.06.26.07.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 07:38:30 -0700 (PDT)
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
Subject: [PATCH v4 3/3] Documentation: riscv: Update boot image header since EFI stub is supported
Date:   Mon, 26 Jun 2023 16:36:26 +0200
Message-Id: <20230626143626.106584-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626143626.106584-1-alexghiti@rivosinc.com>
References: <20230626143626.106584-1-alexghiti@rivosinc.com>
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

