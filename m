Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D127C250C14
	for <linux-doc@vger.kernel.org>; Mon,  3 Mar 2025 16:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019459; cv=none; b=QbEaqrCOAPB/Ppp5yRma5DGHvOulvHsRAPLgMxsP8h6MhZvDyvvVIi6CVH0RtJzD+3dE6XTM+5B8/TePtlPa7Z+t+hKBe3b0B8kzGjZeEl6HY8c0KtoLaHEzzT4O0lzti+ji3yjHD5jdOZmswfkFTz8d+dWGdBTWIvTHudVcn4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019459; c=relaxed/simple;
	bh=RlWl3fpiF9O9sdm/iMb9TRR2Zh30yDuqbmqk7QeHHkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZacg2RXerq4vwbouvquu6vd255pFLiGrhtxiXsWrrTLB2672WvM7gwR4kDpdkoIqBmCvfzb6BVt1e8ThV3cG+9NgIwrMuthBbavvjS8kWHHwOlMMmq9BuEcQ2W0skpY3VFT+mhXvrBNLoEpiF1aIajWRQN6bK0w98wz5OX4yHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BwVrRVZ1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BwVrRVZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741019455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TqnqolcXMjdbgOoHxDkquZtgq0jreZJuwmbRkc4obqU=;
	b=BwVrRVZ1xC7xAbCQbZ/P+KzhM0UE/DuKdYIYV3rffin7N803Gs/6dAvicXFnSkAatqtz15
	WXKhaKHXfYATVEdFLMmCmdZtIvhuTEqUm1vkKh0Xg4t9UN4PxBFlhOxdn1M9oqcOqeKTu1
	b1Uy/gRZQRjeYc+6pTZIHNk3FGh4Zoc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-lwzRZ5dHNMqBFA_Zc_EuKg-1; Mon, 03 Mar 2025 11:30:44 -0500
X-MC-Unique: lwzRZ5dHNMqBFA_Zc_EuKg-1
X-Mimecast-MFC-AGG-ID: lwzRZ5dHNMqBFA_Zc_EuKg_1741019444
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-390e271517fso2720797f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Mar 2025 08:30:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741019443; x=1741624243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqnqolcXMjdbgOoHxDkquZtgq0jreZJuwmbRkc4obqU=;
        b=njeR5os5u49/p2lHKHxxNGl6bduzKFAJf2qnKF8P/Hf4vJT4P5zWQjV0tD6XCMpbsU
         cLb59ltRp2MdEPamdePuHHt5KBM5Q8s2nYyyLHDG/98mwNEnTm9Y5lBDqHJajePhN1jN
         5NAeWXFt6LaDROXKIAp69V7A0XX97FP3Ev8XBS6ZiZKKskBQAZeID62MVqkIU48QbWdV
         5XJzzbERzZx/OaiHpwzLElldcTGed/1nioqYIojxPrzIXghrIZtQQDoYLIKwnqOQQYRY
         zWCa2xmOIt9bBqPi2ZBXneWmK1iMZp1mGA3TEKGFCOx+F39TQmqSYnRnTdvPTAX76d00
         wDig==
X-Gm-Message-State: AOJu0Yzg4rJpRGVRTNxrfXzKQlYOGJUiOQrxzGK56NrJi1AFFQE7ez1y
	K9FSgMmZ7wxfJ+DLLiwmxWdIIWF/0xl7HqOpya/Ep9tWBnMTvimrKluU5cplVkAKbEw010KBkcs
	zjZdV6ecEYQEK/T/tjCEWsd9bXiDhXUX53oZetzJgmlDQLP182V1C3RP/+Q==
X-Gm-Gg: ASbGncsUyyqZxzTkCmmvx3MU+hQ0gjvpKj1Ky08Ze7y2q3XPVdfs2/odmS5f0ArvdfQ
	OOzRUlatOqiPmZ0WP75kYo+iLtuz+0TveNzMJdU/d26i4Nb1r/aA9SlC1iB+Tpnj8t0Gn7mJz2O
	DPFlucdZwGTOncYd2GS+WmF2UndXtOCNCQOgXkOr51c63t/STcUrWX+rMpK+NuiOiO6QH8TqeAz
	Br3GTjeLv6et+Ja30zEwtrE235HKS37S7I0mIYNyDjQYwfOvAF5/XnAeX1wDcLsHg3oL6XvhSHj
	nf6vtP0ijWxRnVh2parMPRu1c3LRgDvuuajPBSR4QMcpwb7F3mhI70L80lU4yrx9QluL7g3BgTP
	V
X-Received: by 2002:a05:6000:1fa3:b0:390:f400:2083 with SMTP id ffacd0b85a97d-390f400227cmr11383322f8f.0.1741019443607;
        Mon, 03 Mar 2025 08:30:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnhjPORrAR9y+RvgL1OaYsuXRTyHneFQKcSCvW+9sKqMuJZykkJsayBSNel9nRS5Z27sSgaA==
X-Received: by 2002:a05:6000:1fa3:b0:390:f400:2083 with SMTP id ffacd0b85a97d-390f400227cmr11383264f8f.0.1741019443130;
        Mon, 03 Mar 2025 08:30:43 -0800 (PST)
Received: from localhost (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de. [2003:cb:c734:9600:af27:4326:a216:2bfb])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bc032d049sm46650855e9.5.2025.03.03.08.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 08:30:42 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Muchun Song <muchun.song@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH v3 11/20] mm/rmap: use folio_large_nr_pages() in add/remove functions
Date: Mon,  3 Mar 2025 17:30:04 +0100
Message-ID: <20250303163014.1128035-12-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303163014.1128035-1-david@redhat.com>
References: <20250303163014.1128035-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's just use the "large" variant in code where we are sure that we
have a large folio in our hands: this way we are sure that we don't
perform any unnecessary "large" checks.

While at it, convert the VM_BUG_ON_VMA to a VM_WARN_ON_ONCE.

Maybe in the future there will not be a difference in that regard
between large and small folios; in that case, unifying the handling again
will be easy. E.g., folio_large_nr_pages() will simply translate to
folio_nr_pages() until we replace all instances.

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 08846b7eced60..c9922928616ee 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1274,7 +1274,7 @@ static __always_inline unsigned int __folio_add_rmap(struct folio *folio,
 		if (first) {
 			nr = atomic_add_return_relaxed(ENTIRELY_MAPPED, mapped);
 			if (likely(nr < ENTIRELY_MAPPED + ENTIRELY_MAPPED)) {
-				nr_pages = folio_nr_pages(folio);
+				nr_pages = folio_large_nr_pages(folio);
 				/*
 				 * We only track PMD mappings of PMD-sized
 				 * folios separately.
@@ -1522,14 +1522,11 @@ void folio_add_anon_rmap_pmd(struct folio *folio, struct page *page,
 void folio_add_new_anon_rmap(struct folio *folio, struct vm_area_struct *vma,
 		unsigned long address, rmap_t flags)
 {
-	const int nr = folio_nr_pages(folio);
 	const bool exclusive = flags & RMAP_EXCLUSIVE;
-	int nr_pmdmapped = 0;
+	int nr = 1, nr_pmdmapped = 0;
 
 	VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
 	VM_WARN_ON_FOLIO(!exclusive && !folio_test_locked(folio), folio);
-	VM_BUG_ON_VMA(address < vma->vm_start ||
-			address + (nr << PAGE_SHIFT) > vma->vm_end, vma);
 
 	/*
 	 * VM_DROPPABLE mappings don't swap; instead they're just dropped when
@@ -1547,6 +1544,7 @@ void folio_add_new_anon_rmap(struct folio *folio, struct vm_area_struct *vma,
 	} else if (!folio_test_pmd_mappable(folio)) {
 		int i;
 
+		nr = folio_large_nr_pages(folio);
 		for (i = 0; i < nr; i++) {
 			struct page *page = folio_page(folio, i);
 
@@ -1559,6 +1557,7 @@ void folio_add_new_anon_rmap(struct folio *folio, struct vm_area_struct *vma,
 		folio_set_large_mapcount(folio, nr, vma);
 		atomic_set(&folio->_nr_pages_mapped, nr);
 	} else {
+		nr = folio_large_nr_pages(folio);
 		/* increment count (starts at -1) */
 		atomic_set(&folio->_entire_mapcount, 0);
 		folio_set_large_mapcount(folio, 1, vma);
@@ -1568,6 +1567,9 @@ void folio_add_new_anon_rmap(struct folio *folio, struct vm_area_struct *vma,
 		nr_pmdmapped = nr;
 	}
 
+	VM_WARN_ON_ONCE(address < vma->vm_start ||
+			address + (nr << PAGE_SHIFT) > vma->vm_end);
+
 	__folio_mod_stat(folio, nr, nr_pmdmapped);
 	mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, 1);
 }
@@ -1681,7 +1683,7 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
 		if (last) {
 			nr = atomic_sub_return_relaxed(ENTIRELY_MAPPED, mapped);
 			if (likely(nr < ENTIRELY_MAPPED)) {
-				nr_pages = folio_nr_pages(folio);
+				nr_pages = folio_large_nr_pages(folio);
 				if (level == RMAP_LEVEL_PMD)
 					nr_pmdmapped = nr_pages;
 				nr = nr_pages - (nr & FOLIO_PAGES_MAPPED);
-- 
2.48.1

