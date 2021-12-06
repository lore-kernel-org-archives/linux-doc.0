Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD65C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 10:56:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241965AbhLFK76 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 05:59:58 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48316
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241946AbhLFK75 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 05:59:57 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4ACA53F1F7
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 10:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638788188;
        bh=CS+lflLGdqIBScWk3+o9lUxh8jVqR8Nq2WKSyjwTWok=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=kRQvGMmQbwuxrGCad0acS+UGXUGGVmvUr4mRKUgt8rHEOMcve4eyFknePpdsT746v
         SS6OxmxtIpZbVX1X21I7NjyK1DTWV1nS8pjNcJ1mr6CZ2fSal4r8cU5TviNX0+jv/7
         oPMP5l8JvSIDIJ0DYdCDZ596F/QyxwbF45GuIY+yC+xfYZH3bEHeZbK5c9VKnOEAwM
         g32jxTT33g+qtNGvlyF0DUQuVEROczp0r6vlU5bckHFnFDtnWjuJfWeJ9EzGNhHoF2
         uhyyAUwmN9H/9Mnv2geFNQCCSbAgQgSmx9CP2GRW1ONHIYvIEoVTBLWfNUGQEjf1X7
         pK8R7KgDaDOBg==
Received: by mail-wm1-f71.google.com with SMTP id 144-20020a1c0496000000b003305ac0e03aso7669710wme.8
        for <linux-doc@vger.kernel.org>; Mon, 06 Dec 2021 02:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CS+lflLGdqIBScWk3+o9lUxh8jVqR8Nq2WKSyjwTWok=;
        b=5meOC5IQzwGNQYjCVnbWKI2fHDIyxQncY8L2L7ylTGDtt3Bks/Ro+r2PlH9HtX84FG
         m4BWchwglyfIicFnaiXh0BWAz3ZdTDSWXdJ5dQm3CvN6OeQk8u2mzOaWBfeeDV+9Q1wI
         M6sW5c1WUlJ8X2OQXBVdnPU0iU+ZDBuzfmnlT/fAnxZydimKURPUymE8KEMJTvXvusFL
         xIxJboU1sxzO4xi04cTNyrPJxBfBPDU4yE3+5u3rOW6T+ssPxcu/5qjKc5zypqTMQWIW
         FoDwSoMdbvlsorI32DLShduYeB2Qe8mV7tNBiy8QWQcQClkuZioljBQvRzx1CCZPqVe6
         7wsA==
X-Gm-Message-State: AOAM531mAIApuGgkTAQibj6FuRY9MjObNobVdo8WX4Jq2g8OJQ2woPJg
        IgmIe+7QlwDgvlngjdqVTiXlHxbQ3tUjlx4d3Yrmw0oU04c1UhTctXbhnkkICLt9A9SheW4eRFO
        sVFs09nw5r2V+BnB46zoIV5mUY+CKv55ih4Pyhg==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr41714895wrw.118.1638788187812;
        Mon, 06 Dec 2021 02:56:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVLYW0mXNza0Vbe+pg2BAchzw+eMDx5NF0VjULPJd5GzhsW1C+AKsPuIExWWzzUawkBQmTeg==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr41714859wrw.118.1638788187621;
        Mon, 06 Dec 2021 02:56:27 -0800 (PST)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id v6sm13522985wmh.8.2021.12.06.02.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 02:56:27 -0800 (PST)
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
        Atish Patra <Atish.Patra@rivosinc.com>,
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
        panqinglin2020@iscas.ac.cn, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
        linux-arch@vger.kernel.org
Cc:     Alexandre Ghiti <alexandre.ghiti@canonical.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v3 09/13] riscv: Explicit comment about user virtual address space size
Date:   Mon,  6 Dec 2021 11:46:53 +0100
Message-Id: <20211206104657.433304-10-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
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
index e1c74ef4ead2..fe1701329237 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -677,6 +677,15 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
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
2.32.0

