Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6270CEB64DD
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jun 2023 07:24:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbjFUHYw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Jun 2023 03:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbjFUHYm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Jun 2023 03:24:42 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC101703
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 00:24:41 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f9b4a715d9so21263045e9.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 00:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687332280; x=1689924280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQDRIqOL25lhh2vW3phUacbtXDC/Hgmm9aSu83e6n78=;
        b=x1xZiuScOCs29m4m9pPxoAs5kRoFSS8kxXOiTaBfJ84sHlZ9664m08lrFjOAnyDA4r
         GluBnz5W9XdgDQlJieE05espwRJ5BGtnyYHjFfqLuhWKNHyQE1V2OdOEs4WGtJhkdYyn
         E+6c9H8DAwTdQPWh30EDyF57rZuBbWHtfrXwoSV4LKYvcueXWpyMmAdPQmF0MEGZYr5e
         9YckhhDptG8R6YxttjX08SH+x19OGMv610eFAoRiuDeCaW0qu+1iANLvc61fDTNQPY6e
         JNNWraib49EaorsHJkrKw0gA+RDawGSsyjhtJJxTtvJtamcBuDPdHPuURmVMCHTQR8jW
         oPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687332280; x=1689924280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQDRIqOL25lhh2vW3phUacbtXDC/Hgmm9aSu83e6n78=;
        b=U35l8D9PKmypo9k+x5PMc6TyQA6V5I2jB/sMxy7VIyANPyy3jSNs39zTsCeI00wMMx
         A5vY0uSWzf51CTEEE9FkqtwO5WsKnf1Kuha/ctShPOJhrSQ/F/S8lgY8KQVIxmP7aL/0
         NFg1hWbB/9gL/yJHiKii2Xz5Ok2mf597l1dl+FFYDsHfMWLoYCa1vz2dY3we0zcxVnS7
         FhtzqXhHqrcYbZsJG/X5dnHmcjwF/tEZlWK0YJdPOUzl2ffoSfGJtkVboTCM/qHquBDl
         W/2Q79aX99S33Zoeqy6UhpnxLihSgyp97a/4nNOFs2H6nAaIUCHC8ZEHM1ptINV2BJgV
         msbw==
X-Gm-Message-State: AC+VfDxK3+N5BOOfC5AlJti7Rr+6KltymfrxBLm29e6uS6Q4MjbHXLc2
        cGKVClUs3YLmFOlF5z7Eor6lew==
X-Google-Smtp-Source: ACHHUZ4dJReKgFWz4Rz1T/e3oc9QKQiJxhIA69ZtlRzSniyGxM7KjXFjlMVaX3q3cDTgs0tucWV0Iw==
X-Received: by 2002:a05:600c:ad2:b0:3f9:bb86:bdd3 with SMTP id c18-20020a05600c0ad200b003f9bb86bdd3mr1606118wmr.7.1687332280108;
        Wed, 21 Jun 2023 00:24:40 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c210f00b003f18b942338sm4181118wml.3.2023.06.21.00.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 00:24:39 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Song Shuai <songshuaishuai@tinylab.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 3/3] Documentation: riscv: Update boot image header since EFI stub is supported
Date:   Wed, 21 Jun 2023 09:22:34 +0200
Message-Id: <20230621072234.9900-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621072234.9900-1-alexghiti@rivosinc.com>
References: <20230621072234.9900-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The EFI stub is supported on RISC-V so update the documentation that
explains how the boot image header was reused to support it.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
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

