Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22193C04A6A
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jul 2023 16:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236189AbjGNQ4F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Jul 2023 12:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236142AbjGNQ4C (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jul 2023 12:56:02 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A02B35A6
        for <linux-doc@vger.kernel.org>; Fri, 14 Jul 2023 09:56:00 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-666ed230c81so2072218b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Jul 2023 09:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689353760; x=1689958560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WogNqZmM5qIDEUwvyRv9RC9FRo2r68Wx4DIsyw3FtoM=;
        b=k4JpV8O2fSGGk7XNKD9q0ujwSrgLNS5JKisf0sw0jvUKEZew9wqD0mOgv5xqEakXS6
         pzsAREBd08kDkGplbNP1AkoiyWeRAIz7FulZLlqtB8qp3y/qckPqJhQJiKhZfl9WN0WU
         nMle1U6p0NZ6MT6w5szP3MC1Av+TfDzsM7avqkgjrKklsCAEJOIvC2zN/3btjBehraei
         NSwhWdWxIJBc5KhqU4BaNyhMvKIzjfVx6EmHAfAN5LUA6SlhocFalrUll5gGPpviaIA5
         tMoWOIW4JYBkvXrXMWF2tH+8ZBhwSqtGJVaUkW1XRy8sQZxk+lMN38vEoUg+I8BBf1Ee
         cuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689353760; x=1689958560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WogNqZmM5qIDEUwvyRv9RC9FRo2r68Wx4DIsyw3FtoM=;
        b=FkK7saSLzAP4zNuLU7IcfLW7xhHKkeJCJftHu5/C8G9wmnhwNgTbkf5rgjRjd5+aBr
         FZx6F4VykSOAXKC3JzF0sac6LA57AsyUPtAHoc3vAeRxIRrCdmxVGeNtmqvZOqsXvgEM
         gXtXfWC7X+JAOUMFxS/qUWIze+fSnjzfDfkgD+B26B4Oz0/1Zi0Krq+o7Zs/UQIFyN3g
         zrJm8SouXIiI6ycmyynFqyB+65Ma/RE7xVYLta6ZCh5u6l6V4HyGKkqlnoNIIutdDwxv
         x+eYbQG2BoxAfRsrlX+V/B6FWjI+yqy2iAcIFGEIHMpGgV1uaLanHuKPUysUJy94Db8D
         o0Ew==
X-Gm-Message-State: ABy/qLbkM+LL3BjDlncNlz8lLy361ozp2ggxP1zb3w6vN1Ia/7N7FONm
        KdWJiwUGsr58bdgvMdJRIR2oCw==
X-Google-Smtp-Source: APBJJlFI//JCJ/vZz+Q9PwxyNeL/qKz+QPWaKPFke/aicziyFeQBMzZv9VLqcfrN88UuwdEdg68umg==
X-Received: by 2002:a05:6a20:639e:b0:133:ee16:5677 with SMTP id m30-20020a056a20639e00b00133ee165677mr1028643pzg.59.1689353759643;
        Fri, 14 Jul 2023 09:55:59 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902b18800b001b694140d96sm8008081plr.170.2023.07.14.09.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 09:55:59 -0700 (PDT)
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     charlie@rivosinc.com, conor@kernel.org, paul.walmsley@sifive.com,
        palmer@rivosinc.com, aou@eecs.berkeley.edu, anup@brainfault.org,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
        mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org,
        alexghiti@rivosinc.com
Subject: [PATCH v6 3/4] RISC-V: mm: Update pgtable comment documentation
Date:   Fri, 14 Jul 2023 09:54:51 -0700
Message-ID: <20230714165508.94561-4-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714165508.94561-1-charlie@rivosinc.com>
References: <20230714165508.94561-1-charlie@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

sv57 is supported in the kernel so pgtable.h should reflect that.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e13f5872bfe9..28660bab754c 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -840,14 +840,16 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
  * Task size is 0x4000000000 for RV64 or 0x9fc00000 for RV32.
  * Note that PGDIR_SIZE must evenly divide TASK_SIZE.
  * Task size is:
- * -     0x9fc00000 (~2.5GB) for RV32.
- * -   0x4000000000 ( 256GB) for RV64 using SV39 mmu
- * - 0x800000000000 ( 128TB) for RV64 using SV48 mmu
+ * -        0x9fc00000	(~2.5GB) for RV32.
+ * -      0x4000000000	( 256GB) for RV64 using SV39 mmu
+ * -    0x800000000000	( 128TB) for RV64 using SV48 mmu
+ * - 0x100000000000000	(  64PB) for RV64 using SV57 mmu
  *
  * Note that PGDIR_SIZE must evenly divide TASK_SIZE since "RISC-V
  * Instruction Set Manual Volume II: Privileged Architecture" states that
  * "load and store effective addresses, which are 64bits, must have bits
  * 63–48 all equal to bit 47, or else a page-fault exception will occur."
+ * Similarly for SV57, bits 63–57 must be equal to bit 56.
  */
 #ifdef CONFIG_64BIT
 #define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
-- 
2.41.0

