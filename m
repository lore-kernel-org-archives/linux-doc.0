Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F237495539
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 09:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400922; cv=none; b=VjeSenFp6TdD9kz7sqMEeZ6DdtNNxhbwjuAxLpx40nyv0+4OkiVssxleGthPcGYT+mnhR7VFZ4ZTVPY441DAtPuJPwOh5ea/AlFdUYQ76jopSZ066X/vXea42LbZ9fs3WOjRJlIt+vI5bMFRUncQ0ccAaShg52UBEVqU5N6hb4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400922; c=relaxed/simple;
	bh=8JXyz/iLrnOMQ+H+8M5mCSfykQy89HEytqAbfOPDnOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XgOSeSsOVuy152qgDo/XLmquFtDfLj7/VG29L0XFopU5sKNAz51j0JlaVb7PQnSqQ5ohWjitjVcSB4VfEHv9V6S1N8lAcTA9N4AA7ghLWUxSQg8oeVe/KOWk+DfwwJ7pZwCPSliTVUZLObi8ioQ2ixE4fgA27huBfpatVZdcvcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=broUX/XB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="broUX/XB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so9502875ad.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 02:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792400920; x=1793005720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/pB41CYmMwKsKbqW1foc/PLT2lTdajoPoPYMHSrvZcM=;
        b=broUX/XBQZ9o1k7g3rLTvfTRC2wSEAoJzO6dvu9MBhJlFWDJZebatgYkjD5z/tlQ0d
         0cJ1YWP8yTelAOkFsM0kPn5ubHhkXims0SQ2W7hLUE2htDroQVrtNw1PXm+qgZzAgKUt
         UUAKI6IMfrZKB5rnk1EJfUOdFAHVp+tS7m9IcWvsR4XYdNOsuJa9wm74hbXbe2KEFuaJ
         z/IoUXWWhIEAozhG66UF/0fl8w0qL6TlSU4vArb3k/pK2Ztd8CR18HI3hLxUK5Nz1VsQ
         o8JCj7xxAZUXhzgCNLGtr/tleRoVNDJt4BacP0PGhmRw0H7/HJkUrOZJs4XC1cS/AaY6
         hhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400920; x=1793005720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/pB41CYmMwKsKbqW1foc/PLT2lTdajoPoPYMHSrvZcM=;
        b=uNUbH8UrMnvf19Hs+uNBSJn5MaXkMaSQb/9cfCsSkNzFxpoy1gg4NIRFr5TA8yUe3Y
         FSAe/HqLfou8XVKdtOy7L9fT3AKRNZbj7M3h1OG4tI2E0DrtyBMI0aJuGMljpAdyxpuL
         +g2fYUB8YYhiS3SYJ95PqLxu1PjuKzVO7YAGSnKMlL05UbQOcu/Sh9fEZFvRgKsz5rBo
         ojRlvf5wkyCWH+EEvKI9Wl5m6/uN/8QHhB8h5l8On+ZgdW/2zCVSE/yGx+KsjwzEioEF
         R9EG3H0eotca5w3PalNxeNJThggJJl0YbMVEJpJlfHxyXAy99StouUxr7+n+O7eDb+0C
         8hgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUf2C5LrdXD5xQ/7ZIBGpPPp7ZZyaXYY1Htm2NYj265Iw3VhDkb4haXUNmHvbCDIhOGKxNCLBJwRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJi/7imgBqpGNmMohdykzkfp3+turlgn7rBT0dWpySLeh9cBTjk
	LDzKm2FLcNEdsN87BYJ8sw1o9wvVQc0ExLmy4xUd8kiuP3o8sLDl1YPp/Zz85xvX2Oo=
X-Gm-Gg: AYBFou0KxLiV7WZcDEovdYAtnd5BLiM+yngKlfru6MaN67d1d6kqu1NFOtF8X3D8GO3
	LswUePX28M9+HDTD6rfyRseMzxznGLvWl7wHb40GKBR/QeNtxFNZJmH/la7xA9SzRhUJFdlIsfI
	gVisfDxxp8mWXVGfaxotat+Ztn1r3QOV+kDWeCqRuk6efxF3Re+X7JJR16zzoQWGBhGiwRN5dCf
	WE66CSw9NkxT0GCUraR2Vl2Eeej9F4asLTbSEoxKnDKZPyNu8xVUWBtP+2fOy8eJ4w0BFphj984
	6jroEfvV2f+BjRPY1xDvZPWrZgCo70K7UYnI/mVARGTNiKip4jXarxt8rW52XXbikDArPCL94e8
	ESmYoB9hKp3XLfw3d5K16w0nAB1W9b3hyg5g7SH7tldCHFwQabs36GJ5CwH6nKzvDdcT15ecWK5
	PLmbJG6oGVYr2BEsBAx/4VMgeKqVU3flKqy8OqKcbgISo3vx7jrFMTrG8GO7+M7FSNBaCPq3/HG
	MzVak1RNLgPK1y9zK9Z
X-Received: by 2002:a17:902:dacf:b0:2e9:9f14:c44 with SMTP id d9443c01a7336-2e9a6d38bbamr62890025ad.49.1792400919921;
        Mon, 19 Oct 2026 02:08:39 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e305f1dsm36707595ad.0.2026.10.19.02.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:08:38 -0700 (PDT)
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
Subject: [PATCH 0/4] mm: Enforce read-only shared vmemmap tail mappings
Date: Mon, 19 Oct 2026 17:08:26 +0800
Message-ID: <20261019090830.1917657-1-songmuchun@bytedance.com>
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
a single, self-contained step: mapping shared vmemmap tail pages read-only
at population time.

After the previous HugeTLB and device DAX conversions, both can install
optimized shared-tail mappings during vmemmap population. These mappings
should be read-only because each shared tail vmemmap page backs metadata
for many tail pages. HugeTLB applies this protection in a later,
subsystem-specific pass, but device DAX currently lacks it.

This series moves the protection into the generic sparse-vmemmap and
powerpc radix population paths. This protects device DAX mappings and
makes the HugeTLB-specific vmemmap_wrprotect_hvo() pass redundant. With
that pass gone, the bootmem-only optimization wrapper has no distinct
work and is removed as well.

This is intended to be the fifth smaller step toward the broader HVO
generalization. The remaining HVO naming and enablement consolidation is
left for follow-up series.

[1] https://lore.kernel.org/all/20260513130542.35604-1-songmuchun@bytedance.com/

Muchun Song (4):
  mm/sparse-vmemmap: map shared vmemmap tail pages as read-only
  powerpc/mm: map shared vmemmap tail pages as read-only
  mm/hugetlb_vmemmap: remove vmemmap_wrprotect_hvo()
  mm/hugetlb_vmemmap: remove hugetlb_vmemmap_optimize_bootmem_folios()

 Documentation/mm/vmemmap_dedup.rst       |  3 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c |  3 ++
 include/linux/mm.h                       |  2 --
 mm/hugetlb.c                             |  2 +-
 mm/hugetlb_vmemmap.c                     | 45 +++++-------------------
 mm/hugetlb_vmemmap.h                     |  6 ----
 mm/sparse-vmemmap.c                      | 26 ++------------
 7 files changed, 17 insertions(+), 70 deletions(-)


base-commit: 2887e63d2e8e0cf55402612d8996ce955a2c3e55
-- 
2.54.0

