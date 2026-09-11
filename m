Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6626F38A70A
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 05:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103013; cv=none; b=Q5lBrXVpytq8DBEQmLPnrsQfGq/wKqze5EbOqJPxhxhXbtjoj0/PAcnh48EX0mQo2+UibgkR18UBRPWjPat0Ywc+7XoAhzky7c6ROT2ODiK4PitU7VxZLCE02VkEJwIj5Ywe5qq45IjjdCNTH+1VdIVkJdOpqAtgbuSGOHUzG+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103013; c=relaxed/simple;
	bh=61T4yHtrc+/68Njc8a6Em4ai4R7Ll91D9PGAmdrjjxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hOULPEfLuLXfmccgqWMv0URaqYa7Qi0VVreXJmKNiZldaipV2WTFHCOFhM95tmNM7CvGJCC+RD/z0C+hAtIjTw6IJu7EB+YOgjvrRGAc2lg6DGnq9KeJ9LQlRnaHrUbAmAoeCazh0z0V7XSLc0AHQPNG+I8KCT4fbAJlJKt/TQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OItLOlIO; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OItLOlIO"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so488706a91.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 22:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103007; x=1789707807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqQtNE5K5bGF4fAhBmQKuNzeCVlz+kHVYANXwAzhHeA=;
        b=OItLOlIOXlUIS6A3VCFW7vJ3vP44BD2ixBXKW/3RTx6J3ruJyDaD8HqDZY912X2IdE
         mUw9rp3mqapwNm4w+oltQm/33ibredE0PnPIp4XEIldx0iZP4GAja/Y1/X6J8JOMZG5m
         iaFeSnologR2tP7PNCelvzULLYLWEVJZHkATdcce2qE3mZ7HYH0ifnZKI9jfqtH7X219
         N2e8hkUoEtgYtoMMfRSIqGoJZQMtrv+5Y0g3D0PMspf6LokK1gO+XbQnL9KBQNy3hAyZ
         fJnVmwNYgjZKB4D7MjAJhOh+eNqrMmpO8l8lqMykh0vOEKC8eac14IFucH0xXbEh1Job
         XWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103007; x=1789707807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqQtNE5K5bGF4fAhBmQKuNzeCVlz+kHVYANXwAzhHeA=;
        b=SFOs+rfWJrZ7AjVmHd3r+6dvYHscPJdSktmYUmd7GwwR1EoX+FkmEgjL2CuovYdQSa
         NYmxFfsC6AMXgC7nsIz5SoAM+wtFwo+qslUsQCDIljGyrz+YoD1dTUl4UQxd7PKFJXYg
         HbVr1h8wO1+iZUgF4nga1tLdH4jVrSKVxsqYkPxS7HOtmYd57nv9w5TP2S+0iP12zb5W
         YPLjP8tQhIhwP7VqMrxmHAq7ytpYHWjOsbWMWCxcj8hGIjCJ6616YZ2y5J19irGsDjyP
         kQbAR++dlQtO22FyBdvhumt1YCX2qonJBlrNqjXpu75La694EVYAa7ATSU8kE5Ugy9td
         fU/w==
X-Forwarded-Encrypted: i=1; AKwUvBykvWDRUIXesus8Q4eOzjQH1rgdfHs3M2gK3gzASgOQcclJKQhIE48HzKvYIE0RpgXSD4gxhJDlS9k=@vger.kernel.org
X-Gm-Message-State: AFuF++mAwIu32NJ2M4nrbSd9NfuJnjKjO0IcRxXbJHLe5ZsXDm4DCuWL
	TwkyNvYuTWWeRqKiaG6OEschoailvRNyyLox7jlffD6v5aQF0NePmY0dleI8hrAt9gc=
X-Gm-Gg: AYBFou0qGrbnaG+LcmBF0CY8+1ftkGRPuq4VP5fNniMSbuki64W3+/wM+FoO8/KlXen
	r6Aw1d1GZI/axOmdMX5nfw65Enq3CZo2qr0VIqTeauoSfivf4HAIHIhFk7MAq3+fHrYJFxlyHoN
	gcyqdsEB5nZJ5gla/244B9q5h2Fo35vSo15bG/C/ovl3LMHfYQa+ysCvZLvQNi7YIissSXXCJDN
	ExYYm5IM41m3PAQ/T5AXDenrGy2mc1KXOnV9tFMNGO7TpKTAWeyaeIRGK6nPrbHIRolTseaHOlk
	ttE6yL6IogHn7bEL52CAoNcR3iE09+a0jiBXN/dlBhHVFS//OirwWa0Oqa3agRk1NgeolCotnzf
	wMiisPzcJc7bFmUqcO1sc0+DKYOp+ozDeJmjSxVHeFFx+Xt2WLUiGljz7NLzQ89ivXBEACuRkZi
	9j/YRiPKSuVzBtoY04RqLzZ1a+B2gFJniUugQk9CPoYIz3BDUHIJJlk++pD/DLm2qRYtd40CACc
	/WJEkIFOSSewgk0/Y/SylYJjbdMGqRT3H+l
X-Received: by 2002:a17:90b:1d45:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39d9c21cf40mr3843551a91.20.1789103006582;
        Thu, 10 Sep 2026 22:03:26 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.03.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:03:25 -0700 (PDT)
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
Subject: [PATCH v3 00/11] mm: Switch device DAX to section-based vmemmap optimization
Date: Fri, 11 Sep 2026 13:02:17 +0800
Message-ID: <20260911050228.58884-1-songmuchun@bytedance.com>
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
records the compound page order from pgmap->vmemmap_shift in section
metadata before vmemmap population, uses the common per-zone shared tail
vmemmap page, and drops the extra reserved tail page. The powerpc radix
path is updated to use the same shared tail-page helper, so the generic
and powerpc DAX paths follow the same reservation model.

The first patches prepare the shared infrastructure by introducing a
generic CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION symbol, factoring out
shared tail-page allocation, and keeping the special shared-tail struct
page initialization local to sparse-vmemmap.

The middle patches move device DAX onto that infrastructure by recording
the device DAX compound page order in memory-section metadata, using that
metadata to back generic device DAX mappings with the common per-zone
shared tail page, exposing the shared helpers so the powerpc radix path
can use the same model, and dropping the extra DAX-only tail page
reservation and the now-unused section accounting arguments.

The final patch updates the documentation for the new DAX layout.

This is intended to be the third smaller step toward the broader HVO
generalization. The wider HVO consolidation between HugeTLB and device
DAX is left for follow-up series.

[1] https://lore.kernel.org/all/20260513130542.35604-1-songmuchun@bytedance.com/

v3:
- Use EOPNOTSUPP for partial additions to sections that already use
  optimized vmemmap mappings
- Move device_zone() after NODE_DATA() to fix non-NUMA builds
- Collect Acked-by tags from David Hildenbrand and Qi Zheng
- Rebase onto mm/mm-new

v2: https://lore.kernel.org/all/20260908030335.96549-1-songmuchun@bytedance.com/
- Add a missing SPARSEMEM_VMEMMAP dependency (suggested by Qi Zheng,
  reported by Sashiko)
- Add an explicit ZONE_DEVICE dependency for DEV_DAX
- Add missing dependencies to the new public header
- Explain why optimized and ordinary layouts cannot share a section
  (suggested by Qi Zheng)
- Explain why sharing tail vmemmap pages is safe for DEV-DAX (suggested
  by Qi Zheng)
- Clarify the removal of duplicated 4K PUD calculations from the docs
  (reported by Sashiko)
- Collect Acked-by tags from Qi Zheng

v1: https://lore.kernel.org/all/20260831075342.57563-1-songmuchun@bytedance.com/

Muchun Song (11):
  mm/sparse-vmemmap: introduce CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
  mm/sparse-vmemmap: factor out shared vmemmap tail page allocation
  mm/sparse-vmemmap: open-code init_compound_tail()
  mm/sparse-vmemmap: prepare DAX vmemmap population for compound page
    orders
  mm/sparse-vmemmap: set compound page order for device DAX
  mm/sparse-vmemmap: switch device DAX to shared tail vmemmap pages
  mm/sparse-vmemmap: move vmemmap optimization helpers to a public
    header
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
 drivers/dax/Kconfig                           |   2 +
 fs/Kconfig                                    |   1 +
 include/linux/mm.h                            |   6 +-
 include/linux/mmzone.h                        |  23 ++-
 include/linux/page-flags.h                    |   5 +-
 include/linux/vmemmap-optimization.h          |  94 +++++++++
 mm/Kconfig                                    |   4 +
 mm/hugetlb.c                                  |   2 +-
 mm/hugetlb_vmemmap.c                          |  30 +--
 mm/internal.h                                 |   9 -
 mm/memory_hotplug.c                           |   6 +-
 mm/mm_init.c                                  |  17 +-
 mm/sparse-vmemmap.c                           | 184 ++++++++----------
 mm/sparse.c                                   |   3 +-
 mm/sparse.h                                   |  81 +-------
 20 files changed, 253 insertions(+), 463 deletions(-)
 create mode 100644 include/linux/vmemmap-optimization.h


base-commit: c46036ca3ab7a7628fabe5790aefd917d0858db6
-- 
2.54.0

