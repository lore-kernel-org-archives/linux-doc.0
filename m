Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DF23BE16F
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 11:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510634; cv=none; b=IlR1uxFR1eIBDmUQyUzBcr/HlDn35hXhtPWuryaCkQmNOgCIWhH1IPSx875+qOV+jIvktCkmTDVc8gemDVxbtbP9h0tjzoNbPGpOSilOWyvDIwNyWjJzUh+eUJl1mFliBCh/75hSe6T7a/8ADk7Y0rowhHKCCdnmkJ+u35j7Hec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510634; c=relaxed/simple;
	bh=8GHogSKoIm1asFwelYhr6ck8UTLDFmUYAeHRfPd9GmQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o8pqwrD0pS1qdHjIPxHvewNPR9IyDLfXyX6OOY/jwlifCrPQmK1vRLDyYa/B4tMkua/hfg5l7d7HVNMR75ixcOlQ2V+QnwDyqXx8X8y90nwj7kcCqHSsh4Jnx76r4R+XdJU2kDO5byiC0/ZZwcLzf2tiKp78QghmpU6ViSVVP6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PETwJMqP; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PETwJMqP"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c96c92c0980so339440a12.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 04:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783510633; x=1784115433; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Woy9F6ZqYKjUSWB5HkEf/ya/mNEoU0v6GtNR1Tp6mKc=;
        b=PETwJMqPJssc5zm/p4eRiZBApDqcIwkcYyHLPgQpI/ebpdDgyjAuY9zi/mi7G+Qu/6
         ruFp5eK2ysnEprLuNW6sj9h1UJtR66Qte4rQa/Ell+S/pyuFHO0htXe4EvuPiMWPYZk7
         6yPNs/e3qAkdsnG4owh7k16q/eBbK8/CWnOJEvfbKswtLNnqv4oCj3ioqRt+O/Key+JE
         WZwbop/3tAYddY1wmz5I5oL/NNAtPrH/0nrsHVmQ5sd/orlPVvL3qSyO31Xy51Oq4+I+
         1zCICMJ3XL71vMf1IwMQ8Pzimx5sPpDqZmIMBn5OqJfCXQ2PsgR0Vl59lgX8unafFreS
         BnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510633; x=1784115433;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Woy9F6ZqYKjUSWB5HkEf/ya/mNEoU0v6GtNR1Tp6mKc=;
        b=rwuvgj0Eaw6hGQtuDihYhH+fMHY39IJA3OwqjHZqh62MtbdHw7o682ZZyxGsexL6CV
         85zoWbfGd5k7bG1lTdN37ac9XRcQ42zz3ycsu8SjjsGDcwl6Szrz2nzQsJx9gCouiRhB
         NV2MTjvp03eb2odW/6EvARLf5RH5vxMsH68eXypGIratJAESZLpYax4oIW/W8pgEydk7
         bo5mzz21VyzZE9F93Mq1OV6VAWNYlvCoZJ0GbJYqJWYJbQTG6wWGvZuAyurOKUXfljom
         P1M4GIXTiAMiKuIXnOoGa/cUdGudV6xuLayf6z9nQQ6YKuw6YQYS6lqNLfFDj+/zz7BW
         TAiw==
X-Forwarded-Encrypted: i=1; AHgh+RozGn6qSF7jj/ywvxQEJ/Qqs0GCu6i7aEzB3yuQQRiolcx5oplnNbJZ0uVMbiJmRMDsW4OubNRbjuk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+qeKWD1MxGn35LioDhtWmOwKyojD3Sxaq0NoSTRUXh24Pha6Z
	bK+fOxbm+HSrx+JyJlr//IY2hZdAX0Zk5R3sZ+XztpS64VNUB7JgyDRH
X-Gm-Gg: AfdE7cnvULOasZHiqUut4+8b0yEc4MH8X4HL1Ei548V4Hf44PJ+SCPHic2+4rfU4zfr
	0s3/KX0QZNZWxYC2DXKgIQvn8x0yYaL8mkGCXQ4k8i/mrvb4mqgLPZDGHOGbzhb/qHSZENLkJCR
	Czijocdb2JbRmLD8U3bb2VZgUKzs/srlGel9UsvQijokQsp6gCLLF2RCI1pqttXH9zcX7YAAGk1
	HzB8Ld/IE7m4kfAeGQSaapLIRcUGU5+WiXlsQUweSPMoOJo1uwDQTAQyS/Td5Wc9QPJDJRI/YF3
	Kg9rzOG908j5moFRwIwbKP9TutuX2c2aqqWJ9zW7+SzEJZRONCzENFE6B8H2mr9WfflBfjPf+AR
	uCAe/ldaMHOoiNcnX3pun7N1wrc3ECVOdh0785Nmzlf6Tk49OEir5ehqTkzS/8wWRtHsP+CyqOQ
	pvZSzNfO8kdj7UU57mKemYN+j/oKIFfkKrWgJ0HDdRMW/ve98IiMOlHoCLLik=
X-Received: by 2002:a05:6a20:430e:b0:3bf:d1f9:b1dd with SMTP id adf61e73a8af0-3c0bcb803demr2704343637.44.1783510632562;
        Wed, 08 Jul 2026 04:37:12 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([203.18.50.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3a2e42bsm2260788a12.30.2026.07.08.04.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:37:11 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Subject: [PATCH v9 0/3] mm: clean up folio LRU and swap declarations
Date: Wed, 08 Jul 2026 19:35:42 +0800
Message-Id: <20260708-ch-swap-series-plus-folio-lru-cleanup-v9-0-2bc72b4f8730@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA42TmoC/5XQy07DMBCF4VepvMbIHt/GrHgPxMK3NJbSJIpJA
 FV5d9yyaBQ2YXlG8vdLvpKSppwKeTldyZSWXPLQ12GfTiS0rj8nmmPdBBhopgSnoaXl04309x0
 du7nQZujyQLtppqFLrp9HGq1BHlAIiIFUa5xSk7/unbf3uttcPobp+55d4Hb9b2EByij31kkXQ
 CkvX88Xl7vnMFzIrbCIh6oZHFVFVZX3XmnTYLB2r8qtKo6qsqohMeA2ccbiH1VtVMGOqqqqUoN
 x3mGKPO1V/VANO/yvuqpRNlqi1UIg7FWzVdVR1VTVMcCEXjVBxL2KWxWPqljVhFwjB23R4VZd1
 /UHiOeFzd4CAAA=
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
 Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>, 
 Matthew Wilcox <willy@infradead.org>, Baoquan He <baoquan.he@linux.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1783510625; l=4505;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=8GHogSKoIm1asFwelYhr6ck8UTLDFmUYAeHRfPd9GmQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH1GLVTow/u+GY2BnotLjKLsI0uclIkvi5tbMa/r7iWNgQtdhlbghg2vvw6Rx/C8IeR90NalapO
 BXH5jKoHnOQo=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

This series splits folio LRU and swap cleanup into three steps:

  - move the page-cluster sysctl next to swap readahead in
    mm/swap_state.c
  - rename mm/swap.c to mm/folio.c after the swap-specific code
    moves out
  - move MM-internal reclaim declarations out of include/linux/swap.h

After this series, swap cache and swap-in readahead stay in
mm/swap_state.c. Folio LRU helpers live in mm/folio.c, and
MM-internal reclaim/workingset declarations move from
include/linux/swap.h to mm/internal.h (public LRU helpers used outside
mm/ remain in swap.h).

The first patch handles the swap-specific page-cluster state before the
file rename, so the rename commit only carries folio LRU code. The last
patch keeps the LRU helpers used outside mm/ in include/linux/swap.h and
moves the internal reclaim/workingset declarations to mm/internal.h.

Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
Changes in v9:
- Rebased onto akpm/mm-unstable (d11ba1f57061).
- Drop the unrelated blank line in mm/swap.h.
- Drop the redundant swap_readahead_setup() comment.
- Add Suggested-by Matthew Wilcox on patch 1/3.
- Link to v8: https://lore.kernel.org/r/20260708-ch-swap-series-plus-folio-lru-cleanup-v8-0-e816812698a8@gmail.com

Changes in v8:
- Rebased onto akpm/mm-unstable (0bfae5663f86).
- Re-tested full build, swap-in readahead smoke test, and
  run_vmtests.sh on x86.
- Make swap_readahead_setup() static and remove mm/swap.h export
  (including the CONFIG_SWAP=n stub).
- Refactor swap_state.c init: extract swap_sysfs_init(), add
  CONFIG_SYSFS=n stub.
- Drop swap_readahead_setup() call from kswapd_init() in vmscan.c.
- Add Reviewed-by Kairui Song on patch 1/3.
- Link to v7: https://lore.kernel.org/r/20260705-ch-swap-series-plus-folio-lru-cleanup-v7-0-a028e8b5fc3d@gmail.com

Changes in v7:
- Rebased onto akpm/mm-unstable (cfb8731f5396).
- Re-tested full build, swap-in readahead smoke test, and
  run_vmtests.sh on x86.
- Move swap_readahead_setup() into swap_init() in swap_state.c.
- Move version-history text below the "---" separator in the
  cover letter.
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
 mm/swap.h                               |  2 -
 mm/swap_state.c                         | 50 +++++++++++++++++++++-
 mm/vmscan.c                             |  1 -
 11 files changed, 129 insertions(+), 124 deletions(-)
---
base-commit: d11ba1f570615ec8d4814d6313ee1d7075a33787
change-id: 20260531-ch-swap-series-plus-folio-lru-cleanup-d9781c8332dc

Best regards,
-- 
Jianyue Wu <wujianyue000@gmail.com>

