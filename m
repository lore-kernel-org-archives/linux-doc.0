Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55602253355
	for <linux-doc@vger.kernel.org>; Mon,  3 Mar 2025 16:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019464; cv=none; b=oMZeiLQiCmZDsZe8lOhzHguaFxyC/OiH9aLoFdlEqKtkrUjuGvniJaPZWbQMWbI19SklrLSIzisGJE9LhYGuWR+330m9t9p8iVZcy2GIiFxFZH9yg8SIKBldz4keGTPk98SmHHqQ5YCeFmATOR4gK63Bf2CHFKx2zijsGTHJTgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019464; c=relaxed/simple;
	bh=tLoq8V+yWL9uG7J57/fSv64hWMwnlNF56fAlUed9ZyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MM/IVr6XZ4aqSqS0Tavab6GIdyT1Fd49QkAHrQu6QyNwgiiBurlQeCqrBoFIqV2NRUBShLcorfdCF9BulMY5KYD6Jdz9RSQi4vnE3lhVZOt5N+S4RiqnxyjNTQIZ3q02Bjroo/umKi3nRc/nQ1WANS3K3EtvrV1JweUgED+fbAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=adEnZ+oQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="adEnZ+oQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741019461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sbAdVb8IlT1mHMxqkPSZKSMArZKBklKlP7kdJIBKPLI=;
	b=adEnZ+oQOQvYbLnpMePkt3AlwHZzUy8u1XnpE+Khcr//qvPWEG6mVEfZzs3d4v/LsgOFuq
	HxrSRrBImPLcfSpVL6OpMs/iS30oKULPr4sMF8icZJQos3uw7oS89DnL4dKC/Vjl5/HXOl
	duA3gI/gMhk9NS/IJLce5dMhdleakNY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-YHoC7JaQNE-KlChBFyHIzg-1; Mon, 03 Mar 2025 11:30:59 -0500
X-MC-Unique: YHoC7JaQNE-KlChBFyHIzg-1
X-Mimecast-MFC-AGG-ID: YHoC7JaQNE-KlChBFyHIzg_1741019458
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43bc9d150d1so2519635e9.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Mar 2025 08:30:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741019458; x=1741624258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbAdVb8IlT1mHMxqkPSZKSMArZKBklKlP7kdJIBKPLI=;
        b=rpi2Gung7Ou7UiCSeFl5ufAk0Mv0MFACox+IrqWqbKhk8MEuMrJnnACGEjmtE2f9mf
         WmRlTqi6pWjh6LtW8ZyeYO0WXU5cv8zOYF4/cSwOvZsYrHlaDBsgthoDFtYpreFGHd7j
         KYv/Y6zidlMT/fDwQCPycOBGcFAWUWfriFBKhpZ09oRiudrrUgoFMDAaXnJpbhUnAOZX
         8U/lYCXKzzvAKnC+odlV5wy2uznFPwREGzJJrjAJ3cZ5YB1+CuMbwE5lOoFghTJpICE+
         xdNq2wgqheKQMOkYqZcFwI6UiIyTxWHcNJzkpTuVlcu32eo0jhnTitsPx4AR3Z1KJaOO
         bGvw==
X-Gm-Message-State: AOJu0Yxnl34qyyqAC3FlR1DVAWvqhlp8lN7r91x8msqbxcDKTbmi5NOi
	GAeFMvbDGVqix3gdokH0L60lZ0HRDcqg1tLuCNcKhy5MYRsvY65U4pR1JZuDR5fH9exDibwuiQt
	b/ADuDKAqVQE7ejKWReMJ6gSFcGdjzgLHilCU8K3OuR7HySTK3+G+UQg+vQ==
X-Gm-Gg: ASbGncuO7r+XuS+6GtoJo+ul1NJ0ZliMwHJmjfRnmw7UHk3ViArI6/FFL/jnVCNi9aa
	HTWhFXs9hGAbbO71eDggyXMqYSv1zjhH05TOFyP4hwq7rJpgTiM5ScdD5BmxvybW722MTaOF9Kr
	ocgo5G/sYMJR4Gbf9X05kbbokYj1xu6W+zoV7zotbJxKAsBJJsKR9EG4E3aLoFSEuRJ8JELfWV/
	q2KccOGbifoS1acHOG5ncVqklRVeN5v4R4kfXA0Xj1vv/omaqwzIWgKKsAWypcFTRA+fAxk/qUq
	irrLbJBakwfbRlbgXXtCgPe/MSIRA0ShoD3V8Ec1iDXu2yP3oqUCGyfST1qB/Ut72ZE6TGswkg2
	G
X-Received: by 2002:a05:6000:156d:b0:38d:e3db:9058 with SMTP id ffacd0b85a97d-390ec7cb945mr10994394f8f.12.1741019457904;
        Mon, 03 Mar 2025 08:30:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvRr8UGYMtbKKLfF4vYk+epXuFbk91XT0kZhy1XfmXmyE27quXMsv2mgA7hFUbYP+d7m+S+Q==
X-Received: by 2002:a05:6000:156d:b0:38d:e3db:9058 with SMTP id ffacd0b85a97d-390ec7cb945mr10994345f8f.12.1741019457510;
        Mon, 03 Mar 2025 08:30:57 -0800 (PST)
Received: from localhost (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de. [2003:cb:c734:9600:af27:4326:a216:2bfb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e47a6aabsm14858335f8f.26.2025.03.03.08.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 08:30:57 -0800 (PST)
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
Subject: [PATCH v3 18/20] fs/proc/task_mmu: remove per-page mapcount dependency for "mapmax" (CONFIG_NO_PAGE_MAPCOUNT)
Date: Mon,  3 Mar 2025 17:30:11 +0100
Message-ID: <20250303163014.1128035-19-david@redhat.com>
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

Let's implement an alternative when per-page mapcounts in large folios are
no longer maintained -- soon with CONFIG_NO_PAGE_MAPCOUNT.

For calculating "mapmax", we now use the average per-page mapcount in
a large folio instead of the per-page mapcount.

For hugetlb folios and folios that are not partially mapped into MMs,
there is no change.

Likely, this change will not matter much in practice, and an alternative
might be to simple remove this stat with CONFIG_NO_PAGE_MAPCOUNT.
However, there might be value to it, so let's keep it like that and
document the behavior.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/filesystems/proc.rst | 5 +++++
 fs/proc/task_mmu.c                 | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 09f0aed5a08ba..1aa190017f796 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -686,6 +686,11 @@ Where:
 node locality page counters (N0 == node0, N1 == node1, ...) and the kernel page
 size, in KB, that is backing the mapping up.
 
+Note that some kernel configurations do not track the precise number of times
+a page part of a larger allocation (e.g., THP) is mapped. In these
+configurations, "mapmax" might corresponds to the average number of mappings
+per page in such a larger allocation instead.
+
 1.2 Kernel data
 ---------------
 
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index f937c2df7b3f4..5043376ebd476 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2866,7 +2866,12 @@ static void gather_stats(struct page *page, struct numa_maps *md, int pte_dirty,
 			unsigned long nr_pages)
 {
 	struct folio *folio = page_folio(page);
-	int count = folio_precise_page_mapcount(folio, page);
+	int count;
+
+	if (IS_ENABLED(CONFIG_PAGE_MAPCOUNT))
+		count = folio_precise_page_mapcount(folio, page);
+	else
+		count = folio_average_page_mapcount(folio);
 
 	md->pages += nr_pages;
 	if (pte_dirty || folio_test_dirty(folio))
-- 
2.48.1

