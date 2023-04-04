Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A885C77B60
	for <linux-doc@archiver.kernel.org>; Tue,  4 Apr 2023 18:26:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236219AbjDDS0s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Apr 2023 14:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236381AbjDDS0M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Apr 2023 14:26:12 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D4972A4
        for <linux-doc@vger.kernel.org>; Tue,  4 Apr 2023 11:23:37 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id u10so32142221plz.7
        for <linux-doc@vger.kernel.org>; Tue, 04 Apr 2023 11:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gqxa4spepTnsUwVbNTwSWIuFxwC658E+AuuPxXktYUk=;
        b=kAvoNYqdv/gD8yskD/3UsIZZx/i7x6fcbhJrbItIXOVXMaf2J/ZphfqXiq9a0kB1u6
         PmIxtinJIL/VK4LPrFwgURCxv3uMUJaXR8WupowGpRdbZYxe85vGf7ADA3kpdGLGAjbw
         doyBX/v48bQyNdsiTbpiqy+9xqhSQ/wjueeo3mWjHXI7j5kcoXr3GBMPSRO6QBlcfYJL
         R/rE84Q8SYe+o93Fsj2ITB9DYOXg1jXgXV57Lpo/XLRh+NBFQ/p1nNn9hZqy4KxK2o/2
         A9STBeEYXkETh3CnhrVKqaS3widasWrESAX5SSaNCUkVwZAhEOTn5+5CcS1XD6b614hV
         WsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gqxa4spepTnsUwVbNTwSWIuFxwC658E+AuuPxXktYUk=;
        b=R3IYUDyPVPutq50KoRBcF5J0ZY6pWbk2f/JftCesS2TivUVyYCwyxUegPtPbeZ/oq/
         342ybXhRRo/iRoyQToouzB1rPBEvOWCSdpu0oxeg+oDZ7yGEPIrSiTCn/0dqAdzF2iht
         45GgfyBNPwbYxPlJxlrfuqV5ry9GNg1impUha6crQZ8UzWGvUFju9Se/248gwgk16LZt
         H5YpmOWXiPZkNnmuWRL9Z1UCLIW9vnnGWfkdo38LZQVeOOPi0ch+HZADXIaSUm7axAGa
         gcIgLtGEzb5z7WBD5XrhcDPVA5YAJG6kJWhMbfgYcPE7f0B0zgr1Zj1oUBOpe0ovcT2I
         lDcg==
X-Gm-Message-State: AAQBX9cFKHS8L/QybNYhUcH/f1GZYtfgLeF78qCFAxvPCiJIii+al5d5
        jbYfclIxpJbZ0che8WVYy819Myskxg3rx9D8/Uc=
X-Google-Smtp-Source: AKy350bWUm4xmbDDUw2nmPYP8Z7MtcO7/jXhnD91vBLbrD3SWPHhJwbKHL30pf+O4r7dr/bP2clOAg==
X-Received: by 2002:a05:6a20:6687:b0:db:6a5a:3ce7 with SMTP id o7-20020a056a20668700b000db6a5a3ce7mr2798195pzh.12.1680632608339;
        Tue, 04 Apr 2023 11:23:28 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:23:28 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Weili Qian <qianweili@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Marc Zyngier <maz@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V4 23/23] crypto: hisilicon/qm: Workaround to enable build with RISC-V clang
Date:   Tue,  4 Apr 2023 23:50:37 +0530
Message-Id: <20230404182037.863533-24-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With CONFIG_ACPI enabled for RISC-V, this driver gets enabled in
allmodconfig build. The gcc tool chain builds this driver removing the
inline arm64 assembly code. However, clang for RISC-V tries to build
the arm64 assembly and below error is seen.

drivers/crypto/hisilicon/qm.c:627:10: error: invalid output constraint '+Q' in asm
                       "+Q" (*((char __iomem *)fun_base))
                       ^
It appears that RISC-V clang is not smart enough to detect
IS_ENABLED(CONFIG_ARM64) and remove the dead code.

As a workaround, move this check to preprocessing stage which works
with the RISC-V clang tool chain.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/crypto/hisilicon/qm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
index e4c84433a88a..a5f521529ab2 100644
--- a/drivers/crypto/hisilicon/qm.c
+++ b/drivers/crypto/hisilicon/qm.c
@@ -611,13 +611,9 @@ EXPORT_SYMBOL_GPL(hisi_qm_wait_mb_ready);
 static void qm_mb_write(struct hisi_qm *qm, const void *src)
 {
 	void __iomem *fun_base = qm->io_base + QM_MB_CMD_SEND_BASE;
-	unsigned long tmp0 = 0, tmp1 = 0;
 
-	if (!IS_ENABLED(CONFIG_ARM64)) {
-		memcpy_toio(fun_base, src, 16);
-		dma_wmb();
-		return;
-	}
+#if IS_ENABLED(CONFIG_ARM64)
+	unsigned long tmp0 = 0, tmp1 = 0;
 
 	asm volatile("ldp %0, %1, %3\n"
 		     "stp %0, %1, %2\n"
@@ -627,6 +623,11 @@ static void qm_mb_write(struct hisi_qm *qm, const void *src)
 		       "+Q" (*((char __iomem *)fun_base))
 		     : "Q" (*((char *)src))
 		     : "memory");
+#else
+	memcpy_toio(fun_base, src, 16);
+	dma_wmb();
+#endif
+
 }
 
 static int qm_mb_nolock(struct hisi_qm *qm, struct qm_mailbox *mailbox)
-- 
2.34.1

