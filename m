Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3DD1E893
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481772; cv=none; b=EYSUgkRyJbkOvUGnOnIhAR4C/Ru5qhmP54AtgSIHYTASJDNcYlaz2j2yWqX3kHjSxyIGM4ZyTmLTl7eMrh6XSg1e0reF0DWBxqfuYIJFQ2WV+bDQ5j11CPA7Hzl56scslBcOwg2xU5Sk+vrxrsXuqi06oFXaWf9N3ej8ZiGUo8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481772; c=relaxed/simple;
	bh=D5VgWC/LkWlhhFQ3nb9pLHCjF2BV0mjcJ6cSvSw8UuU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=up+hYho2euOfCkBwXkoOZTBygYzqr2OZkcM/tzIX0F6j+GDGVltleCyeVxhpufFeeuSo1D3jwrCKnp42xepfVRYmA4K4G08iQ4h0PkwBkyHcfiRGixAYUi+NUytMacmrFP3PfhiEt9qX/5OjXB3Leen3brYoTAxyeVgJZL5o5H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=J/WVPWr/; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="J/WVPWr/"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6dde290d09eso5245626a34.2
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481770; x=1706086570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKsgEv/kzIHJgzrrOvKf84e1/JzOzrzZCZjXHAU2DdQ=;
        b=J/WVPWr/O2MlZtLGViFRL2e7n3OnLSqTuvafal+b0wgx8H+hFXb6SAq4OdKk2nDH7p
         yy668Srsq2Z+v1cD6XcWcS9uaL/NMFiF4IRjY6d13qZDM/bnZpBz7W9D0CPBxQa1TO+D
         4uQYqHu/ZGiN+110eSITJI7vw7gpRyW7kfJwrN2aqQ9rdMIBzT1MvK5GCxKv9sxRJ85L
         HXz0SFHPls0L1LKQi5YKiZES+9bKy6hID7838N0bVg8dZKjWfbigokFg1x4+PSB29QC5
         PJWYQoF8TYIcRijRU3yqnxuuaxocv/oVIyfzZTL6QhIhv7f0+72ZtK7N8cU+XOS25DO3
         Yziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481770; x=1706086570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKsgEv/kzIHJgzrrOvKf84e1/JzOzrzZCZjXHAU2DdQ=;
        b=lBS1w8s/IjoIXIlK+yJTwqSwIb+cUot9Azx7oTIKhwTJ3xWXEyzBXVqutV5Ke+MN7u
         WtuT3S1w74fnnCkx1EAMCXaweZNxQXDpwcVO0duAz23taiKdj4aLDRCaxtGHHkvMe5hN
         SoIsA9HvEliQL8t5arX6CW0c9g3xQQr8dM+a34pvamywhPUmX2tyNQx3mM18ISi3nuan
         o8Yrwd7Us5LZCzsY8NsPncxSRXXtGHCOrVzqb1p9yQDOHDrYENT7VHtQSXtYdaNRAgC2
         Ffu41vOYtxI8emhIw2toltAYMud3qe0wQ9Xo5uC6K+86rYVppu9PhPFvqYtHZXr1AIE0
         y6qw==
X-Gm-Message-State: AOJu0YxZGC2A2ryvJyXeYBsgE7kTALadXGvdWieQDuTNIWRof+BoJgFX
	NuuDfXAG7tIyOtbtqPOqenWL03ItfsK9+Q==
X-Google-Smtp-Source: AGHT+IEvdt19Hm4szN0FuTv8pBAaeMLyqs22w3CrmVV//8yYsZWCydXtC1PMH6jLDXN8RgGrX2F0HQ==
X-Received: by 2002:a9d:69d5:0:b0:6e0:ac77:bb47 with SMTP id v21-20020a9d69d5000000b006e0ac77bb47mr6631272oto.28.1705481769947;
        Wed, 17 Jan 2024 00:56:09 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:56:09 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 13/19] arm64: text replication: setup page tables for copied kernel
Date: Wed, 17 Jan 2024 16:53:51 +0800
Message-Id: <20240117085357.31693-14-jiahao.os@bytedance.com>
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

Setup page table entries in each non-boot NUMA node page table to
point at each node's own copy of the kernel text. This switches
each node to use its own unique copy of the kernel text.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/ktext.h |  1 +
 arch/arm64/mm/ktext.c          |  8 +++++
 arch/arm64/mm/mmu.c            | 53 ++++++++++++++++++++++++++++------
 3 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/ktext.h b/arch/arm64/include/asm/ktext.h
index 386f9812d3c1..6ece59ca90a2 100644
--- a/arch/arm64/include/asm/ktext.h
+++ b/arch/arm64/include/asm/ktext.h
@@ -16,6 +16,7 @@ void __kprobes ktext_replication_patch(u32 *tp,  __le32 insn);
 void ktext_replication_patch_alternative(__le32 *src, int nr_inst);
 void ktext_replication_set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
 void ktext_replication_init_tramp(void);
+void create_kernel_nid_map(pgd_t *pgdp, void *ktext);
 
 #else
 
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 9efd21eb3308..6692759e78a8 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -136,6 +136,14 @@ void __init ktext_replication_init(void)
 
 		/* Copy initial swapper page directory */
 		memcpy(pgtables[nid]->swapper_pg_dir, swapper_pg_dir, PGD_SIZE);
+
+		/* Clear the kernel mapping */
+		memset(&pgtables[nid]->swapper_pg_dir[kidx], 0,
+		       sizeof(pgtables[nid]->swapper_pg_dir[kidx]));
+
+		/* Create kernel mapping pointing at our local copy */
+		create_kernel_nid_map(pgtables[nid]->swapper_pg_dir,
+				      kernel_texts[nid]);
 	}
 }
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index f3ec38d9e232..181d5339dd05 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -638,6 +638,16 @@ void mark_rodata_ro(void)
 	debug_checkwx();
 }
 
+static void __init create_kernel_mapping(pgd_t *pgdp, phys_addr_t pa_start,
+					 void *va_start, void *va_end,
+					 pgprot_t prot, int flags)
+{
+	size_t size = va_end - va_start;
+
+	__create_pgd_mapping(pgdp, pa_start, (unsigned long)va_start, size,
+			     prot, early_pgtable_alloc, flags);
+}
+
 static void __init map_kernel_segment(pgd_t *pgdp, void *va_start, void *va_end,
 				      pgprot_t prot, struct vm_struct *vma,
 				      int flags, unsigned long vm_flags)
@@ -648,8 +658,7 @@ static void __init map_kernel_segment(pgd_t *pgdp, void *va_start, void *va_end,
 	BUG_ON(!PAGE_ALIGNED(pa_start));
 	BUG_ON(!PAGE_ALIGNED(size));
 
-	__create_pgd_mapping(pgdp, pa_start, (unsigned long)va_start, size, prot,
-			     early_pgtable_alloc, flags);
+	create_kernel_mapping(pgdp, pa_start, va_start, va_end, prot, flags);
 
 	if (!(vm_flags & VM_NO_GUARD))
 		size += PAGE_SIZE;
@@ -721,14 +730,8 @@ static bool arm64_early_this_cpu_has_bti(void)
 						    ID_AA64PFR1_EL1_BT_SHIFT);
 }
 
-/*
- * Create fine-grained mappings for the kernel.
- */
-static void __init map_kernel(pgd_t *pgdp)
+static pgprot_t __init kernel_text_pgprot(void)
 {
-	static struct vm_struct vmlinux_text, vmlinux_rodata, vmlinux_inittext,
-				vmlinux_initdata, vmlinux_data;
-
 	/*
 	 * External debuggers may need to write directly to the text
 	 * mapping to install SW breakpoints. Allow this (only) when
@@ -744,6 +747,38 @@ static void __init map_kernel(pgd_t *pgdp)
 	if (arm64_early_this_cpu_has_bti())
 		text_prot = __pgprot_modify(text_prot, PTE_GP, PTE_GP);
 
+	return text_prot;
+}
+
+#ifdef CONFIG_REPLICATE_KTEXT
+void __init create_kernel_nid_map(pgd_t *pgdp, void *ktext)
+{
+	pgprot_t text_prot = kernel_text_pgprot();
+
+	create_kernel_mapping(pgdp, __pa(ktext), _stext, _etext, text_prot, 0);
+	create_kernel_mapping(pgdp, __pa_symbol(__start_rodata),
+			      __start_rodata, __inittext_begin,
+			      PAGE_KERNEL, NO_CONT_MAPPINGS);
+	create_kernel_mapping(pgdp, __pa_symbol(__inittext_begin),
+			      __inittext_begin, __inittext_end,
+			      text_prot, 0);
+	create_kernel_mapping(pgdp, __pa_symbol(__initdata_begin),
+			      __initdata_begin, __initdata_end,
+			      PAGE_KERNEL, 0);
+	create_kernel_mapping(pgdp, __pa_symbol(_data), _data, _end,
+			      PAGE_KERNEL, 0);
+}
+#endif
+
+/*
+ * Create fine-grained mappings for the kernel.
+ */
+static void __init map_kernel(pgd_t *pgdp)
+{
+	static struct vm_struct vmlinux_text, vmlinux_rodata, vmlinux_inittext,
+				vmlinux_initdata, vmlinux_data;
+	pgprot_t text_prot = kernel_text_pgprot();
+
 	/*
 	 * Only rodata will be remapped with different permissions later on,
 	 * all other segments are allowed to use contiguous mappings.
-- 
2.20.1

