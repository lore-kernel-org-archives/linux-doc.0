Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541362;
	b=GEpK9deFiWkNrso0SGN1hlevP3ZzAA+az83AIUIjTIsAkCJyIpQRMOA1xG8JHFLN5iN4
	 F6oevAysw4LMFgoUI0Xu0aNfkhf/1uOMGXnOg3rNZSTbkf5KQ8IxgIbIMMatdjzqdqYkF
	 BSklh5/JOPYNDX3WbUrSXoJPBuJzI/D78EYh+JJa68GrHWgOrvL8yO/JaVctZgKnuzjUn
	 q09ijZgrCJMHtuwnT7Mxfa+xPOohm8FB7b+Fy0qy2UDMXPqRHcwvP3uk/5opIt3nxsMfx
	 fIzxgeCnI5oYBZmdlaSGh7RfG+xJcS7JMekPSX+bce92mkU85oHlL14/Z1cmlNSh4HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Gh6CqnsQ+4Kge1Ge1wt7W5gV069TsTISbQWwZdpvMuU=;
	b=gQ5W3qjIUvLiABCjvGIl276QNk+aHTdNgoQLHzHCQoyc1HpsjYs7Nu8aReSa4MLI7lrk
	 nTs1xP7nhX4ecEmLmQYIHJVZ7K8/JJzkU30WVkgepKAlWAKw1uaA2O5MYLtuUps96eiGS
	 S51sf9u8lh8ptfgTNwgRhXHx2hOupiH2yhA+QdGQxw1zPuYB4Vyksckw8tgrahQvgr3+O
	 1ci/yABV+yu176i+UsUsItSoIqoA054YWDZ0CVVoxPOGpo8l6yE+JeqL+hc9crixJySZu
	 KxwOGeIDKjEYGNtTIXA0VoBkc4L+AzgViqNUb0/RkSJrFuizZ8MBoSTSPVB3jiOuLrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3a2BM8n;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E2B606A329
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 17:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E2B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3a2BM8n
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06e79e152so2322150b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 09:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541361; x=1796146161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gh6CqnsQ+4Kge1Ge1wt7W5gV069TsTISbQWwZdpvMuU=;
        b=C3a2BM8n3061p4sMZOMJ8Y1++2AGZZiH9JYuZvbQ1ruA3bG/0EZNMmcDp/Au9lC7ZJ
         4r92Y+doFslYiemisX5ngldE6XhXw8kw2ZHYv7N9/lc9DmuUWCdbpPLJiO2piXiV+MYW
         s9RW1RbmdQXh7QSgmJeSTl4QJoQdLiYrVKgk4TGnRMb0WSc3Di8exzY/ym4LeiBAIY4F
         c7mPMRBA3YPBPOYnXon2OZYof1k1S/oLnI5I8cIQcB5aoJOb1lIOFSoWx1AgOuB2VVlG
         gWG0KvOOBmeF6PC37XfXGWXqVoTdmP82hw2ertwKDYXQ8z6kid1rNVz9R0dtO3JCDTO8
         uYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541361; x=1796146161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gh6CqnsQ+4Kge1Ge1wt7W5gV069TsTISbQWwZdpvMuU=;
        b=VTn/WxuHEfXnegL8n6ZBfOh7UcOYOQdPSWr4qwWCUM1pXkGKAgHu71nfUxmrdm22sE
         XwOstOFs4cqAkuTxX7rQuUYqd8vcML8dFFPcyUthGfoDq/QGJSybZRWQBiaW7fev/T2Z
         bz8+PcRVGlfCO2Ow9n0FRBT8gdY27NCUAhu+94iCeVXe0bcJO2tRkrTKDR5IlIEcsvGU
         iKbV9v5AprNzOehhAn0B77KkY5fXGu646x1r8r9Wtuk9/gbpNyEEtaQBSRlyeAhwXHQP
         3kYEyJ7QtuCHBE6WZExKT4OIS+Z8k06zzUPhx6In3UeP37r1/dXJerRYfqn71kqMTd/I
         gP/g==
X-Forwarded-Encrypted: i=1; AL+hErEQmBFmXVF7IXvcAuB8L98KJQ5T0xpl6lSsCnh3+qQ8RzPNNJq6qiL/Jd8zq8SOk0DtmamMmoH1ECo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GN04ZWFzQ2qUBNHYlixrzOv4io7qr6TAHw2Cz9E14HNZDqv+u
	wR3ZUE4oOSr1CpcVNxUgfxpXf/BI0ME0zLd53OWKLbSkAAXo9u5f+YVj
X-Gm-Gg: AZFdTZdg/Jzjsi/q0MsOLaHa5TbHLGhLuUF6NUh/xzoW3Yxuq8Ai3IxvliRvYXmDzK5
	oOqls53BtDO11XKWt9gqk+DKOQznVkNmkUZLlvQINPA1dRTQQ5EuPIyh4VIPWa4tZNrMIC3rGJl
	eyxh2NEZKij8DGjaoGvimdCnfNtqUx52jMPh759N+9uKMX2eXQdNP1+zAg81JyMiLX+cl0LDHVm
	vIC2hpVymDsVoYsBxtMDEhf0ICmeDRycXuRAhT+hzfB6npDbV76761mFhbPsw6sNzJTqkut2vtA
	gCxbGK5okUpRqUowHdA3P05kN8+MeUxHUswEWD+Xby8qjzqvovLjEZyekYXBWa/X4H5iS1PUQVM
	ZuA9IM48hb1DcZiotQ+dB98jL8dN3jRN1dVYzpDgD5sk1q9cHc6czmrVXE2ThYB0yy+txJoXmz4
	hxCTn0g6mQwx3NlwIYX2kRxFp7c18/fnM5aSOWsKfByH+gAxdfu/H5J2Ij4XZCM/6/fL8vbZP8m
	zT/N7zhBwglO5cY/Z2MPEaxb8gEb9Y3y82mAI4U+jiOGjmiWi5t39Ewnjl2ISpNLK/MEVry+B8I
	rmBbL+/RKYwDb4OONIzJ73ACTXNlbJfRXFqNXaTgQxdzOUOJJuDMoaQg7oMFx8U/oi8wckE=
X-Received: by 2002:a05:6300:404c:b0:3fb:35d2:645e with SMTP id adf61e73a8af0-4014a27e70emr13896715637.5.1795541361413;
        Tue, 24 Nov 2026 09:29:21 -0800 (PST)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4aca2sm7432265b3a.32.2026.11.24.09.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:29:20 -0800 (PST)
Date: Wed, 25 Nov 2026 01:29:04 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Zi Yan <ziy@nvidia.com>
Cc: kasong@tencent.com, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Gregory Price <gourry@gourry.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>, SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
	Yu Zhao <yuzhao@google.com>, Vernon Yang <vernon2gm@gmail.com>, 
	Zicheng Wang <wangzicheng@honor.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Subject: Re: [PATCH v6 11/18] mm/mglru, smaps: convert to LRU refs based
 operations for MGLRU
Message-ID: <awXIalgUrVIf5VP9@KASONG-MC4>
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-11-8ffea39934a6@tencent.com>
 <DN2UPVW6W83J.I1S5XXQ2DPLV@nvidia.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DN2UPVW6W83J.I1S5XXQ2DPLV@nvidia.com>

On Mon, Nov 23, 2026 at 02:52:55PM +0800, Zi Yan wrote:
> On Mon Nov 23, 2026 at 1:53 PM EST, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > PG_referenced is only the lowest bit of the folio LRU refs count
> > (LRU_REFS_FLAGS) now, and MGLRU never kept it stable: promotion used to
> > clear it, and now it toggles as the count grows. But with the LRU
> > referenced count as a stable API now, we can use two helpers to provide
> > in-kernel users a stable and sane reading of the referenced status of
> > an LRU managed folio.
> >
> > Add folio_check_lru_refs() and folio_clear_lru_refs(), which use the refs
> > count when MGLRU is enabled and PG_referenced otherwise, and switch the
> > smaps paths over to them. The lru_gen_enabled() test stays inside the
> > helpers, so its static key is not splattered over the few call sites.
> >
> > Convert smaps as the first user of them. MGLRU now reports every folio
> > with a nonzero count, so the reading no longer flickers and clearing no
> > longer results in an ambiguous status.
> >
> > The classical LRU case is unchanged.
> >
> > Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> > Tested-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  fs/proc/task_mmu.c        |  6 +++---
> >  include/linux/mm_inline.h | 31 +++++++++++++++++++++++++++++++
> >  2 files changed, 34 insertions(+), 3 deletions(-)
> >
> 
> <snip>
> 
> > +/**
> > + * folio_check_lru_refs - Test if an LRU managed folio has been referenced.
> > + * @folio: The folio to test.
> > + *
> > + * Returns true if the MGLRU refs count is nonzero, or PG_referenced is set,
> > + * which is also correct for the non-MGLRU case. Kept as a separate helper,
> > + * to avoid splattering the lru_gen_enabled() static key.
> > + */
> > +static inline bool folio_check_lru_refs(const struct folio *folio)
> > +{
> > +	if (lru_gen_enabled())
> > +		return folio_lru_refs(folio) > 0;
> > +	return folio_test_referenced(folio);
> > +}
> > +
> > +/**
> > + * folio_clear_lru_refs - Clear the referenced state of an LRU managed folio.
> > + * @folio: The folio to clear.
> > + *
> > + * Reset the MGLRU refs count to zero, or clear PG_referenced, leaving
> > + * PG_workingset alone for the non-MGLRU case. Kept as a separate helper
> > + * just like folio_check_lru_refs().
> > + */
> > +static inline void folio_clear_lru_refs(struct folio *folio)
> > +{
> > +	if (lru_gen_enabled())
> > +		folio_set_lru_refs(folio, 0);
> > +	else
> > +		folio_clear_referenced(folio);
> > +}
> > +
> >  static __always_inline
> >  void lruvec_add_folio(struct lruvec *lruvec, struct folio *folio)
> >  {
> 
> I assume this mean people should stop use folio_*_referenced() directly.
> Are you planning to remove PG_referenced helpers to achieve that?

They are still there for CLRU, but yeah, and actually there is an earlier
RFC where we can remove PG_referenced and PG_workingset, just like this:
https://lore.kernel.org/linux-mm/20260502-mglru-fg-v1-31-913619b014d9@tencent.com/

And this:
https://lore.kernel.org/linux-mm/20260502-mglru-fg-v1-32-913619b014d9@tencent.com/

It doesn't really reduce the flags usage but make the code cleaner.

The co-exist of MGLRU & CLRU makes it looks weird, hopefully we
can solve that soon, let's do it step by step.

> Other than that, LGTM.
> 
> Acked-by: Zi Yan <ziy@nvidia.com>

Thanks.
