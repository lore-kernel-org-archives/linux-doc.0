Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795332643;
	b=2HPwc4cEIzlsc7cB+rAaSBKwBOQWf9eZin9W5nPggl4ZUlj+MeNcle6O4KRdrK1tCHQL
	 k1KJ2pbJZs0l21WDBWDdHFeXbqOxZgiSmO95gu+9jhxFwCuPsETwjHcXNpuwiJiStfECX
	 oAnQZ7I+gg/ehP29JfY1ds6oT9bGQa6nYoXL84wmVNLnN6p9jBcrmVEIVfUXMdPmuvdU+
	 ukvU99GEr50/AtBQHTORCACvXrojcnzOrj+TDw4n+USb2qVSYLyX9Xc69bGpJM1AlOR79
	 JlvF239XEZ02hqWG9d0EbFMtgL7XY8WwRT68oRgDAEComyvQCIYvb4NhVXaORhmGs+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332643;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=H02gl3A8lED/orev+VVlUTCHLPwpp1eOdDDA4V8ytIA=;
	b=18/LT2RNLBtOXb8RY6fvjBSZ2mmbwgCxyaegv34z3HzNOnapH4fPNzWMRe00y5iohwRV
	 MCgMJNzlR0FKE1V6gW523Vyqiu3fwgxMuGiVP+Km2uU8dJP45UmLIOdyyqgl5hZiARrVl
	 vtW2F8It7JYhVrrUeODah4Th5o0necFTNVMYd69c6UYpVBzYtnSCO5rt2wmSUavaLyVGX
	 efJPfxj3ncEKWuI8wKpxu2/0qJjhd+ITJ1+LTTznQX0HfYsx5C+AmIp7iTi2VNyDH3rUj
	 p4HylmOZ+kYZJ6s5OgsTDnbRTzSah0hDJ70PeKO87zKDTAtXXV4pwzjscBKBbZavu0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M8jygr5a;
	arc=none smtp.remote-ip=95.215.58.175
Received: from mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9322A606A330
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 07:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9322A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M8jygr5a
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NLC7oANZwCfL7depjHfIzJ4jloTo6BAzdIgGpvntEFI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795332639; v=1; x=1795937439;
 b=M8jygr5aBCWN7dK64eSo5G8nBVNnH0PVvZJGbiNzj+/iqwBKnRyiMpIwEeajBT8v9Zwurfdb
 4WVj/0p+Z8kpL94Zyzs+pjbbbZTWMJqOsf4W2KJXbOfLfrnI7egNG+fFRkVEV1nxoKF3B1VtJq1
 8pUyTesQeNgTH7mUVdlBe9BM=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b98bde626d255cef;
	Sun, 22 Nov 2026 07:30:38 +0000
X-Mizu-Trace-ID: b98bde626d255cef
X-Migadu-Flow: FLOW_OUT
Message-ID: <3af03366-784b-48bb-a807-9ccea92e39ca@linux.dev>
Date: Sun, 22 Nov 2026 15:30:25 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/17] mm/memcg: add folio-based lruvec live helper
To: kasong@tencent.com, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>,
 Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>,
 Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>,
 Zi Yan <ziy@nvidia.com>, Gregory Price <gourry@gourry.net>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>,
 SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>,
 Yu Zhao <yuzhao@google.com>, Vernon Yang <vernon2gm@gmail.com>,
 Zicheng Wang <wangzicheng@honor.com>, Chen Ridong <chenridong@xiaomi.com>,
 Tal Zussman <tz2294@columbia.edu>, Kairui Song <ryncsn@gmail.com>,
 Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh
 <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>,
 Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>,
 Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 damon@lists.linux.dev, linux-doc@vger.kernel.org
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
 <20261119-mglru-fg-v5-4-9eee2fe97a2d@tencent.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261119-mglru-fg-v5-4-9eee2fe97a2d@tencent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/19/26 5:03 AM, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Add a helper that resolves a live lruvec for a folio under RCU
> without taking the lruvec lock.  It takes a folio directly so the
> lruvec lookup happens inside the RCU read-side critical section,
> which a lruvec-based interface cannot guarantee.  The first user is
> the lockless folio_inc_lru_refs() path later in the series.
> 
> Factor the ancestor walk out of lruvec_live_lock_irq() into
> __lruvec_get_live(), so that both entry points share it, and spell
> out why the walk is enough while only the RCU read lock is held:
> reparenting of a memcg that starts dying waits for a grace period,
> so it cannot race with the caller until the lock is released.

Right, that's the ordering: CSS_DYING is set before the reparenting in
the RCU work, so testing for a dying memcg under `rcu_read_lock()` fully
covers the race.

> 
> Move memcg_is_dying() up in memcontrol.h, next to the other memcg state
> predicates, and use it for the walk rather than repeating the open coded
> css_is_dying() test a few definitions away from where it is explained.
> 
> No functional change for existing callers.
> 
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   include/linux/memcontrol.h | 71 ++++++++++++++++++++++++++++++++++++----------
>   1 file changed, 56 insertions(+), 15 deletions(-)
> 

LGTM, so:

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi


