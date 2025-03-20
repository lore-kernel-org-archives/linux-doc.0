Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106911E7C2E
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 01:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742435777; cv=none; b=BMa2fRKbvQpaNQwXbqEGK3pjnBer52FWHDSwKNuHSqhAN8rzE4uWKr1phgb+4Q8t+IKDceh3DKdEy03Fczkk06ynG5EgkiHaA7FVUdR/RU/+Bp30BIJcNAuc5oonEFLR74NukrGnUFYnAs3IeGuAQk+LK/T9y7XBD+XgqulSBFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742435777; c=relaxed/simple;
	bh=aauz3udTRYLSn3TyXAxFQCzufnyuf5H6VJtvegcFsTo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lMLJVS5AkORh/a5ArqDalU+CBp2kGci9zJMlTrNHAdwIvQiN7EYLa/lWUINF5SWrOqnldSHIiIi9vaa5OX6aPC8fDRDffbuKlifTwxfz1g8XNA8XInsiONNK1tfPRgaWqNSDiuuOt49dq6MXiUVBlAGNqhrdCX7vryPRo/gBIUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gf/glGMt; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gf/glGMt"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff78dd28ecso644052a91.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 18:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742435774; x=1743040574; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uSm1C3hzri2Wj9pRnB1afKKuALL7+tUjT9kdNp30IT0=;
        b=gf/glGMtbNJ8jZTBLVqTFWCgkxvNcE6p0mOUBrOv7WOpEa2O/njJbF6pFI9nu8s75L
         /GLr73vwDfLHm0q6aXBCY99Sgjk8N1b8GY7hLpBarwwarfcF23tq44ZziRBGOexmWZK5
         0qSjAjYsnQHxm3R8PlTmhBv+0Q6Lc8JNT6PXzBo5DbO5i2xfgfZTNOFM/EIGBuwpUawM
         gnavIYZnD8D2qA8LhBX/CeunsgdaTem5Ic/Z7Qd36PdybHDt8Wl69TNBwExGvrq13j5g
         3wP5iJaz/+swf9wHeCKBHkQOaFxCEDyS6aGWP88ToL4tgc8qmZdhD+UfK/Y0Dv1y79eZ
         pEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742435774; x=1743040574;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSm1C3hzri2Wj9pRnB1afKKuALL7+tUjT9kdNp30IT0=;
        b=xQ7Fi9A5v38ADRlv3Hvgcut84FLIEY53YlMKWSKNJJpAjaeS3FwLKYPoulNF0xju8W
         hUfp+hdVwqCnUeqFqW1ErKwt5NnY9Bf9cARDFGRepcNnFGfZLj1BGD6FcxVH/IWogac6
         Z/O832/3p6UShBvHYXksIPr5TFKtbvzFq38aSAPvF8tzK1tF5pQSWrmBe2kW16uSUi4I
         k8rIuyzn9f4dNvZaEEqEG/FGQc1bDJ3RU5UxkSrUR0xQ3JBGYwG2oYD1FP8QLy7cTkA/
         O8DhhVERvGsNhtl5JAR8wSV4bfofr4W1hpvSKMUa1J6LryA+4lrJFMeqygFDZ2P1j1yC
         pY7A==
X-Forwarded-Encrypted: i=1; AJvYcCVDhrqpD+P447cfGHsE43CNuAvqIi74pwklHMQ+6e0BQIGvRxeQvqgrmh1Yk5Pl8X/kvn6v+gcAVJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkTzn4mUmUceVrO9xsLwXbpSR5Sjk8C3bKyCsQ1Omnganb7rsC
	mbbxUuw/jp1jENGvkT7243Fckd5XxQ0VLO93OngBGFntaxBH3HOxkipJEfHfwkB08Z/1tOepvHP
	u46XSDbcJWdw5SxeliA==
X-Google-Smtp-Source: AGHT+IGDFxZ224ZfpKuOQMpb0L5eyzWuzuuNb6JbsQOka9qAXNPHwzXyZCt1rphKnSoqunSh0fOsVTw3awCrNzrI
X-Received: from pfbay13.prod.google.com ([2002:a05:6a00:300d:b0:730:7e2d:df69])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:12d4:b0:1f5:837b:1868 with SMTP id adf61e73a8af0-1fbecd48a69mr9047217637.29.1742435774464;
 Wed, 19 Mar 2025 18:56:14 -0700 (PDT)
Date: Wed, 19 Mar 2025 18:55:44 -0700
In-Reply-To: <20250320015551.2157511-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250320015551.2157511-10-changyuanl@google.com>
Subject: [PATCH v5 09/16] kexec: enable KHO support for memory preservation
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	dave.hansen@linux.intel.com, dwmw2@infradead.org, ebiederm@xmission.com, 
	mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, krzk@kernel.org, 
	rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org, Jason Gunthorpe <jgg@nvidia.com>, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Introduce APIs allowing KHO users to preserve memory across kexec and
get access to that memory after boot of the kexeced kernel

kho_preserve_folio() - record a folio to be preserved over kexec
kho_restore_folio() - recreates the folio from the preserved memory
kho_preserve_phys() - record physically contiguous range to be
preserved over kexec.
kho_restore_phys() - recreates order-0 pages corresponding to the
preserved physical range

The memory preservations are tracked by two levels of xarrays to manage
chunks of per-order 512 byte bitmaps. For instance the entire 1G order
of a 1TB x86 system would fit inside a single 512 byte bitmap. For
order 0 allocations each bitmap will cover 16M of address space. Thus,
for 16G of memory at most 512K of bitmap memory will be needed for order 0.

At serialization time all bitmaps are recorded in a linked list of pages
for the next kernel to process and the physical address of the list is
recorded in KHO FDT.

The next kernel then processes that list, reserves the memory ranges and
later, when a user requests a folio or a physical range, KHO restores
corresponding memory map entries.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 include/linux/kexec_handover.h |  38 +++
 kernel/kexec_handover.c        | 486 ++++++++++++++++++++++++++++++++-
 2 files changed, 522 insertions(+), 2 deletions(-)

diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index c665ff6cd728..d52a7b500f4c 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -5,6 +5,7 @@
 #include <linux/types.h>
 #include <linux/hashtable.h>
 #include <linux/notifier.h>
+#include <linux/mm_types.h>
 
 struct kho_scratch {
 	phys_addr_t addr;
@@ -54,6 +55,13 @@ int kho_add_string_prop(struct kho_node *node, const char *key,
 int register_kho_notifier(struct notifier_block *nb);
 int unregister_kho_notifier(struct notifier_block *nb);
 
+int kho_preserve_folio(struct folio *folio);
+int kho_unpreserve_folio(struct folio *folio);
+int kho_preserve_phys(phys_addr_t phys, size_t size);
+int kho_unpreserve_phys(phys_addr_t phys, size_t size);
+struct folio *kho_restore_folio(phys_addr_t phys);
+void *kho_restore_phys(phys_addr_t phys, size_t size);
+
 void kho_memory_init(void);
 
 void kho_populate(phys_addr_t handover_fdt_phys, phys_addr_t scratch_phys,
@@ -118,6 +126,36 @@ static inline int unregister_kho_notifier(struct notifier_block *nb)
 	return -EOPNOTSUPP;
 }
 
+static inline int kho_preserve_folio(struct folio *folio)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int kho_unpreserve_folio(struct folio *folio)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int kho_preserve_phys(phys_addr_t phys, size_t size)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int kho_unpreserve_phys(phys_addr_t phys, size_t size)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline struct folio *kho_restore_folio(phys_addr_t phys)
+{
+	return NULL;
+}
+
+static inline void *kho_restore_phys(phys_addr_t phys, size_t size)
+{
+	return NULL;
+}
+
 static inline void kho_memory_init(void)
 {
 }
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 6ebad2f023f9..592563c21369 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -62,6 +62,13 @@ struct kho_out {
 	struct rw_semaphore tree_lock;
 	struct kho_node root;
 
+	/**
+	 * Physical address of the first struct khoser_mem_chunk containing
+	 * serialized data from struct kho_mem_track.
+	 */
+	phys_addr_t first_chunk_phys;
+	struct kho_node preserved_memory;
+
 	void *fdt;
 	u64 fdt_max;
 };
@@ -70,6 +77,7 @@ static struct kho_out kho_out = {
 	.chain_head = BLOCKING_NOTIFIER_INIT(kho_out.chain_head),
 	.tree_lock = __RWSEM_INITIALIZER(kho_out.tree_lock),
 	.root = KHO_NODE_INIT,
+	.preserved_memory = KHO_NODE_INIT,
 	.fdt_max = 10 * SZ_1M,
 };
 
@@ -237,6 +245,461 @@ int kho_node_check_compatible(const struct kho_in_node *node,
 }
 EXPORT_SYMBOL_GPL(kho_node_check_compatible);
 
+/*
+ * Keep track of memory that is to be preserved across KHO.
+ *
+ * The serializing side uses two levels of xarrays to manage chunks of per-order
+ * 512 byte bitmaps. For instance the entire 1G order of a 1TB system would fit
+ * inside a single 512 byte bitmap. For order 0 allocations each bitmap will
+ * cover 16M of address space. Thus, for 16G of memory at most 512K
+ * of bitmap memory will be needed for order 0.
+ *
+ * This approach is fully incremental, as the serialization progresses folios
+ * can continue be aggregated to the tracker. The final step, immediately prior
+ * to kexec would serialize the xarray information into a linked list for the
+ * successor kernel to parse.
+ */
+
+#define PRESERVE_BITS (512 * 8)
+
+struct kho_mem_phys_bits {
+	DECLARE_BITMAP(preserve, PRESERVE_BITS);
+};
+
+struct kho_mem_phys {
+	/*
+	 * Points to kho_mem_phys_bits, a sparse bitmap array. Each bit is sized
+	 * to order.
+	 */
+	struct xarray phys_bits;
+};
+
+struct kho_mem_track {
+	/* Points to kho_mem_phys, each order gets its own bitmap tree */
+	struct xarray orders;
+};
+
+static struct kho_mem_track kho_mem_track;
+
+static void *xa_load_or_alloc(struct xarray *xa, unsigned long index, size_t sz)
+{
+	void *elm, *res;
+
+	elm = xa_load(xa, index);
+	if (elm)
+		return elm;
+
+	elm = kzalloc(sz, GFP_KERNEL);
+	if (!elm)
+		return ERR_PTR(-ENOMEM);
+
+	res = xa_cmpxchg(xa, index, NULL, elm, GFP_KERNEL);
+	if (xa_is_err(res))
+		res = ERR_PTR(xa_err(res));
+
+	if (res) {
+		kfree(elm);
+		return res;
+	}
+
+	return elm;
+}
+
+static void __kho_unpreserve(struct kho_mem_track *tracker, unsigned long pfn,
+			     unsigned int order)
+{
+	struct kho_mem_phys_bits *bits;
+	struct kho_mem_phys *physxa;
+	unsigned long pfn_hi = pfn >> order;
+
+	physxa = xa_load(&tracker->orders, order);
+	if (!physxa)
+		return;
+
+	bits = xa_load(&physxa->phys_bits, pfn_hi / PRESERVE_BITS);
+	if (!bits)
+		return;
+
+	clear_bit(pfn_hi % PRESERVE_BITS, bits->preserve);
+}
+
+static int __kho_preserve(struct kho_mem_track *tracker, unsigned long pfn,
+			  unsigned int order)
+{
+	struct kho_mem_phys_bits *bits;
+	struct kho_mem_phys *physxa;
+	unsigned long pfn_hi = pfn >> order;
+
+	might_sleep();
+
+	physxa = xa_load_or_alloc(&tracker->orders, order, sizeof(*physxa));
+	if (IS_ERR(physxa))
+		return PTR_ERR(physxa);
+
+	bits = xa_load_or_alloc(&physxa->phys_bits, pfn_hi / PRESERVE_BITS,
+				sizeof(*bits));
+	if (IS_ERR(bits))
+		return PTR_ERR(bits);
+
+	set_bit(pfn_hi % PRESERVE_BITS, bits->preserve);
+
+	return 0;
+}
+
+/**
+ * kho_preserve_folio - preserve a folio across KHO.
+ * @folio: folio to preserve
+ *
+ * Records that the entire folio is preserved across KHO. The order
+ * will be preserved as well.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_preserve_folio(struct folio *folio)
+{
+	unsigned long pfn = folio_pfn(folio);
+	unsigned int order = folio_order(folio);
+	int err;
+
+	if (!kho_enable)
+		return -EOPNOTSUPP;
+
+	down_read(&kho_out.tree_lock);
+	if (kho_out.fdt) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	err = __kho_preserve(&kho_mem_track, pfn, order);
+
+unlock:
+	up_read(&kho_out.tree_lock);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(kho_preserve_folio);
+
+/**
+ * kho_unpreserve_folio - unpreserve a folio
+ * @folio: folio to unpreserve
+ *
+ * Remove the record of a folio previously preserved by kho_preserve_folio().
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_unpreserve_folio(struct folio *folio)
+{
+	unsigned long pfn = folio_pfn(folio);
+	unsigned int order = folio_order(folio);
+	int err = 0;
+
+	down_read(&kho_out.tree_lock);
+	if (kho_out.fdt) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	__kho_unpreserve(&kho_mem_track, pfn, order);
+
+unlock:
+	up_read(&kho_out.tree_lock);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(kho_unpreserve_folio);
+
+/**
+ * kho_preserve_phys - preserve a physically contiguous range across KHO.
+ * @phys: physical address of the range
+ * @size: size of the range
+ *
+ * Records that the entire range from @phys to @phys + @size is preserved
+ * across KHO.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_preserve_phys(phys_addr_t phys, size_t size)
+{
+	unsigned long pfn = PHYS_PFN(phys), end_pfn = PHYS_PFN(phys + size);
+	unsigned int order = ilog2(end_pfn - pfn);
+	unsigned long failed_pfn;
+	int err = 0;
+
+	if (!kho_enable)
+		return -EOPNOTSUPP;
+
+	down_read(&kho_out.tree_lock);
+	if (kho_out.fdt) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	for (; pfn < end_pfn;
+	     pfn += (1 << order), order = ilog2(end_pfn - pfn)) {
+		err = __kho_preserve(&kho_mem_track, pfn, order);
+		if (err) {
+			failed_pfn = pfn;
+			break;
+		}
+	}
+
+	if (err)
+		for (pfn = PHYS_PFN(phys); pfn < failed_pfn;
+		     pfn += (1 << order), order = ilog2(end_pfn - pfn))
+			__kho_unpreserve(&kho_mem_track, pfn, order);
+
+unlock:
+	up_read(&kho_out.tree_lock);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(kho_preserve_phys);
+
+/**
+ * kho_unpreserve_phys - unpreserve a physically contiguous range
+ * @phys: physical address of the range
+ * @size: size of the range
+ *
+ * Remove the record of a range previously preserved by kho_preserve_phys().
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_unpreserve_phys(phys_addr_t phys, size_t size)
+{
+	unsigned long pfn = PHYS_PFN(phys), end_pfn = PHYS_PFN(phys + size);
+	unsigned int order = ilog2(end_pfn - pfn);
+	int err = 0;
+
+	down_read(&kho_out.tree_lock);
+	if (kho_out.fdt) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	for (; pfn < end_pfn; pfn += (1 << order), order = ilog2(end_pfn - pfn))
+		__kho_unpreserve(&kho_mem_track, pfn, order);
+
+unlock:
+	up_read(&kho_out.tree_lock);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(kho_unpreserve_phys);
+
+/* almost as free_reserved_page(), just don't free the page */
+static void kho_restore_page(struct page *page)
+{
+	ClearPageReserved(page);
+	init_page_count(page);
+	adjust_managed_page_count(page, 1);
+}
+
+struct folio *kho_restore_folio(phys_addr_t phys)
+{
+	struct page *page = pfn_to_online_page(PHYS_PFN(phys));
+	unsigned long order = page->private;
+
+	if (!page)
+		return NULL;
+
+	order = page->private;
+	if (order)
+		prep_compound_page(page, order);
+	else
+		kho_restore_page(page);
+
+	return page_folio(page);
+}
+EXPORT_SYMBOL_GPL(kho_restore_folio);
+
+void *kho_restore_phys(phys_addr_t phys, size_t size)
+{
+	unsigned long start_pfn, end_pfn, pfn;
+	void *va = __va(phys);
+
+	start_pfn = PFN_DOWN(phys);
+	end_pfn = PFN_UP(phys + size);
+
+	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
+		struct page *page = pfn_to_online_page(pfn);
+
+		if (!page)
+			return NULL;
+		kho_restore_page(page);
+	}
+
+	return va;
+}
+EXPORT_SYMBOL_GPL(kho_restore_phys);
+
+#define KHOSER_PTR(type)          \
+	union {                   \
+		phys_addr_t phys; \
+		type ptr;         \
+	}
+#define KHOSER_STORE_PTR(dest, val)                 \
+	({                                          \
+		(dest).phys = virt_to_phys(val);    \
+		typecheck(typeof((dest).ptr), val); \
+	})
+#define KHOSER_LOAD_PTR(src) \
+	((src).phys ? (typeof((src).ptr))(phys_to_virt((src).phys)) : NULL)
+
+struct khoser_mem_bitmap_ptr {
+	phys_addr_t phys_start;
+	KHOSER_PTR(struct kho_mem_phys_bits *) bitmap;
+};
+
+struct khoser_mem_chunk;
+
+struct khoser_mem_chunk_hdr {
+	KHOSER_PTR(struct khoser_mem_chunk *) next;
+	unsigned int order;
+	unsigned int num_elms;
+};
+
+#define KHOSER_BITMAP_SIZE                                   \
+	((PAGE_SIZE - sizeof(struct khoser_mem_chunk_hdr)) / \
+	 sizeof(struct khoser_mem_bitmap_ptr))
+
+struct khoser_mem_chunk {
+	struct khoser_mem_chunk_hdr hdr;
+	struct khoser_mem_bitmap_ptr bitmaps[KHOSER_BITMAP_SIZE];
+};
+static_assert(sizeof(struct khoser_mem_chunk) == PAGE_SIZE);
+
+static struct khoser_mem_chunk *new_chunk(struct khoser_mem_chunk *cur_chunk,
+					  unsigned long order)
+{
+	struct khoser_mem_chunk *chunk;
+
+	chunk = (struct khoser_mem_chunk *)get_zeroed_page(GFP_KERNEL);
+	if (!chunk)
+		return NULL;
+	chunk->hdr.order = order;
+	if (cur_chunk)
+		KHOSER_STORE_PTR(cur_chunk->hdr.next, chunk);
+	return chunk;
+}
+
+static void kho_mem_ser_free(struct khoser_mem_chunk *first_chunk)
+{
+	struct khoser_mem_chunk *chunk = first_chunk;
+
+	while (chunk) {
+		unsigned long chunk_page = (unsigned long)chunk;
+
+		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
+		free_page(chunk_page);
+	}
+}
+
+/*
+ * Record all the bitmaps in a linked list of pages for the next kernel to
+ * process. Each chunk holds bitmaps of the same order and each block of bitmaps
+ * starts at a given physical address. This allows the bitmaps to be sparse. The
+ * xarray is used to store them in a tree while building up the data structure,
+ * but the KHO successor kernel only needs to process them once in order.
+ *
+ * All of this memory is normal kmalloc() memory and is not marked for
+ * preservation. The successor kernel will remain isolated to the scratch space
+ * until it completes processing this list. Once processed all the memory
+ * storing these ranges will be marked as free.
+ */
+static struct khoser_mem_chunk *kho_mem_serialize(void)
+{
+	struct kho_mem_track *tracker = &kho_mem_track;
+	struct khoser_mem_chunk *first_chunk = NULL;
+	struct khoser_mem_chunk *chunk = NULL;
+	struct kho_mem_phys *physxa;
+	unsigned long order;
+
+	xa_for_each(&tracker->orders, order, physxa) {
+		struct kho_mem_phys_bits *bits;
+		unsigned long phys;
+
+		chunk = new_chunk(chunk, order);
+		if (!chunk)
+			goto err_free;
+
+		if (!first_chunk)
+			first_chunk = chunk;
+
+		xa_for_each(&physxa->phys_bits, phys, bits) {
+			struct khoser_mem_bitmap_ptr *elm;
+
+			if (chunk->hdr.num_elms == ARRAY_SIZE(chunk->bitmaps)) {
+				chunk = new_chunk(chunk, order);
+				if (!chunk)
+					goto err_free;
+			}
+
+			elm = &chunk->bitmaps[chunk->hdr.num_elms];
+			chunk->hdr.num_elms++;
+			elm->phys_start = (phys * PRESERVE_BITS)
+					  << (order + PAGE_SHIFT);
+			KHOSER_STORE_PTR(elm->bitmap, bits);
+		}
+	}
+
+	return first_chunk;
+
+err_free:
+	kho_mem_ser_free(first_chunk);
+	return ERR_PTR(-ENOMEM);
+}
+
+static void deserialize_bitmap(unsigned int order,
+			       struct khoser_mem_bitmap_ptr *elm)
+{
+	struct kho_mem_phys_bits *bitmap = KHOSER_LOAD_PTR(elm->bitmap);
+	unsigned long bit;
+
+	for_each_set_bit(bit, bitmap->preserve, PRESERVE_BITS) {
+		int sz = 1 << (order + PAGE_SHIFT);
+		phys_addr_t phys =
+			elm->phys_start + (bit << (order + PAGE_SHIFT));
+		struct page *page = phys_to_page(phys);
+
+		memblock_reserve(phys, sz);
+		memblock_reserved_mark_noinit(phys, sz);
+		page->private = order;
+	}
+}
+
+static void __init kho_mem_deserialize(void)
+{
+	struct khoser_mem_chunk *chunk;
+	struct kho_in_node preserved_mem;
+	const phys_addr_t *mem;
+	int err;
+	u32 len;
+
+	err = kho_get_node(NULL, "preserved-memory", &preserved_mem);
+	if (err) {
+		pr_err("no preserved-memory node: %d\n", err);
+		return;
+	}
+
+	mem = kho_get_prop(&preserved_mem, "metadata", &len);
+	if (!mem || len != sizeof(*mem)) {
+		pr_err("failed to get preserved memory bitmaps\n");
+		return;
+	}
+
+	chunk = *mem ? phys_to_virt(*mem) : NULL;
+	while (chunk) {
+		unsigned int i;
+
+		memblock_reserve(virt_to_phys(chunk), sizeof(*chunk));
+
+		for (i = 0; i != chunk->hdr.num_elms; i++)
+			deserialize_bitmap(chunk->hdr.order,
+					   &chunk->bitmaps[i]);
+		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
+	}
+}
+
 /* Helper functions for KHO state tree */
 
 struct kho_prop {
@@ -545,6 +1008,11 @@ static int kho_unfreeze(void)
 	if (fdt)
 		kvfree(fdt);
 
+	if (kho_out.first_chunk_phys) {
+		kho_mem_ser_free(phys_to_virt(kho_out.first_chunk_phys));
+		kho_out.first_chunk_phys = 0;
+	}
+
 	err = blocking_notifier_call_chain(&kho_out.chain_head,
 					   KEXEC_KHO_UNFREEZE, NULL);
 	err = notifier_to_errno(err);
@@ -633,6 +1101,7 @@ static int kho_finalize(void)
 {
 	int err = 0;
 	void *fdt;
+	struct khoser_mem_chunk *first_chunk;
 
 	fdt = kvmalloc(kho_out.fdt_max, GFP_KERNEL);
 	if (!fdt)
@@ -648,6 +1117,13 @@ static int kho_finalize(void)
 	kho_out.fdt = fdt;
 	up_write(&kho_out.tree_lock);
 
+	first_chunk = kho_mem_serialize();
+	if (IS_ERR(first_chunk)) {
+		err = PTR_ERR(first_chunk);
+		goto unfreeze;
+	}
+	kho_out.first_chunk_phys = first_chunk ? virt_to_phys(first_chunk) : 0;
+
 	err = kho_convert_tree(fdt, kho_out.fdt_max);
 
 unfreeze:
@@ -829,6 +1305,10 @@ static __init int kho_init(void)
 
 	kho_out.root.name = "";
 	err = kho_add_string_prop(&kho_out.root, "compatible", "kho-v1");
+	err |= kho_add_prop(&kho_out.preserved_memory, "metadata",
+			    &kho_out.first_chunk_phys, sizeof(phys_addr_t));
+	err |= kho_add_node(&kho_out.root, "preserved-memory",
+			    &kho_out.preserved_memory);
 	if (err)
 		goto err_free_scratch;
 
@@ -1079,10 +1559,12 @@ static void __init kho_release_scratch(void)
 
 void __init kho_memory_init(void)
 {
-	if (!kho_get_fdt())
+	if (!kho_get_fdt()) {
 		kho_reserve_scratch();
-	else
+	} else {
+		kho_mem_deserialize();
 		kho_release_scratch();
+	}
 }
 
 void __init kho_populate(phys_addr_t handover_fdt_phys,
-- 
2.48.1.711.g2feabab25a-goog

