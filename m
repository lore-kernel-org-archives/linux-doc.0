Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695AA23BCEE
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 03:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516636; cv=none; b=Fi3PVqpjshrfqJDEKWcCv0fSxScr9DSLmCv1ZPArTt+9iLmP2ofq5CR2mcVl+PQiOMxjDW15S+58YTyNLTrciI1qoFqrBx8VHRjZvW01qLtB+TC/jO2mUUmgUZtrMN8x7WBE/QAI/6dKiVUOkdCFW95fbYd4jcT/bz18kkhGIHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516636; c=relaxed/simple;
	bh=nS+ihT8yiDs312RlqRcd39KPDyY9S4PRM4guYmebc9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pcCnxUkv7DOJRy5CWOA3iz657Qqqbj0ucus79NaQcopzIflhQ+9p41IGEnwKcSyF0HmWGL4eB7z4DV2ziqjRclqLxIYvu6nVAkGJUCmmEsKYV3EtmfpOP+w4aF7H2REpijVIwksI29XAestZLUVWbaP3e/dH9kXhlbrn/o/senQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVuhkggL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVuhkggL"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caed617615so106548555ad.3
        for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 20:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784516634; x=1785121434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+CN3F8GNJ49+wMCUtm6B3zkpBPb78+r1IbCrOzeLVY=;
        b=ZVuhkggLQeTrrcQo7xuaVftVKlVfYYI5NrbIaDUVtEkotIODt39SjBSVg1t1K9PImy
         nWp3qHDKz4AxCDiMxvdLhW48mFZlf6xS5varigeAgoSNeLeILOQfDkWcUfHX5JTFhnf4
         Jm0mLNnsbuxbAaOiDVI7MAQrhjNLB/HGnDIklSx43/0AGrZElQAXUtrRS5c0y7dx7VnW
         FyfREacoYQPgTFVtphHRyYFpjAUW2Vvqkv9HRhAerq9xLBwX119BonlZ3p4c0gs2KDsR
         7GWXBWUYcOdPfQkIi4DEdSKGdmt/2zDA0V6SknulidkOfQevEQIOUmFZD9Sc6RJHYVAr
         ZUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784516634; x=1785121434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+CN3F8GNJ49+wMCUtm6B3zkpBPb78+r1IbCrOzeLVY=;
        b=sNdK8XOnMRd5ESTyL48zC4LRGuLRd9ke7ro6Dyr46PjwDdXowNOOQHlM/iOcLuJrZ5
         UfVYoZCMcrnMKtGT5GGhqkBovc6lz+eBtJqTy3zIqRkdvc4KjSLvvH9E6MirmSmifFPj
         +2H5g5WQ/2YlNdW3ZzUzp5rb72LmUpp6aImhwQz+ks/V3jKbeAnykq9U11Swqt+kIvC/
         qPBhcQcaRuwEiHL4mGXxeDtbV9FBg6RMQ47hHXwc2+YcHzVSicjrY1psr6oMhY1ZF9pU
         uVCcKIB/DoEMxaYxS0ZSzE2BcCCsLobcOUGxETEvU6aAtV4Lh6pE3Gt/GLr5b7FzfkOW
         /KNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqQ3sSuf3Eibkhiyh0oFrX63Ku+J06cNaeEVeQLTCMf2K5/P/jupxFDZxTNvfmSQFihPaPygtzHyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5d11cPc/70biolrJk1TZ9K6EL9TNubbxDNPaa5BEFfisntc2A
	gRJsWnO02YP7/ShfhmCkghgC7rJuBHZubpNm7QJKMPA1eI7ZeJgLtTlU
X-Gm-Gg: AfdE7clnYpN+MfPzRFaD6L3VxJKi5tWIcIGDBAFp6hf8PnF3B2n9VQPnN6Gjozzg6dY
	df6205IZiYlk1QORn0RcuRFUy+nLNw7tworSljkcGC/ZHamgP5ET83GjvpFMRkxpFTlQs6WCwps
	tOZ24+DQiA3Z5VFxY6wD28I5bN2pTnWYKjtp70/a2+z+n3afziKCgimsj8gjS/d+YahJ/pIb4K6
	UHpbx3N4mL2s3MmEMRFASNjVGK2B0YqP4qYhXUT607VkZiqTATA0ugPXgbRDWDfH5SslKweImJH
	WxJNp2OCgXGbwCk31JdcV+hW6Vm1MHb8gruJcyeuoIkxelx0KMTnGtOCnrovWZBGppJM+bE682I
	HAZN31ABYSVkfvaQ8CoxNcBHDW4jRJCJAHgNLPbTsqtbaVMCCk8icgCB+YF+vdmWJmx59KcXIpp
	1Fjd+4AlcdXrvU22hMheqX+nkuJA4=
X-Received: by 2002:a17:902:e54b:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2cf348547d0mr141397945ad.12.1784516633659;
        Sun, 19 Jul 2026 20:03:53 -0700 (PDT)
Received: from localhost.localdomain ([112.65.87.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344d80e6sm47783065ad.29.2026.07.19.20.03.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Jul 2026 20:03:53 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	npache@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	daichaobing@sangfor.com.cn,
	wangkefeng.wang@huawei.com,
	gutierrez.asier@huawei-partners.com,
	zengheng4@huawei.com,
	kasong@tencent.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	lianux.mm@gmail.com,
	lianux.wang@processmission.com,
	kunwu.chan@linux.dev
Subject: [RFC PATCH v3 2/3] mm/damon/vaddr: implement DAMOS_SPLIT handler
Date: Mon, 20 Jul 2026 11:03:26 +0800
Message-ID: <20260720030327.80153-3-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720030327.80153-1-lianux.mm@gmail.com>
References: <20260720030327.80153-1-lianux.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement DAMOS_SPLIT for the vaddr and fvaddr operations sets.  For
each large folio in the target region whose order exceeds the scheme's
order, split it down using split_folio_to_order() -- the same helper
used by truncation, migration, ksm and shmem.  No new core-mm code or
exported symbols are introduced.

split_folio_to_order() must not run under the page table lock, so the
folio is pinned (folio_trylock + folio_get), the walk is ended to drop
the page table lock, and the split runs while holding only mmap_read_lock.

The scheme's operations-layer filters are honoured, and the amount of
memory that passed those filters is reported via sz_filter_passed.



Co-developed-by: Kunwu Chan <kunwu.chan@linux.dev>
Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
Signed-off-by: Lian Wang (Processmission) <lianux.mm@gmail.com>
---
 mm/damon/vaddr.c | 108 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index d10b8042adb5..a8607448584d 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt) "damon-va: " fmt
 
 #include <linux/highmem.h>
+#include <linux/huge_mm.h>
 #include <linux/hugetlb.h>
 #include <linux/mman.h>
 #include <linux/mmu_notifier.h>
@@ -896,6 +897,111 @@ static unsigned long damos_va_stat(struct damon_target *target,
 	return 0;
 }
 
+/*
+ * damos_va_split() - Split large folios in a region down to @target_order
+ * using the existing split_folio_to_order().
+ *
+ * Locking: folio_walk_start() returns the folio with the page table lock
+ * held.  split_folio_to_order() must not run under the page table lock,
+ * so we pin the folio (reference + lock), end the walk to drop the page
+ * table lock, and split while holding only mmap_read_lock.
+ * split_folio_to_order() returns -EBUSY for a raced or pinned folio;
+ * we skip such folios.
+ */
+static unsigned long damos_va_split(struct damon_target *target,
+		struct damon_region *r, struct damos *s,
+		unsigned long *sz_filter_passed)
+{
+	unsigned int target_order = s->order;
+	unsigned long addr = ALIGN_DOWN(r->ar.start, PAGE_SIZE);
+	unsigned long end = r->ar.end;
+	unsigned long applied = 0;
+	struct mm_struct *mm;
+
+	mm = damon_get_mm(target);
+	if (!mm)
+		return 0;
+
+	while (addr < end) {
+		struct vm_area_struct *vma;
+		struct folio *folio;
+		struct folio_walk fw;
+		unsigned long folio_sz = 0;
+
+		if (mmap_read_lock_killable(mm))
+			break;
+
+		vma = vma_lookup(mm, addr);
+		if (!vma) {
+			/* Skip the gap to the next VMA, if any. */
+			vma = find_vma(mm, addr);
+			mmap_read_unlock(mm);
+			if (!vma || vma->vm_start >= end)
+				break;
+			addr = vma->vm_start;
+			continue;
+		}
+
+		/* Folios in these VMAs are not our business. */
+		if (vma->vm_flags & (VM_HUGETLB | VM_MIXEDMAP)) {
+			addr = vma->vm_end;
+			mmap_read_unlock(mm);
+			continue;
+		}
+
+		folio = folio_walk_start(&fw, vma, addr, 0);
+		if (!folio) {
+			mmap_read_unlock(mm);
+			addr += PAGE_SIZE;
+			continue;
+		}
+
+		folio_sz = folio_size(folio);
+
+		/*
+		 * For file-backed folios, @target_order may be below the
+		 * filesystem's minimum folio order (mapping_min_folio_order()).
+		 * split_folio_to_order() will simply fail in that case and
+		 * we skip the folio.  This is a safe no-op; future work can
+		 * adjust target_order upward like split_huge_pages_in_pid()
+		 * does when a specific filesystem needs it.
+		 */
+
+		/* Honour the scheme's operations-layer filters. */
+		if (damos_ops_has_filter(s)) {
+			if (damos_va_filter_out(s, folio, vma, addr,
+					fw.level == FW_LEVEL_PTE ? fw.ptep : NULL,
+					fw.level == FW_LEVEL_PMD ? fw.pmdp : NULL)) {
+				folio_walk_end(&fw, vma);
+				mmap_read_unlock(mm);
+				goto next;
+			}
+			*sz_filter_passed += folio_sz;
+		}
+
+		if (folio_order(folio) > target_order && folio_trylock(folio)) {
+			folio_get(folio);
+			/* Drop the page table lock before splitting. */
+			folio_walk_end(&fw, vma);
+
+			if (!split_folio_to_order(folio, target_order))
+				applied += folio_sz;
+
+			folio_unlock(folio);
+			folio_put(folio);
+		} else {
+			folio_walk_end(&fw, vma);
+		}
+		mmap_read_unlock(mm);
+next:
+		addr = ALIGN_DOWN(addr, folio_sz) + folio_sz;
+		cond_resched();
+	}
+
+	mmput(mm);
+	return applied;
+}
+
 static unsigned long damon_va_apply_scheme(struct damon_ctx *ctx,
 		struct damon_target *t, struct damon_region *r,
 		struct damos *scheme, unsigned long *sz_filter_passed)
@@ -926,6 +1032,8 @@ static unsigned long damon_va_apply_scheme(struct damon_ctx *ctx,
 		return damos_va_migrate(t, r, scheme, sz_filter_passed);
 	case DAMOS_STAT:
 		return damos_va_stat(t, r, scheme, sz_filter_passed);
+	case DAMOS_SPLIT:
+		return damos_va_split(t, r, scheme, sz_filter_passed);
 	default:
 		/*
 		 * DAMOS actions that are not yet supported by 'vaddr'.
