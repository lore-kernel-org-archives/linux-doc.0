Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4973093D8
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 03:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836642; cv=none; b=DZqwy62b/x7RNucoJ5zGeD5GMwXMm3z8zFbJ3AnulFc0VQTX4RcXgFIPWQ5QWZl1+d/Sd1X2EAXfU9juPlPG2KprFKiqRuMBBEnpUYwFNeX+T8/Zvch6W4tGW9r9wBZWzD1JRS3GK/nzX8MqJIKymaeBstFJQzVvWaIJeBfgWw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836642; c=relaxed/simple;
	bh=MnxQfL/qcbRq8D1GtDEHI9Ad8vqjnjNEr2rs4oXd9FY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YpIIcDtyNzoKWQtpYUx+CA2dz93vrjadBfn3D2te6Bb8IsYlJcs4J07E32piRZeDpMDPsJIdT8nOdWZNPteM6ld9wugdVgY+NFYgZYRrCh+RmuscYjtBAblja+RzF+Fm4jeiYJCJPcNhiBll9PTWbYy2wC/L592dnB0HDTF8bCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=joU42EhZ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="joU42EhZ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8556ec44e9aso3442394b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 20:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788836639; x=1789441439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4XfCysBDn5qT8WqcsoKK1dWXF2dmEIjBSMFOB3v2Scw=;
        b=joU42EhZzW98Dl3crbAvBhL5+qpRbpBER6EmPSt5c/l/Cx17LAekdorEZPCzoAG/bg
         WnXHtkhLBDAMTvxuNpHcRLVcGyHli5gGMNL/Yd0HCmBOCShPP3mggouh83YmMZQ2goLj
         LAVp1yFVXGXjhE5wdrjWlRZaqazkCJUcNqIF4QBQqbtvP0FttsPSPaHgpN91Si9dh2cP
         elX9rUoNF2EgNmFvUqBko2wfguiXWoEHILKopTfPlCe0Y1RS+QRwq62PMJMAPLOZ03I7
         M68vp5+f+LHH7SJN980LupwvIGRtCUr/MepHLv5zJQaoaWUmByjF3BBX0SYk3AWPYxN8
         5V4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836639; x=1789441439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XfCysBDn5qT8WqcsoKK1dWXF2dmEIjBSMFOB3v2Scw=;
        b=WsgMs9mvPqKfSxQ+cxXSwqQBGdeoG3lEXoaU0TgqEtwBIfrEVVtvBrt7TIiCo7vNim
         TY5r7hDipYBMqYCuNBPqk0lemB36uxgGIOvNuASFaLVlmxM7pfnJduAS2iZMOhgmdGmp
         9MEzOz1qTNwegN6rUdbOXZcW6teieiKC6QioK+WeZfQIWdV/eBozg6RN8nIz3i6u9WjB
         kWn3iGNl5IdftrGStQZxpQtNyYkCSQiHVJQMAktubmG16xeUrBu0S458JYzNNB3Fg6qz
         RvA15/QhwZXOe2WVLy16JUzurt6qToJn7u006l0phMicGrtsirn3c/d7wjzqcTzab6QN
         1EHg==
X-Forwarded-Encrypted: i=1; AKwUvBxqm/lOpJcFacZEU6uQ5Pxp/oQ/mLQEojgUchjRv+fxu+f+It7W16SnD5/vE0nzmb0JhqjbC7YCXxE=@vger.kernel.org
X-Gm-Message-State: AFuF++nHvh38x8uS1Rmhk3+vJoAsCokiZviXQhCIbPz3yGg86TytJ9Mg
	BC+HLM2hxGTTxEPaw023fSJjcRptS1YAG/1X6/WvsqTyEbkDeIxYKgJ0By5xaA/KfCg=
X-Gm-Gg: AYBFou1rO3yU0y1T6yqp5IO8MLoSEHKdK+zqvFGhHyt/XKHuiUFVF5JkYI9+liL70Xp
	AtVpt/SmB129ege9N2qxUElDXAB+t89/oJoNc2m85EYZGEaXTQrPkDR4nfemqkb0tvMorzHQMUs
	dcugFsE6rm5iXEUR9ltB+/szwexHvAxGa8fV7nKSXrR01eGHEnvjZ9iDxtamItOHSLMygz50HGB
	q1tq1EW7SVTfl+aB+7phm7H/82ZF0hz0S+Dm+1qLI//ehEyxYMZD1Sw/KkLhWSUDJvAosEt2gYn
	Kk3lDeIRq2yYHQyk/nIjSSrlvBkISA4uoz2P86I34H5hIHHXlXx0otBnpSPBTLTq4l3v0gzikGa
	ADyqxg9XrCGK6eexd45RAEuoimaNwmwLV2DiBS62R7d3/jxlxp5nOBCp6QE/3wSZaNeuwdlKrKO
	SE+stiW87pq5nt7Ik1IiC+kfE6vtda7fhDEdgomdHhJ/8TNY+ebxL3z5YLOMXPE7SJVd4mWaa+d
	GB/EHgoosMahFVER3899rdF
X-Received: by 2002:a05:6a00:2d0c:b0:857:72ba:ff0d with SMTP id d2e1a72fcca58-8616af5cf97mr37061890b3a.21.1788836638765;
        Mon, 07 Sep 2026 20:03:58 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152a358a2sm4868234b3a.29.2026.09.07.20.03.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 20:03:58 -0700 (PDT)
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
Subject: [PATCH v2 00/11] mm: Switch device DAX to section-based vmemmap optimization
Date: Tue,  8 Sep 2026 11:03:24 +0800
Message-ID: <20260908030335.96549-1-songmuchun@bytedance.com>
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
radix path can use the same model, and dropping the extra DAX-only tail
page reservation and the now-unused section accounting arguments.

The final patch updates the documentation for the new DAX layout.

This is intended to be the third smaller step toward the broader HVO
generalization. The wider HVO consolidation between HugeTLB and device
DAX is left for follow-up series.

v2:
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

[1] https://lore.kernel.org/all/20260513130542.35604-1-songmuchun@bytedance.com/

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
 drivers/dax/Kconfig                           |   2 +
 fs/Kconfig                                    |   1 +
 include/linux/mm.h                            |   6 +-
 include/linux/mmzone.h                        |  23 ++-
 include/linux/page-flags.h                    |   5 +-
 include/linux/vmemmap-optimization.h          |  91 +++++++++
 mm/Kconfig                                    |   4 +
 mm/hugetlb.c                                  |   2 +-
 mm/hugetlb_vmemmap.c                          |  30 +--
 mm/internal.h                                 |   9 -
 mm/memory_hotplug.c                           |   6 +-
 mm/mm_init.c                                  |  17 +-
 mm/sparse-vmemmap.c                           | 184 ++++++++----------
 mm/sparse.c                                   |   3 +-
 mm/sparse.h                                   |  78 +-------
 20 files changed, 250 insertions(+), 460 deletions(-)
 create mode 100644 include/linux/vmemmap-optimization.h


base-commit: 9d3243fc689fef444f87e0a703b4c99653137e1b
-- 
2.54.0

