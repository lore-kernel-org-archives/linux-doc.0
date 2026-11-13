Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559826;
	b=dxP88rDR71yWVqr43kvupWwFSg2Ke9bnLWaQQ5X5ycbsS1th5Ofl5SjUAA5njmsqhuyb
	 wjwzkyNwwIH381RoqKvuE4NO/kyORh755ALqmUQlQ+z97Acvj1SPGDJ9dh5fFs7SUWtzO
	 hXoG/m+TtsLBsYYzddpBrcncpDGJQa4lZEGxo92qm8DM0I9QfPOemovPPjulhwlTaqyi7
	 d3gm1pz9LrLh2Ht1lHm7lrzyVk+LMztDqq+QD/qkX2P/PDT/j90CFXAsZHvimoqXguVI8
	 SdeO8SfwDQb7yN0I3aohcbQInJgW8TGFLg6CMOcVm0Ly690x/TiUH6XcxlMx7jnayDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559826;
	h=DMARC-Filter:DKIM-Signature:Date:Mime-Version:In-Reply-To:X-Mailer:
	 To:Message-Id:Content-Transfer-Encoding:References:X-Original-From:
	 Content-Type:Cc:Subject:X-Lms-Return-Path:From;
	bh=BRtBrIkCJ4EaL32K9DlOPnqwkNfnHFCSjQCoKgoeAeI=;
	b=vbvwxwECQWoacZFXI7rd4RETZNbF41upXX5VjWMEpoWouX0rgYeLM594SyoqmbfYaiwD
	 rxExYvY2bHryBN8IJQwLyE+adEtIJGru+rEe2XaC6q5NvjVf+3PkM2zM5fQLvyyESeKbo
	 v41/McERNPKoWEfbKE4XmExxcXtiu03fwNGSmlaNP5j1MSqzR28XHkh1GRPvgyA2FokhU
	 1yrDkUeLo4Ed3cRFFb9HEvNgL3BO6oFrqI//rT6SsyWwAtzwZZOiUixcrkJJOlOu39Gtz
	 khix+cqeKNsDr0olGjVEPcvaNAlzkEbuCbNOocchELFkwndHhK1N/WUbKMNiUeNUe/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ohSvZADq;
	arc=none smtp.remote-ip=209.127.231.112
Received: from va-2-112.ptr.blmpb.com (va-2-112.ptr.blmpb.com [209.127.231.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F2C606B366
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51F2C606B366
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ohSvZADq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794559823; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=BRtBrIkCJ4EaL32K9DlOPnqwkNfnHFCSjQCoKgoeAeI=;
 b=ohSvZADqWwkUbpue3+Py1p1OMG+qrQgWkWWP9sOK85C/eaDYLQ52nkmCN+PHYi52xYchrH
 AZwjEc1sqgAkqeF0Og2wPob3N1NPn5kG4CScI9FNQlzj/Kx0MkFaQWe1rO5CSilhf5NkZg
 hyGwPcpmdS2HzsPnjXxbXk4jqt8DkY6hx46oixmiiJEQEglE1kSxQsWevkC5YMwMiOzGrK
 mh7rJSlMfqFQDbF3AnK1mbM6+D4LdZ5cDdhd5PjgnEG1i4qrJ1OoVCtmK+CCsd09EGrXLf
 jhQX/xexR0UujW0YzkDyNXo3t221867BetuOvWOZz3mVxiVSA43xpZz/f+NQpA==
Date: Fri, 13 Nov 2026 16:49:48 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <179455442014.482102.4069329165987986914.b4-reply@b4>
X-Mailer: git-send-email 2.45.2
To: <gourry@gourry.net>
Message-Id: <20261113084948.78661-1-lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
References: <179455442014.482102.4069329165987986914.b4-reply@b4>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <akpm@linux-foundation.org>, <cgroups@vger.kernel.org>, 
	<david@kernel.org>, <joshua.hahnjy@gmail.com>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, <lizhe.67@bytedance.com>, <ljs@kernel.org>, 
	<mhocko@suse.com>, <muchun.song@linux.dev>, <rakie.kim@sk.com>, 
	<roman.gushchin@linux.dev>, <shakeel.butt@linux.dev>, 
	<weixugc@google.com>, <ying.huang@linux.alibaba.com>, <ziy@nvidia.com>
Subject: Re: [RFC v2 1/1] mm: add source selector to memory.reclaim
X-Lms-Return-Path: <lba+26af6cf45+407931+vger.kernel.org+lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>

On Fri, 13 Nov 2026 02:20:20 -0500, gourry@gourry.net wrote:

> > On 2026-11-02 15:04 +0800, Li Zhe wrote:
> > +	Specifying a source value constrains where proactive reclaim applies
> > +	pressure. Currently only source=nodes:<nodelist> is supported. For
> > +	example::
> > +
> > +	  echo "1G source=nodes:0-1" > memory.reclaim
> > +
> > +	This reclaims memory of the target cgroup resident on nodes 0-1.
> 
> you buried the fact that you want to allow source=zswap in your cover
> letter. I was confused by nodes: was needed here until i re-read.
> 
> As Joshua mentioned, i don't think you need the separate cover letter,
> and I agree this is far too long for the proposed change.

Agreed. The nodes: prefix was meant to keep source= a typed selector,
but I made the motivation and possible future extensions too long and
distracting. I will make v3 much clearer and shorter, and keep the focus
on source=nodes.

> ---
> 
> When I asked for testing, I wasn't concerned with the functionality,
> I was asking what problem this actually solves. performance? fairness?
> 
> Shaping the distribution of memory is neat and clearly works, but why
> does userspace want this?
> 
> The interface "lacking flexibility" is not a problem in and of itself.

Thanks, this is a fair point. Sorry, I also made that earlier
explanation too long, so let me summarize the intended use cases here:

https://lore.kernel.org/all/67fcd8db-269d-43f1-aea2-8c41165747d0@bytedance.com/

In short, performance, fairness and cost are all part of the goal. One
target is mixed DRAM/CXL systems where user space keeps each memcg near
its own DRAM/CXL resident ratio target, based on the workload's
latency/throughput and cost requirements. Another target is the case you
described below, where user space wants memcg-scoped reclaim to apply
pressure to the desired tier first, rather than reclaiming from warmer
memory on the top tier. This is especially useful when a memcg is close
to its memory limit and user space wants charge-reducing reclaim to
start from colder/lower-tier memory first.

> I CAN see why you might want to proactively shape what data is swapped.
> Let me give you an example:
> 
> ---
> The global node reclaim interfaces allow us to put pressure on distinct
> nodes - which lets us shape which node is swapped from first.
> 
> Example: node0-1=DRAM, node2-3:CXL
> 
>   echo 1G > node2/reclaim   # swap from CXL
>   echo 1G > node3/reclaim   # swap from CXL
>   echo 1G > node0/reclaim   # demote to CXL
>   echo 1G > node1/reclaim   # demote to CXL
> 
> But the memcg.reclaim interface only allows us to pressure the complete
> set of cpuset.mems nodes for that memcg
> 
>   cat cpuset.mems           # 0-3
>   echo 1G > memory.reclaim  # makes progress from any of 0-3
> 
> Presently, proactive reclaim iterates nodes in node or fallback order,
> meaning it attempts to make progress from the fastest node possible
> first - which attempts to demote by default.  If the lower nodes are
> full, this demotion will fail and we'll swap directly from the top tier,
> which is (presumably) warmer than the bottom tiers.
> 
> Enable source-bound reclaim in the memory.reclaim interface so that user
> space can have the same control over memcg memory tiers that global
> proactive reclaim has.
> 
>   echo 2G source=nodes:2-3 > memory.reclaim  # [z]swap from CXL
>   echo 2G source=nodes:0-1 > memory.reclaim  # demote to CXL
> 
> This lets user proactive reclaim to target the coldest memory first
> rather than preferring to reclaim from node0 first and potentially
> swap out memory warmer than what is present on a CXL tier.
> ---
> 
> With this, you might be able to demonstrate fewer refaults and less
> DRAM (node0) memory consumed by zswap. These are clear benefits.

Thanks for the example. It makes the problem much easier to discuss. I
will refer to it when reworking the v3 motivation, and will avoid
framing the issue as a generic flexibility problem.

> I would argue that memory.reclaim should operate this way anyway,
> and that would could make proactive reclaim do this by default, but
> I could see the policy bits in userland being useful as well
> 
> Performance may not be the only reason you want this, but you need to
> help me understand what you're trying to accomplish.

Thanks again for the review and suggestions.

Thanks,
Zhe
