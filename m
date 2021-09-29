Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3264C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 29 Sep 2021 14:57:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAAE76142A
	for <linux-doc@archiver.kernel.org>; Wed, 29 Sep 2021 14:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344801AbhI2O7Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Sep 2021 10:59:25 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54398
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344777AbhI2O7Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Sep 2021 10:59:24 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E24113FE02
        for <linux-doc@vger.kernel.org>; Wed, 29 Sep 2021 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632927462;
        bh=OQKNU2zsWxm9Jo/LuBgWw8xEdpf0SBZ+oU39CLxAstw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=QXbTcDat8bahnrgDcpSWmEir2E4aqRm5zRmQ1nu4e7UyPzZg4MNMcynVmfxCiMlwv
         IeSsj9ggUBsRN/0peKAMPDlGxAANJ8cvfAYU4+2mgFek4h/hnawOACdsaoUwYVSheY
         aTkRwgwadZN6seK1kx5cSQcUZOD3TpaFjuinH9McxFfV0bfICLZr4j0PYwptf9fwU2
         vjuXoqrudYYe23qAShgAdLpc+32e94vTfx6f+/wRgzdzwBX7m1PnrW6tjuMr4+yjip
         XIjkf5cz2ENHjR5E/lZxoew9jqkmrKwnGhV1wOVkCWi9B5DxJyr/a6isVMshul/mxc
         FGK/EfqtxxYFw==
Received: by mail-wm1-f70.google.com with SMTP id 5-20020a1c00050000b02902e67111d9f0so1341927wma.4
        for <linux-doc@vger.kernel.org>; Wed, 29 Sep 2021 07:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OQKNU2zsWxm9Jo/LuBgWw8xEdpf0SBZ+oU39CLxAstw=;
        b=7FvgxMTz/98vFhOfCN6RiE2N1OuSko0hoiVNXQ2XoUUWDClDP2Y4qztRLuannJp+MW
         AuNCWVZ85TNmJVgS3vH+iu+vaCmmpEDWOnuZhHoIsF7Mm3a1EM4HFEF6ipbDaMR0SzQc
         aMMqSWxV5WZUCZ2vI0n5548pGQ5en7ksUUZZP5WV6kOw+EMpXE2yRHe0DqYy7hZTzObJ
         75zUYwyUpTz5zp2t8Dmsnb+LGpceSRxzZRQJYJO4sXn+aU3iY7pTJzUVOaCASdnmz1Oa
         r8K/DJdB7MfvVPKV3QpOwa2cKlQTTbBJdqL/WwB54zS+ziVs8a3950W52DXe3XcDwKv3
         nu/A==
X-Gm-Message-State: AOAM531VegcD2/JFTcJvD1atnchqIXg27f7komPIRgavx0+9fRPhYZik
        lYsyt6eaMjU8HXnF783j+m0bg1Woc0mNZ6r7/ppFcgdNUs0zLjF5oG7UJKSTSSa3WqG5fLDa7hP
        xsrOnuwxw2BENxL52NQckwDeXZ8En77hm/Z2AYg==
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr370313wrb.56.1632927462558;
        Wed, 29 Sep 2021 07:57:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWeSWC8Cet11Ro5/xO8f14KgL4rhrNIaUyTxHnc/lR/+aHCeqyv0GI/LbfJlrDouaKDo8Q7w==
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr370287wrb.56.1632927462418;
        Wed, 29 Sep 2021 07:57:42 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id a25sm1888009wmj.34.2021.09.29.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 07:57:42 -0700 (PDT)
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
        Atish Patra <Atish.Patra@wdc.com>,
        Christoph Hellwig <hch@lst.de>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
        Mayuresh Chitale <mchitale@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
Cc:     Alexandre Ghiti <alexandre.ghiti@canonical.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v2 06/10] riscv: Explicit comment about user virtual address space size
Date:   Wed, 29 Sep 2021 16:51:09 +0200
Message-Id: <20210929145113.1935778-7-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Define precisely the size of the user accessible virtual space size
for sv32/39/48 mmu types and explain why the whole virtual address
space is split into 2 equal chunks between kernel and user space.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/pgtable.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2f92d61237b4..fd37cc45ef2a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -664,6 +664,15 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 /*
  * Task size is 0x4000000000 for RV64 or 0x9fc00000 for RV32.
  * Note that PGDIR_SIZE must evenly divide TASK_SIZE.
+ * Task size is:
+ * -     0x9fc00000 (~2.5GB) for RV32.
+ * -   0x4000000000 ( 256GB) for RV64 using SV39 mmu
+ * - 0x800000000000 ( 128TB) for RV64 using SV48 mmu
+ *
+ * Note that PGDIR_SIZE must evenly divide TASK_SIZE since "RISC-V
+ * Instruction Set Manual Volume II: Privileged Architecture" states that
+ * "load and store effective addresses, which are 64bits, must have bits
+ * 63–48 all equal to bit 47, or else a page-fault exception will occur."
  */
 #ifdef CONFIG_64BIT
 #define TASK_SIZE      (PGDIR_SIZE * PTRS_PER_PGD / 2)
-- 
2.30.2

