Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F04EB64DD
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jun 2023 09:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbjFSJsV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jun 2023 05:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbjFSJsS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jun 2023 05:48:18 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493E1127
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 02:48:17 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b46f5d236dso17334411fa.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 02:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687168095; x=1689760095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7SPByKyVPiwN/2FqCBqpnqbBRCuyopKfDoQFMlp0Pg=;
        b=bmSQnUrSqleWQxuOOJHziLNGlBJwx1UmYKUBfklFbIAeB8U5h+81cjA0KCNl57VTYO
         rZvlBcOFaUUyFHTEG+yRnEw07mP9+WfL/4Txb116IzGJsUz1ELXUrtn10GHImlG5DJBe
         eBxc6JULv/EB+xxGYnt3+yQ59Zv/vaIxQX2maQOtsQ65MzCZuLdm8K54vr6jp/JNEdcV
         1sgOSt40aD6vKH7ZCysoB8p2tM69MNOZMA7uPedLmtiX4ZHN7gmptkIUHDxb7KmDak2u
         OnUFoPuH+P9Dz6cXFGLciHGUarCskCtl9DMguvm4L443Qw9ECl4f6S75avXowA7wsNye
         +e8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687168095; x=1689760095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7SPByKyVPiwN/2FqCBqpnqbBRCuyopKfDoQFMlp0Pg=;
        b=ii1rcNR0yUg8Lw7z2GSxM0lYCrCFdBoBk85xIRipryldmjgq1DKCU2HpmEPBZziAdo
         5EQPOkYeBBpZRF5Gi4oufD+KYNx9bdhxVkOW4Ll/ZOWb5rwRKdC0/FXSmbWY2YjgqeNj
         UhIL8p3duUODkMRo8U3L/SZFbxKLHKQQGaSEn39RPcQoEzGy9ezEyFhJH9Q8M8uVS4pz
         euQOXWSjj5SrzMRp3lyOwdfgFE09GMEx1aLQVxebjk747HnY91/FsZiZLprHoSlB6LFA
         5uy6NaatD4OD9ngRQONQ5o9tvnopf46tdNXCMPrRpEfcN3WFNr/doUj0TkeU6GWQXs/d
         285Q==
X-Gm-Message-State: AC+VfDy7AAYoBk09kFOaR2DjrhIdig4c9tC/OG55pxrZlN0pnDn9J8Nj
        rkkyobiXZmDvIPL8iyoPhiBaVA==
X-Google-Smtp-Source: ACHHUZ6DUJj3ieHmVMQb0BYF1rpy+Y5YBvOqhmgE2Rm97iwaM6H/IWbHWp57ylDtA+4wY/TOIqW+Sg==
X-Received: by 2002:a2e:9c03:0:b0:2b4:6bc2:a540 with SMTP id s3-20020a2e9c03000000b002b46bc2a540mr1989324lji.15.1687168095301;
        Mon, 19 Jun 2023 02:48:15 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id c25-20020a05600c0ad900b003f18b942338sm10217564wmr.3.2023.06.19.02.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:48:15 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 2/2] Documentation: riscv: Update boot image header since EFI stub is supported
Date:   Mon, 19 Jun 2023 11:47:05 +0200
Message-Id: <20230619094705.51337-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619094705.51337-1-alexghiti@rivosinc.com>
References: <20230619094705.51337-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The EFI stub is supported on RISC-V so update the documentation that
explains how the boot image header was reused to support it.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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

