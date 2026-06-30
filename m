Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CEF72623
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 01:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782781707; cv=none; b=Ia64S0PxMP13DdW/E+Y4aw0p1AM8uY/6JxfnWBWkaCgs70tEBwUlw/bfozFDW+J6A1uKg4Z+cqRv0SDPb7tXUyV3RsriISgX9zJzLiKGkKNgOXkWjIDmVN/4SbgSEL/FmYez8DdRpu29GlajFfFpUzwD1uQlSNyCZKRkNzMZ/LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782781707; c=relaxed/simple;
	bh=3EbJt9K+1+sPTDt06QMPG69wrSXSNbIIWZKhplBpBzc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nV23RtZj/ruBMa8HPGV166PsWUEOc2EB5JtqaO3v/V/3mF5vdBN7KOZ3M5FiMgk15kIdcFyKE63JT1P+xH5uxMQ3TIapfCqlkJkxEdP0RGEdV8DI8QFAUBeBqdTYNxHZaE6KhRbo+jR5ZBl8/4+OIoaSDXnz3RGgFnKn+Ks0SwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYaQEuA9; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYaQEuA9"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-842358aaf36so1706153b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 18:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782781706; x=1783386506; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wdNQRJo20C9SfN4nYA84GpNLauxAw8Nhc1XJP6tzcac=;
        b=lYaQEuA9V6OVYvQ4jvkyTC9Lb2crrvnvea63I9/yzJI4pySahhNX6XjL5mKvQnxT1D
         gvtivEjeJRws+TuN3QI59sX1T/c26WAYh09QrpuBmcl3CoBMqxbqYiUU2jHApPPZmV1L
         6KsVC8gdxf7su8MTi1xFd0Fs2JmSecCZbCM8rontzymQPIClvXRfEpkWjeC9TGnMzxuD
         yedBlU56Q/42VayTCWQlaMrgbi9MTqM+adtM2uO9V2+mPSZMyio5yGPpFGeO99ZTsTSR
         EyCzC+1WuZv3dpw94DxCWYAves2JlCgRQ1Qug0zl5Z5UF2mwrq+Tq/XMmoyF0WiQVZKe
         VF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782781706; x=1783386506;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdNQRJo20C9SfN4nYA84GpNLauxAw8Nhc1XJP6tzcac=;
        b=kueJxWg+WAk6kIEs6nyOqEbjuNOSiQ4TkLA7UF2a8NbBIIW/HOpT7mwsfTNGPWAV0S
         ZxdchgYOB7UkLZn6mcSLhbul31Y980n0I5TumiHIj8lN7rsWnp3P5ekVBYCpQz/FAusI
         dXNeE0T2l6GSE4swSJGpqwO1tY39y+5xDgpLeprZZM1EvUC4uWPbiVDn8UzdY6Wp1Uev
         xTxOROU/IS6V4kYwsgXA8UUAt7u8knwpuMTUyFKERNv6BevO3GS5IKfnWjpYoKGiTAZe
         hGajrETJovKBHbfFFbLgnn9C+VGB/JJxfOytTbLE4Eult+4ber0X34IVMcSujyI814wM
         2D0Q==
X-Forwarded-Encrypted: i=1; AHgh+RoqHzmBA83XqJv8QMWxUDrYJRTvx4yjfuKr/26OYrV3kRecui5CTskGgdR0wyFfsYorX4WHY/4YwVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+L+qmBa1bkblFY11du5kU2YR5+ZwjWS+Vi2Z5dCyCl4oX/JDT
	///458z6m3W/GDB7vVFT+B1Nhd10phM6yW28YWWBUj5T8LXcCsBq/jcx
X-Gm-Gg: AfdE7clBU0XXO4GRQqo74u5QZtNL+/taPiC98vkciVCc+5fwpzHwHV06WEAM5rbPpp/
	bYkbl8Y84lO+bhvszOtkKz5TADinadI9wF8XidfJvMGNPXz8oXdeb+9trQtiItyCj8YsF0UD1ic
	yM3tE9QvPp4DcP8AErTiViU217E80ddW3Tv2u1L21fFalDduP7xD71dKYz4dV0izkJtBtTzMfOO
	HqkEtaPoaxVsW/VOg0Q/yvPs9w1sy7ytNjkj20o5Ww8wRKSyF0stsIZ9miJI8vPFjkYm7l1y4PJ
	X9q+IRxhzdTSLbGpBlgmIVpLdJ+UzwhS7gYRX/RFifUk3ZW5vGHqmDFgWRc8gfL9V4S0LPabJot
	E5uxs5sJVpIWGEa5HNE0ak8sZ8YUIlyOobx6eisxwIQHbdGCmkU8MjxxmJ3WEXEsYo9UQzNbBqb
	fDPAo0MBi7sr+rF8stA83/oO4xQuN3Z82ljTDrTC2DdknniDX7/h2ipIqlyBg=
X-Received: by 2002:a05:6a00:94c3:b0:842:77ab:35c8 with SMTP id d2e1a72fcca58-8479f3fe486mr1183229b3a.44.1782781705494;
        Mon, 29 Jun 2026 18:08:25 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([203.18.50.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a005afbfsm653310b3a.27.2026.06.29.18.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:08:24 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Subject: [PATCH v5 0/3] mm: clean up folio LRU and swap declarations
Date: Tue, 30 Jun 2026 09:08:16 +0800
Message-Id: <20260630-ch-swap-series-plus-folio-lru-cleanup-v5-0-4627aba8ed1e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAXQ2oC/5XNyw7CIBCF4VcxrB3DpdTiyvcwLmBKLQmWBmzVN
 H13URdeVro8k8z3TyTZ6Gwim8VEoh1dcqHLQy4XBFvdHSy4Om/CKS+pFAywhXTWPTz/oPdDgiZ
 4F8DHAdBb3Q091GpdMayE4DWSbPXRNu7y6Oz2ebcunUK8PrIjv1//LYwcKDCjdKGRS2mK7eGon
 V9hOJJ7YRQvtaT8V1VkVRpjZLluKlTqWy3eVfGrWmQVLeVMWUZp/aHO83wDSGLS5oYBAAA=
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
 Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Baoquan He <baoquan.he@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1782781697; l=4194;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=3EbJt9K+1+sPTDt06QMPG69wrSXSNbIIWZKhplBpBzc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDzbourfcQ+2nSZE3R2G0N7uuQMV6PSYXLzXaLG02N8vF0NJCy6bcv3rPqiNoOSs3froJ2KRlrx
 0kR8TAd+U5gM=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

The previous version moved the folio LRU helpers out of mm/swap.c in
one step. Based on review feedback from Johannes, Baoquan and Barry,
split the cleanup into smaller steps:

  - move the page-cluster sysctl next to swap readahead in mm/swap_state.c
  - rename mm/swap.c to mm/folio_lru.c after the swap-specific bits move out
  - move MM-internal reclaim declarations out of include/linux/swap.h

After this series, swap cache and swap-in readahead stay in mm/swap_state.c,
folio LRU helpers live in mm/folio_lru.c, and MM-internal reclaim/workingset
declarations move from include/linux/swap.h to mm/internal.h (public LRU
helpers used outside mm/ remain in swap.h).

The first patch handles the swap-specific page-cluster state before the
file rename, so the rename commit only carries folio LRU code. The last
patch keeps the LRU helpers used outside mm/ in include/linux/swap.h and
moves the internal reclaim/workingset declarations to mm/internal.h.

This series is based on akpm/mm-unstable as of 2026-06-29
(81652c5a65d4).

To: Andrew Morton <akpm@linux-foundation.org>
To: Chris Li <chrisl@kernel.org>
To: Kairui Song <kasong@tencent.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
To: Nhat Pham <nphamcs@gmail.com>
To: Baoquan He <bhe@redhat.com>
To: Barry Song <baohua@kernel.org>
To: Youngjun Park <youngjun.park@lge.com>
To: Qi Zheng <qi.zheng@linux.dev>
To: Shakeel Butt <shakeel.butt@linux.dev>
To: Axel Rasmussen <axelrasmussen@google.com>
To: Yuanchu Xie <yuanchu@google.com>
To: Wei Xu <weixugc@google.com>
To: Johannes Weiner <hannes@cmpxchg.org>
To: David Hildenbrand <david@kernel.org>
To: Michal Hocko <mhocko@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
To: Liam R. Howlett <liam@infradead.org>
To: Vlastimil Babka <vbabka@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
To: Michal Hocko <mhocko@suse.com>
To: Hugh Dickins <hughd@google.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Changes in v5:
- Rebased onto akpm/mm-unstable (81652c5a65d4).
- Fix mm/swap.h for CONFIG_SWAP=n after rebase.
- Tested swap-in readahead on x86 with swap: vm.page-cluster present
  and writable, swap in/out under anon memory pressure, page-cluster 0
  and 3 paths, no oops in dmesg; run_vmtests.sh passed.
- Link to v4: https://lore.kernel.org/r/20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com

Changes in v4:
- Address Baoquan He's review on v3: align patch 2 subject with
  rename-only scope; fix vm.rst sysctl documentation; refresh file
  header comments in mm/folio_lru.c and swap.h declaration comments.
- Expand patch 1 commit message on CONFIG_SWAP=n vm.page-cluster
  registration (also on CONFIG_SWAP=n kernels).
- Link to v3: https://lore.kernel.org/all/20260602-ch-swap-series-plus-folio-lru-cleanup-v3-0-5bbb567f8c99@gmail.com

---
Jianyue Wu (3):
      mm/swap: colocate page-cluster sysctl with swap readahead
      mm: rename swap.c to folio_lru.c
      mm: move reclaim-internal declarations out of swap.h

 Documentation/admin-guide/sysctl/vm.rst |  3 --
 Documentation/core-api/mm-api.rst       |  2 +-
 MAINTAINERS                             |  3 +-
 include/linux/swap.h                    | 75 +++------------------------------
 mm/Makefile                             |  2 +-
 mm/{swap.c => folio_lru.c}              | 46 ++------------------
 mm/internal.h                           | 67 +++++++++++++++++++++++++++++
 mm/memfd.c                              |  1 +
 mm/swap.h                               |  9 +++-
 mm/swap_state.c                         | 37 ++++++++++++++++
 mm/vmscan.c                             |  2 +-
 11 files changed, 126 insertions(+), 121 deletions(-)
---
base-commit: 81652c5a65d4ae28e9b18c16ef917a40025c3653
change-id: 20260531-ch-swap-series-plus-folio-lru-cleanup-d9781c8332dc

Best regards,
-- 
Jianyue Wu <wujianyue000@gmail.com>

