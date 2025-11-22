Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F4B2C1584
	for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 22:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763850264; cv=none; b=mbvPAImthsvsIZ7cfmK11esMULF0VimI5kzzapSngDWmKWcWULbnchZA69Fa2KPqC7TIdA+4kT7RfL1BTRbYXnuWJ7jr0Rs2ZU/5WZueh1fnQGHhftWkgTAMDY3ATtczqfmart541wIGX3irUjUgl02yAOd6tkwu1vHUq2Vf1nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763850264; c=relaxed/simple;
	bh=cV6ayUY0cd5cthn+5O2DyMdENfG+D5eByWYgHRliMyA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQyUwHZp7IebAoYpsxEgAZwURRDBUbSd7NGsmgcu5mVkPFEwnwMvrRlndZfZ/aor5ZPMT9y/fhjw4qUFVnQ8ngym4bNnXBgPYcU4C7/xAPxzXwgBW6UUx11Lvd7pD59nUVreoKbjbgI9FSwt2XlV4OfbLBvIiI1Kk9EY7r7VInc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=HScPZ3NE; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="HScPZ3NE"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7866bca6765so27781837b3.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 14:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763850261; x=1764455061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+3x59DbFWdBPdmdih5ENuDC3ZjNMKrWdUeGoJeNo7E=;
        b=HScPZ3NEKZwt7blLAousjMuqCBILyYAhjd7MiMhHJgDzj1HcFn/1KoEHw8jqBuPHYY
         Bl0XBqTl6iLCVqc7OQZoFuAR9O3rUa8aIhWzSR7Gxd/3k4SmnbvChslsJZrwXV92YnRX
         OxKY33rox5nPfmVMvDhstWwTW7SK8BpGAOzaWThOctNUDRl+0a9rQwL+ZO3EO8ABfZyl
         EbAgutSOFlvto3g7icuAEdFEs6d3f4Aralf7CZHf2a2qB2FpxsVC1uQpDGZ47qHiaOtS
         Khz3ogqv+mHOAQUPQe+bInIjdoPl8bIaO/kADbyRcU0giU+CxqbH39NbEDbAO7ZgNBry
         yyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763850261; x=1764455061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3+3x59DbFWdBPdmdih5ENuDC3ZjNMKrWdUeGoJeNo7E=;
        b=eSZjUFtBDh77YA2AVXzaxc+4JThMU5S0lq+X5YvTVMB4ptfweXfIyeYDOeV6sM3bKF
         LVMXLE3sYu2b1CwTr6kV0c+03icEMQDJcV8PCmIO84NM4kd8LW5rfe1Rj5M7rF3QH5b5
         y+a6Iv1WXpGAMpwpp4kdekGQu8dWGbaO/Fu0sQV02L86JzWAoAMAczq6uFu/yBKzflXr
         kztrlQFL1Ux4lvBo+pIgtQBd0SVfRqywsswIH89sdrXynANt7lgcHWyFHURYQMZlyFvM
         VyHb57pWK9/xw5uOuPJPUVMvbxHxtEa4nPHBd/mueusAL937Kje8RxpMROzWbD84et/5
         5Uag==
X-Forwarded-Encrypted: i=1; AJvYcCVWAnyqeKLCKVfzVlpq3d1WWiLbVgLFGSzHVfdC7nhYeWRdLNz9JaMSSWsNNUc27v+uvDPxQ6xADUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU6/dA+94vy6BZ2Ies60+oj3EOrzordXhgKb/UU9LD+2HzuKEn
	2zNHbhLRJCbzdqCwoD5ovQJ4ZeL7taf2OjJZLdaW9D3BBzuxfdB81o5B/tOo22tArPM=
X-Gm-Gg: ASbGnctT2XgXAPz0mTQXElNqZQlepHIyY1WE0ibJnnxJxCW0daFWeQY20Mvw3jn2Yot
	LKeHuXpGogRK9p5P1rr+uJIyLnOCMAbwVOVlPN0CrMe5Ao77ldnIbJqqfPMeLbF0kc19CzAB399
	HTPqO9uKu9fjvnF4fZ69mxTQkdQI0ftZ3KMsqzlc6Y1kjaHtm/WFbBUzOkgNEfKIapDft6X+nmM
	4lsjMHTcNDn+3/0mzpIlxWmQu1lxupUnR84d4sliknBmcEcmArvImwUn+IJnBE4yATPdv+x4dWL
	MS/+Js3g62Ct1P3qZwqM4hbxOzjitjBzm/FywBC3dPWC3yX82Ep2PPWYiWrZ0up7vRNbMZBry2m
	iaHrQn76dJoB4/ocNBX4HauDQweHtgbm3rV/u9ticx2ljTFdSLSWLhRuoxVOOPnJfy0kNWZ7oIt
	pgnP85hmIG3sfN2GB1lDpyLJ6/KXUD98RFChTAlg1w80yOwGvMMeiqpt/UHZn36Au0I/eP3FkhB
	c053RE=
X-Google-Smtp-Source: AGHT+IHLBVEUSrsRTAR569f2nmbBoHdToiAZD4CXjMMgQTOgrYNyCyqBuS6WcJxB+UmOJcCfJHKxnQ==
X-Received: by 2002:a53:acd3:0:10b0:63f:55de:63cc with SMTP id 956f58d0204a3-64302ab185bmr3797706d50.31.1763850260775;
        Sat, 22 Nov 2025 14:24:20 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a79779a4esm28858937b3.0.2025.11.22.14.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:24:20 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com,
	hughd@google.com,
	skhawaja@google.com,
	chrisl@kernel.org
Subject: [PATCH v7 12/22] mm: shmem: export some functions to internal.h
Date: Sat, 22 Nov 2025 17:23:39 -0500
Message-ID: <20251122222351.1059049-13-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
In-Reply-To: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
References: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pratyush Yadav <ptyadav@amazon.de>

shmem_inode_acct_blocks(), shmem_recalc_inode(), and
shmem_add_to_page_cache() are used by shmem_alloc_and_add_folio(). This
functionality will be used by memfd LUO integration.

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/internal.h |  6 ++++++
 mm/shmem.c    | 10 +++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 1561fc2ff5b8..4ba155524f80 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1562,6 +1562,12 @@ void __meminit __init_page_from_nid(unsigned long pfn, int nid);
 unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
 			  int priority);
 
+int shmem_add_to_page_cache(struct folio *folio,
+			    struct address_space *mapping,
+			    pgoff_t index, void *expected, gfp_t gfp);
+int shmem_inode_acct_blocks(struct inode *inode, long pages);
+bool shmem_recalc_inode(struct inode *inode, long alloced, long swapped);
+
 #ifdef CONFIG_SHRINKER_DEBUG
 static inline __printf(2, 0) int shrinker_debugfs_name_alloc(
 			struct shrinker *shrinker, const char *fmt, va_list ap)
diff --git a/mm/shmem.c b/mm/shmem.c
index cb74a5d202ac..b9cd7f8d50fa 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -219,7 +219,7 @@ static inline void shmem_unacct_blocks(unsigned long flags, long pages)
 		vm_unacct_memory(pages * VM_ACCT(PAGE_SIZE));
 }
 
-static int shmem_inode_acct_blocks(struct inode *inode, long pages)
+int shmem_inode_acct_blocks(struct inode *inode, long pages)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	struct shmem_sb_info *sbinfo = SHMEM_SB(inode->i_sb);
@@ -435,7 +435,7 @@ static void shmem_free_inode(struct super_block *sb, size_t freed_ispace)
  *
  * Return: true if swapped was incremented from 0, for shmem_writeout().
  */
-static bool shmem_recalc_inode(struct inode *inode, long alloced, long swapped)
+bool shmem_recalc_inode(struct inode *inode, long alloced, long swapped)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	bool first_swapped = false;
@@ -861,9 +861,9 @@ static void shmem_update_stats(struct folio *folio, int nr_pages)
 /*
  * Somewhat like filemap_add_folio, but error if expected item has gone.
  */
-static int shmem_add_to_page_cache(struct folio *folio,
-				   struct address_space *mapping,
-				   pgoff_t index, void *expected, gfp_t gfp)
+int shmem_add_to_page_cache(struct folio *folio,
+			    struct address_space *mapping,
+			    pgoff_t index, void *expected, gfp_t gfp)
 {
 	XA_STATE_ORDER(xas, &mapping->i_pages, index, folio_order(folio));
 	unsigned long nr = folio_nr_pages(folio);
-- 
2.52.0.rc2.455.g230fcf2819-goog

