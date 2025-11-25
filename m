Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A3732FA26
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 16:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764089974; cv=none; b=d6Bn5Ni1480CN0YSiEgvp0PhyYHYAHxzI3xLbyZwYxcK/LP918/Xk2gjRvOGLb+msUQD9YxPpc94n7l3sH3OUatyNnPGFMEytLBm8hB7vJMcuxi1Ri1ZEQIryN2YzCgoeE9EmGUPQBDZ6vJdNdqzA2lFoIUvQ72ha4QaQEsNSp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764089974; c=relaxed/simple;
	bh=KuhNTb4CjpCAEi4yupsWgshbtHoJow3Edu2RC58eD+A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVUXHJssIaruxPRaKfDdkV3BsppU7SBTKNj64L6FdOtq7vLDmpweSs/9nXWzuolgpIc/+vtlRqlzHWYmZ0OztoZTWvwtlav+xCgb3xl1PxlTkGsCwv8N3Gt2m+4qAhEgV0Off/07nQbrTaZ6UOoJZHYzneQEACEh3x6lv804Vs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=U88ZGUUw; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="U88ZGUUw"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-640d790d444so4987776d50.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 08:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764089970; x=1764694770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VfwgkEKDg4HJju8ezcZR8QklgFqMiwexlZP+Lehn03I=;
        b=U88ZGUUw8sIuIpfHDMPI8Q+2mhFeTq4UMOJ5xNh+pvA+/gPggiKVc+Oy88M8daEp3V
         Kr3h6IOATS5pPABp90uNpjoL+4wfUqnqouasFuJ9B+QdYqdPQD/lMGECFiQrtYL2i8fi
         5oMZyIfERnWMcJWUZR/jqMlyoyMwDzyfIcsof8sk0CjUOubhJSQsZUYfHCBftBgsaCZN
         O5MPse1lXcbv3EJhGYM3stpyZYmiBeTZ3BjsUXRbC0r+7a9voyl+ki3haOC4JRV8N80G
         uTR0Ga5FN13YNYPXylzji1M/Pbj3phu0vLzlzYkucAvJUv1QtB+6k4ncrOnVdTNnHoub
         VQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764089970; x=1764694770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VfwgkEKDg4HJju8ezcZR8QklgFqMiwexlZP+Lehn03I=;
        b=jHMvlzRUVQsQUPYQ5JOxhGO1CMOHh1NrNWs6y4/Xi20tPsbd9yLrdBcNhKfuSRLZEk
         pKG2gU8uIFHciJjBW2NTFadSy7g3c0h20BGpyxhBBCE3Gj701Ga0m6adRwhdyVXBla1q
         S9ZN+qfDzpMhj8fLjVyxLyhIwdzQSxPVxxzoD1PRB5XO9RkrXDVTXjnYDtGZQji4Cxay
         jXkP87dYQb2oLbuGjfsev/H8Ie01+Qlg0QxgNBmZu00L699DK49I+xu0jSu2Cusw129z
         W4ol96ErvAKCh/H6IsQGMVud/kq+6KMlDaRSiJNkYuUuOD1+vIWfAFJAjB1YrEiHVqLY
         NC2g==
X-Forwarded-Encrypted: i=1; AJvYcCXPK0cMjgoKyZR99MtzPnyyzcZBqPwkPiWFjinZBJp8rSdqiTi3qgnB3GThnUjuzR4wpcxOywpqslU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmzHZLjwSJoDrb+fCrcmkkPReWl4Hy9kxD3CzR83JnZttGsldE
	G/sCo5iFE3PrmKyfwDEHikd7a6aGypXBAx+ql1ZF6ajjFXUvQaPkIe0ak3GLa/fPpP8=
X-Gm-Gg: ASbGnctgCxZY9f80JkGxHPNqgC67uM4bkn+cAp2G9Q+6ip/bsYIfKO0vW0dPhn9Hyli
	RKKPB/qwbLaMaacbIanOQuTnpsVszR1SKUOFKKT/8WvhoAy6nAIcq3Q9Z5QvzFd7LO4N1fmU+l+
	5odlu+bY7OasV/f8OtLBBV672rbkCvBd8UaStVaJBTAeBwVm11CBBMAws30yB6mYIRETjTpuWJ3
	RSGhkhMsEqSjy2Utlxo3z/2Fx6+m+tAJima0y+wrmICbtxmV6lPVnLTy7XpvD0ixsbXfhWJtu/n
	7mdRExCHwfLPBDI8Hj4U5xDdk40k7ig35Jb/Z34D9EHvukRxxmeWfune6PIzQ4Am2WEhEwhYwJy
	iCUzNmixlcbJk/iU5keF9Br81dNXHsXUe//CiEeNYDt2qjoZQwvTycKKUlyJc0/v3C2UGBUWT2h
	RX55hwS5IyxBs/GJ3jiS/0PvVucdLH5epPdyQ8eJd2nvg9OnqBKGlzWphoDbSod8qJGXMSpD7Gv
	JzrrIE=
X-Google-Smtp-Source: AGHT+IHxFSNIvKptfLX2O2s6I7Ya1I+lmAyOHmAnZEOWuFdMycjzG+KGE1lNfFdZGkk9BfTpPXWC4g==
X-Received: by 2002:a53:d048:0:20b0:63f:beb2:950f with SMTP id 956f58d0204a3-64302a5d4c6mr9409405d50.34.1764089970594;
        Tue, 25 Nov 2025 08:59:30 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798a5518sm57284357b3.14.2025.11.25.08.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 08:59:30 -0800 (PST)
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
Subject: [PATCH v8 12/18] mm: shmem: export some functions to internal.h
Date: Tue, 25 Nov 2025 11:58:42 -0500
Message-ID: <20251125165850.3389713-13-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.460.gd25c4c69ec-goog
In-Reply-To: <20251125165850.3389713-1-pasha.tatashin@soleen.com>
References: <20251125165850.3389713-1-pasha.tatashin@soleen.com>
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
index 786573479360..679721e48a87 100644
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
2.52.0.460.gd25c4c69ec-goog

