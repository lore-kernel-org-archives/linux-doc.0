Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA45EB64DD
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jun 2023 09:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbjFWJ4A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jun 2023 05:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbjFWJzx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jun 2023 05:55:53 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC7210D2
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 02:55:51 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f954d78bf8so502998e87.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 02:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687514150; x=1690106150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJtAM0L0emx8T5IXtJyi6+wwS3eppT8Ww5R/dqqSfCU=;
        b=NKkG8bNv3EO4QeYMT85sNX4yymCntNQSlDHlNCBUiXhJCFZLTYnc1fxigDu1UDYqjT
         x/WHlYdO1RARm72vbFOKJXt7Xi2B+Gc7a/WaQSbrVle9IwixizNMq29S5TYpy7Lsr2La
         iuQ1s6+4Jt+oah+t9i0eHptytK7zsSCgpuxYNEom/yED+at5UjJcN8Tkw48lkezSp3ZW
         CgEHz9obTkkSzWUlis3Ov9jN3wq4G5X/i2+Uqp2Q8SdXAU4otfDnNsnspefpXF63Vo3w
         juyH31zimZv063v6oUxIjqsuPXY+ALHeFtdf+vqPr3TRwAXtLlJc5Cz6sDKOFfu7VbTq
         FOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687514150; x=1690106150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJtAM0L0emx8T5IXtJyi6+wwS3eppT8Ww5R/dqqSfCU=;
        b=OgrJ4dwpOfAC3ZR54exW0//g+vpWKENIjiB84T37/Etd9BGfyeVfU8QWnkiWIQipZm
         lTselRx9TbhOjTVWCF445Hw5mdi28qwYN5NKkcBYpgUi51ocmcfRKDe2rrtkP6G+BlIE
         DN5yAexswgiR/u0p9IaCyBYjCASG3EFgfM4TBaUmL387gPrQkKimcBBfTw93huB2hMf2
         TX27L5tFD94HyE5JFzlRyIizGk1aqORkrrhhyDor5sgOrpzX/l/PWyD706Q2q22rErPE
         O6n3OA3lJkKD3fhUljeVnPbWYqxDktcu74AcEN3DHESxcTkOPDPkldEIIcN0Usll7exV
         EpkQ==
X-Gm-Message-State: AC+VfDyKJzRWq0zTF8U/l2GY/r52ZafR08OU155NiS+3YMhaZ1jiz3Nw
        NfpzEEOnCLXCs26z2z9aNgRv9A==
X-Google-Smtp-Source: ACHHUZ56QVDSKsm4uhHAhKIZIWN2wRB+s5t+Y+A8bNdb79k8zsowL0ID1EaqAwo4QKkcWaDAMc8Rsw==
X-Received: by 2002:a19:2d01:0:b0:4f8:7568:e94b with SMTP id k1-20020a192d01000000b004f87568e94bmr7651114lfj.56.1687514149706;
        Fri, 23 Jun 2023 02:55:49 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id g17-20020a7bc4d1000000b003f7f87ba116sm1876221wmk.19.2023.06.23.02.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 02:55:49 -0700 (PDT)
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
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 1/3] Documentation: arm: Add bootargs to the table of added DT parameters
Date:   Fri, 23 Jun 2023 11:55:45 +0200
Message-Id: <20230623095547.51881-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The bootargs node is also added by the EFI stub in the function
update_fdt(), so add it to the table.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/arm/uefi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arm/uefi.rst b/Documentation/arm/uefi.rst
index baebe688a006..2b7ad9bd7cd2 100644
--- a/Documentation/arm/uefi.rst
+++ b/Documentation/arm/uefi.rst
@@ -50,7 +50,7 @@ The stub populates the FDT /chosen node with (and the kernel scans for) the
 following parameters:
 
 ==========================  ======   ===========================================
-Name                        Size     Description
+Name                        Type     Description
 ==========================  ======   ===========================================
 linux,uefi-system-table     64-bit   Physical address of the UEFI System Table.
 
@@ -67,4 +67,6 @@ linux,uefi-mmap-desc-ver    32-bit   Version of the mmap descriptor format.
 
 kaslr-seed                  64-bit   Entropy used to randomize the kernel image
                                      base address location.
+
+bootargs                    String   Kernel command line
 ==========================  ======   ===========================================
-- 
2.39.2

