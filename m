Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10BD27E1DC
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 07:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162869; cv=none; b=hh7XBR3O6MlTyZur5EVe1a18mwGlt7i4glbU/010T/yTJVyLiZohYhzO+3EzWYJxbHBUSIvuzsPr4NRlViC6r5Y6jRKYWgEV9kQDBWmUB3fbOenTdzuMKwkmgRpUG7nBzZPkYJDYWT4BFMeH12ghb09sVRd3cUeqrw9FbLbQVIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162869; c=relaxed/simple;
	bh=bvfF+DUVXECUEeR99JcjVt7gfOi3Uh3kiCiqo+9RkZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MpDAOi9BVnLXI8T7LJzHs+R3Jm92zEh6f/8JGTReqqMsIpJlPVJqfSUexg0rX1OJpozxtr4IqTARuQZ93eT8P4PKIHNqsVy/AbsKTMKwQdjted5tL45nwcNAo8llSdloHf/kw+xT3DYZO/wRvnR//s3VO/9LKrkiN4kzlrDV8j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZP0Zlhto; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZP0Zlhto"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84eb992a881so2783394b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 00:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788162867; x=1788767667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TXPCi3Qy+Dn1DAAHVgNjvUWIuwmWO5YrhOqB0jfLte0=;
        b=ZP0ZlhtokqcMbdb/zrd4WQ6pXwzid2KrvJsX53gr2g+rMKe3zV791ogYqjp0ZCe2Oz
         mqB4TkhX2rsmVhTnXx6YLEp1zXMtGEh3ambSNOmdGniEm/59niZlktXopDv8fCb/2CAv
         yUUbGrcjnB0Y5c+JcyKYfFiace4TRn4RHnhux6iG4KODY2gc01h4SeZ9S4d2adIKWxod
         sit0uLfjc53pUPb7IMS4/g7jL14Y+B1GdzokSl4Tlzsea0jqXScQb7me8q1WUikc9ELK
         YltuHGxrjy6fajWwyqGiBQMpzCwZza5eDqxmYWtxcBzHcWXLRLFzwh27WfTQQwcr2m/u
         +rRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162867; x=1788767667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXPCi3Qy+Dn1DAAHVgNjvUWIuwmWO5YrhOqB0jfLte0=;
        b=ANhKtDXP4mTXteUmEL52lwkcwzcRbEqgJz9b2J2rnPi0p5k1M6vHfveIoQg/BPKE9r
         bKmshtbtKcx8DIjz5Ng7ZN5zULXiCpkAHonyPSdeeaTrXBopsKnyojs7as9pKSZhsHLW
         icNHSjF3Bds9U7s6OS09FqXnRb/mLKPEIXoupHfQgjBG9MA4FwT+jgxUC/fJHpfcfVGA
         QD8J3TCVgCEe2rRu+uEHS7yJpRULgoI4vypex0SfmnME1ddVJ0KCiir4AdJ5gqfvVHYX
         UHOeDVhMBNmLvH1litPqlx8crUQnCKWxSg2kQGZ1sI5NlmYPUqkkW3rPzIw3PKu9fZBY
         +KmA==
X-Forwarded-Encrypted: i=1; AHgh+Rrv+do8qetASBrOoz7rH0iR9WiQq+XZ6zj/4VW8kns1QXJSfUbKgqQRHtuYO8311Wlf6YGLX+Xbifk=@vger.kernel.org
X-Gm-Message-State: AFuF++kawuz/S/l3z4aTw/NcS6A1zrhJ4zXjS3rv1g4dcvSrNoJ8uB3N
	ZEUlW/U3j9aQ4LcOoz0aIBPKuDa12fTXwW4C0xQSfuQr+BwM8aCn562EMTq8AaHQxIU=
X-Gm-Gg: AR+sD11pNTOpQvg+IZmjaWcBTiIuyXvCOw9ufu2hVcg4Zc1Yk456EfkxyDxTSSMjK2U
	oI0culSv++d4smx8I22L7nxJ4TDIdV3XnsSNlTS18rkPZ/HJtz+T8Sc5svB0KWboO8APDFx5bZV
	TAmKhyovUMtW/1H+GgG32SCKP9DiB+boK+DAPFhES2wh7hbME4UDnkbeLv4mzoq8Fw9WwwvE1rA
	DYeGKz2H7YTGEKDQhLw09aZLJ5UNvZ5Nqw3MXfOASTSmBlle9WndUQkrq9ftQ6xu2E1Chu0PqMt
	6gLXrywESSjF/saozUvaJmV5c52GsnCdvL0LzjX7/xCQKI+q9ZPTM9HRclIeu4s1TA5B1wLVS2m
	HuNNCs3mIa/1E5pntDvYRQ7h1HMS6sw218bOUE6bJQL+usYI8i6oc8HgS5uEzr/TsQxqecNF/m4
	vQuNE97gGPAIkDOePAoI6Ph4gN4eBwgHDBmkjKXSFzxMfECHeju3pwoe1oINYa1wJ7aYa3D8IvO
	W1HLVymekrSBzeaqrUfOYUUcH+mueosMLc=
X-Received: by 2002:a05:6a21:e081:b0:3d3:b00b:26e8 with SMTP id adf61e73a8af0-3d3b00b6d9dmr18107787637.28.1788162867110;
        Mon, 31 Aug 2026 00:54:27 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm3590256a12.10.2026.08.31.00.54.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 00:54:26 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 00/11] mm: Switch device DAX to section-based vmemmap optimization
Date: Mon, 31 Aug 2026 15:53:31 +0800
Message-ID: <20260831075342.57563-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is split out from the earlier, larger series "mm: Generalize
HVO for HugeTLB and device DAX" [1]. While the parent series generalizes
vmemmap optimization across HugeTLB and device DAX, this subset addresses
a single, self-contained step: switching device DAX to the section-based
sparse-vmemmap optimization infrastructure introduced for HugeTLB.

After the HugeTLB conversion, optimized vmemmap state is described by
the memory section and the sparse-vmemmap population path can allocate or
reuse shared tail vmemmap pages based on that metadata. Device DAX still
uses the older DAX-specific population model, including a separate tail
vmemmap page reservation and architecture-specific logic to locate or
populate reusable tail pages.

This series makes device DAX use the same section-based model. Device DAX
sets the section order from pgmap->vmemmap_shift before vmemmap
population, uses the common per-zone shared tail vmemmap page, and drops
the extra reserved tail page. The powerpc radix path is updated to use
the same shared tail-page helper, so the generic and powerpc DAX paths
follow the same reservation model.

The first patches prepare the shared infrastructure by introducing a
generic CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION symbol, factoring out
shared tail-page allocation, and keeping the special shared-tail struct
page initialization local to sparse-vmemmap.

The middle patches move device DAX onto that infrastructure by recording
the device DAX compound page order in the memory section, using that
section metadata to back generic device DAX mappings with the common
per-zone shared tail page, exposing the shared helpers so the powerpc
radix path can use the same model, and then dropping the extra DAX-only
tail page reservation, and the now-unused section accounting arguments
can be removed.

The final patch updates the documentation for the new DAX layout.

This is intended to be the third smaller step toward the broader HVO
generalization. The wider HVO consolidation between HugeTLB and device
DAX is left for follow-up series.

[1] https://lore.kernel.org/linux-mm/20260513130542.35604-1-songmuchun@bytedance.com/

Muchun Song (11):
  mm/sparse-vmemmap: introduce CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
  mm/sparse-vmemmap: factor out shared vmemmap tail page allocation
  mm/sparse-vmemmap: open-code init_compound_tail()
  mm/sparse-vmemmap: prepare DAX vmemmap population for section orders
  mm/sparse-vmemmap: set section order for device DAX
  mm/sparse-vmemmap: switch device DAX to shared tail vmemmap pages
  mm/sparse-vmemmap: move HVO helpers to a public header
  powerpc/mm: switch device DAX to shared tail vmemmap pages
  mm/sparse-vmemmap: drop the extra tail page from device DAX
    reservation
  mm/sparse-vmemmap: drop unused section_nr_vmemmap_pages() arguments
  Documentation/mm: update DAX vmemmap deduplication docs

 Documentation/arch/powerpc/vmemmap_dedup.rst  |  90 ++-------
 Documentation/mm/vmemmap_dedup.rst            |  32 +--
 MAINTAINERS                                   |   1 +
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 124 +-----------
 arch/x86/entry/vdso/vdso32/fake_32bit_build.h |   2 +-
 drivers/dax/Kconfig                           |   1 +
 fs/Kconfig                                    |   1 +
 include/linux/mm.h                            |   6 +-
 include/linux/mmzone.h                        |  23 ++-
 include/linux/page-flags.h                    |   5 +-
 include/linux/vmemmap-optimization.h          |  88 +++++++++
 mm/Kconfig                                    |   3 +
 mm/hugetlb.c                                  |   2 +-
 mm/hugetlb_vmemmap.c                          |  30 +--
 mm/internal.h                                 |   9 -
 mm/memory_hotplug.c                           |   6 +-
 mm/mm_init.c                                  |  15 +-
 mm/sparse-vmemmap.c                           | 184 ++++++++----------
 mm/sparse.c                                   |   3 +-
 mm/sparse.h                                   |  78 +-------
 20 files changed, 244 insertions(+), 459 deletions(-)
 create mode 100644 include/linux/vmemmap-optimization.h


base-commit: da6c37ed8beb273e3308e42d4bca3ce11b4432fa
-- 
2.54.0

