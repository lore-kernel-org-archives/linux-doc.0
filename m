Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EC22BDC0E
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 16:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440703; cv=none; b=MAinyN2dlk8Gbk9At5isZk5a40UHuCtR5R5HordTaFD98afhe0/8C5W9CQnMW9y2fKIhK5JpfhE0kxlDXIgI3NKfrjHpLFEKphhdBXbuxt2DKMez8r6MMl5mnRB73lRYz0KtY3L33KmepdTHqrEZrBngTUAKWnFtXu5DS5PO5Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440703; c=relaxed/simple;
	bh=3q6cs41GifWzmyNSOa0nCahu/8aSuzVSNbctt5MiNwg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mVYaeH639DAvGVTxX9ag64BsOKB67VQDq7RtLNHktWgLuEXhNM1iLYvXPFeYOfstI0h2yi++Aq7/z6gHlwfMfkFHA33xTqlLhqju2ne5OXwcTCKIHjU/EQRuAgRDUsPSmWhSHiu5aUY5LtOStQZaClKjJPd+ZC6d6PTUMyABNt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXIFxvZK; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXIFxvZK"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cacb8416a1so37073695ad.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 09:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783440701; x=1784045501; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=99+toj70dZgyWT9XG1jyZH6wGT8LuDxWhIOZpE4AM10=;
        b=AXIFxvZKFXhuZpIKEs35Uw3Zn3pu/u1WOXtEkzw4A5q87o653IkVsiC+1+jMAobrr3
         /BpsnwnTsu5gsinV6GC0LxMo6zsAWgi5EVfcGsfMKpAUbS1Wmf2hAfXXEr9kCWrXqTX1
         CfaGgDnNzYNHNT5hFjrEsn4Z+Rc8KjjBco4R9KrfPnQn7b2sxuBE/98Qwpt9cEvYCoUl
         Zo0mSK61tEkMgW7OX+KF85Yfew4nErCk4bbGJlwaq1L3Qrs1WjF2zOJeitCkP9l3uSSl
         nXMJVxBBZxixFO+W7QAcvf1yj5veq63maxDpniEBQeqIUI6MrxjCu18LPRLehDT3O8el
         qSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783440701; x=1784045501;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=99+toj70dZgyWT9XG1jyZH6wGT8LuDxWhIOZpE4AM10=;
        b=AZa59Poyq6UuCADhBOYZsBefPJCSJayGvB/tKH5JBmg8KSjgps3ZG/ADN6Eg/CwB5j
         jSpH4Th7GUZhXGr1/Bz5FW950YP0QdETVjw9m1QBIRK7Y3UMTnt3WO9MPaa89YbXu7R3
         ZADIVHG/hnROhj1nUNbAhOX+24/qCSZ0LE0P9FuOpngRi4U3jGxzr2hk1mALz/jYr+Y8
         sXrrD3IL/uFwFMRkDeM1DaiQr54adr7LdhiVypEbb/Q8Vnc3KTRT+j4bKz4HRrfGyLd7
         d045DpBzsJKyafM1hQ/H5WF+7lJJvj7xZ+pcZTiFONltJAxScW2eQn2Nze/9+C7PQfAV
         lgBw==
X-Forwarded-Encrypted: i=1; AHgh+Rrr9YmiW1/xT6U+/MVsdeFw42T6L2e1AWAiHMU+3Bt3MshnKaedZYQAxmhWTL6ZdYZoBT/QSmQw1gU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6GFoullwUYdh50nwk7Y2qsFr7yjQ7FNaeDYqIJpxU5Zm6sm6z
	eFEL4S2jdOLQXY4+YNO6/6FGfhhpaZMZnyQ1x5D3K6WgxPudykOhXfxn
X-Gm-Gg: AfdE7cmWmXMa5rnxcSi5oeEtwCLNoIxpApGqpxPNnQOi7hWEVzrWCgazBXQHpNdOaA8
	FKYHFxa0V+fliJdPhMUYIt8m0Av8BKBw46KhGhQIgy5h62A1xGgKxaA34fTF45/fIozsTLXnsGK
	KJc0OhellpzgCgM6Yi8g+6+h1atVuOAlePjVth6N3mTH/Oz9aHLP3sW2RNzuyP8kp35neCz5ngH
	lePYWLps/XybjlSXjA6FE/tG3IeYbDHg/fhSXZIYwDWBsnQB7KS4mP710f45AB1fScdl+6rOy20
	Wmd8iFFp5RSTFNa15rKT90T6fY9pgF44L+bovz5l0aqIXsYj+HlvRMh85mC681NLs7ABJ9+l6gg
	4TZRx0SRJpB1KPHCdh/1Oew0SBMS7QK4h55Uvlwy5K2YRf45Q0ig70VJxQNhuh/+QMqaEo3XKFS
	g1Sg335hFejM6QzGUlokeByASb4s4hlvo4MpqtGHAvfe1Vs8crrLYGdcxCZFhG83znW/cSZPDDB
	EYZk3+JrRaCsVdwulq1SoVgR4bDct67mLBC0xWt
X-Received: by 2002:a17:903:4b47:b0:2ca:ef49:f5a0 with SMTP id d9443c01a7336-2ccbe617daemr65460725ad.6.1783440701373;
        Tue, 07 Jul 2026 09:11:41 -0700 (PDT)
Received: from [127.0.1.1] (ec2-18-162-112-89.ap-east-1.compute.amazonaws.com. [18.162.112.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfd443sm14712115ad.30.2026.07.07.09.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:11:40 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Subject: [PATCH v8 0/3] mm: clean up folio LRU and swap declarations
Date: Wed, 08 Jul 2026 00:11:26 +0800
Message-Id: <20260708-ch-swap-series-plus-folio-lru-cleanup-v8-0-e816812698a8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC4lTWoC/5XQy07DMBCF4VepvMbIHt9Z8R6IhS+TxlKaRDEJo
 CrvjlsWjcImLM9I/n7JV1JwyljIy+lKJlxyyUNfh306kdj6/ow0p7oJMNBMCU5jS8unH+nvOzp
 2c6HN0OWBdtNMY4e+n0eanLE8WiEgRVKtccImf907b+91t7l8DNP3PbvA7frfwgKUUR6clz6CU
 kG+ni8+d89xuJBbYREPVTM4qoqqqhCC0qax0bm9KreqOKrKqkZkwB1yxtIfVW1UwY6qqqpSg/H
 BW0wc96p+qIYd/ldd1SQbLa3TQljYq2arqqOqqapnYNEG1USRtuq6rj+e0fLyiAIAAA==
X-Change-ID: 20260531-ch-swap-series-plus-folio-lru-cleanup-d9781c8332dc
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
 Baoquan He <baoquan.he@linux.dev>, Baoquan He <baoquan.he@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>, 
 Matthew Wilcox <willy@infradead.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783440691; l=5288;
 i=wujianyue000@gmail.com; s=linux; h=from:subject:message-id;
 bh=3q6cs41GifWzmyNSOa0nCahu/8aSuzVSNbctt5MiNwg=;
 b=a496fpvM/EI7ZriJBD0qzF1GY/kXka+3Txn1hmbxzxK804xt2v/K9j5UQ0lHccZscjCeumXRN
 lYD+D4bREE+AU1PaxKjnOiteo7YBbGCmV1RthqFvdvMNSQvNiwnw91r
X-Developer-Key: i=wujianyue000@gmail.com; a=ed25519;
 pk=49tqjvkqDVX1TtHEyTCiJGlKLg6SQ4BmgzG+HoHQW6E=

This series splits folio LRU and swap cleanup into three steps:

  - move the page-cluster sysctl next to swap readahead in mm/swap_state.c
  - rename mm/swap.c to mm/folio.c after the swap-specific code moves out
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
Changes in v8:
- Rebased onto akpm/mm-unstable (0bfae5663f86).
- Re-tested full build, swap-in readahead smoke test, and run_vmtests.sh on x86.
- Make swap_readahead_setup() static and remove mm/swap.h export
  (including the CONFIG_SWAP=n stub).
- Refactor swap_state.c init: extract swap_sysfs_init(), add CONFIG_SYSFS=n
  stub.
- Drop swap_readahead_setup() call from kswapd_init() in vmscan.c.
- Add Reviewed-by Kairui Song on patch 1/3.
- Link to v7: https://lore.kernel.org/r/20260705-ch-swap-series-plus-folio-lru-cleanup-v7-0-a028e8b5fc3d@gmail.com

Changes in v7:
- Rebased onto akpm/mm-unstable (cfb8731f5396).
- Re-tested full build, swap-in readahead smoke test, and run_vmtests.sh on x86.
- Move swap_readahead_setup() into swap_init() in swap_state.c.
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

To: Andrew Morton <akpm@linux-foundation.org>
To: Chris Li <chrisl@kernel.org>
To: Kairui Song <kasong@tencent.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
To: Nhat Pham <nphamcs@gmail.com>
To: Baoquan He <baoquan.he@linux.dev>
To: Barry Song <baohua@kernel.org>
To: Youngjun Park <youngjun.park@lge.com>
To: Johannes Weiner <hannes@cmpxchg.org>
To: David Hildenbrand <david@kernel.org>
To: Michal Hocko <mhocko@kernel.org>
To: Qi Zheng <qi.zheng@linux.dev>
To: Shakeel Butt <shakeel.butt@linux.dev>
To: Lorenzo Stoakes <ljs@kernel.org>
To: Axel Rasmussen <axelrasmussen@google.com>
To: Yuanchu Xie <yuanchu@google.com>
To: Wei Xu <weixugc@google.com>
To: "Liam R. Howlett" <liam@infradead.org>
To: Vlastimil Babka <vbabka@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
To: Michal Hocko <mhocko@suse.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Hugh Dickins <hughd@google.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org

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
 mm/swap.h                               |  3 +-
 mm/swap_state.c                         | 53 ++++++++++++++++++++++-
 mm/vmscan.c                             |  1 -
 11 files changed, 133 insertions(+), 124 deletions(-)
---
base-commit: 0bfae5663f86b4b08977b132ea4c35abeb53425f
change-id: 20260531-ch-swap-series-plus-folio-lru-cleanup-d9781c8332dc

Best regards,
--  
Jianyue Wu <wujianyue000@gmail.com>

