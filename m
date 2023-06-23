Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E48CEB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jun 2023 09:57:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbjFWJ54 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jun 2023 05:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbjFWJ5z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jun 2023 05:57:55 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C362F189
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 02:57:53 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f9c532f9e3so5943575e9.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687514272; x=1690106272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pQzPxsmpV8ILmUDokZDt4x2j1OZGQdakvLzX04+Ejg=;
        b=DRlPNLsK/mZ3irMEYdZmnmDdlPds7DvI5au6/NXLEmObZ0q2j+riTTvnF4pnaba5Eb
         DH2TXjFL5OFBSrzNE1j4a5aGqGz48UHjYrVhZd3wVtPnW2C22JGEuGjsrq+JpfMRJV2k
         MkWPC6wPxJC27j2xRo0NYQY4kjlkcSDEwr9JRvSSwtmlCEF3IowczoAHbtWW345VGYQr
         DLQu/ZwtBg6Q81ga1VMS7w7OdSttnxx7sF4T278R3LjJ8THYdUsFWjekXwF9VxCxViVY
         kF8/QayqIlynx9XhIUmUIXrLU/LQ5y0rz+dMU2qOPVvjSn5y1zTvusx3LzoxEB2uMWUr
         2K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687514272; x=1690106272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pQzPxsmpV8ILmUDokZDt4x2j1OZGQdakvLzX04+Ejg=;
        b=MC9g9DukUUcoXnib/T7cOk1NgaFly0Qf0J+lV/PA93dmK4iCWrMoG8tAzXfxJrco82
         sPPATMVcZOp+y2IzCIaRe147OH43IpY1dgQBK6D23LEDE4x1I98D09EYXUuEyF5W5v6y
         /Z7PVgWL8Ar7WGVmLkMlow+p+R+fce9LR7VZeab6re5Ygw4lfY25J42L3UhAIB3loZE5
         TjHhkh5xvOK9G13NP+xDxGrX3RMPENgSzF9K2qTHBPLNrePqwZWwhq61WIFF378/zTwk
         87e8uCm1Rioq8Tb1VkTKY/bJeO/uSHkJJfJ+d2TdS37XP+80MhhFW1KPtCdEiQaq4i2U
         Ajzw==
X-Gm-Message-State: AC+VfDxUk2B9fM6aXV3R2D45722c6dsD2KXa17XzU6s2+iuY+PipgBt4
        23bsMe75y/jut9Q0XSFcv9lQCg==
X-Google-Smtp-Source: ACHHUZ7JjYmbOrvMcpUGZTC3uEGAoLXqDRseSay3/vHcvG0f5A9N3KF1iNgjt3GTjbTfRCaqYSCqCQ==
X-Received: by 2002:a05:600c:230b:b0:3f1:6fb3:ffcc with SMTP id 11-20020a05600c230b00b003f16fb3ffccmr17377352wmo.22.1687514272211;
        Fri, 23 Jun 2023 02:57:52 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id s9-20020a7bc389000000b003fa745f3264sm1824671wmj.43.2023.06.23.02.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 02:57:52 -0700 (PDT)
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
Subject: [PATCH v3 3/3] Documentation: riscv: Update boot image header since EFI stub is supported
Date:   Fri, 23 Jun 2023 11:55:47 +0200
Message-Id: <20230623095547.51881-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623095547.51881-1-alexghiti@rivosinc.com>
References: <20230623095547.51881-1-alexghiti@rivosinc.com>
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

