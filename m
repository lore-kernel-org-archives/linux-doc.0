Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FE1478875
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836871; cv=none; b=rJQLNnSM9/YADRsQk3SVOH2X7JlU7qZxS7IAHHVBtQ5tGaVePyIC7gWNypeHiUNYU69BtpYQXrZr+8UqQHDd5U+mmRxGCFXfbl7kUjAMZzp51QbCdC4fCS//zG8qZsvXtUzbVXS/4PIRDieNwidoAml6msYjoi8JmVK06uXJdcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836871; c=relaxed/simple;
	bh=ozZ242VPVy2flVhjMUpvLDowV2A3SAEMfd76chEaS/I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p5VUhZgvDg0UxgJebxLA8dv3x2mjFy0+Ic+PEwX1FKxhF42pqNCoi8dYA6MzRT/NGxZsrZcuVF4ylxZwhIAazQm2gAvk0f946/EgCSgWy99hePOYtT94TxfHL3jsQe449eGWrePM3+QPwynbnMXg/M1X+S5zfU0eDroChtH8kRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyIn165u; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyIn165u"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c99672293cso26932315ad.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 09:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782836868; x=1783441668; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3PcY56r3Gc4NP6LZch/40tRd41JkmPS9gpOd8qwacw=;
        b=lyIn165ulRLgbctjYIENKSwx73Ef2XYB21dGOfX07uklKpgIPD7l7E3xPolOCT4+Io
         zhesAnATV7dzztYF/vOSVVUeQZlIitTHPKPFwbfbQfui6R+Pw57lqvonMW+4OF5EoFKg
         im9OkgwD1Lq1eq49ra/YyAE/n/Lk6JA5fPo1pMd4YQE0KcSxIAGwj6MvYrew6MB1WOpD
         hVUCogjR0J2UOEt0Mr+MwIyxkSd1/rAijKSgwQFREok6YlfeZyENo0DgCqgFDYcbae9w
         BbZ54p1fYPAUrmjQBuT+ZVJjJ2CjifKBDOexoHOp7OAR+CEM1QhXaje4AUeJ1zFEMiX3
         yKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782836868; x=1783441668;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3PcY56r3Gc4NP6LZch/40tRd41JkmPS9gpOd8qwacw=;
        b=Yw2f2GTSeE7n7cnC/KIZzsTUVw6v+q5RA/3P1ey61uTKxv01yOFbSaext6aFVPu8gd
         U9I+J897hJ/IS/VpdG9dVEr+qciTSXTYwtw0YfiMou01g5bnbzrblUcMpMERdlS/uzU4
         /+GBXXMXoOZ5dyF2NChfwSsqwSr243bCadSCcR6N/5Md0MRhPeJG3CRzPKy62y541Fgj
         88RvDvtFpDtyZGJZWocmieUJA9P0Q3dQNRs+qcmy+hqTQv6vAC95XbCpGMqMUI9/kPMA
         RxiwSxRxoP3wtFheJhmMc4ZUHLinBeZKJFeqMn9+0ezuRKmBUkxh3FNgApZkP+R6r0Ti
         H5Vw==
X-Forwarded-Encrypted: i=1; AHgh+RoBsc4WJZQOtFejVOHkHgmBBJCnpoNfY0tJsuubW9vQ2yAIpzS7bt+Xtv/0gI7PZQItg4VgAKn3SxU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw87F5TejMnsdRC0/mW6MkYuCLllu6TuNxXk+ESO5lPakGyac2v
	EvjPfFnXicZE31G60ji+TDunE4GM/Br3/LtdGlBujQAGFVamIIDGXHQ0
X-Gm-Gg: AfdE7ck6sVM6rgfJBs4mPBeObCTXL6EcBKbHbo98nuAHQHfT/PpVpD07byD2kz1x4S2
	PsEeCaejPwrU03JFQ6emDTVaxIiIE3ZdZG25XpOKA5N/T1fCWV+vwuIjNlx5c2u2OBPnHPInP9W
	2Snr2YX4VEKGFb/1Q3c1XLOAD1jpq+ZJFHVrQ9Qe5nPogr/B+Ihidpm3t3uZB90ky6wjxNh9PXx
	Ljei/ljO2R/9UY8P7iJ2GDXnYI95Bc7xBGf/QVdSXf3SrWUkgkQYCfNaqvt5y2Icn8C7MwdiBN1
	M5JXdYG1sgWHe/JrjVNynj7FiEzd+/wi/zmDoKkyeO0HWqeELUwMKaxxfm2n5KtsEgW0u3qLlyu
	UiNUNVKC0zln1qmZir8ZgWr0dbsbulRRugZIIbs6nPbb37bRanOivvBeokzTDeeW/BU0tsk8ASa
	2og2ZgUeVKssf8jKNjrUouZpVOmZNdDIpZQTQo9gS0vYKJYCvGPZ1urlC5Ua3tLi8ITzagXXu2
X-Received: by 2002:a17:903:19c7:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2ca5a52fcb9mr11637185ad.7.1782836867835;
        Tue, 30 Jun 2026 09:27:47 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bcesm17829375ad.29.2026.06.30.09.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:27:46 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Subject: [PATCH v6 0/3] mm: clean up folio LRU and swap declarations
Date: Wed, 01 Jul 2026 00:27:31 +0800
Message-Id: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-0-d4f648963382@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHPuQ2oC/5XNy07DMBCF4VepvGaQ74lZ8R6IhS+TxpIbRzYJo
 CrvjlsWRLAJyzPSfP+VVCwRK3k6XUnBNdaYpzb0w4n40U5nhBjaJpxyTZVg4Eeo73aG7z+Y01J
 hyClmSGUBn9BOywzBdD3zvRA8eNKsueAQP+6dl9e2x1jfcvm8Z1d+u/63sHKgwJyx0nqulJPP5
 4uN6dHnC7kVVvGjasqPqqKpyjmndDf03pjfqtyr4qgqm+qRcmaQURr+qGqnCnpUVU2VmnfW2R4
 Dw726bdsXvo/CUNwBAAA=
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1782836859; l=4374;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=ozZ242VPVy2flVhjMUpvLDowV2A3SAEMfd76chEaS/I=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBW38YUDJC5EEUVI/W3wuOcivo/VsltkPoCjaJuVPuRzifRN6yDdlZpgv7Kaoq6mACvD7+phjlW
 qMJxGX9lJFgM=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

The previous version moved the folio LRU helpers out of mm/swap.c in
one step. Based on review feedback from Johannes, Baoquan and Barry,
split the cleanup into smaller steps:

  - move the page-cluster sysctl next to swap readahead in mm/swap_state.c
  - rename mm/swap.c to mm/folio.c after the swap-specific bits move out
  - move MM-internal reclaim declarations out of include/linux/swap.h

After this series, swap cache and swap-in readahead stay in mm/swap_state.c,
folio LRU helpers live in mm/folio.c, and MM-internal reclaim/workingset
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

Changes in v6:
- Rename mm/swap.c to mm/folio.c instead of folio_lru.c.
- Link to v5: https://lore.kernel.org/r/20260630-ch-swap-series-plus-folio-lru-cleanup-v5-0-4627aba8ed1e@gmail.com

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
      mm: rename swap.c to folio.c
      mm: move reclaim-internal declarations out of swap.h

 Documentation/admin-guide/sysctl/vm.rst |  3 --
 Documentation/core-api/mm-api.rst       |  2 +-
 MAINTAINERS                             |  3 +-
 include/linux/swap.h                    | 75 +++------------------------------
 mm/Makefile                             |  2 +-
 mm/{swap.c => folio.c}                  | 46 ++------------------
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

