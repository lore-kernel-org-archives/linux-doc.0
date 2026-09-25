Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C15A32B109
	for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 20:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790367641; cv=none; b=DXmpm9NX/R4fcG9nW0mQWp7sXXkpcL+unuABBQsLsbOBnurA09TsT/SI4PDU4bGwiZUd2Cwa266y2t3sx3as+mCGHzfZbEB+3yW7XMGehhLnHp4u8vXFWS2SsWVooir3/+Xjkc6vJatguQaiZST73by7dmqWfs1jpEwJj6NR700=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790367641; c=relaxed/simple;
	bh=jLtlM+dcV4vNFcRKCK3NS6KrvFDMXTg1LH4aBfPd9q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XalHZTScTqK/BFQCZhAzoyIKOMdlTeZZ5tfB/PR09RUBYoMOu9UzC5j/bh9VwgZIy6ba7QhzxjNGbDuIgCJGRSQXqJiZGDwYQzG9iXKC7qwy1tQLzSLfY8dEYd5eF2zq348waH0p+xL6W7j5q1l3fbRVdvVrR2z5zAGMgCFtVO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=SNrnUWfo; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="SNrnUWfo"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910ca5aa7so128892085a.1
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 13:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790367637; x=1790972437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jHCr0O6x1oEoTdeKSMNckh0NZBgonxokbaxnCBlTws4=;
        b=SNrnUWfojszSQQ3NLl2pUk4mJLAa9rRrhWCaVr0dKlcEbd+2v8/xHSyX7pYeVPNvKn
         sFIZB2GXz54DwPR298s2oI0icjj+x6g9GPW26737gP2UlFaTn2nDfGW13eKLaX59uE7y
         YfjH5JECHT6cTQnyp/Cf7TzvcdvwO/ecrZUFYj7iGVYRw3xyx40aX1KyANMXEyxt8dTq
         8a63/FBbDb/2hPeyi5PfbKkCMcPjmnaNq6OTpI37VhycmIQRGoOQiV5Q8DQMB9yS6p4Z
         zcIKgc5yaQeMWzG3dj+3MOF/w9hYLjB2cKaZhAfVEDd913J2tP6S3GW3z2QRp7fCjMaQ
         YZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790367637; x=1790972437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHCr0O6x1oEoTdeKSMNckh0NZBgonxokbaxnCBlTws4=;
        b=rPr++yL2WnNnwIwYVSciUTvjWZRto4vQefc9jP6GGPrMjd9I+bjdigEWObJlnmGq2u
         I994fVwYI2TMobgVAwWjVtbfYBfQlP8z03bV39EaUFmY+JKT76Lhd9vQbIZ2Q7ptOg4c
         exed3MVf8+JXAo3kJJ+cGIMnCoHttZdz1LPEStCjqYwmD+bx1O/WjXSFgA9izXO97TBl
         xRQaD1LvoTP28iKnYcNG4I33kY5Y3W3zx0tM468/d1xAsPzg3OdEAWD/jfJzYFS/M65N
         9bmmz+OF21rvV8eU+4Sckt9CquONSWr75YpscfzQuD19P+yawNLvdD0+7tW9VxIewMbK
         DOjg==
X-Forwarded-Encrypted: i=1; AKwUvBz8gDm/i2AwbwmuSnWpThOMT57crEDCq0S4YXNmqUSJ8cG4tq26McB0nh0Rn0gVp329a9CWu+xmRO0=@vger.kernel.org
X-Gm-Message-State: AFuF++lghINq+UV+2mL5jhf7OF3gmg5uN6AQwew9js91YlcayENaqHCP
	zfdjVYqc/jf3/omyeUiKRQf93wRkRBBpjCgo79iDmvPMDWn8VsCFX4/RJ8VSyvJAEuk=
X-Gm-Gg: AYBFou35vgm2uVza+rBlwUynzVhzylupq1mUNa85QDj74yP2VCFQ9mp+pEvFnv6L+pQ
	wo8yuh0/cYBGHfQ8vlUohy/paqiYB+Vs74RGxt58GfpwtPMpOF0vOqVXekVfcZjdKX8AtN4hTpJ
	ZXkPN9ssenqBIaTUeM5L0Ia1Ar2XcfBStWRiUbDAIr2r+SYozVRzFdPTJFIi5ZvyUSn/Gy7XkgU
	nWwILQTI5lvKrf2t2FtsLJuhisQhwZtvr/DurowRac94bFYBDwRAXSFCUGVhlo6NPjZ7KSlHTO4
	mxPwGxVp/WTVWtVCwiZhvVTkVqWlYyenuVaVeduBOyAM7HDzPDi0noaVJySdu9gfjR+qmj8OKyz
	Ccz2fbSO2Gez2Zmroke2HOrDab/ssXgk4GeFZjaDQ0hlTrdq6VfAiURnsrhOYOpaxN+FUhc0nnB
	FM5FtGnfipV9CLqaHAifrt2Q3hsVBsFeUaBVBPlDNTt9oL+HMmgiI0wa/GK245An321ll+
X-Received: by 2002:a05:620a:40ce:b0:939:a9d4:7022 with SMTP id af79cd13be357-93c43b5acadmr649894985a.8.1790367637558;
        Fri, 25 Sep 2026 13:20:37 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448b06c9sm260456585a.11.2026.09.25.13.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:20:36 -0700 (PDT)
Date: Fri, 25 Sep 2026 16:20:32 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: YoungJun Park <youngjun.park@lge.com>, Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>, Rik van Riel <riel@surriel.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kairui Song <kasong@tencent.com>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Barry Song <baohua@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Gregory Price <gourry@gourry.net>,
	Wenchao Hao <haowenchao22@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Meta kernel team <kernel-team@meta.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-doc@vger.kernel.org,
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arbXkEQ1cwOVMqEy@cmpxchg.org>
References: <CACePvbUwTxcMPVK_1GAz5gPDdh0BV9JZSnKXaUFLqDHBzBmPQg@mail.gmail.com>
 <7ee199ddee81bf8026688def82f78ad9db09be9e.camel@surriel.com>
 <CACePvbVA+DnDJprMx3qOrGb98y1ORQ-LfaENy_Btfx3uW=E4eQ@mail.gmail.com>
 <f3ca71f1c561f28a341de0e5a1b3f24bd4da3201.camel@surriel.com>
 <CACePvbX5Oy98DygLZjC=Z03Lqb0nk50_OEKQCT9svbQOOwwDew@mail.gmail.com>
 <CAKEwX=Mv+tnL8K4rfPuof6mKaLQp=tqR_qjtKrtY0-5L85FLfw@mail.gmail.com>
 <CACePvbUF2QQMh_GiCNQn-RTmZNkkLWkmaHSYzdQwv2fupjNQiw@mail.gmail.com>
 <arUcil9kxUPiymXI@KASONG-MC4>
 <araWKyJ5MENBwXCL@cmpxchg.org>
 <arbHLt-iB4RHXyWt@KASONG-MC4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arbHLt-iB4RHXyWt@KASONG-MC4>

On Sat, Sep 26, 2026 at 03:21:30AM +0800, Kairui Song wrote:
> On Fri, Sep 25, 2026 at 11:41:31AM +0800, Johannes Weiner wrote:
> > 
> > Thanks for your thoughtful email, Kairui.
> 
> Hello Johannes,
> 
> > > I also want to separate two things that I think got bundled together
> > > here: not requiring a physical slot behind a compressed entry, and not
> > > charging the raw size to the swap counter. The first one is great, yeah,
> > > and it's exactly the part we want, it's what makes compression usable
> > > without provisioning disk. The second one is a policy change, maybe it's
> > > not needed for the first stage, charging a cgroup for the
> > > memories it has offloaded doesn't require any slot to exist behind them.
> > > If someone wants to run memory compression with no disk at all,
> > > memory.swap.max defaults to max, so that still works fine, right?
> > 
> > I think what we found out over the course of this discussion is that
> > people have been using memory.swap.max in two ways. Regardless of what
> > we do, we will "break" one side.
> > 
> > (1) The usecase you're describing. Use memory.swap.max, combined with
> > memory.max, to set a "total", predictable footprint of in-use
> > application address space. You can mmap whatever you want, but the
> > number of unique pages you can touch is limited to this sum. And you
> > can control residency vs non-residency through the invididual values
> > of those settings. If compressed entries are not included, this
> > usecase will break.
> 
> Right, thanks for the reply! residency vs non-residency is one of
> the issues here. It's also about how we consider these two kind of
> resources to balance the scheduling of containers.

Ack.

> > (2) The use case we have. Use memory.swap.max to divide a finite space
> > in storage. We only have so much space on disk, and we need to manage
> > fair access. Note that this isn't about speed. We have a mix of
> > containers where some use writeback and others do not. The ones who
> 
> Same for us, the usage is mixed.
> 
> > write back to the swapfile need to be able to get their fair share -
> > not more, not less. Including something that doesn't actually consume
> 
> Is that writeback compression rate based? I mean for zswap, you have to
> writeback uncompressable part, and then also do cold writeback through
> shrinker. The compressable part is hard to predict and control though?

It is compression rate based. And yes, the exact composition of what's
in zswap and what gets written back isn't very predictable.

We don't really care at the cgroup level, though. The goal at that
layer is isolation: a container gets a slice of memory and disk swap,
and the most important thing is that it stays within those confines
and doesn't become a noisy neighbor to the others.

We do care about workload health, too, but that sits one layer above
it. For example, we monitor memory pressure. If a workload expands
hard into (z)swap and starts thrashing, we kill it. But if it just has
a very large set of cold data that gets pushed into (z)swap without
any thrashing, we don't really care. Let it run. Maximizing
utilization in this case is more important than predictable capacity.

There is one exception, but it's narrow: when we run out of disk swap,
things can become very unstable. Especially when the workload is
mostly anon, and there is only a small share of file cache to absorb
pressure. So we kill when N% of disk swap is used.

But that's only for the cliff. If zswap didn't use disk slots, there
wouldn't be such a cliff. As long as you're within memory.max, put all
you want into zswap. We only kill if you start thrashing.

Neither of these need additional kernel interfaces. Just psi and swap
usage metrics that get polled every few seconds.

I think you could easily extend this mechanism to "predictable
capacity" by monitoring anon + shmem + a "vswap" counter and issue
kills when they go above some threshold you consider unreasonable.

It doesn't sound to me that you actually need synchronous,
cgroup-style enforcement for this? If a workload goes over, you kill
it within a few seconds.
