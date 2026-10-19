Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0271A42E8F0
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 09:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400940; cv=none; b=HrG3Z4ozoeZNLrtzRSzo7fP/Q7mT1ljuMsestDAczyAa84VCV1TayWMFWwrm+DH+wBbdMXL6dv6NnQdmgeIKME+b1D9rw5ouwq5BxrozN+chHB87K/TF+bJAhkKTcCwMqi/l+vk1ll89C5fCdzZPq/SYkQg4lp4fMGhfWqhWj+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400940; c=relaxed/simple;
	bh=Bzq3/RGv85idXkoWlK7EtgKQNZZxLdTg9B9C3aypFoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K6ZJkFHC75fHVKWTk7PaoxdgE18aZauLyqfZtdKZu/SzDiGwoMRRCSkP3Zjp3RSb/SW5URArPvBgeIWyluGU/PSHhM2I0aY/Dt5a5yh+FE3pckO+TXN0yJbr1Ry9TyPR1YWg7WWLeSshuxTEmDU0jTs28Q5PIhAi3JUvQJtjGJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DxNITdkO; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DxNITdkO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e987b4a710so13106075ad.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 02:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792400938; x=1793005738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+7LPi5HRPOOcdUC/D4c64YzsREdoI+6xRf4WfL2Y6c=;
        b=DxNITdkO3sVqQsTY7HXzQ4PIffzPEr1KUVomHb6wHgSofNSws0Vw0Dd0zyLni6I0hW
         7/Gvbs3JI6lIKgU9M08G3aEa/3MFmT86qH4U1yBW6yzvw8XtAccdxVrTtceNKVQwMq0U
         1mB2GgBTz3rtsBgFTGE0QON7bd/4w6bz8vLX7nvCON9u0fwLvBBXOsMaEYyiTsQQXKUm
         8adQRvzKKQMjcR2RgqVVmp8o2pMtAxowRpikNc3cHPkT7pIbyfLQ8/F066bhSvpInM/D
         3b8b04eqxJC3D3dECmHqLCnmUOozvaScrpRtWDMWYQv9ZpzWJqdYhKRqt1aQ0h5zBvlG
         UDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400938; x=1793005738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+7LPi5HRPOOcdUC/D4c64YzsREdoI+6xRf4WfL2Y6c=;
        b=Ppi/wYsxwAlxxecX8qoOpGwO3XdWEvDABa2Oe6oDQGlPc/4M0fUB2tGSPAHlHQS007
         Es2NAy9ZyFDGzluKl12sq5m34tUB24qfnLg06YhJTYNTbN+KTTMXS7SAtsfYocNXPCtd
         rRh3MkZ+bKuchVXX+CehX9+3ShZn9evIagqS7kvj62JYEKb7PDDkwK2Qlww6i1M3EkQS
         Wo6B1nVCivdVb9lYeCGfDai+3uOk6HzTb2TTAGSioZ9R8nUGdrp5MegKGUjKChT4ZtGT
         bGpfIdITJrUnSJeQKI0yZ/Vz9cS87TxaTc8h1lvJS2le0x+1IESPbj6rd8n+kdqrA39d
         x0+A==
X-Forwarded-Encrypted: i=1; AKwUvBwbgd83s4uXvOt6KmJWxFoYKxZ8STxGOwc38W1p3e3Z+BEjMmPsEC7Qrv3fuA+CBHkExyQ9Rpux4iA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3wy/3hnw7WvzHNAIPBZ5IzHhgjaxqSsZW1gMq8n0vujnliCTZ
	Ra1jkyV3ZMjtnkA1WwqJt6ojhhnK+BKMemZyJbKY4O+xSh0u83G7sfuzzMpk+kZHOX8=
X-Gm-Gg: AYBFou2I0a3HsuUaocYzJ1OWg0OlK8hht+D3cV7YIZvQFQH5NFr0tDsGoEvlsj0D8i5
	9YwX3Ch4Nk6NahG6VUshW//q8+SmOxTuUTk/JIdxB6Ub/DQE12ny3sJsuC5BMw2WXWWUDH136r5
	MrSMdgJKuCWutnQpyPGFleLI+ltFCIIn9D8M+8lw3e75/94zKROqCdTXwKfTbv5O1rXuSZV865S
	XumG7T9zc01HvMyR2J3KiiB5zvE12l1GmzHgSysvnuMFq0k6P8GDRZVnt3bel75RAnnUMBr5g5v
	UwH4nY5TuPiQTqF8YZ/wR267MOigiyCKYLbkZiCsqiUa+CEvwRM6QCtLKbHgxP++LKMFj513Wc1
	iZh7YSQNKynNc2h+RnwrblyCJncwDENgsWfnaw/1TnpLsj2r2zEWaIUZhNO3x6NYwB6Su6KmOsE
	yIe1lBb2WBze9g4FkdLI6cV0AOBIogDK81yzSBmGDT/50/LoK9guXM7QDIQysJguh2X4mx4sWPz
	aEkAQJgYz41Yb1FXTU=
X-Received: by 2002:a17:902:f603:b0:2e8:6540:11b6 with SMTP id d9443c01a7336-2e9a6e3c596mr43244805ad.37.1792400938093;
        Mon, 19 Oct 2026 02:08:58 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e305f1dsm36707595ad.0.2026.10.19.02.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:08:57 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 3/4] mm/hugetlb_vmemmap: remove vmemmap_wrprotect_hvo()
Date: Mon, 19 Oct 2026 17:08:29 +0800
Message-ID: <20261019090830.1917657-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019090830.1917657-1-songmuchun@bytedance.com>
References: <20261019090830.1917657-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shared vmemmap tail pages are now mapped read-only during initial
population, so already optimized HugeTLB bootmem folios no longer need a
separate write-protection pass.

Remove vmemmap_wrprotect_hvo() and skip these folios during boot-time
optimization.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/mm.h   |  2 --
 mm/hugetlb_vmemmap.c | 18 ++++++------------
 mm/sparse-vmemmap.c  | 23 -----------------------
 3 files changed, 6 insertions(+), 37 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 35f5fc43861a..6f5affe54946 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5359,8 +5359,6 @@ int vmemmap_populate_hugepages(unsigned long start, unsigned long end,
 			       int node, struct vmem_altmap *altmap);
 int vmemmap_populate(unsigned long start, unsigned long end, int node,
 		struct vmem_altmap *altmap);
-void vmemmap_wrprotect_hvo(unsigned long start, unsigned long end, int node,
-			  unsigned long headsize);
 void vmemmap_populate_print_last(void);
 #ifdef CONFIG_MEMORY_HOTPLUG
 void vmemmap_free(unsigned long start, unsigned long end,
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 0057fa2a16a8..3d72346c2ca2 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -603,19 +603,13 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 	nr_to_optimize = 0;
 	list_for_each_entry(folio, folio_list, lru) {
 		int ret;
-		unsigned long spfn, epfn;
-
-		if (boot && folio_test_hugetlb_vmemmap_optimized(folio)) {
-			/*
-			 * Already optimized by pre-HVO, just map the
-			 * mirrored tail page structs RO.
-			 */
-			spfn = (unsigned long)&folio->page;
-			epfn = spfn + hugetlb_vmemmap_size(h);
-			vmemmap_wrprotect_hvo(spfn, epfn, folio_nid(folio),
-					HUGETLB_VMEMMAP_RESERVE_SIZE);
+
+		/*
+		 * Bootmem gigantic folios may already be marked optimized when
+		 * their vmemmap layout was prepared earlier, so skip them here.
+		 */
+		if (boot && folio_test_hugetlb_vmemmap_optimized(folio))
 			continue;
-		}
 
 		nr_to_optimize++;
 
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index ba0496daf4de..0af4b9e791b2 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -386,29 +386,6 @@ int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
 	return 0;
 }
 
-/*
- * Write protect the mirrored tail page structs for HVO. This will be
- * called from the hugetlb code when gathering and initializing the
- * memblock allocated gigantic pages. The write protect can't be
- * done earlier, since it can't be guaranteed that the reserved
- * page structures will not be written to during initialization,
- * even if CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled.
- *
- * The PTEs are known to exist, and nothing else should be touching
- * these pages. The caller is responsible for any TLB flushing.
- */
-void vmemmap_wrprotect_hvo(unsigned long addr, unsigned long end,
-				    int node, unsigned long headsize)
-{
-	unsigned long maddr;
-	pte_t *pte;
-
-	for (maddr = addr + headsize; maddr < end; maddr += PAGE_SIZE) {
-		pte = virt_to_kpte(maddr);
-		ptep_set_wrprotect(&init_mm, maddr, pte);
-	}
-}
-
 void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 				      unsigned long addr, unsigned long next)
 {
-- 
2.54.0

