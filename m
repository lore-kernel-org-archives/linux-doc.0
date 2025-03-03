Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781F624FC0D
	for <linux-doc@vger.kernel.org>; Mon,  3 Mar 2025 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019454; cv=none; b=hhgKPr30IX3W8KWT2zKN+CyxErCfxLUKVM2AmftdBaWL9ejZ3ZaWMjOH5z3EtsxUanhDmU1DF5XNKyRBaG98w0WDFGcAxJtrtBSxqIqVJTv7h1w6Qty4l62dEFRPpVy7qFLpDxYoyfVaRFRrSbRuofdiHRo/zzZMxseYHV0iuyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019454; c=relaxed/simple;
	bh=02Xdg2rkGPtCOeGUCnvp6kwlwub3xR5UDzHXfcHWX3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYOpXyR0EOBmEn2+JM0KzMsnfaCr8ZMzhKOlQrGlIYPlakS/flNCfZT/4XLQ6qBeobWoGcA0w+gc1UTE7Vf+ZiorqOeW2RAdTeqrEw4r8pzd/VzTZVZFbq5WypHEQvHd2kzgsI7qw0qVCv53KJ6FFQ8guiRbexT4RxJcOHSM9ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=McgGWadX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="McgGWadX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741019451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L4FvEMzbdPGmsETJ2MBrv3sRxLuQ35ROZ1b2dyZFsHo=;
	b=McgGWadX8DOW3xgtWSp3x4lz8+bhNxPv38bkkmLEl6Ag2PIWzTDWYK+BtuKIVW+0i4VXaR
	2N1/rgbQtvgOc5H7F0RTIhdqz45btFrCaIqlX49tgx4HSiJSbf7rwOnuVbFq18fGE8fssQ
	bZv9F1hXT9JFg8pdhF3AkWvGxXsM4Qk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-MZnhJl8ANmmgZUe7NbS5GA-1; Mon, 03 Mar 2025 11:30:48 -0500
X-MC-Unique: MZnhJl8ANmmgZUe7NbS5GA-1
X-Mimecast-MFC-AGG-ID: MZnhJl8ANmmgZUe7NbS5GA_1741019448
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-390f365274dso1237036f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Mar 2025 08:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741019447; x=1741624247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4FvEMzbdPGmsETJ2MBrv3sRxLuQ35ROZ1b2dyZFsHo=;
        b=JVXPWidUVBALQdFjw6Ah1Fr6OPDbef3rS4sU5jmbgeHKYHqcTtlV1vSspIOQmH34dO
         7qcp/XkUUfJUjxBlCZolihBRf05lMm/72cAdtLJagws4NYog2JBW4J/v+RnnVxfhqU/Y
         y5brekNSWG8SWQ5kcCJLelLkKeP0431Zq57KK62dMOPxbvt+ioR6stJK4dSLMWGhh9Yh
         KZj1SpMq8W5Gim3Qp0644s/G9bd/7GtotLA8lnSmQoaRUMgMjToGuUTU6X/mQaCZmSZs
         bCtzgQwu0p2quOCbNqGRnDuBqcrKEcNHQWMbvtcNFCWF/63GOZQtsuUrU4pTDHwh5vpK
         eqbA==
X-Gm-Message-State: AOJu0YyBZ2sZCgFhwluAm6HGVUWH1+1XcQBXk4KRD4W7A7DhlVbNkgoV
	0H/V+Plawumw1AQSBfFRgcC5h4nrIoEf+9gIlyHcjydkZqYpN2iyTzKHPQrQ6i/21RdEaDa0nKl
	5keSSj2+CLR+fz0nUdmxQJ9QCT3vcRFNtzj8Wk66d0zpd9YRKOkAg0r7/9w==
X-Gm-Gg: ASbGnctqUIqR89srG/XA0HGxAadqcOZAF9DA6WaxSzEQBZReTYzx5vF9Icpdkgs3/a1
	+cogx2uZOUIRsa1PoapXyOT6k1Ny6ayX6aw+Zq/U+QC/rTeuqjhLlNkIDWOnAzNuTkWqGRu8DR3
	v/D4WaXFPVJab43tubPjn7i27/G4gKXvPQOIJ9fuRUUUQOQNgvraBz+/bJ6yQsdlwPHTgbQRIvX
	0A6pdXy8ovTGMgj/FkFYClYI/dSf8lZQ/ymzg+ueHOLjG1TKwu9ZhSLfe1X7qnize/0NkewquxK
	rLqWmrbqxxCaN7fs+mzNmZ5ToJ85XwaQFAqt4oNVhtMCkKvWD91hJgRoqsQavg0zFdILUlrJyvR
	y
X-Received: by 2002:a05:6000:1563:b0:390:e9e0:5cc6 with SMTP id ffacd0b85a97d-390e9e062d6mr13290384f8f.1.1741019447590;
        Mon, 03 Mar 2025 08:30:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ9qLz9Zew7W+f+EXmCL5po72v+Q03kK3/3MSwVL/z8h10XiTsQrbDI7Khsstadj0a/aIAmA==
X-Received: by 2002:a05:6000:1563:b0:390:e9e0:5cc6 with SMTP id ffacd0b85a97d-390e9e062d6mr13290341f8f.1.1741019447204;
        Mon, 03 Mar 2025 08:30:47 -0800 (PST)
Received: from localhost (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de. [2003:cb:c734:9600:af27:4326:a216:2bfb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e4795d1asm14736287f8f.4.2025.03.03.08.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 08:30:46 -0800 (PST)
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
	Jann Horn <jannh@google.com>
Subject: [PATCH v3 13/20] mm: Copy-on-Write (COW) reuse support for PTE-mapped THP
Date: Mon,  3 Mar 2025 17:30:06 +0100
Message-ID: <20250303163014.1128035-14-david@redhat.com>
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

Currently, we never end up reusing PTE-mapped THPs after fork. This
wasn't really a problem with PMD-sized THPs, because they would have to
be PTE-mapped first, but it's getting a problem with smaller THP
sizes that are effectively always PTE-mapped.

With our new "mapped exclusively" vs "maybe mapped shared" logic for
large folios, implementing CoW reuse for PTE-mapped THPs is straight
forward: if exclusively mapped, make sure that all references are
from these (our) mappings. Add some helpful comments to explain the
details.

CONFIG_TRANSPARENT_HUGEPAGE selects CONFIG_MM_ID. If we spot an anon
large folio without CONFIG_TRANSPARENT_HUGEPAGE in that code, something
is seriously messed up.

There are plenty of things we can optimize in the future: For example, we
could remember that the folio is fully exclusive so we could speedup
the next fault further. Also, we could try "faulting around", turning
surrounding PTEs that map the same folio writable. But especially the
latter might increase COW latency, so it would need further
investigation.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 83 +++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 75 insertions(+), 8 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 73b783c7d7d51..bb245a8fe04bc 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3729,19 +3729,86 @@ static vm_fault_t wp_page_shared(struct vm_fault *vmf, struct folio *folio)
 	return ret;
 }
 
-static bool wp_can_reuse_anon_folio(struct folio *folio,
-				    struct vm_area_struct *vma)
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static bool __wp_can_reuse_large_anon_folio(struct folio *folio,
+		struct vm_area_struct *vma)
 {
+	bool exclusive = false;
+
+	/* Let's just free up a large folio if only a single page is mapped. */
+	if (folio_large_mapcount(folio) <= 1)
+		return false;
+
 	/*
-	 * We could currently only reuse a subpage of a large folio if no
-	 * other subpages of the large folios are still mapped. However,
-	 * let's just consistently not reuse subpages even if we could
-	 * reuse in that scenario, and give back a large folio a bit
-	 * sooner.
+	 * The assumption for anonymous folios is that each page can only get
+	 * mapped once into each MM. The only exception are KSM folios, which
+	 * are always small.
+	 *
+	 * Each taken mapcount must be paired with exactly one taken reference,
+	 * whereby the refcount must be incremented before the mapcount when
+	 * mapping a page, and the refcount must be decremented after the
+	 * mapcount when unmapping a page.
+	 *
+	 * If all folio references are from mappings, and all mappings are in
+	 * the page tables of this MM, then this folio is exclusive to this MM.
 	 */
-	if (folio_test_large(folio))
+	if (folio_test_large_maybe_mapped_shared(folio))
+		return false;
+
+	VM_WARN_ON_ONCE(folio_test_ksm(folio));
+	VM_WARN_ON_ONCE(folio_mapcount(folio) > folio_nr_pages(folio));
+	VM_WARN_ON_ONCE(folio_entire_mapcount(folio));
+
+	if (unlikely(folio_test_swapcache(folio))) {
+		/*
+		 * Note: freeing up the swapcache will fail if some PTEs are
+		 * still swap entries.
+		 */
+		if (!folio_trylock(folio))
+			return false;
+		folio_free_swap(folio);
+		folio_unlock(folio);
+	}
+
+	if (folio_large_mapcount(folio) != folio_ref_count(folio))
 		return false;
 
+	/* Stabilize the mapcount vs. refcount and recheck. */
+	folio_lock_large_mapcount(folio);
+	VM_WARN_ON_ONCE(folio_large_mapcount(folio) < folio_ref_count(folio));
+
+	if (folio_test_large_maybe_mapped_shared(folio))
+		goto unlock;
+	if (folio_large_mapcount(folio) != folio_ref_count(folio))
+		goto unlock;
+
+	VM_WARN_ON_ONCE(folio_mm_id(folio, 0) != vma->vm_mm->mm_id &&
+			folio_mm_id(folio, 1) != vma->vm_mm->mm_id);
+
+	/*
+	 * Do we need the folio lock? Likely not. If there would have been
+	 * references from page migration/swapout, we would have detected
+	 * an additional folio reference and never ended up here.
+	 */
+	exclusive = true;
+unlock:
+	folio_unlock_large_mapcount(folio);
+	return exclusive;
+}
+#else /* !CONFIG_TRANSPARENT_HUGEPAGE */
+static bool __wp_can_reuse_large_anon_folio(struct folio *folio,
+		struct vm_area_struct *vma)
+{
+	BUILD_BUG();
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+static bool wp_can_reuse_anon_folio(struct folio *folio,
+				    struct vm_area_struct *vma)
+{
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && folio_test_large(folio))
+		return __wp_can_reuse_large_anon_folio(folio, vma);
+
 	/*
 	 * We have to verify under folio lock: these early checks are
 	 * just an optimization to avoid locking the folio and freeing
-- 
2.48.1

