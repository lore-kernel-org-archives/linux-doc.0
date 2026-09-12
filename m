Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3780E47A0C7
	for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 11:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789213919; cv=none; b=IsnbYg/WRji+yarmlkgE2Zfr+yG9uDUZf7bK3T26zzhvFzVOBubCzLdH3UzgHQBd/KOu64UE45YkWsP/1bD2lJt1MeUok/09dBn15cEnpBIRBhJODfb0h2ekLRE4erdua6fIvsEj+5NEjMxjxH8jCF69fWQHm+nhYHuEnwcRZBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789213919; c=relaxed/simple;
	bh=bMr4wFVrCL5Uq8NJ+XMirZznWyUkydJB1wO+gPO26N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hy6LfLwYr10gYJDPcHUBIUmgCXeWoe7Bdmlo3Xz+hWJaJx6ArKNo2lE/R+IdjEBOXtnQJ13cbgVSS6A4rovegV0slLEUN7jazg6nwiJ+W4qeLIlg+j+RSPsMQc5RbVkK7m1RXqltJGRsNuOu+2b33YuS51TXgRapOj0NNygm1RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=Gj0HBzqD; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="Gj0HBzqD"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9399daa3d43so158209685a.2
        for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 04:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1789213915; x=1789818715; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcAx2yrZ5W43UEp0p7bdF0l1dDSK9D0U9mKNzi+eSEk=;
        b=Gj0HBzqDjNHCbLUcfpEvKmBRLm2yYR37MjPBOqH0LsvasIzBsxpnaCBkVckPkhqKJl
         gCEMi9zNegxqI8a4zS64OsivGN/FRdn9c6J/rdqu2CiBxanfS0FSPfp1jPHLCAuefL0n
         KeISDJqLavs7m1v7H9xJjYinxn3gMRzm8rgVLeT7OMlhHFQxuaf895bawTkNeUEe31Je
         V6fnTcYo4iQvRx/XlLP7if6DFan+FuXtHCmjlgyKWhCF5UXXG4oJUrG8RIBmUubzf7Hy
         YYMIMU8SfLJoSPm9pFwi7S58b5osSunPL+cXVnAnnufx8dWL2cuytR7ufWllKIJxod/0
         wNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789213915; x=1789818715;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bcAx2yrZ5W43UEp0p7bdF0l1dDSK9D0U9mKNzi+eSEk=;
        b=fsvlx5jYHPPVwOenqUXQLtsJ/MrIlS0UG4X2sJ0Ch7m0h3ly+KT+I9H+oP+NfthyH+
         TxfZ0uQNGrnJ7YnM8nXJhwYOL8LX4cTnTGinUiluz6nOfb4vOOER2FXwNItr84WvtOa8
         9WlluBwDWQvX3kCQxQyfuwX4cZiUUIvsfSmgawe4LHiey08HOLKgkW6XsnphdgzUr9J1
         1yS7JW9KfHf5sYt/4SExpZbAmOCt1H8pd+Ms9KC4VZf1oOtc2dWhqAVDwQkO3epXToWi
         xdWC2dc5MSnSmPdOpmcmXuJtP5MZw9GnP8dDGCaENGLARnvo22JG713f03ebwWE5Wk6L
         JoTA==
X-Forwarded-Encrypted: i=1; AKwUvBwZmoR3Yw8252Mlp8TS3L35Ew9Q9Pm4d6x+HcnaCbMNmg4x3KeW9mMHcDc2m/hK+IzKtE7MjQ0/z6I=@vger.kernel.org
X-Gm-Message-State: AFuF++kWE4n3mxYFx+h5UmfDP6WocgySBP35FY/HAa+2w8B4azHBg93b
	5XCxxYdS2silMSU8cjzSj+FW1MGV17Y4bzYD+CK6hdNsrI0azZ8PuVFwDbospePnIiI=
X-Gm-Gg: AYBFou18iq8TozTFMpls2dbGpoHXtAeptl+f7O7J1DJaMm288Ec+EKpyOcomILBbsWE
	uPjNH8uHsxnlwYzARqM6m7sgaqgpUILrplAD061ef8/4dtCa7xKTyXWXLyKAsGlniqrgdA5a6Jg
	BPBAWQC0dr9Ww2Hh4GQDnXI1tUM+r7GB2Kq0BOd0RmahDQpcMdPqsCzTaxSQkWpatzPjEvhAzuh
	rw/aRiKFELYSMiBGwnQ1cFite/zP1LxhuUNaQdCtjiTPnURpq5MSEJALRXVm/MSKNq0xD8Kcky6
	fmd0H5jickJzbJ4+IM5YAO964rOjSHZuTW6OB3KkC5u1J1mz7iJmX/yCVpa3ljFITonZBFzsOoU
	sr8qrjhddgCphzI9YDxX3dmPb6KlD7kitOGXYGJ16lN8Z4cSCzIvQjhrMHNMC/UBLhBmG291dRR
	nSpuHm8zdPbrBVp/4yPCBBjQIaz2e+GOldS8w549DSd7M/EmCkwWQYb2nAwsXlnSDZOzzI6g==
X-Received: by 2002:a05:620a:700f:b0:936:e702:51a9 with SMTP id af79cd13be357-939ea275a08mr1168041885a.36.1789213914937;
        Sat, 12 Sep 2026 04:51:54 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f18628sm481437485a.13.2026.09.12.04.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 04:51:54 -0700 (PDT)
Date: Sat, 12 Sep 2026 07:51:50 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>, Chris Li <chrisl@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
	YoungJun Park <youngjun.park@lge.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Rik van Riel <riel@surriel.com>, Gregory Price <gourry@gourry.net>,
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
Message-ID: <aqU81l1oqGItb-0C@cmpxchg.org>
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
 <aqBT_35E-eSoN_zj@cmpxchg.org>
 <CAKEwX=N4aaq_oD2agTUNrUNXhaYGeQ9vxu+dywFvEFgWFi4uQg@mail.gmail.com>
 <CAMgjq7AfNBUpMamcv29JFzpX=7ApNYVLtPjWT4Sm8cXjSLYL9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMgjq7AfNBUpMamcv29JFzpX=7ApNYVLtPjWT4Sm8cXjSLYL9g@mail.gmail.com>

On Sat, Sep 12, 2026 at 05:00:42PM +0800, Kairui Song wrote:
> On Thu, Sep 10, 2026 at 12:42 AM Nhat Pham <nphamcs@gmail.com> wrote:
> >
> > On Tue, Sep 8, 2026 at 11:30 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> > >
> > > On Mon, Sep 07, 2026 at 01:51:31PM +0800, Kairui Song wrote:
> > > > Where I've ended up is that unbounded growth is a real concern. On a
> > > > host with no memcg limit (root cgroup, and most desktop and embedded
> > > > setups), an unlimited pool means usage can keep growing, with no
> > > > admin visible ceiling at all. I'm not attached to xswap's percent of RAM
> > > > knob specifically, but I do think some kind of bound makes sense.
> > >
> > > Swap space is just process virtual address space, no?
> > >
> > > Swap entries already have one or more page table entries pointing to
> > > them, which in turn are managed by trees of vm_area_structs. That
> > > means rlimits apply, overcommit protection applies, and OOM killer
> > > attribution works as well (oom_badness()).
> >
> > I tested this theory. I spinned up a process, and let it spam 0-filled
> > memory + swap these pages out continually.
> >
> > As you predicted, oom-killer picked it up eventually. The host was
> > (and is) intact otherwise :)
> 
> Good to know the kill path works. But I think the accounting side cuts the
> other way? Won't that conversely underestimate the host's ability to
> handle memory alloc? Not to mention a lot of application are
> swap  space aware, some built in logics like e.g. with vm_enough_memory:
> 
> On a 1G machine with vswap enabled:
> [    0.241906] vswap: created virtual swap device (2199023255040 pages)
> 
> a 2G sparse anonymous allocation fails:
> [   46.044002] __vm_enough_memory: pid: 1129, comm: search_agent,
> bytes: 2147483648 not enough memory for the allocation.
> 
> The default "Heuristic overcommit handling" policy is meant to handle
> seriously wild allocation (as documented, and it's named as
> OVERCOMMIT_GUESS).
> totalram_pages() + total_swap_pages
> 
> Is the limit, the heuristic exists only to make "a seriously wild
> allocation fail" (as documented). But on a vswap-only machine,
> reasonable allocations fail. Common swap devices, zram, or xswap don't
> have this problem. One could argue that the size there is just an
> optimistic guess, the compression ratio is not controllable. But that
> heuristic is a guess by design, and a plausible number serves it fine.
> "Unlimited" seems break that.

That cuts both ways, though. If the configured compression space is
large and compression ratio is poor, it lets through allocations that
can be considered "seriously wild" for this machine.

It's a filter. I wouldn't say that letting things through is evidence
that it's working.

Since compression space is backed by memory, it still makes sense to
me to reference this heuristic to RAM. Cut it off at 2xRAM or 3xRAM
tops if compression space is available.

That all being said, I've laid out implications and concerns around
limiting compression space in this thread, too. Collecting pros and
cons is fine, but if you bring up cons for the unlimited case, it's
fair to ask that you engage with cons brought up on the limited case,
too, so that we can weigh the tradeoffs.
