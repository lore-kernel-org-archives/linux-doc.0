Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950035;
	b=ngL5zoufG6DTXXXBt3ttd8XsazCoG61C4ZK4CNSY0JPeTW9T8QsJgBofhK6pllU16hGd
	 r5VyJgzxuyHrWo/ZeWOTqEk4VVE73YbPtgmkj+bKwU2SAc5LyFdTqvm0fGd07v6IHS6QQ
	 v4gXk8Obn/2SvTFXtNRRb/x22zge4E0auGiHFHZ5K+7Gxh3jU0VfqTNiBzXhx19L53LnU
	 ITnSplPtDYkxwqRcbY45uNjG5zBj1JUlZG6UwCa7E9qTM/RHi+3BrPCehQVXCNKLY7hxI
	 lCJU7fiixlyUFyzDVLxFdTIZ1PQBQnIQmd9MCgJyq6U7iF0WlpZzpeFIbr0tZKluFzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6x1S3ZqdbkxHt3USof+znmMvAt7VbtHwbOPxHgeUp/E=;
	b=HAcE0c47JPN6vq1b6kZgPPLZYE3BPpNI+lk95OfvPpTYNTCAXed4rDiDVl+kDf4UThbv
	 h12LgWUk2TR7LBKZXBezaVj14+7bmDsWQNEvscyPyO8jJeCuyKYtDZMaVN1Xa2M12HuT1
	 YzD0mHgQkgU4n+UwFuunuWx4kSYcW67IowP7D54QG3Rf39GWBrB9ttpBxyKbYRRXBBSbD
	 7mh0YqBk8IUrsPBAYTvBzXQcO8/52KGVAgrPDrQEtrkAnfumGgaCpw1BCkJVmevZ5nT45
	 CD0XdpBD0ypuaToeM+imcFlCQTT68i+30kxFlbapVBeJ6/4u7F967UqpTbmajwkBClw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=N3W6rewO;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EFE606A326
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70EFE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=N3W6rewO
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eafb65e169so1728466e0c.1
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 10:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950024; x=1793554824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6x1S3ZqdbkxHt3USof+znmMvAt7VbtHwbOPxHgeUp/E=;
        b=N3W6rewOtEnCKlu0xpAwJvTOFp1/AE72NHOhKW0WInhEZ2eoJ2PpyxANhJLc96Wkl7
         qotmYvxnHLdqJT6MbYH6Yl02zRKS7TV8jR9j/blSAHWvyqU7qDD2kKnRikH/1bWYi7ZN
         zdMa9mnVUIJRkVNZohG/f8xIUM2njCBdpBbO/9Qz7PIK52cBvURt0PrA8QVJ/vK01n35
         EEeRSNC0ZFoZeeLekOJwqqCDHoQ8H5JtMLj101ThUw4mUrneCAvFxyKqDhuQHn+wzcSt
         gFpjgVGwJ/5aZaDpb1jgWtP4uqv+IdI70IKCEAyxkVkKKivgWolfllqdOZYhBE6Kf4Oo
         lV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950024; x=1793554824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6x1S3ZqdbkxHt3USof+znmMvAt7VbtHwbOPxHgeUp/E=;
        b=jAl+VBq1HzoYwyFeTCIwnP+A/7Aot6prjwy+C/3OrqIjTVOEnsmvsKOypTP2KsuPIN
         /mUgoJ/gUs6LkvXW/weaDgDugLf8pUXJ6P19lmitSQG+8NNlEfqAgQ+6jgWlhunO8rs+
         aantXoq50S2lIVFYfcR8YjO8ANhTDrPdpjHUiHVWREwRJUt/g7iN0ym1Eu31ihrEhqSF
         fwy2O7Qwzo1raAjb7AmVqmcOsywaKMNgzvsT3pKtGYpKknG3ma6lC1VcqN0XBctQayHm
         JdLC7F/MkSddqmZpjHbDQwKPpYHKIkyDTdr1+Jt4ahALSIQdvC3+pdZ17uc6YEJdFBH4
         J4cg==
X-Forwarded-Encrypted: i=1; AKwUvBxJy/geELzzBUOJpPcfmFwdNxDpmpUuckV2f/Ty3PIIUyXdofeq8tO7tmVMByGptESSBwrp2fuurPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKb2LECPtcfy6jZil5IRkqA0jH2sBsvtDPt1EzINMOH2GCOxJan
	WpQbvTOLUkNzlK+LF5G4wDfudhG5XPiPUZuiyCfmvtzrxKAVwr4dxKll0v0tefQm+Ds=
X-Gm-Gg: AYBFou0V+8yDfcaG2nbtEGwohJgvreC0l7NGooRvp8GRbPxiY06zWAnExgy8Wmrmn7F
	Hk0kUQbHLHlMCz8NSr2nAJiz3udMdWgon+aduM2D4ZXaN5UtlJ1FNPAzcmSt+8rmJeVbRHAwEX4
	xIjszpwJzJk8UhEfeNuN7diYt28nMvXOettBhpQRnoMA059UZvRdL1k5DCm7ecbmPb9BAHAYv/Y
	iixO9JNjlH0LU+vCQIbGXFNwqxnpHk5p8/Nlqo6qJpNs5wLpq6qRyQNNIOGCeol1dEvZMZw10A4
	YaYIvEVtl9TOseTorMpary4tqGVJqz2XrZuZdnZl190W3tiVAYVy8rshGVPaMOIC4Tsar1tCwR0
	KADM1NH0B8bRRB1BlYNKaX3ZkYMFd+PVNAomu5MJ088ZK3nOqUQsnzGtN2W9IsVST+vViNPwxKU
	xSQG7PHJQkXt4sijWpF0BDLS22lle4queGbk3vMAj3cOm+Whe7+2A1ieu/ZxxedbG30xiZnJS8I
	l846H4kZpr//tajypHwqN9jBVgInAkGfVUN4BoSPUQEF0l4wCKIIcSgMpm6DF7mEe/Luf4BO9V2
	9OvEeercAGgZPdxlD8Zo2dnoB01fuV5vntsyvQDcCGFrqeH/XR1kgLIPRzXTQxpQ8UNs3Gem7t8
	zbN65RY1u+U92q9sQxx6sphQ=
X-Received: by 2002:a05:6122:21a9:b0:5ea:d5ff:3bc5 with SMTP id 71dfb90a1353d-5ec2309e769mr1605074e0c.2.1792950024405;
        Sun, 25 Oct 2026 10:40:24 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:24 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v2 3/9] kho: validate preservation metadata in kho_restore_vmalloc()
Date: Sun, 25 Oct 2026 13:40:10 -0400
Message-ID: <20261025174017.3870481-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
References: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kho_restore_vmalloc() currently dereferences preservation before
checking for NULL, does not reject unknown KHO vmalloc flags, and does
not validate preservation->first.phys, preservation->total_pages, or
preservation->order before allocating the pages array and shifting by
order.

Move kho_flags_to_vmalloc() to kexec_handover_common.c and introduce
kho_vmalloc_validate() and kho_vmalloc_walk() so both regular KHO and
the upcoming read-only KHO mode can share vmalloc header validation and
chunk-list traversal. Converting kho_restore_vmalloc() to
kho_vmalloc_walk() also restores each chunk page before reading its
contents and rejects non-terminal chunks that are not completely full.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kexec_handover.c          | 99 ++++++++++-----------
 kernel/liveupdate/kexec_handover_common.c   | 87 ++++++++++++++++++
 kernel/liveupdate/kexec_handover_internal.h | 14 +++
 3 files changed, 150 insertions(+), 50 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index c24f25bfc96a..67efbdd39439 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1204,10 +1204,6 @@ EXPORT_SYMBOL_GPL(kho_unpreserve_pages);
 /* vmalloc flags KHO supports */
 #define KHO_VMALLOC_SUPPORTED_FLAGS	(VM_ALLOC | VM_ALLOW_HUGE_VMAP)
 
-/* KHO internal flags for vmalloc preservations */
-#define KHO_VMALLOC_ALLOC	0x0001
-#define KHO_VMALLOC_HUGE_VMAP	0x0002
-
 static unsigned short vmalloc_flags_to_kho(unsigned int vm_flags)
 {
 	unsigned short kho_flags = 0;
@@ -1220,18 +1216,6 @@ static unsigned short vmalloc_flags_to_kho(unsigned int vm_flags)
 	return kho_flags;
 }
 
-static unsigned int kho_flags_to_vmalloc(unsigned short kho_flags)
-{
-	unsigned int vm_flags = 0;
-
-	if (kho_flags & KHO_VMALLOC_ALLOC)
-		vm_flags |= VM_ALLOC;
-	if (kho_flags & KHO_VMALLOC_HUGE_VMAP)
-		vm_flags |= VM_ALLOW_HUGE_VMAP;
-
-	return vm_flags;
-}
-
 static struct kho_vmalloc_chunk *new_vmalloc_chunk(struct kho_vmalloc_chunk *cur)
 {
 	struct kho_vmalloc_chunk *chunk;
@@ -1357,6 +1341,45 @@ void kho_unpreserve_vmalloc(struct kho_vmalloc *preservation)
 }
 EXPORT_SYMBOL_GPL(kho_unpreserve_vmalloc);
 
+struct kho_vmalloc_restore_ctx {
+	struct page **pages;
+	unsigned long contig_pages;
+	unsigned long idx;
+};
+
+static const struct kho_vmalloc_chunk *kho_get_chunk(phys_addr_t pa)
+{
+	struct page *page = kho_restore_pages(pa, 1);
+
+	return page ? page_to_virt(page) : NULL;
+}
+
+static void kho_put_chunk(const struct kho_vmalloc_chunk *chunk)
+{
+	free_page((unsigned long)chunk);
+}
+
+static int kho_vmalloc_restore_entry(phys_addr_t pa, void *priv)
+{
+	struct kho_vmalloc_restore_ctx *ctx = priv;
+	struct page *page;
+
+	page = kho_restore_pages(pa, ctx->contig_pages);
+	if (!page)
+		return -EINVAL;
+
+	for (unsigned long j = 0; j < ctx->contig_pages; j++)
+		ctx->pages[ctx->idx++] = page + j;
+
+	return 0;
+}
+
+static const struct kho_vmalloc_walk_ops kho_vmalloc_restore_ops = {
+	.get_chunk = kho_get_chunk,
+	.put_chunk = kho_put_chunk,
+	.entry = kho_vmalloc_restore_entry,
+};
+
 /**
  * kho_restore_vmalloc - recreates and populates an area in vmalloc address
  * space from the preserved memory.
@@ -1369,18 +1392,16 @@ EXPORT_SYMBOL_GPL(kho_unpreserve_vmalloc);
  */
 void *kho_restore_vmalloc(const struct kho_vmalloc *preservation)
 {
-	struct kho_vmalloc_chunk *chunk = KHOSER_LOAD_PTR(preservation->first);
 	kasan_vmalloc_flags_t kasan_flags = KASAN_VMALLOC_PROT_NORMAL;
-	unsigned int align, order, shift, vm_flags;
-	unsigned long total_pages, contig_pages;
+	struct kho_vmalloc_restore_ctx ctx;
+	unsigned long total_pages, align;
+	unsigned int order, shift, vm_flags;
 	unsigned long addr, size;
 	struct vm_struct *area;
 	struct page **pages;
-	unsigned int idx = 0;
 	int err;
 
-	vm_flags = kho_flags_to_vmalloc(preservation->flags);
-	if (vm_flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
+	if (!kho_vmalloc_validate(preservation, &vm_flags))
 		return NULL;
 
 	total_pages = preservation->total_pages;
@@ -1388,37 +1409,15 @@ void *kho_restore_vmalloc(const struct kho_vmalloc *preservation)
 	if (!pages)
 		return NULL;
 	order = preservation->order;
-	contig_pages = (1 << order);
 	shift = PAGE_SHIFT + order;
-	align = 1 << shift;
-
-	while (chunk) {
-		struct page *page;
+	align = 1UL << shift;
 
-		for (int i = 0; i < ARRAY_SIZE(chunk->phys) && chunk->phys[i]; i++) {
-			phys_addr_t phys = chunk->phys[i];
-
-			if (idx + contig_pages > total_pages)
-				goto err_free_pages_array;
-
-			page = kho_restore_pages(phys, contig_pages);
-			if (!page)
-				goto err_free_pages_array;
-
-			for (int j = 0; j < contig_pages; j++)
-				pages[idx++] = page + j;
-
-			phys += contig_pages * PAGE_SIZE;
-		}
-
-		page = kho_restore_pages(virt_to_phys(chunk), 1);
-		if (!page)
-			goto err_free_pages_array;
-		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
-		__free_page(page);
-	}
+	ctx = (struct kho_vmalloc_restore_ctx){
+		.pages = pages,
+		.contig_pages = 1UL << order,
+	};
 
-	if (idx != total_pages)
+	if (kho_vmalloc_walk(preservation, &kho_vmalloc_restore_ops, &ctx))
 		goto err_free_pages_array;
 
 	area = __get_vm_area_node(total_pages * PAGE_SIZE, align, shift,
diff --git a/kernel/liveupdate/kexec_handover_common.c b/kernel/liveupdate/kexec_handover_common.c
index f2784f5c523c..dc25cb4c08af 100644
--- a/kernel/liveupdate/kexec_handover_common.c
+++ b/kernel/liveupdate/kexec_handover_common.c
@@ -19,9 +19,96 @@
 #include <linux/printk.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
+#include <linux/vmalloc.h>
 
 #include "kexec_handover_internal.h"
 
+static unsigned int kho_flags_to_vmalloc(unsigned short kho_flags)
+{
+	unsigned int vm_flags = 0;
+
+	if (kho_flags & KHO_VMALLOC_ALLOC)
+		vm_flags |= VM_ALLOC;
+	if (kho_flags & KHO_VMALLOC_HUGE_VMAP)
+		vm_flags |= VM_ALLOW_HUGE_VMAP;
+
+	return vm_flags;
+}
+
+bool kho_vmalloc_validate(const struct kho_vmalloc *preservation,
+			  unsigned int *vm_flags)
+{
+	if (!preservation || !preservation->first.phys ||
+	    !PAGE_ALIGNED(preservation->first.phys) ||
+	    !preservation->total_pages)
+		return false;
+
+	if (preservation->order >= BITS_PER_LONG - PAGE_SHIFT ||
+	    (1UL << preservation->order) > preservation->total_pages ||
+	    !IS_ALIGNED(preservation->total_pages, 1UL << preservation->order))
+		return false;
+
+	if (preservation->flags & ~(KHO_VMALLOC_ALLOC | KHO_VMALLOC_HUGE_VMAP))
+		return false;
+
+	*vm_flags = kho_flags_to_vmalloc(preservation->flags);
+	return true;
+}
+
+/**
+ * kho_vmalloc_walk - Walk the chunk list of a preserved vmalloc region.
+ * @preservation: Validated KHO vmalloc preservation metadata.
+ * @ops:          Callbacks to acquire/release chunks and process each entry.
+ * @priv:         Caller context passed to @ops->entry.
+ *
+ * Traverses the linked list of struct kho_vmalloc_chunk pages starting from
+ * @preservation->first.phys, invoking @ops->entry for each contiguous physical
+ * range and verifying that non-terminal chunks are full and that the total
+ * number of pages matches @preservation->total_pages.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int kho_vmalloc_walk(const struct kho_vmalloc *preservation,
+		     const struct kho_vmalloc_walk_ops *ops, void *priv)
+{
+	unsigned long contig_pages = 1UL << preservation->order;
+	unsigned long total_pages = preservation->total_pages;
+	unsigned long nr_pages = 0;
+	phys_addr_t chunk_pa;
+
+	for (chunk_pa = preservation->first.phys; chunk_pa; ) {
+		const struct kho_vmalloc_chunk *chunk;
+		phys_addr_t next_pa;
+		unsigned int i;
+
+		chunk = ops->get_chunk(chunk_pa);
+		if (!chunk)
+			return -EINVAL;
+
+		for (i = 0; i < ARRAY_SIZE(chunk->phys) && chunk->phys[i]; i++) {
+			if (nr_pages + contig_pages > total_pages ||
+			    ops->entry(chunk->phys[i], priv))
+				goto err_put_chunk;
+
+			nr_pages += contig_pages;
+		}
+
+		next_pa = chunk->hdr.next.phys;
+		if (next_pa && i < ARRAY_SIZE(chunk->phys))
+			goto err_put_chunk;
+
+		ops->put_chunk(chunk);
+		chunk_pa = next_pa;
+		continue;
+
+err_put_chunk:
+		ops->put_chunk(chunk);
+		return -EINVAL;
+	}
+
+	return nr_pages == total_pages ? 0 : -EINVAL;
+}
+
 /**
  * kho_encode_radix_key - Encodes a physical address and order into a radix key.
  * @phys: The physical address of the page.
diff --git a/kernel/liveupdate/kexec_handover_internal.h b/kernel/liveupdate/kexec_handover_internal.h
index e73a2e310917..dd79e5006562 100644
--- a/kernel/liveupdate/kexec_handover_internal.h
+++ b/kernel/liveupdate/kexec_handover_internal.h
@@ -8,7 +8,21 @@
 #include <linux/list.h>
 #include <linux/types.h>
 
+/* KHO internal flags for vmalloc preservations */
+#define KHO_VMALLOC_ALLOC	0x0001
+#define KHO_VMALLOC_HUGE_VMAP	0x0002
+
+struct kho_vmalloc_walk_ops {
+	const struct kho_vmalloc_chunk *(*get_chunk)(phys_addr_t pa);
+	void (*put_chunk)(const struct kho_vmalloc_chunk *chunk);
+	int (*entry)(phys_addr_t pa, void *priv);
+};
+
 const void *kho_get_fdt(void);
+bool kho_vmalloc_validate(const struct kho_vmalloc *preservation,
+			  unsigned int *vm_flags);
+int kho_vmalloc_walk(const struct kho_vmalloc *preservation,
+		     const struct kho_vmalloc_walk_ops *ops, void *priv);
 unsigned long kho_encode_radix_key(phys_addr_t phys, unsigned int order);
 phys_addr_t kho_decode_radix_key(unsigned long key, unsigned int *order);
 unsigned long kho_radix_get_bitmap_index(unsigned long key);
-- 
2.56.0.307.g5fe7bd680c-goog

