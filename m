Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087482;
	b=0NasWJVQoF9IFZbSX4FoLKrEYh0P5++XoI9YetkmTbgKLU3nZLMYXvuc7S4N+1zKvURR
	 Q88oks3vUMq8yQ0ROvqo/wZKkpKukX9a+XfEmGcyFVIyoG7F9+yy5rUJCyblkzK/m1fL4
	 pqJQCdedsLWS8FWkHMG7kUuIfN5/FEmW1PtAkOBOpd6idSHTMfx03CYJqKPRLz3zasbw0
	 4VeWZY/xo1ywHAgHwz9rdmxPM8mDlPwaXxnzVU9UNPT5ZvUAUuoubPJWkk7Ytnca2vUOd
	 r0Bw13/bmgaUxXc8fQmUSQDkxyzCtIML2DI6K8r/ioViJp2WO5s7PhLypt1rg+++A6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087482;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=9Y4HSKGmKLqBmv82uN8Zw1yJpfCCeKgGfjpKz1LLlzs=;
	b=ibKjAoNVl1MHnQk3sWlLmSvI477y6sgctILlOdn8jOXbqYHDiNDEcdCZsawKhqZDe1Jx
	 TJINrvTLQ/AKPrLJdYspK3HN+M4Q9mxTQtRKHxl3Q2D1qglOZ6/eL2Aeg9POSP7G79cfd
	 yti7RKun+8SsQOnmWlDTG84wvI/rVxlUK7ymEJ6Z6EsrxmgAOq70hsapmlgz5dkAB5J+J
	 mvtl1YjExbotSVHRZnCLi2vOaUzWU5CSMic6eFHu9mb8NjglKutyJDP30OKe0/zyPJ7fd
	 9dQ0a5J4pU27q9qDFjDZNK2uCt5zDp1buLPyIGfMISfsB4JoOoYBCFtJLRCk84zFFwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tychen.cc;
	spf=pass smtp.mailfrom=tychen.cc;
	dkim=pass header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=QFssQDBU;
	arc=none smtp.remote-ip=198.54.127.68
Received: from out-zbxj-a68.jellyfish.systems (out-zbxj-a68.jellyfish.systems [198.54.127.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6C1606A326
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 11:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE6C1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=QFssQDBU
Received: from fedora (ec2-52-197-241-54.ap-northeast-1.compute.amazonaws.com [52.197.241.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jVbhS4WPLz8sWT;
	Thu, 19 Nov 2026 11:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1795087465;
	bh=9Y4HSKGmKLqBmv82uN8Zw1yJpfCCeKgGfjpKz1LLlzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QFssQDBU1bWgh5y1TGsTPlJBzh222++oczH4cleFn81Ik9KK1tcsybvy2u8PoG98e
	 9E0oFppVnJX46zo5smPRv7Y69CZiOxAsRIXtIqO+/mvKfUZJqP0HCPXqh2FYWHpkyP
	 j+7rU7BUV3pZQ+I+zOmYB05/vr5sEUJcKPu8NP0kDSEcazUaz6fCkNU92yM9o7mbYE
	 DJaYV3Kj5jLcKP4kHLAe7ycckEVMZuF0tIYhOIT0BV7idayvyclagc6LFG8IIp6vrv
	 mkzLXPapiNWtPHXOMz7nMy3835yv0C0JPXl1npzATBg3tix7i63IkvltjWJXkERgGv
	 wWfrRY4Li7D9Q==
From: Tianyi Chen <hi@tychen.cc>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Muchun Song <muchun.song@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Chris Li <chrisl@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Youngjun Park <youngjun.park@lge.com>,
	Zi Yan <ziy@nvidia.com>,
	Gregory Price <gourry@gourry.net>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	SJ Park <sj@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Yu Zhao <yuzhao@google.com>,
	Vernon Yang <vernon2gm@gmail.com>,
	Zicheng Wang <wangzicheng@honor.com>,
	Chen Ridong <chenridong@xiaomi.com>,
	Tal Zussman <tz2294@columbia.edu>,
	Kairui Song <ryncsn@gmail.com>,
	Xiang Liu <liuxiang.277@bytedance.com>,
	Ehab Ababneh <ehab.ababneh@intel.com>,
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>,
	Lian Wang <lianux.mm@gmail.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Hui Zhu <hui.zhu@linux.dev>,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Maxim Muzafarov <maxmuzaf@gmail.com>,
	hi@tychen.cc
Subject: Re: [PATCH v5 00/17] mm/mglru: frequency guided promotion (MGLRU-FG)
Date: Thu, 19 Nov 2026 20:23:56 +0900
Message-ID: <20261119112357.275352-1-hi@tychen.cc>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Envelope-From: hi@tychen.cc

On Thu, Nov 19, 2026 at 05:03:32AM +0800, Kairui Song wrote:
> That's because MGLRU deliberately disables hotness tracking for
> MADV_RANDOM areas while CLRU still has refault distance.
[...]

I ran the OpenSearch k-NN test from the RFC thread [1] on this series.
Its .vec/.vex index files are mapped with MADV_RANDOM, so from the
paragraph above I expected no change. With FG the gap is gone in this
test.

Setup: 25fee5b1762b with and without all 17 patches (they applied
cleanly), the same .config, and a fresh 4 vCPU / 5 GiB KVM guest per
kernel. OpenSearch and a one-pass 96 MiB mmap scan share a 1 GiB memcg
with no swap. 5 seeds, lru_gen enabled=7 vs 0. The script is unchanged
from [1].

Medians over the 5 seeds, last 1,000 queries after the scan:

                  p99 (ms)   memcg file refaults   .vec resident (MiB)
 base, MGLRU         66.18               144,387                 99.98
 base, lru_gen=0      2.09                     0                117.19
 FG, MGLRU            2.16                     0                117.19
 FG, lru_gen=0        2.12                     0                117.19

Right after the scan, base MGLRU had already dropped .vec from 117.2
MiB to 54-71 MiB (median 66.3) in all 5 runs. FG kept the full 117.2
MiB in all 5. All 5 seeds go the same way, and classic LRU is the same
on both kernels.

This is one synthetic setup and I tested the series as a whole, so I
can't say which patch makes the difference.

[1]
https://lore.kernel.org/linux-mm/20261119082441.196139-1-hi@tychen.cc/

Thanks,
Tianyi

Assisted-by: LLM
