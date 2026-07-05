Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775D62C15A5
	for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2026 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783260787; cv=none; b=NwrPLL0WpbgL92kSybqDmKRmC5zKYVXEtQ0/dRShzBrtu2o73F+3IlcKtrEHzHWEKnGIREsFNnXFPbMdtLi6GToayfVreR5Fw7F+d7kp3jVSeh1spHSsOUY5vol5SMJBRZfzFJ10aVzhBQxnJXyeIiR+Od8h073dTNrGQ/1YO+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783260787; c=relaxed/simple;
	bh=ZQ9daNpdfqJ2noIQ4x2iiNBox8Y+VpB+RIrWCS/MaZE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HLC/kIKuvKGoYGOwaJGIV4AL0Krb/qERGLTHufy/M19gb8K+18VNtfoz1RZq9tCmCSUVey9kBBqjMr9DWZnSr3JcmWrFL8vVzHY+Y5czK6fCgiepa5W7ZcvAiVPzjh7pzri7cE9q3UVZoksbBEHw/DQUhu+VZcOCIWPvr+AdXrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpnhjYsc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpnhjYsc"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caf4496889so9022785ad.1
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783260786; x=1783865586; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Lak4tBsVkZ5HxGSDt8B/CEhdebz90m/2sUmJ2zk2LQ=;
        b=OpnhjYsc1NIGlSsws2dXC6A93TgTKU1TOPj+K/JxLXzMg2gxsefD/0VtPq+MpLMopU
         4rHqGtXpZZ+BQNcyLgqPOL7c29+FgS+rxJB3tOtH6Sgy09qsqwvO8raimHs0sd2tR6od
         jLTEb7j1ivCsPYH0CakvqwmsrQLOrqA50V6Cg9v7mzl41A+s9GDaJSqyJL1MS9P9K4/K
         Xp9fg5du7z9Ae0xxbsmP1thzZENUiQs6LBeI7sX2kTKR7/Vfs9qBw1LD8z0dZAvhkOmt
         YBw+3AVCwE8ySaa32hgkipi023AC5HzTmbnPatCgyb8LG+g9qVTrN0g5GIQkR4Ec0sOZ
         v+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783260786; x=1783865586;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Lak4tBsVkZ5HxGSDt8B/CEhdebz90m/2sUmJ2zk2LQ=;
        b=Ek997l3ozNzPQ+YT+JyJPmPa4kcepAVah6woF0wE9taprXbP1jXI6E21qWalkryOMq
         W8tDa1Kd5R+jI4UO2CF7e7oBREQfxU29YkimhCQvOZyHd72O36HdQ6fj/SFA+0qE0B4c
         JmfdIu08/ehfziBzg7v9LXHsS+/pKsqS4PnllrGDjLsI5rKdpCT39/hvAQkTIdc4Kno2
         bLH5I9fRCYpieZv94dqztrQtIp50ZdwP8Zit/M8JIhnZOyfIKLEtcEDK/qUm7KUh7jBS
         tMhOIAtAJj+ibwK4vzAFgk42PPZa2DrzYqyqThbQube1GE2EpVhLWTJVxpAxIo6jeS8a
         SZtw==
X-Forwarded-Encrypted: i=1; AHgh+RqP/HMvANpSHHS2TZ9DgjWJIaT/cRbXl3jwIYfaWYgskcGTPJTiJ1qr/5UP1zwOS9Fsnu8hTDxc6kg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9XNYjJ8REjMyNudxcKDKUdc15GhOeIEnWdbv7V3E3Zjuz0VTi
	ZiXuvcq7D+hfPO+IIzg0Tbvi11Dthp9JgeNYS4NDhN7GnJvkAA2elrcn
X-Gm-Gg: AfdE7cnSwTvRtYPXv86xobNUT5LWhj2ReB+P1fQxOWO1g6kzC1AIydAEn4ylDZv1+eN
	bQg6uYm6lCm0tFl1mZw7jNoaQU+9Tsswrz2qDlukp2aqcxKGPXlZ6w6fZxN95DO54Nhs4rwLucW
	OhpaMFpYm++c252HISvkVd7FY9o8XqJNYizt+s3SkgJmtArUDqFFE/4JpPCl85HtliWIFwOaLxd
	v1IBeKomaHpK/+aKllgWlshK1aI9VU7CCNHUFi4gSVz9mQn+uu9DF5KwRhbiFPgFFSkFb/5fjSf
	+pxyUBSstMMH+KAjDmSIGl6kXPe1jnbnacXJJUdLwIP2BD+pq1COe9Zt7b4eYICEMQ/+ovVk/ed
	0s+BqquqR1BOQO20tkkQ79VinMuvOX0jZbu9zil1i/tIcywa/Qt38f1K3ZfqTENvXaAWFxkB8d5
	6zS0rGfDmixRURTnfsOutjk99tusn6zg2QL6FzF4vO3fFV6iGcjvcv6eq52fGh3co=
X-Received: by 2002:a17:902:ef4d:b0:2cc:6410:91b0 with SMTP id d9443c01a7336-2cc641096eamr42244575ad.8.1783260785665;
        Sun, 05 Jul 2026 07:13:05 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260basm34169155ad.16.2026.07.05.07.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 07:13:03 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Subject: [PATCH v7 0/3] mm: clean up folio LRU and swap declarations
Date: Sun, 05 Jul 2026 22:12:30 +0800
Message-Id: <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-0-a028e8b5fc3d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE5mSmoC/5XQyWrDMBSF4VcJWvcWzUNXfY+ShSbHAscyUu20B
 L97lXQRk27c5bmg7wddUY0lxYreDldU4pJqymMb6uWAfG/HU4QU2kYUU4kFI+B7qBc7we87mIa
 5QpeHlGEoM/gh2nGeIBilideM0eBRs6YSu/R173wc2+5T/czl+55d6O3638JCAQNxxnLrqRCOv
 5/ONg2vPp/RrbCwhyox3auypgrnnJCq096YZ5VvVbZX5U31EVNiIsE4/FHFRmV4ryqayiVV1lk
 dA4nPqnyoCu/+V9nUwDvJtZGMabpV13X9ASDF2nwyAgAA
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
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>, 
 Matthew Wilcox <willy@infradead.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1783260776; l=3515;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=ZQ9daNpdfqJ2noIQ4x2iiNBox8Y+VpB+RIrWCS/MaZE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLysbk4r6/RIlvhNCwMAcUn2JQ0j8sOaPx2KjFB8QaRM/SBLEL6DeUEMIfj5LnK69iJpcxaCiE8
 JpmERuFYSlgI=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

This series splits folio LRU and swap cleanup into three steps:

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

Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
Changes in v7:
- Rebased onto akpm/mm-unstable (cfb8731f5396).
- Re-tested full build, swap-in readahead smoke test, and run_vmtests.sh on x86.
- Move version-history text below the "---" separator in the cover letter.
- Add Suggested-by and Acked-by Johannes Weiner on patch 1/3.
- Add Suggested-by Matthew Wilcox on patch 2/3.
- Link to v6: https://lore.kernel.org/r/20260701-ch-swap-series-plus-folio-lru-cleanup-v6-0-d4f648963382@gmail.com

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
 include/linux/swap.h                    | 76 +++------------------------------
 mm/Makefile                             |  2 +-
 mm/{swap.c => folio.c}                  | 46 ++------------------
 mm/internal.h                           | 67 +++++++++++++++++++++++++++++
 mm/memfd.c                              |  1 +
 mm/swap.h                               |  9 +++-
 mm/swap_state.c                         | 37 ++++++++++++++++
 mm/vmscan.c                             |  2 +-
 11 files changed, 126 insertions(+), 122 deletions(-)
---
base-commit: cfb8731f5396cafde2d60a2e7d9d27cdb4505f45
change-id: 20260531-ch-swap-series-plus-folio-lru-cleanup-d9781c8332dc

Best regards,
-- 
Jianyue Wu <wujianyue000@gmail.com>

