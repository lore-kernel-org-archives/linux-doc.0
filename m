Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066341DDE1
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481764; cv=none; b=rLajRxxNIbWAhQy4RxgpW5FhfOKBBbTQx/VARmq52MzkZ1To1plRipuQUQ4WH+v1WUWeHvsMropPKd7szYoNl/IcSg/mYpvfPyy3TLV/jo4jZDfBGauMmunOGVwPEcgeOYh1dN33+bVGHx2wLE419FSnBqn0Vmt7UJ5a4MPJZew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481764; c=relaxed/simple;
	bh=n8qUDdxeHPgrAmH3WfFEcTjvpsmZnP8wwO9TRYFaAdU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=RBeZ2vkXpzVy8oc/pAq/jnuJ3Stak60bVXiOYDxWgL97maME1payNayaxwzjA9R9adqP67WMAIxAJ88uDHCWk7UCfClKyZEiSzbL3aLPMgh6UavoneEkvcqhdAs8AQHKVADIwG0vWgnLaLiWyBwOvE+gMeO1xGGOJ2TltCIcNJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=B8QtLLfL; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="B8QtLLfL"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso413936276.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481761; x=1706086561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+adH9hgaHp+sBlsR3+gAITXNjLgIIuJMkoKTlM/Hjjg=;
        b=B8QtLLfL0cyqH4bmYKazxS5BTa5gz3eJV3ZyfSsh/+ZLQakFf3BNYZ/oyiKEA3MdER
         pMD050vmT3JYhcUxuZkFNVzrrgEQLKtYb6VAHRDTLjaD9z/hBRItLk7u7+Xw8OYDTQd+
         ixeSWieYv4UPtA61Fwhc5Ch71nqY233xIJY45vWfFBn9pSghTofDt3huqJ/I7yFfkoNc
         423NwqllLUMXhktvk/6sTEMREL23YJyhNRclT4CDXdvKoMobamuPf95YHJLlYTmvhaOY
         O+HEmKswO46E7ARAU6tegJvjByk/6Cio4KUPv7hCfGzxkWavqc8o52nLLOx9J5bG/AmD
         lP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481761; x=1706086561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+adH9hgaHp+sBlsR3+gAITXNjLgIIuJMkoKTlM/Hjjg=;
        b=V9YYoUFtpowES709azgNhboADmV8IN1UtQrAlE8g4iltvQTI5i9aVefN/Kmaii+jRo
         OADMV7tVfVCDmIpHE+qZTrWnormPKqH7JsADc18GODQLAaOvq+DOxHBZAbbt7SvAdKyZ
         WBr68K7KERaEQ6ZYLq3+JhjXNtRq7qDVVQ0KbQY6PXopyZc7cEvUBuwJuuoRyvLhQ/wM
         b31HDh0MHXgu0gURC6gSdU+jGbxkohBnyfMYKMGsuC1Ch/2gTHY8LGFVdJfprtUQavTw
         T0Me9TTPJn6OxEs6zcfRt+jsxjP/kfPWcKGHLt42B83eSJJYbAxkjKmyyWNP7Z8XyqKn
         EDdA==
X-Gm-Message-State: AOJu0YxcYzu/hucqB83ypKWIMzR6zn93vARwPP0gmcQgWZsqMLMp9/Gb
	8zmV5hF4rD/Qx0WfLa8flAeGC5bPU4vF3A==
X-Google-Smtp-Source: AGHT+IFYJld0b0WSvvfje8juPP6NnmJOEUpOa3HfMUJdkbeTXHWZQdhtV9EfPrUayVwWT6sEWVvqhQ==
X-Received: by 2002:a25:bcce:0:b0:dc2:2d59:512f with SMTP id l14-20020a25bcce000000b00dc22d59512fmr1634077ybm.20.1705481760996;
        Wed, 17 Jan 2024 00:56:00 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:56:00 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 11/19] arm64: text replication: boot secondary CPUs with appropriate TTBR1
Date: Wed, 17 Jan 2024 16:53:49 +0800
Message-Id: <20240117085357.31693-12-jiahao.os@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240117085357.31693-1-jiahao.os@bytedance.com>
References: <20240117085357.31693-1-jiahao.os@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Arrange for secondary CPUs to boot with TTBR1 pointing at the
appropriate per-node copy of the kernel page tables for the CPUs NUMA
node.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/smp.h    | 1 +
 arch/arm64/kernel/asm-offsets.c | 1 +
 arch/arm64/kernel/head.S        | 3 ++-
 arch/arm64/kernel/smp.c         | 3 +++
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index efb13112b408..a095616999a9 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -79,6 +79,7 @@ asmlinkage void secondary_start_kernel(void);
 struct secondary_data {
 	struct task_struct *task;
 	long status;
+	phys_addr_t ttbr1;
 };
 
 extern struct secondary_data secondary_data;
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 5ff1942b04fc..ce9d265bc099 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -121,6 +121,7 @@ int main(void)
   DEFINE(IRQ_CPUSTAT_SOFTIRQ_PENDING, offsetof(irq_cpustat_t, __softirq_pending));
   BLANK();
   DEFINE(CPU_BOOT_TASK,		offsetof(struct secondary_data, task));
+  DEFINE(CPU_BOOT_TTBR1,	offsetof(struct secondary_data, ttbr1));
   BLANK();
   DEFINE(FTR_OVR_VAL_OFFSET,	offsetof(struct arm64_ftr_override, val));
   DEFINE(FTR_OVR_MASK_OFFSET,	offsetof(struct arm64_ftr_override, mask));
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index cab7f91949d8..c21746685cdd 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -648,7 +648,8 @@ SYM_FUNC_START_LOCAL(secondary_startup)
 	ldr_l	x0, vabits_actual
 #endif
 	bl	__cpu_setup			// initialise processor
-	adrp	x1, swapper_pg_dir
+	adr_l	x1, secondary_data
+	ldr	x1, [x1, #CPU_BOOT_TTBR1]
 	adrp	x2, idmap_pg_dir
 	bl	__enable_mmu
 	ldr	x8, =__secondary_switched
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 4ced34f62dab..80a8e55e79b2 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -127,6 +127,9 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 	 * page tables.
 	 */
 	secondary_data.task = idle;
+	secondary_data.ttbr1 = __swapper_pg_dir_node_phys(cpu_to_node(cpu));
+	dcache_clean_poc((uintptr_t)&secondary_data,
+			 (uintptr_t)&secondary_data + sizeof(secondary_data));
 	update_cpu_boot_status(CPU_MMU_OFF);
 
 	/* Now bring the CPU into our world */
-- 
2.20.1

