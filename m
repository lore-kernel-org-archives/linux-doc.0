Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058E5C74A5B
	for <linux-doc@archiver.kernel.org>; Wed, 29 Mar 2023 08:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjC2IWy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Mar 2023 04:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbjC2IW1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Mar 2023 04:22:27 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA344C1C
        for <linux-doc@vger.kernel.org>; Wed, 29 Mar 2023 01:21:38 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id d17so14734718wrb.11
        for <linux-doc@vger.kernel.org>; Wed, 29 Mar 2023 01:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680078096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WewY0DznJP4LApS0GHZeFjLTcqljUJT3mfDrQD/hrs=;
        b=1j+yjVFzgDuEqDrH3wcL6j4lDQph105p+FxdB5PlVelAMl/atkJx91n8nnhjNlyp6k
         7Gchfj9ofuRnBYEFoSDWibQG3PxSjm9l61j4kHzr8i3kVMlF87wXOxuwfN4mSZ02XkFg
         91aUrbYiXIew8Kpm4w38L75Zj1fphTKi5aofFqGKGt6hZ/PSfbmth0UQp1zROHzqoZZr
         otCGq5bPYPDSFRTxrfstKQBTB9JshQK4VEgcOku7pf5LIZr0GintP9TO+jF0EmetGLOb
         5r1B68Pgd0pIIQx7+0Uxgx3l181h/felieYAM64eli3GDO0cx7G2+sLlKMlm1nSo2XE9
         Yd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680078096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WewY0DznJP4LApS0GHZeFjLTcqljUJT3mfDrQD/hrs=;
        b=gK6T+m7/uQAik0prMNBRUcSVrZW+3dZPjYwnFBArdXhtB9k2X7mWsBrxG+mHhlo2ev
         Zys0ejs2dDDjGG4NBIHFh2bT/l09zkNrnIBDKvCOb2qYYjdi+MmSxs+QcrvFSHmLC5pz
         pDhs0b1b65PGj6j2nRzrZt/Zg7TXNkP6YkDhALcv6sYABK5jftpIwZxqXcqbzSSjeeXP
         d9gkjYTQ+HXcRERMNcXzysr3ZmUfU9f7mJbW3q8Q/6ITVdbVJlnNyrzFj+ipSgkrJqMZ
         nAlb09i8Z0IifeIffxoNImouD06OjSGcd9SiMSonvyNCXspPrp002Y0PL878gd949L0U
         RCTA==
X-Gm-Message-State: AAQBX9ffJ088NFMaLIoJFGH4CgeVz43+bWxAsc7JvTWEDiig4T3Ynppm
        qJABu4OXhh7HcWUDx9EaMi04Ng==
X-Google-Smtp-Source: AKy350Z+kqeHRHKVqi6mrMxS4VxHHOKVytdbwzxF+3lbgNW435IPFEJEmKiv6Ii7I0mVXVrMHAdayQ==
X-Received: by 2002:a5d:674e:0:b0:2d2:74d6:6f79 with SMTP id l14-20020a5d674e000000b002d274d66f79mr15795845wrw.59.1680078096581;
        Wed, 29 Mar 2023 01:21:36 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a10-20020a056000050a00b002d78a96cf5fsm22499173wrf.70.2023.03.29.01.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:21:36 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes v2 2/3] riscv: Do not set initial_boot_params to the linear address of the dtb
Date:   Wed, 29 Mar 2023 10:19:31 +0200
Message-Id: <20230329081932.79831-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329081932.79831-1-alexghiti@rivosinc.com>
References: <20230329081932.79831-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

early_init_dt_verify() is already called in parse_dtb() and since the dtb
address does not change anymore (it is now in the fixmap region), no need
to reset initial_boot_params by calling early_init_dt_verify() again.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/setup.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 542eed85ad2c..a059b73f4ddb 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -278,10 +278,7 @@ void __init setup_arch(char **cmdline_p)
 #if IS_ENABLED(CONFIG_BUILTIN_DTB)
 	unflatten_and_copy_device_tree();
 #else
-	if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
-		unflatten_device_tree();
-	else
-		pr_err("No DTB found in kernel mappings\n");
+	unflatten_device_tree();
 #endif
 	misc_mem_init();
 
-- 
2.37.2

