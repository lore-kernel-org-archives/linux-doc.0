Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB9547209C
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 19:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933042; cv=none; b=j25XCW9KYcDVzBtnTA9mvAXYdotGMTMRayhS8512O7mwpN9rL8ldmsSzA0VNDG/FIK/dLcvBn1NR4LUOn/1qf4G4VUMiYGV8tPRcMS99IT+akOU8D8eMQTKgcnvYcPHXPxFpziwg7Hfcy4Luz6pkZd5N53U2wJreWuteaQOAxDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933042; c=relaxed/simple;
	bh=wgzzxsy58BvqCqX/ilqt4T5Q9dkczW+R9c2r7pwHm7M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZDdIkXwnWFYxv8u5NPAl/pbtQ72hZm+vWBafULRDzwOY2W8A+k5i24iTiZQ1Hb94b0F8LrxF14DZmaYJ+t+aQK7MpOx/pIxKG2qNmOKtSjy6v0xolInhTk8iRppfg9fhPHHVrvUM8wBW0mhhsZtzqU/RnFtZUXdciD58k6U0eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=BLkWGEd9; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="BLkWGEd9"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d46e4cdcdso17669197b3.2
        for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 12:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933039; x=1790537839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0WQSV2M4dYwT0nemuMW5I3vbKfQKNkPtdhJ2W+zZzFM=;
        b=BLkWGEd9plcD8ipUKaaRYEGEuDCeuIpJhlWWBYIW/i+MQbBZXwIa9GTAmNKfiJbT+G
         L3IZU4H280isE3pE8wxVp7iyzWeQ3Bck/FcArcWAxUYb8VpOO2eC+dm3jrd8wB9dfV9s
         +KtlaQKJKcLhPLTzl9t24QWZn4UJd0Vr0ItkHRyTABWgiEGFLvMb8HAsxPCyitUokHKg
         FRLtUysbbul4b53uVAVdyx874xF445BmMiqDdguriBa7lGO/sGnx8dCoB5VN4Yc5bm3S
         NeGTyToz7HZULa2JHFqvtdskM83gNa3ckTFH6H6+TTyFIoFcEYe61Erm1OQ+pzZRM26z
         hzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933039; x=1790537839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0WQSV2M4dYwT0nemuMW5I3vbKfQKNkPtdhJ2W+zZzFM=;
        b=fXfwstekxz9DAITc4KRN20TUt2u+50diC9QH7V2tNxeSQ12m122xrdcf7vGBiavAtd
         fMSxgxrqUIPUXwEDbIyoo6DvPzDK7OhTa+ylMWLUfDkVA55fYOs64DChCORsDnznJWwH
         TEe+2o2Etw8mKjJaS6GsQpvG3p+BwgdM66pIhSokE2InGVC56pM+xX4H4x2BRba0Q9eN
         3Owe2HkIMYtXQnAvbWtAimFP8zE+l5Tgt+0NEYjKG7X+VXNU6Rg1Kx5h8G5FHNw5D8X9
         /S9oU81KiqRSyixGGfTOeNh7UIohxo6rUUyyVN7s5n3bIKBrhoDrPv66d5K21SjTVb08
         B7WQ==
X-Forwarded-Encrypted: i=1; AKwUvByXH+/DnUm4uxoyfmDMAbeSZRL2dhihGAJQgJBaV4MwW2nFY9zIhrTjYFdk7dkskP7/MD/gaOL3iY8=@vger.kernel.org
X-Gm-Message-State: AFuF++lNCNBGWpjzGvsL6opWRsaMSRmbZ5eXk6DchZDUce+Bb5p3qZ1E
	sKNXo3IoSHNN4uPmW11RCciJV3LQGhl5MKjrmL8k1nTvsC/94CVU0lbw17poSyfJ+/U=
X-Gm-Gg: AYBFou1lALJPAfE0pAFnlfVBFekUhef/DYT+Jo75/Fv7B0Ot7dXvCvGDINsyvOEQuKJ
	qGASfFOi3e0b7QghNF9me4JZjQ/LMTZl0390bvw5qC+2e7kK6YfafOflewteqGs6ZvLEBiejF5A
	VcBbbMXLSLpTbo8geM5AlxkCsnkx9oCg6d1BTC9afs+99xM+3E+ZAcAxErfLDcFXunll1q/jqF7
	BWQoGAyRg0m/Qc+gRFU3O4Ohtum7ltIck0ltPKwRAJa17NrLHeVWxtNptwUM7xk4NBeL0tnRqSB
	qhrhDNG+XBOdoL9/19c98z+OJqJaM6SOwlSNg7Gix5vuyxJcsJHGfDoxt5RdG5BtcMvA9Y1fRUS
	U8iKGGLbh5x66pww1AmRVcFpfeBp865PxKMKOSilTQpqEvnrQK/KK9jISg0G0lO5fWFqqMYHBC1
	2qXF59WG3/IcIQFSj7ic23/4fpGfKw9eccWQ5IrQn/9FapRkFigoJaoZsEw16lygFDhnDjm2wNi
	6rMA0R/n6LU8FFWHRZ7CFo7rcRo0lHwbjvTiC803iq8KxrEuUQxiSQggPjBEEVwuPYmFNr+ijAd
	Yd9AwiyzoVen0J97vLI=
X-Received: by 2002:a05:690c:e1ca:20b0:854:9062:73ae with SMTP id 00721157ae682-89736b3f795mr32929267b3.33.1789933039155;
        Sun, 20 Sep 2026 12:37:19 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a48d99122sm18294247b3.48.2026.09.20.12.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:37:17 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	legion@kernel.org,
	kees@kernel.org,
	will@kernel.org,
	ruanjinjie@huawei.com,
	atomlin@atomlin.com,
	rppt@kernel.org,
	jani.nikula@intel.com,
	hamzamahfooz@linux.microsoft.com,
	joey.gouly@arm.com,
	tglx@kernel.org,
	nsc@kernel.org,
	alexandre.chartre@oracle.com,
	james.morse@arm.com,
	dianders@chromium.org,
	bp@alien8.de,
	jpoimboe@kernel.org,
	shuah@kernel.org,
	catalin.marinas@arm.com,
	linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvmarm@lists.linux.dev,
	jaredwhite@microsoft.com,
	johan@kernel.org,
	pbonzini@redhat.com,
	mingo@redhat.com,
	linux-mm@kvack.org,
	seanjc@google.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	tarunsahu@google.com,
	gshan@redhat.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	xur@google.com,
	djbw@kernel.org,
	oupton@kernel.org,
	nogikh@google.com,
	sumitg@nvidia.com,
	linux-kernel@vger.kernel.org,
	zengheng4@huawei.com,
	peterz@infradead.org,
	corbet@lwn.net,
	suzuki.poulose@arm.com,
	luto@kernel.org,
	hpa@zytor.com,
	zhangpengjie2@huawei.com,
	x86@kernel.org,
	yuzenghui@huawei.com,
	jic23@kernel.org,
	ardb@kernel.org,
	pasha.tatashin@soleen.com,
	petr.pavlu@suse.com,
	ryan.roberts@arm.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rdunlap@infradead.org,
	kvm@vger.kernel.org,
	fuad.tabba@linux.dev,
	maz@kernel.org,
	mbenes@suse.cz,
	jgross@suse.com,
	seiden@linux.ibm.com,
	pierre.gondois@arm.com,
	song@kernel.org,
	nathan@kernel.org,
	pmladek@suse.com,
	graf@amazon.com,
	chao.gao@intel.com,
	zhenglifeng1@huawei.com,
	arnd@arndb.de,
	sidnayyar@google.com,
	linux-arm-kernel@lists.infradead.org,
	vladimir.murzin@arm.com,
	kas@kernel.org
Subject: [RFC PATCH 04/46] x86/mm/ident_map: Add force_pte to support 4K PTE identity mappings
Date: Sun, 20 Sep 2026 15:36:08 -0400
Message-ID: <20260920193650.3373435-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
References: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend kernel_ident_mapping_init() with ident_pte_init() and a force_pte
flag in struct x86_mapping_info so callers can request 4K PTE leaf
mappings instead of 2M PMD or 1G PUD leaves.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/include/asm/init.h |  3 +-
 arch/x86/mm/ident_map.c     | 72 ++++++++++++++++++++++++++++++++-----
 2 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/init.h b/arch/x86/include/asm/init.h
index 01ccdd168df0..d9caed494e7d 100644
--- a/arch/x86/include/asm/init.h
+++ b/arch/x86/include/asm/init.h
@@ -6,10 +6,11 @@ struct x86_mapping_info {
 	void *(*alloc_pgt_page)(void *); /* allocate buf for page table */
 	void (*free_pgt_page)(void *, void *); /* free buf for page table */
 	void *context;			 /* context for alloc_pgt_page */
-	unsigned long page_flag;	 /* page flag for PMD or PUD entry */
+	unsigned long page_flag;	 /* page flag for PTE, PMD or PUD entry */
 	unsigned long offset;		 /* ident mapping offset */
 	bool direct_gbpages;		 /* PUD level 1GB page support */
 	unsigned long kernpg_flag;	 /* kernel pagetable flag override */
+	bool force_pte;			 /* force 4K PTE mappings */
 };
 
 int kernel_ident_mapping_init(struct x86_mapping_info *info, pgd_t *pgd_page,
diff --git a/arch/x86/mm/ident_map.c b/arch/x86/mm/ident_map.c
index 5a15bffe6574..83013513ba94 100644
--- a/arch/x86/mm/ident_map.c
+++ b/arch/x86/mm/ident_map.c
@@ -77,24 +77,73 @@ void kernel_ident_mapping_free(struct x86_mapping_info *info, pgd_t *pgd)
 	info->free_pgt_page(pgd, info->context);
 }
 
-static void ident_pmd_init(struct x86_mapping_info *info, pmd_t *pmd_page,
-			   unsigned long addr, unsigned long end)
+static int ident_pte_init(struct x86_mapping_info *info, pte_t *pte_page,
+			  unsigned long addr, unsigned long end)
 {
-	addr &= PMD_MASK;
-	for (; addr < end; addr += PMD_SIZE) {
+	addr &= PAGE_MASK;
+	for (; addr < end; addr += PAGE_SIZE) {
+		pte_t *pte = pte_page + pte_index(addr);
+
+		if (pte_present(*pte))
+			continue;
+
+		set_pte(pte, __pte(((addr - info->offset) | info->page_flag) & ~_PAGE_PSE));
+	}
+
+	return 0;
+}
+
+static int ident_pmd_init(struct x86_mapping_info *info, pmd_t *pmd_page,
+			  unsigned long addr, unsigned long end)
+{
+	unsigned long next;
+	int result;
+
+	for (; addr < end; addr = next) {
 		pmd_t *pmd = pmd_page + pmd_index(addr);
+		pte_t *pte;
 
-		if (pmd_present(*pmd))
+		next = pmd_addr_end(addr, end);
+
+		if (!info->force_pte) {
+			if (pmd_present(*pmd))
+				continue;
+
+			set_pmd(pmd, __pmd(((addr & PMD_MASK) - info->offset) | info->page_flag));
 			continue;
+		}
 
-		set_pmd(pmd, __pmd((addr - info->offset) | info->page_flag));
+		/* if this is already a 2MB page, this portion is already mapped */
+		if (pmd_leaf(*pmd))
+			continue;
+
+		if (pmd_present(*pmd)) {
+			pte = pte_offset_kernel(pmd, 0);
+			result = ident_pte_init(info, pte, addr, next);
+			if (result)
+				return result;
+			continue;
+		}
+
+		pte = (pte_t *)info->alloc_pgt_page(info->context);
+		if (!pte)
+			return -ENOMEM;
+
+		result = ident_pte_init(info, pte, addr, next);
+		if (result)
+			return result;
+
+		set_pmd(pmd, __pmd(__pa(pte) | info->kernpg_flag));
 	}
+
+	return 0;
 }
 
 static int ident_pud_init(struct x86_mapping_info *info, pud_t *pud_page,
 			  unsigned long addr, unsigned long end)
 {
 	unsigned long next;
+	int result;
 
 	for (; addr < end; addr = next) {
 		pud_t *pud = pud_page + pud_index(addr);
@@ -108,7 +157,7 @@ static int ident_pud_init(struct x86_mapping_info *info, pud_t *pud_page,
 			continue;
 
 		/* Is using a gbpage allowed? */
-		use_gbpage = info->direct_gbpages;
+		use_gbpage = info->direct_gbpages && !info->force_pte;
 
 		/* Don't use gbpage if it maps more than the requested region. */
 		/* at the beginning: */
@@ -129,13 +178,17 @@ static int ident_pud_init(struct x86_mapping_info *info, pud_t *pud_page,
 
 		if (pud_present(*pud)) {
 			pmd = pmd_offset(pud, 0);
-			ident_pmd_init(info, pmd, addr, next);
+			result = ident_pmd_init(info, pmd, addr, next);
+			if (result)
+				return result;
 			continue;
 		}
 		pmd = (pmd_t *)info->alloc_pgt_page(info->context);
 		if (!pmd)
 			return -ENOMEM;
-		ident_pmd_init(info, pmd, addr, next);
+		result = ident_pmd_init(info, pmd, addr, next);
+		if (result)
+			return result;
 		set_pud(pud, __pud(__pa(pmd) | info->kernpg_flag));
 	}
 
@@ -189,6 +242,7 @@ int kernel_ident_mapping_init(struct x86_mapping_info *info, pgd_t *pgd_page,
 
 	/* Filter out unsupported __PAGE_KERNEL_* bits: */
 	info->kernpg_flag &= __default_kernel_pte_mask;
+	info->page_flag &= __default_kernel_pte_mask;
 
 	for (; addr < end; addr = next) {
 		pgd_t *pgd = pgd_page + pgd_index(addr);
-- 
2.55.0.1082.g2b9226bbc0-goog

