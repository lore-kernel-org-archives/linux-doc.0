Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB452512E7
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 19:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216354; cv=none; b=FApDeqyIY3qXNewjnpc4F1A7lS53QjPiHo+FE+poV8U+GGDxJZQSODppyroHkU3fn8nxmHBCJyb4G7gwcASUxbd1eHq+nrrz1JGmZtsdVfENUUN/E5C9JVyhiT6drnRTt9lrpPkK1kIB3IV/CkL3jou9/HJWKI2lv+GnOyfAFlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216354; c=relaxed/simple;
	bh=PA01cEf2/9mIQZ9O32CRa6PGoRajWbPJGABkde9iNzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6PES+5HFacZNulAP53dptKO8IRwfnlOqG9yHbsSYSD1J+fOgkkqAvzdUG5vtJEDo1myE1JNcqjSclNaWHq9ZFeJvBY/yp0tlD7Jb9c1jTlUVavzZRf/RHpMJ2AjcvIHJ482Tb1K+QN9A6+0RdVlXJLBL2g1DZwsQaerNcjw0xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bC8Kx+Xd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bC8Kx+Xd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739216352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gxIo4/a9ZeK4nnisZvQU6AU2gxtpzJDN86Rrv62j7Tk=;
	b=bC8Kx+XdEnbyqg22ao4ynArdTUfP4C95gMF6sY7ngBaO6SHdSjyRIRyMyemnUamAeilVBS
	4zHwwbebRd6GE2bDug+ISNAhwHnYwMHWiB2ijDyaTNPNRyBfGIw8lXZ59azG8f/u2dJ78L
	KP/iuzb9VpwliRmYWNb9fHQ8uwCrHeY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-UFlkTiRENYeL1DfVoNQq3g-1; Mon, 10 Feb 2025 14:39:10 -0500
X-MC-Unique: UFlkTiRENYeL1DfVoNQq3g-1
X-Mimecast-MFC-AGG-ID: UFlkTiRENYeL1DfVoNQq3g
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38ddba9814bso733060f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 11:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216349; x=1739821149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxIo4/a9ZeK4nnisZvQU6AU2gxtpzJDN86Rrv62j7Tk=;
        b=mbZdm6bfQRO+anf855yWSGwG7qYxEInpXuzuORClnwuxYeJG31H9QkpdpRWYStC2Mq
         6BhOau16l3QQDf2VECdFicbC0ljfM1lKOCHPREE7h0VbQRwZDXGZtWcI0ed1VB1PxgPG
         KS6PD7ePiybKePVLEEKRoAaIKJ2BF1mZTtgFyfeuwyUTFMTYk/xfk2h6hrHRYHG39qA9
         XQqFoYWbh1Ovu5kkO++u7NyfOn+jLLfBVUAJqdu0qfyyc4ccrbeHT1FyWCq60eByFBf+
         x0Jrzaho0DtmztWUAMMHmLniU6CSF9iIpsKmMljV/VeE8XpHxbGa8fmCNnSqwfWaLslV
         0qgg==
X-Gm-Message-State: AOJu0YwZrYPpo61W6reaRGpg7g+56/BhAV7umzBSANvjmjK9xvlXwiTZ
	+VcbOkqkO15IUhMkhlfKiLr7pgytLsX/rXClvWAWm9nPIKAZWv8KNmPt7uLM0UGI40TSkxIdFXE
	vT4LNuelM4lc/x1UvhEcQ4LpRHpcg7tEYwTRfuuXciumehJWW8ZxSE7YAiA==
X-Gm-Gg: ASbGncvBYTDA4gLs3wGVB3mi3BdvmFvKZtmCZEab2F36KMSO1PbsVzN1kiLYZE50VMU
	2jis+HwQjLKmpuYvFpEoVvh435cHBVrkfaDpvVGidRh/XMFlAkhan/ISIRKKry5GYQVbmGstDXb
	cujlX8HvrRbGNJ3pq0a1ZggPSVjmIuZ2a3klyP2JS6VJvGqtqhK3qrmozxMpaRN1/bGUYBLxR3k
	ajvtwFPPDW2AmsBNRWGnnusqNuwYbUeZeHD9Av5ggwYFLUCCYx1BURRiF0+GzZu7yTYlW7djSRt
	xQM/Wmo3pq1ipVP3gXhiCHMZDB4mtInuKZTWzpRTg8h3sJDewij/14dI7iy5eqTc5A==
X-Received: by 2002:a05:6000:1448:b0:38d:a879:4778 with SMTP id ffacd0b85a97d-38dc9343f89mr13325600f8f.33.1739216349519;
        Mon, 10 Feb 2025 11:39:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOm3YA+KmUhyhlND1SLmjpOJWvwKHSp1MsMH3YdrdBRb69cVHv165Q1M/eFn8bTRexW9yPlw==
X-Received: by 2002:a05:6000:1448:b0:38d:a879:4778 with SMTP id ffacd0b85a97d-38dc9343f89mr13325571f8f.33.1739216349113;
        Mon, 10 Feb 2025 11:39:09 -0800 (PST)
Received: from localhost (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dca0b4237sm10326047f8f.85.2025.02.10.11.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:39:07 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	damon@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 17/17] mm/rmap: avoid -EBUSY from make_device_exclusive()
Date: Mon, 10 Feb 2025 20:37:59 +0100
Message-ID: <20250210193801.781278-18-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Failing to obtain the folio lock, for example because the folio is
concurrently getting migrated or swapped out, can easily make the callers
fail: for example, the hmm selftest can sometimes be observed to fail
because of this. Instead of forcing the caller to retry, let's simply
retry in this to-be-expected case.

Similarly, avoid spurious failures simply because we raced with someone
(e.g., swapout) modifying the page table such that our folio_walk fails.

Simply unconditionally lock the folio, and retry GUP if our folio_walk
fails. Note that the folio_walk repeatedly failing is not something we
expect.

Note that we might want to avoid grabbing the folio lock at some point;
for now, keep that as is and only unconditionally lock the folio.

With this change, the hmm selftests don't fail simply because the folio
is already locked. While this fixes the selftests in some cases, it's
likely not something that deserves a "Fixes:".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index e2a543f639ce3..0f760b93fc0a2 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2435,6 +2435,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	struct page *page;
 	swp_entry_t entry;
 	pte_t swp_pte;
+	int ret;
 
 	mmap_assert_locked(mm);
 	addr = PAGE_ALIGN_DOWN(addr);
@@ -2448,6 +2449,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	 * fault will trigger a conversion to an ordinary
 	 * (non-device-exclusive) PTE and issue a MMU_NOTIFY_EXCLUSIVE.
 	 */
+retry:
 	page = get_user_page_vma_remote(mm, addr,
 					FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
 					&vma);
@@ -2460,9 +2462,10 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 		return ERR_PTR(-EOPNOTSUPP);
 	}
 
-	if (!folio_trylock(folio)) {
+	ret = folio_lock_killable(folio);
+	if (ret) {
 		folio_put(folio);
-		return ERR_PTR(-EBUSY);
+		return ERR_PTR(ret);
 	}
 
 	/*
@@ -2488,7 +2491,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 		mmu_notifier_invalidate_range_end(&range);
 		folio_unlock(folio);
 		folio_put(folio);
-		return ERR_PTR(-EBUSY);
+		goto retry;
 	}
 
 	/* Nuke the page table entry so we get the uptodate dirty bit. */
-- 
2.48.1

