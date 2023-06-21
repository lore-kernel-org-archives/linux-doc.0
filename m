Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7D9EB64D7
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jun 2023 07:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbjFUHWm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Jun 2023 03:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjFUHWm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Jun 2023 03:22:42 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF878183
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 00:22:39 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so7568559e87.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 00:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687332158; x=1689924158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJtAM0L0emx8T5IXtJyi6+wwS3eppT8Ww5R/dqqSfCU=;
        b=xAn7hv2GhspML86OK+9CMBbl4yllWSvz7GtWiNe5kWjztw7kYR099vtWl+qdLljqDR
         xX7L1O5Q9ekcZ4EAiT0t0Br4tUilHxRM2Qs1tLI95j+VUC7elWKK+D+5gBTOqwqcXNWl
         xaEngegewU7PBuQXtJJqZQJ4Y6V3eBJk2hhBefjIVlziB/IvGBf9z0Y/k0LmhJ5HQzhB
         ytKekaJBpOXeqZVMBh+2+UkNz+ob2SF1DEI7+Q2Lo2CAU2SyKvrj6WbICyFtU+XzC3Ef
         OsdlarEYl64xwYAcKUOwVE+3iS1H+DWlq+LtRT+z5Wp9FNBMoKEDcl0w30pLE0dlzuqs
         cziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687332158; x=1689924158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJtAM0L0emx8T5IXtJyi6+wwS3eppT8Ww5R/dqqSfCU=;
        b=Py95I5qhvzeILo9sBf5XjsPlgGGSGzpVPIEe+GzbolAWLJwvT41koOTKsWk/Zcl/6a
         packF5GSexuobqXlUNLvVdNOIB2nFDOTG4UtzgPJ1EwUYQUmuIilsV4O811wfbKUCnW0
         vxRUqCixU7DI76FagQp+4YFEi4js3jDGftBL238gwkNHYUKlCCHQS6UnwHPcNwsRPQsu
         3qTIdAWKbT4i+HnVWhdpjgMG/8UMrb1Ai8ksm2TUmo2YqFJJ3wtsuftVEo13xyHipmBi
         otA5mKwGGR2hfqJWOFnK8YJUjIy6+JkOtkPGSeFjyxmThe57ftIXEKo6P3A6nr3pM7ys
         zWyg==
X-Gm-Message-State: AC+VfDzlEvE01XDwrUTSSMsVJZVSvThdLJ9uGTezNYAUpoyvaU4IGUIk
        A/mrsMW+/bMEF6o5XI6gdOhWzpjpMRUUmSRMiqk=
X-Google-Smtp-Source: ACHHUZ5ldRVlcEfwc998L1BxSn/pP/SIE+aK6aDHYb8bc7cN5x1dLZ7PwHw26+4Fnw1q0bmaT1Yr2Q==
X-Received: by 2002:a19:9142:0:b0:4f6:394d:96c2 with SMTP id y2-20020a199142000000b004f6394d96c2mr8645566lfj.29.1687332158089;
        Wed, 21 Jun 2023 00:22:38 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id f20-20020a7bcd14000000b003f7f2a1484csm4192394wmj.5.2023.06.21.00.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 00:22:37 -0700 (PDT)
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
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 1/3] Documentation: arm: Add bootargs to the table of added DT parameters
Date:   Wed, 21 Jun 2023 09:22:32 +0200
Message-Id: <20230621072234.9900-1-alexghiti@rivosinc.com>
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

