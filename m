Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC951DFE0F
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151693; cv=none; b=fT7XuFglssNUf8dsJsxQqH94xAjm6N7vjnrPOxIKw5cY+Kixr90eRUpjXomempUw9Da6ikyC3Dcc8hUS4pzHM5g+5oIX4hKwN9Py2HGSsCqfLGtNzTCnygLrw41Vo4HfZ8atenfbDtE8V33iiW2TYQj4dFT+a7whnVss0UEipdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151693; c=relaxed/simple;
	bh=Y0+EdNoTZ7KKt/QbFsaS3wPTCnj2OeBbOL4l6HpHEm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oyNrneyp49jUyU2rtcTsDXW/3FZg3i6SzPOJi1vF4FJJXuQU0r3ETRzE4z6yHwHL+1g/RIFS/mHx78b8zN61aQPaO2qc0qJFljaaQ3qmpYhcNtbKZGOgZqgMKgEiUdSb9xCMD042V4Baw+uXxxDjxA1ftd9Z+xu0ExXV8Qjt5sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XsN8R1by; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XsN8R1by"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8FdUGdC2w/N5TeOcJ3tL/h1ogRWBFVvHy4t3b3m6isA=;
	b=XsN8R1bylwEDAh3+TloxaWwwdbAcysYbloaY9Y0+R4Qd0KQbC7gnnccErNiT2aPSX7+d3h
	RgATNATUgBPG7HbYoOpuJjlFKY8KwKTvCjK+Drf8FwF5/tKTyrS7zTFCA74XS6jdCCp2W+
	DmOWL+KiLw/Y1y+GZnLsEyTtsUSyDrk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-pozwuFltN6KNkuANs9rO1w-1; Wed, 29 Jan 2025 06:54:50 -0500
X-MC-Unique: pozwuFltN6KNkuANs9rO1w-1
X-Mimecast-MFC-AGG-ID: pozwuFltN6KNkuANs9rO1w
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-386333ea577so2499071f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151689; x=1738756489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FdUGdC2w/N5TeOcJ3tL/h1ogRWBFVvHy4t3b3m6isA=;
        b=hJ1Bdt3umDuN2oCkXhZFjNBWxJoNu2A7B37fBd4K0rLgh4gvCUXCWsAdYkIf2aoV2j
         F0egggsWaSLVuygEJ7/95e0hT6ojahY/bQ+dSIlB1zeBmxs2ZZKIpj0RAltjQR/c1Hj2
         Cad3GV20YI+vT1fW8S/UdazTw8Z3MihWMKt9mM+tJWPiueBgX+tfxzUHMd4NOcZmWEme
         0/7rZr3O5D5q2Gpv6apTvoNJ1ejdrplepo4956W9Mt70fzrFoch8656YCBeZnjUz4SCo
         SqgvD++A/eDwudYsj3UBcNc07A9U31annE9SF526ulN8etW4OCGmOBlsrbcGtpVSc1Hh
         ClBA==
X-Gm-Message-State: AOJu0YxinKT/apTXChddtk2qOJAClVopuyuv6L86MS9EYkxW+oW+yn5w
	6L6iG3rtjNaiWEg+Q1hqSQv9wOohfTE3R2ov/PjHKHJo9ruefQQpx71dcLU374co3UEU6f2zd/s
	sgJFFZMMlAcYi8IIIuEpFo6PWFjRqCdrIZ4V1D6W6Xe/ekCsUkNsD0DdmNQ==
X-Gm-Gg: ASbGnctRlPyjnY86pQc7thK3DtkYjaDrVaiuZz/9pMtx0m+pU+3Sewjpc5yZxaoI5em
	NF3djnnL2MNXS7BCbzrekc8GeKcF8vr7Kzd5Sb9JjNNT1FSREm02iUbvLUBDM6+TTGsNK4dDZSJ
	iJqLDdos+Mco3Zpr35lbGB+P2wTqo1bPhoBvp5p8w6ZRwC7lC5KLpgZ2d5QYSk04+CrGbto1rao
	IIMYt3RZY3uhChnOIjGEkL50244s82ZjX+TbTEbYadNCgKnRyALpKLiFwQhsnpIYJ0voWoJuU4r
	1OySrFJyRkkqXC+Anid1AI9AzwBe3YU+qrGSceldrYMD/AjJfBW1QyORcoeetAEJMQ==
X-Received: by 2002:a5d:5384:0:b0:38a:8ed1:c5c7 with SMTP id ffacd0b85a97d-38c520bdb45mr1846664f8f.46.1738151688840;
        Wed, 29 Jan 2025 03:54:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQObdLJ4S/sxdMO/dY9vI6fd5p4fQOJgmwgX26yitgXbCNTkIYH7aPDZgCkfY36quLJ2o2xA==
X-Received: by 2002:a5d:5384:0:b0:38a:8ed1:c5c7 with SMTP id ffacd0b85a97d-38c520bdb45mr1846636f8f.46.1738151688502;
        Wed, 29 Jan 2025 03:54:48 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c2a1c4006sm17020800f8f.94.2025.01.29.03.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:54:47 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
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
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v1 12/12] mm/rmap: keep mapcount untouched for device-exclusive entries
Date: Wed, 29 Jan 2025 12:54:10 +0100
Message-ID: <20250129115411.2077152-13-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that conversion to device-exclusive does no longer perform an
rmap walk and the main page_vma_mapped_walk() users were taught to
properly handle nonswap entries, let's treat device-exclusive entries just
as if they would be present, similar to how we handle device-private
entries already.

This fixes swapout/migration of folios with device-exclusive entries.

Likely there are still some page_vma_mapped_walk() callers that are not
fully prepared for these entries, and where we simply want to refuse
!pte_present() entries. They have to be fixed independently; the ones in
mm/rmap.c are prepared.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 17 +----------------
 mm/rmap.c   |  7 -------
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index db38d6ae4e74..cd689cd8a7c8 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -743,20 +743,6 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
 
 	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
 					   PageAnonExclusive(page)), folio);
-
-	/*
-	 * No need to take a page reference as one was already
-	 * created when the swap entry was made.
-	 */
-	if (folio_test_anon(folio))
-		folio_add_anon_rmap_pte(folio, page, vma, address, RMAP_NONE);
-	else
-		/*
-		 * Currently device exclusive access only supports anonymous
-		 * memory so the entry shouldn't point to a filebacked page.
-		 */
-		WARN_ON_ONCE(1);
-
 	set_pte_at(vma->vm_mm, address, ptep, pte);
 
 	/*
@@ -1628,8 +1614,7 @@ static inline int zap_nonpresent_ptes(struct mmu_gather *tlb,
 		 */
 		WARN_ON_ONCE(!vma_is_anonymous(vma));
 		rss[mm_counter(folio)]--;
-		if (is_device_private_entry(entry))
-			folio_remove_rmap_pte(folio, page, vma);
+		folio_remove_rmap_pte(folio, page, vma);
 		folio_put(folio);
 	} else if (!non_swap_entry(entry)) {
 		/* Genuine swap entries, hence a private anon pages */
diff --git a/mm/rmap.c b/mm/rmap.c
index 9e2002d97d6f..4acc9f6d743a 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2495,13 +2495,6 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	/* The pte is writable, uffd-wp does not apply. */
 	set_pte_at(mm, addr, fw.ptep, swp_pte);
 
-	/*
-	 * TODO: The device-exclusive non-swap PTE holds a folio reference but
-	 * does not count as a mapping (mapcount), which is wrong and must be
-	 * fixed, otherwise RMAP walks don't behave as expected.
-	 */
-	folio_remove_rmap_pte(folio, page, vma);
-
 	folio_walk_end(&fw, vma);
 	*foliop = folio;
 	return page;
-- 
2.48.1

