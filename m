Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C361DE880
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151677; cv=none; b=s+Q32Ks9XT828bGEXRwv0Kp9onwYFTWn8HmdR57ax8/rvE1jUVI+kbNURVCvuyklQOe7hGVenQq84bUJKd1lgu6rHZG25ONEAdMP193dPy2Tskq21B9Nwopi2J0PAqt4pxfDmxV71ssr2i1eD1epA7jYmxp1iUULAUvbsAOYLxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151677; c=relaxed/simple;
	bh=TUOIefDWX1orCSp/1pnVE1CfdjwXLwRBvFvFbOJdqfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2CD/uBxw+eVeEQGUkIsOucSWXYU7Cpo1WImGyj8s3BJ2dp/cOnckxR2QNi9km6CE6Afbki+1624Ymj6PDYP+eNOL9wKrpr0izKH7nG7gWulm4aHpbqJdbrbP5oF/596HDUMW+eaTNCt4gJuqcVLQF2TW9s3I0v1Q7pOrwU2BP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yfshc1Ul; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yfshc1Ul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bwRdkJe7S5eVWCBWfyg7xh/8u+L2oGZrd41rkCVbduE=;
	b=Yfshc1UlVTAyHf+Wof3r2B5z3qQW2X5LU/m/5Dp2EvrDPQXR9BtboH5bdQtZmLz4LkDKCE
	16Gc+ge92jdzr+U5S9gLxl9WmMKX2ED5JSXaUKs7FpZYIlbp1cN8Sg7Q0ymX2X9LX+9Dw9
	jrMi2QV+6poq6Yulk0QKw86wFm31xLk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-7uB4hcs7M1qkErY53xpNkw-1; Wed, 29 Jan 2025 06:54:32 -0500
X-MC-Unique: 7uB4hcs7M1qkErY53xpNkw-1
X-Mimecast-MFC-AGG-ID: 7uB4hcs7M1qkErY53xpNkw
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43582d49dacso46637615e9.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151671; x=1738756471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bwRdkJe7S5eVWCBWfyg7xh/8u+L2oGZrd41rkCVbduE=;
        b=TalOt+QGtTNAg7D6Z39565uZbHoB2HDbHfQlGvEGutPLrieyvkb6X9TUEBIVo9u+PL
         gngGplKqnez+qaT7QTZa8G6/oit9QYnFK2kLHNGdfCaAd+FVMKm4tArJ+zPnqa9XeJU8
         yomxhx8G+YIMWgKpU8ARRtbVFCu4rGtxStCW3TIIZdEe5ZVBvlEOGYVe9DN29YnF/V5U
         SAgFwTGjaBvBDtQr/COigZIATNyoq8yGzBZnLDB/mVEIcQMIMRYamJsU/uN6qtJHBlhp
         Z+5LhoR15nab20RrJODHifVSpHb3uCngBhNSHLhiDnw9nIHoXmO/bob6rPnwK+DEQnOI
         dgYA==
X-Gm-Message-State: AOJu0YxQND+B9mFaesqP6zNlidyl/sDeakAlGJUDSTPGOzH4N/LDURrn
	1Wd4nbMtKxe7Ltx+OZ+5B924c+YvJbu/ee+ESdHCIi5l2trt6Sj59r00wxqWdgKYtCT2mrHVX4v
	dfdk6XpPHxIAejRkMn9039Hp+ZZVo0ORyXeoESQoqNxroXZjoNmngLHDkAw==
X-Gm-Gg: ASbGncsNhowJijXI6EyvPVo5N7Ii57GCDsMgSjW1PsBxdLNdLz0t8LwHxN3V2iYlA9o
	kV1gi3Wdsdi4ie4dRoM5PwxWbA5S/Vt0TYgtMPHJnhh0xHeLb8d7UfhtGa4wjEY1UUuYlbk+dyh
	V5f85T55GOOFyZ5d1R+lEY3YbbOOOjBdAr2Zw+iuEac1UUDIqyF+qd79WHKLqT++2ercfmqUPfj
	Ll/zaeKh6gtnyE+Q73mCFtkS83sgw3TnloGkXUmCoXwGp38sJARkQ5dWzxtH50jNaffiugE9UGy
	PTRrVl8r45mMvzrZLLqKoqwHLUs1bBpEYF+i+nIj/uLPbRck+zx3NubGd8mOmUfqOQ==
X-Received: by 2002:a05:600c:1c1a:b0:434:f9c4:a850 with SMTP id 5b1f17b1804b1-438dc3c4623mr25664855e9.10.1738151671650;
        Wed, 29 Jan 2025 03:54:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhuPkSFqdGYqW92VDVvy4lKssWj+By02GdvgYFn3sg13RZ9e45UT5b96yUwTD+A2GCuT4qDg==
X-Received: by 2002:a05:600c:1c1a:b0:434:f9c4:a850 with SMTP id 5b1f17b1804b1-438dc3c4623mr25664525e9.10.1738151671268;
        Wed, 29 Jan 2025 03:54:31 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438dcc24e73sm20192895e9.16.2025.01.29.03.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:54:30 -0800 (PST)
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
Subject: [PATCH v1 06/12] mm: use single SWP_DEVICE_EXCLUSIVE entry type
Date: Wed, 29 Jan 2025 12:54:04 +0100
Message-ID: <20250129115411.2077152-7-david@redhat.com>
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

There is no need for the distinction anymore; let's merge the readable
and writable device-exclusive entries into a single device-exclusive
entry type.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/swap.h    |  7 +++----
 include/linux/swapops.h | 27 ++++-----------------------
 mm/mprotect.c           |  8 --------
 mm/page_table_check.c   |  5 ++---
 mm/rmap.c               |  2 +-
 5 files changed, 10 insertions(+), 39 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 91b30701274e..9a48e79a0a52 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -74,14 +74,13 @@ static inline int current_is_kswapd(void)
  * to a special SWP_DEVICE_{READ|WRITE} entry.
  *
  * When a page is mapped by the device for exclusive access we set the CPU page
- * table entries to special SWP_DEVICE_EXCLUSIVE_* entries.
+ * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
  */
 #ifdef CONFIG_DEVICE_PRIVATE
-#define SWP_DEVICE_NUM 4
+#define SWP_DEVICE_NUM 3
 #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
 #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
-#define SWP_DEVICE_EXCLUSIVE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
-#define SWP_DEVICE_EXCLUSIVE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
+#define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
 #else
 #define SWP_DEVICE_NUM 0
 #endif
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 96f26e29fefe..64ea151a7ae3 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -186,26 +186,16 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
 	return unlikely(swp_type(entry) == SWP_DEVICE_WRITE);
 }
 
-static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t offset)
+static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
-	return swp_entry(SWP_DEVICE_EXCLUSIVE_READ, offset);
-}
-
-static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t offset)
-{
-	return swp_entry(SWP_DEVICE_EXCLUSIVE_WRITE, offset);
+	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
 }
 
 static inline bool is_device_exclusive_entry(swp_entry_t entry)
 {
-	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE_READ ||
-		swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE;
+	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE;
 }
 
-static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
-{
-	return unlikely(swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE);
-}
 #else /* CONFIG_DEVICE_PRIVATE */
 static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 {
@@ -227,12 +217,7 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
 	return false;
 }
 
-static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t offset)
-{
-	return swp_entry(0, 0);
-}
-
-static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t offset)
+static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
@@ -242,10 +227,6 @@ static inline bool is_device_exclusive_entry(swp_entry_t entry)
 	return false;
 }
 
-static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
-{
-	return false;
-}
 #endif /* CONFIG_DEVICE_PRIVATE */
 
 #ifdef CONFIG_MIGRATION
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 516b1d847e2c..9cb6ab7c4048 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -225,14 +225,6 @@ static long change_pte_range(struct mmu_gather *tlb,
 				newpte = swp_entry_to_pte(entry);
 				if (pte_swp_uffd_wp(oldpte))
 					newpte = pte_swp_mkuffd_wp(newpte);
-			} else if (is_writable_device_exclusive_entry(entry)) {
-				entry = make_readable_device_exclusive_entry(
-							swp_offset(entry));
-				newpte = swp_entry_to_pte(entry);
-				if (pte_swp_soft_dirty(oldpte))
-					newpte = pte_swp_mksoft_dirty(newpte);
-				if (pte_swp_uffd_wp(oldpte))
-					newpte = pte_swp_mkuffd_wp(newpte);
 			} else if (is_pte_marker_entry(entry)) {
 				/*
 				 * Ignore error swap entries unconditionally,
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 509c6ef8de40..c2b3600429a0 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -196,9 +196,8 @@ EXPORT_SYMBOL(__page_table_check_pud_clear);
 /* Whether the swap entry cached writable information */
 static inline bool swap_cached_writable(swp_entry_t entry)
 {
-	return is_writable_device_exclusive_entry(entry) ||
-	    is_writable_device_private_entry(entry) ||
-	    is_writable_migration_entry(entry);
+	return is_writable_device_private_entry(entry) ||
+	       is_writable_migration_entry(entry);
 }
 
 static inline void page_table_check_pte_flags(pte_t pte)
diff --git a/mm/rmap.c b/mm/rmap.c
index 49ffac6d27f8..65d9bbea16d0 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2470,7 +2470,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	 * do_swap_page() will trigger the conversion back while holding the
 	 * folio lock.
 	 */
-	entry = make_writable_device_exclusive_entry(page_to_pfn(page));
+	entry = make_device_exclusive_entry(page_to_pfn(page));
 	swp_pte = swp_entry_to_pte(entry);
 	if (pte_soft_dirty(fw.pte))
 		swp_pte = pte_swp_mksoft_dirty(swp_pte);
-- 
2.48.1

