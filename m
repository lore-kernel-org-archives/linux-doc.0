Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B5048A2CA
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995545; cv=none; b=Ef+u4YF9E0MON5veWq+LoAO6KgmTxphH6nDK8MnXTzScqajsoXHBrqQTAA/uCNVuGLmq754zcV6zZ/nM//Fb6J7F2E+gwgNzmu3fcOQkxrk1NSNv4k4wP3OpF0nAs+xjOmySrFyxMcjVGWpsajWl30AxDaKvVAGjKo04tyBxe30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995545; c=relaxed/simple;
	bh=+i2M3QsRmqyfUDxMwLqc+K4McxB9zKGXaVZwYP0KXD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHqystwM5bPPKd9gjRLa+oKfj2QVxFUSms5ZkLveZ6gsR7W7MLc8OauRq+M0Awb0KKBKn4ea5XjaY2tpV0pJclCr7QhNCrKUgwbUHKMlM4eUET9YYA9M6i87T8ggnYtmpnz//g9JB+mUS0s1sgPwx79LkGCO+LI+Wx/fZypia+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFmxAHye; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFmxAHye"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d4be94eeacso6074808a34.2
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777995541; x=1778600341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPCSau5pSh9+F1pyHZnzuS9hVsnYodnKvGY7/tGPc+Q=;
        b=KFmxAHyedw0qjIJYR3hKfwKPguT3nKHu09MaPlPboDGFIzZWw6sMANuzoNGjyPznE1
         79IVukLgL3bh8S7R0fmc/3uv+vl/OIuSTQJNvOTmGSyYp6O3gqjENq/jSa3xYzaxxRum
         RZIudMfz4fjc9SvQ7X/xjXC4DBFeKerlgWF2z5I2/f2F4kjNeEeaz5wu5jy/vc3kP9kC
         oNfGSYvXKf4nh/eYplF5CYqrD4jzhoDYDujdoDfSEASrxw069fq9TQUhZqvnjhGLSlEp
         LmFIG/qXlBkL2VAJ0XgZB2ldFhrHbLYalzzeTJMXXwYsYeCRN2lwkgSAB6LGn7Bm9MIh
         Arnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995541; x=1778600341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UPCSau5pSh9+F1pyHZnzuS9hVsnYodnKvGY7/tGPc+Q=;
        b=VPmvfKJLT3AZ1ElaQFvFlIRmuPX7uUhHOF8YWieJ5hRIEEI5ZO4PrK7v4dwOGpARJq
         JI1t4B2ojtu3aLcUUoDEwhQphD+PyXBX4ciVSVERUyxD9q4ySwr4Vjj8EmuShD0B3tX1
         vnF1f8Yncb8hE+BiqRHKW4eRdd6g4cmYab4wOheavtr4k/rqOZi4FrDL+fQqv2J3Z/Hc
         3sGjslEOLZLeGoqi1aDRYXlA0DMfwBMmb8zvaIbpgXUNN1gRenBuVrq6gzsPnDhDGr4b
         wMHug1C09h10s4/fea99tAVEC9qHB78DYWHrbVAYmG23VVRhcS1lcaHA8M6PshljKbFQ
         cmgA==
X-Forwarded-Encrypted: i=1; AFNElJ81xarqGvbtxc2kVNW+pCX1DXbQe+xjMAngv7rFo9k/eKG4klr7lYtatHrQimJdiw8RKhIDhLsnYyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMUEgVDmkjDLYpQRO5slhLrx+SsCUKh2KQzUXKR6Ocer8ejAhz
	CuhkY4GSZojsjBvXiWgvjchTm9VgL27v0otFYCdEa7YIi7x6ejpUDA/vKYJ3q2bCY70=
X-Gm-Gg: AeBDievPKvpnYMlM8XpAOTkKkupHXt+0JfnNVgxcu4g2bTjrcLSkB1VKNhNDKDD+OH1
	oG8kctpfmJYtBorjZFyba4FpwuXJ9LZgsi+4NxB60yndv1BeW9vilcMKCRJHdlODFoPDMlzf4JS
	2xHC3rQc5ME+Gs05wjpXSbOskDxtQ9XiyXZbaLsJHONlAqPKDg6/EUvaGN/PtBWuJexm7JGP6DA
	s1v2/sKYALwVSlkGPQc7WR8Nu6K4H4UOc9fpQ858wllxUStTzHcUkNNu9T9p5Am5BItk1lV+e7Q
	khP9FFHClz9yF6Q10sAPxfnJRYAL91cvmJIxCC5peXYSBKu2Z3Coq3xaJkb7rt/p0ZCvBPiP7vo
	oj/jpOZfR3U33bMthwR15WsAOGIwQuJhACcxXrCzKDnHjUmHMPPSrwyZxK27FFUlzH0U1lRp/jt
	vPJfD7C8444aGYqqHHHT+mXoig8dGImAjd5MTAPs863jYKwobCh5hnfAhOw4xTHdstPTo=
X-Received: by 2002:a05:6830:3906:b0:7d7:e844:7f4e with SMTP id 46e09a7af769-7dee14562acmr7829174a34.22.1777995540927;
        Tue, 05 May 2026 08:39:00 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:47::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deced80854sm9907964a34.18.2026.05.05.08.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:39:00 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: kasong@tencent.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	apopple@nvidia.com,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	bhe@redhat.com,
	byungchul@sk.com,
	cgroups@vger.kernel.org,
	chengming.zhou@linux.dev,
	chrisl@kernel.org,
	corbet@lwn.net,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	hughd@google.com,
	jannh@google.com,
	joshua.hahnjy@gmail.com,
	lance.yang@linux.dev,
	lenb@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pm@vger.kernel.org,
	lorenzo.stoakes@oracle.com,
	matthew.brost@intel.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	npache@redhat.com,
	nphamcs@gmail.com,
	pavel@kernel.org,
	peterx@redhat.com,
	peterz@infradead.org,
	pfalcato@suse.de,
	rafael@kernel.org,
	rakie.kim@sk.com,
	roman.gushchin@linux.dev,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shakeel.butt@linux.dev,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	tglx@kernel.org,
	vbabka@suse.cz,
	weixugc@google.com,
	ying.huang@linux.alibaba.com,
	yosry.ahmed@linux.dev,
	yuanchu@google.com,
	zhengqi.arch@bytedance.com,
	ziy@nvidia.com,
	kernel-team@meta.com,
	riel@surriel.com,
	haowenchao22@gmail.com
Subject: [PATCH v6 02/22] swap: rearrange the swap header file
Date: Tue,  5 May 2026 08:38:31 -0700
Message-ID: <20260505153854.1612033-3-nphamcs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260505153854.1612033-1-nphamcs@gmail.com>
References: <20260505153854.1612033-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the swap header file (include/linux/swap.h), group the swap API into
the following categories:

1. Lifecycle swap functions (i.e the function that changes the reference
   count of the swap entry).

2. Swap cache API.

3. Physical swapfile allocator and swap device API.

Also remove extern in the functions that are rearranged.

This is purely a clean up. No functional change intended.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 include/linux/swap.h | 53 +++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 38ca3df68716..aa29d8ac542d 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -423,20 +423,34 @@ extern void __meminit kswapd_stop(int nid);
 
 #ifdef CONFIG_SWAP
 
-int add_swap_extent(struct swap_info_struct *sis, unsigned long start_page,
-		unsigned long nr_pages, sector_t start_block);
-int generic_swapfile_activate(struct swap_info_struct *, struct file *,
-		sector_t *);
-
+/* Lifecycle swap API (mm/swapfile.c) */
+int folio_alloc_swap(struct folio *folio);
+bool folio_free_swap(struct folio *folio);
+void put_swap_folio(struct folio *folio, swp_entry_t entry);
+void swap_shmem_alloc(swp_entry_t, int);
+int swap_duplicate(swp_entry_t);
+int swapcache_prepare(swp_entry_t entry, int nr);
+void swap_free_nr(swp_entry_t entry, int nr_pages);
+void free_swap_and_cache_nr(swp_entry_t entry, int nr);
+int __swap_count(swp_entry_t entry);
+bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry);
+int swp_swapcount(swp_entry_t entry);
+
+/* Swap cache API (mm/swap_state.c) */
 static inline unsigned long total_swapcache_pages(void)
 {
 	return global_node_page_state(NR_SWAPCACHE);
 }
-
-void free_swap_cache(struct folio *folio);
 void free_folio_and_swap_cache(struct folio *folio);
 void free_pages_and_swap_cache(struct encoded_page **, int);
-/* linux/mm/swapfile.c */
+void free_swap_cache(struct folio *folio);
+
+/* Physical swap allocator and swap device API (mm/swapfile.c) */
+int add_swap_extent(struct swap_info_struct *sis, unsigned long start_page,
+		unsigned long nr_pages, sector_t start_block);
+int generic_swapfile_activate(struct swap_info_struct *, struct file *,
+		sector_t *);
+
 extern atomic_long_t nr_swap_pages;
 extern long total_swap_pages;
 extern atomic_t nr_rotate_swap;
@@ -452,26 +466,15 @@ static inline long get_nr_swap_pages(void)
 	return atomic_long_read(&nr_swap_pages);
 }
 
-extern void si_swapinfo(struct sysinfo *);
-int folio_alloc_swap(struct folio *folio);
-bool folio_free_swap(struct folio *folio);
-void put_swap_folio(struct folio *folio, swp_entry_t entry);
-extern swp_entry_t get_swap_page_of_type(int);
-extern int add_swap_count_continuation(swp_entry_t, gfp_t);
-extern void swap_shmem_alloc(swp_entry_t, int);
-extern int swap_duplicate(swp_entry_t);
-extern int swapcache_prepare(swp_entry_t entry, int nr);
-extern void swap_free_nr(swp_entry_t entry, int nr_pages);
-extern void free_swap_and_cache_nr(swp_entry_t entry, int nr);
+void si_swapinfo(struct sysinfo *);
+swp_entry_t get_swap_page_of_type(int);
+int add_swap_count_continuation(swp_entry_t, gfp_t);
 int swap_type_of(dev_t device, sector_t offset);
 int find_first_swap(dev_t *device);
-extern unsigned int count_swap_pages(int, int);
-extern sector_t swapdev_block(int, pgoff_t);
-extern int __swap_count(swp_entry_t entry);
-extern bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry);
-extern int swp_swapcount(swp_entry_t entry);
+unsigned int count_swap_pages(int, int);
+sector_t swapdev_block(int, pgoff_t);
 struct backing_dev_info;
-extern struct swap_info_struct *get_swap_device(swp_entry_t entry);
+struct swap_info_struct *get_swap_device(swp_entry_t entry);
 sector_t swap_folio_sector(struct folio *folio);
 
 static inline void put_swap_device(struct swap_info_struct *si)
-- 
2.52.0

