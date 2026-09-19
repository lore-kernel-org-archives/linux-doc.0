Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B69634B1A5
	for <linux-doc@vger.kernel.org>; Sat, 19 Sep 2026 19:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789844562; cv=none; b=Mx3Jv1k/4kTPLZIQxClLjBkipP7Z35oN3hzGjIifuskB2cwLEtd+bk0F7HClmbxtxnEl3YciiHGAJCZfw4021RCQeZ+JkLNnEqi1/ob1wi+V7w1fZS0vozNnV3EZ5fHjZVoezPhA743WUNswyJcfccm6XTMq5biGCGiqicLGL2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789844562; c=relaxed/simple;
	bh=hxKoGUuV75+YHy6uYW3H4vYzBx2fImiHDgzErBPHlPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+yllGGxsxC5xqymOz6tVRPi1cJzRogqFVwtbA05CV447a4WZ/gwhCXNPj58cJAJsyZrKDFiUlv0jn7R01OulJ6hs+tb8Q7h3Wg7V/V9TSgSgd9ohzem3uFt7JhhxEMEbJDoePWixBrcd3DdBaUCpodLVcjFLP3i3UBpp9at9qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhBAzf8N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhBAzf8N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37691F00899
	for <linux-doc@vger.kernel.org>; Sat, 19 Sep 2026 19:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789844560;
	bh=Pdt+VykzrSdAH3Ihk6G7KeWETmDZjvYwTDnvxuPWWYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QhBAzf8N19RbHfkJJFkLAi6GKJQe9xtfwOqEiSyCPguIu7PdBAy6YlDNqTG0ocXdD
	 sQAvUXyBSFbvWNFijRms8G2fVMk232HMUGPHOKn4LcAHoTl1p4O76ZaEC/vH5ZhmMh
	 owoqBQaRhUJcEzXLsQEuDwDoN10AXlN98bmHxD3QXCPLBggRC2bVZxWpUmgxttHLYt
	 kUs9UxQ87g96VLgK4jHCZ4wI/5FPu/OK/+YaqHW6eChA0Y8RfRqMclszlRxKqz9Cjl
	 7UmEywcFvtoXxERewT+08rEmrtgPEg4jFd538sE6N/28uJxqIj6qHwW4qdCH8cl/Oz
	 UPiC37NWvjYEg==
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab20a33so1773319d50.1
        for <linux-doc@vger.kernel.org>; Sat, 19 Sep 2026 12:02:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByCkVKWFTvKVdc9U6YWiR2hgNdZTscFWSXKyaEXfRbPR0bTOZ95PEzy1oaka2In2mPnoW07toz9puY=@vger.kernel.org
X-Gm-Message-State: AFuF++lAKzKAVzO+hOqziQAXZAgnUBcsyyk3iLk1A8VPe6ykR8tv8zNT
	QTsH07PfwyRVOzuPsskY1FlOI85vMiQPojNGP4VaNf6llWvmhEtMYHhByCZ530Zyx94ZX2XvGm1
	mWqZf9Qaogho+eq2977JAhsop86qfeoLe9Gx2BP3o4A==
X-Received: by 2002:a05:690e:418c:b0:672:99e0:ebf1 with SMTP id
 956f58d0204a3-67299e0efe2mr784209d50.137.1789844560242; Sat, 19 Sep 2026
 12:02:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora> <aqLi6cIjD2wJwk0B@cmpxchg.org> <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F>
In-Reply-To: <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F>
From: Chris Li <chrisl@kernel.org>
Date: Sat, 19 Sep 2026 09:02:28 -1000
X-Gmail-Original-Message-ID: <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
X-Gm-Features: AcwNN1XjloUiBKubGVavEZ51xBIrMqQYV_VtL3A0tpER26tTv3nQ8ltxbACyHsc
Message-ID: <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Gregory Price <gourry@gourry.net>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Kairui Song <kasong@tencent.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 6:08=E2=80=AFAM Gregory Price <gourry@gourry.net> w=
rote:
>
> On Sat, Sep 19, 2026 at 03:45:03AM -0500, Chris Li wrote:
> >
> > I found this new concept of "compression space" very confusing to me.
> > Can you explain the swap behavior and problem using only normal memory
> > usage reduction and latency without introducing a new term or new
> > metrics?
> >
> > The normal user doesn't even know what compression space is, let alone
> > what makes it transparent.
> >
>
> Sure they do - it's the amount of memory consumed by compressed data,
> including the metadata associated with it.
>
> converting Johannes statement to diagram:
>
> >> Compression space is not a separate resource. It's page tables,
> >> backing pages, and swap descriptors. It's just MEMORY.
>
>                           Page Data (PD)
>   [page tables][                uncompressed page                  ]
>
>
>                         Compressed Data (CD)
>   [      recovered space     ][pte][swap meta data][compressed page]
>                               |                                    |
>                               |---------compression space----------|
>
>
>                         Memory Pre-Compression
>  |[  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ]|
>
>
>                         Memory Post-Compression
>  |[CD][CD][CD][CD][CD][CD][CD][CD]-------- free space ------------|
>    ^----------------------------^
>          Compression Space

Thanks for the explanation. So the compression space is just the
actual data store backing the zswap/xswap/zram.

> It's actually really confusing to represent this space as a traditional
> swap device - built on the assumption of a pre-defined size limit - when
> that size limit has already been defined (the memory itself).

First of all, the traditional swap counter has a very well-defined
meaning. It is the size of the memory that, when accessed, requires a
page fault. A page fault adds significant latency to memory access
compared to access without one. Whether the memory is backed by SSD or
compressed RAM, this is an invariant of that definition. If you change
the behavior by not charging to swap when swapping out to compressed
memory, it will break our deployment, causing many OMGs. Kairui also
mentioned that this will break their usage as well.

Therefore, I must push back on this. Please don't change the swap
counter charging behavior due to the risk of SLO violations for users.
This is a user-visible behavior change.

Secondly, I notice that you are reasoning from the memory usage
aspect. That is a different usage requirement angle than the SLO
violations. Maybe we need a separate counter to track actual memory
usage, regardless of compression status.

Let's figure out a way to make your usage case work as well, not at
the cost of breaking existing usage requirements from an SLO violation
perspective.

> Baking any kind of pre-defined limit *into the infrastructure* (whether f=
or
> an optimization or ease of implementation) is what requires users to know
> what compression space is.
>
> Even using memory capacity at boot as a limit is wrong - hotplug exists.

This reinforces the point that viewing things through the lens of
"compression space" is confusing and muddy. That is not my mental
model. I want to add support for your usage case as well. Please
clearly specify what user usage you want, what the expected outcome
is, and why you want that.

>
> > Why does the user need to care about compression space again?
>
> They shouldn't need to, that's very much the point.

Great, Sounds like I can safely bypass it.

Chris
