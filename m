Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1391DA36
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481749; cv=none; b=MqwWqKylhXVjEIMJOgaR9Vr8zrrxMkDbJaPNwD0y42XsSUAUQqZM9JHtphjD2mW2eonoUWtkFEwhhNtXHJNb77jpEqPRVY9aQSJNKT08O/6K7hxAWIVTB7v4fDsPSkQeWdwobxF5Bbaua6K+/Zz9X1Vpu1SyqpjHl/6qnII5sGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481749; c=relaxed/simple;
	bh=UpEdVoZcUkCn87HTGyYwgWFqONQh9unxA8Szk2GtCgA=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=sc0HmYfzBmjHjyUHKaKBBjGoJ6S2DQJiyPKZOAc+4DBR1IxB8zkIk703ysd2lDDkwqN9GAufFAFBhfNrsm6+dUowti4j/iaTIJei4Q613/L/Hbfn3qkvK4uzDbDqvFAN5VTImyflYoKzLnmjRsRJriKyBGXVSSfJO8EC5luM5QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZET1jrsI; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZET1jrsI"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6dddfdc3244so5813245a34.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481747; x=1706086547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2DzNjSRcGPa/fmbfMbQdVH/pYnmG5wBDVigL5tjcs4=;
        b=ZET1jrsIm2d5EKJZgsW9JVog79uHOGGW7E6KVjCgo/HejVDPL2HytwO5+aFhJpRRGv
         iLGThuJaoUxbeKk7GFGKIgrkKN7YcwdOvH8LlfP3CLaeW6jeSO4VIy+QiKE8e72mnIwG
         BkR2HrX98KlOm++3pNCq1xzAGUglOWrGqpuKRNQUcFT/Z+i4xznIztgUTAsCGnB6Ubx1
         4uxUMGgiRJOq6aNFGNz6QzrHpVZoI1KKh3wXOnOUe0ZQIVQYkCiDxfWib8VQT5kODvKL
         m+tLteU8Yp2qXk+7wYVAoYm12L/hsPrCFYH6Zs8xeBO3pJr3y6IziOr2AM5BP63Ot7v2
         OLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481747; x=1706086547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2DzNjSRcGPa/fmbfMbQdVH/pYnmG5wBDVigL5tjcs4=;
        b=mPzAKyxbTE2kA4aqzmkttEvKrMaoklxD28dpOBZO8vf/2yJ36v7F4wz0N/hL5XLakY
         7Sc4TlDODzw+/wT/wuCv9tHbYLh43/R9Lp56cWcJvQg33f3GkcFbDIG1E72cphGCQWV3
         Hv5qG2U22skdWrlYPirT+LDagbmfU/Z8Ip/DLJUowRAVx6vwmIsJ7vPLFvFBeEWfNSD5
         /Tunw1V36ZmACGcL93Spmk06EZ9vtP6E0wVONRCxcV2BP9L/ICe0sd74irktfHG6fue7
         3irId0MX2XfFNc66SddPcg/6cJArobKP0KU5sXqtX/nj+ELL7gaB4OYgVfYjqxagXH5A
         j/ng==
X-Gm-Message-State: AOJu0Yy2DbGUPxwSf3MRXDNzSX+srRgL7IyKpEhmiHKKqqVloAoJ3SMp
	rUxyMhJIX2aCJ7MQPW0Ax3idZlXCg5dFBQ==
X-Google-Smtp-Source: AGHT+IGGkksMxzkkuAlD+KBn26aXVtzg1Zctd0alh+SrJE6V0RoE9I381tIEN02hOkPwlxIiBps3nQ==
X-Received: by 2002:a05:6871:114:b0:206:8862:3ef0 with SMTP id y20-20020a056871011400b0020688623ef0mr10872306oab.92.1705481747184;
        Wed, 17 Jan 2024 00:55:47 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:55:46 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 08/19] arm64: text replication: add node 0 page table definitions
Date: Wed, 17 Jan 2024 16:53:46 +0800
Message-Id: <20240117085357.31693-9-jiahao.os@bytedance.com>
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

Add a struct definition for the level zero page table group (the
optional trampoline page tables, reserved page tables, and swapper page
tables).

Add a symbol and extern declaration for the node 0 page table group.

Add an array of pointers to per-node page tables, which will default to
using the node 0 page table group.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/pgtable.h | 14 ++++++++++++++
 arch/arm64/kernel/vmlinux.lds.S  |  3 +++
 arch/arm64/mm/ktext.c            |  4 ++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 97d2127d64eb..0eb71b2b1bd2 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -623,6 +623,20 @@ extern pgd_t idmap_pg_dir[PTRS_PER_PGD];
 extern pgd_t tramp_pg_dir[PTRS_PER_PGD];
 extern pgd_t reserved_pg_dir[PTRS_PER_PGD];
 
+struct pgtables {
+#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
+	pgd_t tramp_pg_dir[PTRS_PER_PGD];
+#endif
+	pgd_t reserved_pg_dir[PTRS_PER_PGD];
+	pgd_t swapper_pg_dir[PTRS_PER_PGD];
+};
+
+extern struct pgtables pgtable_node0;
+
+#ifdef CONFIG_REPLICATE_KTEXT
+extern struct pgtables *pgtables[MAX_NUMNODES];
+#endif
+
 extern void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
 
 static inline bool in_swapper_pgdir(void *addr)
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 3cd7e76cc562..d3c7ed76adbf 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -212,6 +212,9 @@ SECTIONS
 	idmap_pg_dir = .;
 	. += PAGE_SIZE;
 
+	/* pgtable struct - covers the tramp, reserved and swapper pgdirs */
+	pgtable_node0 = .;
+
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
 	tramp_pg_dir = .;
 	. += PAGE_SIZE;
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 04b5ceddae4e..48d7943d6907 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -15,6 +15,10 @@
 #include <asm/ktext.h>
 #include <asm/memory.h>
 
+struct pgtables *pgtables[MAX_NUMNODES] = {
+	[0 ... MAX_NUMNODES - 1] = &pgtable_node0,
+};
+
 static void *kernel_texts[MAX_NUMNODES];
 
 void __kprobes ktext_replication_patch(u32 *tp, __le32 insn)
-- 
2.20.1

