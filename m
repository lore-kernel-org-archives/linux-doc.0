Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793149576;
	b=o4IqJOqrhqIKgowIw9nYKo3dIv3eir3fzML7s7yHuXi7ktCYgJE+t97k2UW/8YuOxN52
	 ww5rzHoXke//okXklgGAFyKE68jqFTpdy51O6r5KvFK1ycJm/rExAyVREVuPRLdFVsgcV
	 IAsGE2fyqM4iQlmShnxiSzDJeHIsULSXaKNQXetrQ4zgMndezc8fqQQXX24P9WKJQbaPy
	 Ku8MK8yX2t6agmtgKf0M6Qow2VppJJeFFIdqYKM5wamuSIQ1OEgzEW3ozpWqxqHlaV7s/
	 xX5ldy8iuqkcUcWS2L4lvAEUI1tHuuN5Sx6WOz71L+fVHCZkaxDKSh2rLK9pvnESrig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793149576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=PpW1w1fTH4pWdwk/odzA2Xx9G09sfx2zMLzLE1poreA=;
	b=WU2G8QcZ7w5CyABoy4rZzxbbTRDNLWN/bVyunhIvOAagKSwPpsg9xhdhgt1btoaRRBK/
	 lPpHvsODJ2KYVMULRr5uqQmBReJ7L5s0HogD5Z+VoFIHmEK0apEj2LppY4Y7d6p91895r
	 Vm6sDrEdBTv91p1winYNko1XTtCW0sj0Mi1uPV4nPvF2Eyg1m/3QXFYQeGcvo8NEEISX7
	 fwqeV3xTKq04jk3vVZj54FMETV+cAreXMVKsMmzgHdZ3hYJGcZ5LN1NjVhMoK8/B2I4Ta
	 wgC360+ZMJh6JRkbsSLSECksmgEF3/4ImxN+jk4wYrKTXGLsjBqnNRf5tHUdDwBVoBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IPwkcPFV;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0CC606A31E
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 01:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A0CC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IPwkcPFV
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e94f72fb9fso3395105ad.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 18:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793149575; x=1793754375; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpW1w1fTH4pWdwk/odzA2Xx9G09sfx2zMLzLE1poreA=;
        b=IPwkcPFVyzgfuBUhhocxH+WImzb55zfjbLbDD0hWPoFWKHPSqvkFbDwsbhKGQ4PLrX
         pA60Dbt1ahknus8zsRXikJ3Eb50EO2sCCJ7kPGRTNY5z2Ru0j17dazlzJIx0OxDdDKMc
         3ghrWG56vyaM+9A+P3D1iqqweazvK01ap547sTlu4pTPI1hC85fLahI8y1HoYfFFlPOH
         ZOmeofYNMSGxrU+mDJDfFn5h/79zmSplvr7nT5TCdaCTtBVZIUN95ew+rD+uxuL1SzRH
         fxQTULmmU2FyTt1VKStcaGKSwBaDWZtoHYsou7IgQLM/61JaNgHdIesqZIps11MdVazp
         cnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793149575; x=1793754375;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpW1w1fTH4pWdwk/odzA2Xx9G09sfx2zMLzLE1poreA=;
        b=IpKkN2b+heoE2+3Rw4Q4AagB8kinj+C4B9RJk3WzFHYhSfBO9Asr1YlLki/EKUzUQ2
         LpiakWC4L/uMbFLVJo+K31IgbK8aUFSrK6eqhSR447CvPL42A3fENXbAm/bta2PGgctd
         aeFwzYEZtaqySACwBdL5yFXCRr6yyQNpN+B728AmWzbnPOu0ODqyEKekMVwBU6qZ6xdl
         OtJqwmR65C/q/GgGw9pggQo06RtV+fa7MgdVLkcVJ2jV8e9LTO+nT95kinkSHdTrW2Ws
         E8e3aPObjO3s2vdaTwl5g0ijp/npJy7IqNLd4ph79ccUH7/fSuEAQSXv+prtFif/pEZH
         43MA==
X-Forwarded-Encrypted: i=1; AKwUvBwbEeQFEEaw3wy/MkD/l5rXkdaVT10g51OZD2tLykKVuRu7rUpmvA6s+srtnrziq2gfWHRryJMqlBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbYJoCqSzoAjfE0TEm3OihxujiWqMLAEaFXber0mMB3wIilQGH
	90gfw7WGYKv24KiM8ErEoIX9sTFVmLC5t+5DIKtGElR1qDP8G1pApYqILgdrmX+4HvOBpBnvqQC
	uv7/rbVu+xoIk3ZZK0w==
X-Received: from pldb12.prod.google.com ([2002:a17:902:ed0c:b0:2e8:fa52:c600])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:37ce:b0:2dd:c100:b2c8 with SMTP id d9443c01a7336-2eb005a750dmr7696975ad.51.1793149575175;
 Tue, 27 Oct 2026 18:06:15 -0700 (PDT)
Date: Tue, 27 Oct 2026 18:06:04 -0700
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261028010611.3929937-1-tjmercier@google.com>
Subject: [PATCH 0/2] mm/vmscan: remove obsolete offlined memcg reclaim handling
From: "T.J. Mercier" <tjmercier@google.com>
To: roman.gushchin@linux.dev, muchun.song@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Johannes Weiner <hannes@cmpxchg.org>
Cc: cgroups@vger.kernel.org, "T.J. Mercier" <tjmercier@google.com>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Since commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of
dying memory cgroup for LRU folios") and commit 0e0ac326c511 ("memcg:
move LRU size accounting on reparenting instead of copying it"), LRU
folios and their size accounting are reparented to the parent memcg
before a memcg is offlined, leaving the offlined memcg's lruvec
permanently empty.

This series removes the remaining reclaim special-casing for offlined
memcgs that assumed they could still hold LRU folios:
    1. Remove redundant !mem_cgroup_online() checks in vmscan.c
    2. Stop rotating offlined memcgs to the head of the old generation
       (MEMCG_LRU_OLD) in MGLRU.

T.J. Mercier (2):
  mm/vmscan: remove redundant !mem_cgroup_online() checks
  mm/mglru: stop rotating offlined memcgs to the old generation

 Documentation/mm/multigen_lru.rst |  4 +--
 include/linux/mmzone.h            | 22 +++++---------
 mm/memcontrol.c                   |  1 -
 mm/vmscan.c                       | 48 ++++---------------------------
 4 files changed, 14 insertions(+), 61 deletions(-)


base-commit: 2bba28e98578de622ef307d00875aa8f8bca3d10
-- 
2.56.0.307.g5fe7bd680c-goog

