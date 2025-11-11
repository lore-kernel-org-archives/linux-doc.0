Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9482BE051
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848643; cv=none; b=s6N9PhweYJWgffcyW59163VFIq5zlnw9SIcfPyVbhWJor4SKz3plUxtrBcFOqRmFFVuopg4/u9qNMDoKfKS6kvXEhXMucoIkE/9I06g9xQtO1Jsg1jNq6K8xSAJV/W2beHy3Kt1DEO4ACwF49v24rCrPIKgVmNFUcLQF/ccDVyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848643; c=relaxed/simple;
	bh=l6nRJ7tdRGvxA4c5h4KBMAhCvuaIH/Goxb69gB+0GP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1cDvelXO49MZWIzpYhED8h+SdJD+LRuyCG8aoe2L7RlQVwZuoqVkgELyMUdWSGC543mC1Pbtdx8Zauvz1kdJUUTtsAayktpTkBeEPQMxDgfxeLLITRyB8kY38jh3Z8EHGgSRb8IC/7gcf9CUDZm4X/PM4RNa6baFXmXlr8YEDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TlgJz8pw; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TlgJz8pw"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7277324204so688202866b.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 00:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762848640; x=1763453440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQbue78pKwkHXp+W4v6uPbf6iMxcJPuiWhAhoJWq+ek=;
        b=TlgJz8pw921GFXv+BAHpqmxytw9WivNw3nHQNI+q+p2xvs6o/Jzc6woYDg95mMxvhm
         F1lBRg8PceWaaEqCW0UHnxmsk7Ex9Z9zPoFxb5hS0dBtNI2U7xWS3QIOUdo5Kdi9VF5L
         Yep3aPijohcNipi37iHEjlJJmmS1dNWuKgTdjdu8RO1ZTmdo/REk0zcT4BN9VjLOUlEg
         QFHFUO4LE5KiX48lHSTjsK+mA3bWahtg89m30bPbLtPVo7Cm/t1gdkYOPo4FYTtdR8Gs
         hh65vPPkcHFYyNhaQpzJCdea7Zo3A2CH32nqZQz/PrrQ64u9jli/A9mkzcEPonAbaeAH
         2xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762848640; x=1763453440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQbue78pKwkHXp+W4v6uPbf6iMxcJPuiWhAhoJWq+ek=;
        b=hZZAnkKED5B4j8wSneDLCXnS8m02tqP8mC1x7lhHZtc4q44KMDy8xTU0wn+xEK5+41
         fnMgAatPzik7czYD+SWBOLnQMVkcsmZZNgsUsx/wg3VFmUWtlkZqta1YuE9q6Mgxf4fJ
         mlrmhmOVOsoF0rO99s+jCIZtHDgeNZ1WR9RF4ldltdUtEUM4LxYBKsfS5Mxif0Dof0ul
         mESUebhVPWOMZYmMX7VHaNtNcM9BVWSpzBM+WkoQfVf8oQ5vEF6I9fFrLxYC6B60M/Lu
         /W6Y/ELLMIWlv786AH6/L6ofdhJHEFxk6P/SXx/4YwWwXAfDO3rhC8Lx0cPvZY+QPD5c
         752g==
X-Forwarded-Encrypted: i=1; AJvYcCXJWJBd2C/pkrgjJh4I+Wq+posN7i4PSs8HsZubZfcEClreclIG0r4CTt7rSo/aqIkc+h365VCqNy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIIntu3aNsSE4dwRj6Svh03VaunFehrhsc/Td2fTBMxdmy1VIR
	LQbzEcu/uIw70948PFfy0dsHPyINhgB7bmcL+KAv5OHtrk3Vl6PZiT5X0LokU6DjclI=
X-Gm-Gg: ASbGncufnCPZd6T3GVqxIAuBobZ9N9494ll3tJJD1/Un+/wNuEhyunYPt59sZCKGjNi
	tWQZwW0Xg1mTf5jE0dJXGL1UapX8n6H9bK7Qz8NgjsSFkgM+JE3Dmesu0YmmVFPJ/TS18lVZl/y
	JgwyB34GwIlEap/dg0G0pyOkZqFq/n9qLFLKfF+xbF7jN4SsKy3pi93fh+TC4MewXDBji7iO7jf
	WKXTYhEoXBJ6KLMs1/aHjuOIjZnsr11ma1GtYYlP05rVKxQ8O4BdL1NzDTbiOt77ltge+Tfn1nc
	ldCf/x0jG5TppWeTZLfQuECZQ05/jJcjIB7OS3dWxiApdxU5XlsAOw0nhuuHV6hj0mtT+xwHzu3
	cProBV+FlpSJ76rb6cfnitdXCyBEKJzTnKbzYktyG8fchsgupXjDszK62jIqKcgHD8r/9EOQ55t
	9xliDmcQzBlKlgJSp/dEUG8Msx
X-Google-Smtp-Source: AGHT+IEZYvAe437RcYeslkObkmRF/TXOLhs0HzqzcY6BdpIa2QVGfreM/sajryoPs6lMwNHAyeu0Pg==
X-Received: by 2002:a17:907:3d44:b0:b6d:8da0:9a35 with SMTP id a640c23a62f3a-b72e028d598mr1171710366b.13.1762848639974;
        Tue, 11 Nov 2025 00:10:39 -0800 (PST)
Received: from localhost (109-81-31-109.rct.o2.cz. [109.81.31.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf40768fsm1292308366b.23.2025.11.11.00.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 00:10:39 -0800 (PST)
Date: Tue, 11 Nov 2025 09:10:38 +0100
From: Michal Hocko <mhocko@suse.com>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: Leon Huang Fu <leon.huangfu@shopee.com>, linux-mm@kvack.org,
	tj@kernel.org, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev,
	akpm@linux-foundation.org, joel.granados@kernel.org, jack@suse.cz,
	laoar.shao@gmail.com, mclapinski@google.com, kyle.meyer@hpe.com,
	corbet@lwn.net, lance.yang@linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [PATCH mm-new v3] mm/memcontrol: Add memory.stat_refresh for
 on-demand stats flushing
Message-ID: <aRLvfoMKcVEZGSym@tiehlicka>
References: <20251110101948.19277-1-leon.huangfu@shopee.com>
 <ewcsz3553cd6ooslgzwbubnbaxwmpd23d2k7pw5s4ckfvbb7sp@dffffjvohz5b>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ewcsz3553cd6ooslgzwbubnbaxwmpd23d2k7pw5s4ckfvbb7sp@dffffjvohz5b>

On Mon 10-11-25 14:50:11, Michal Koutny wrote:
> Hello Leon.
> 
> On Mon, Nov 10, 2025 at 06:19:48PM +0800, Leon Huang Fu <leon.huangfu@shopee.com> wrote:
> > Memory cgroup statistics are updated asynchronously with periodic
> > flushing to reduce overhead. The current implementation uses a flush
> > threshold calculated as MEMCG_CHARGE_BATCH * num_online_cpus() for
> > determining when to aggregate per-CPU memory cgroup statistics. On
> > systems with high core counts, this threshold can become very large
> > (e.g., 64 * 256 = 16,384 on a 256-core system), leading to stale
> > statistics when userspace reads memory.stat files.
> > 
> > This is particularly problematic for monitoring and management tools
> > that rely on reasonably fresh statistics, as they may observe data
> > that is thousands of updates out of date.
> > 
> > Introduce a new write-only file, memory.stat_refresh, that allows
> > userspace to explicitly trigger an immediate flush of memory statistics.
> 
> I think it's worth thinking twice when introducing a new file like
> this...
> 
> > Writing any value to this file forces a synchronous flush via
> > __mem_cgroup_flush_stats(memcg, true) for the cgroup and all its
> > descendants, ensuring that subsequent reads of memory.stat and
> > memory.numa_stat reflect current data.
> > 
> > This approach follows the pattern established by /proc/sys/vm/stat_refresh
> > and memory.peak, where the written value is ignored, keeping the
> > interface simple and consistent with existing kernel APIs.
> > 
> > Usage example:
> >   echo 1 > /sys/fs/cgroup/mygroup/memory.stat_refresh
> >   cat /sys/fs/cgroup/mygroup/memory.stat
> > 
> > The feature is available in both cgroup v1 and v2 for consistency.
> 
> First, I find the motivation by the testcase (not real world) weak when
> considering such an API change (e.g. real world would be confined to
> fewer CPUs or there'd be other "traffic" causing flushes making this a
> non-issue, we don't know here).

I do agree that the current justification is rather weak.

> Second, this is open to everyone (non-root) who mkdir's their cgroups.
> Then why not make it the default memory.stat behavior? (Tongue-in-cheek,
> but [*].)
> 
> With this change, we admit the implementation (async flushing) and leak
> it to the users which is hard to take back. Why should we continue doing
> any implicit in-kernel flushing afterwards?

In theory you are correct but I think it is also good to recognize the
reality. Keeping accurate stats is _expensive_ and we are always
struggling to keep a balance between accurace and runtime overhead. Yet
there will always be those couple special cases that would like to have
precision we do not want to pay for in general case.

We have recognized that in /proc/vmstat casee already without much added
maintenance burden. This seem a very similar case. If there is a general
consensus that we want to outsource all those special cases into BPF
then fine (I guess) but I believe BPF approach is figting a completely
different problem (data formating overhead rather than accuracy).

All that being said I do agree that we should have a more real usecase
than LTP test to justify a new interface. I am personally not convinced
about BPF-only way to address this fundamental precision-vs-overhead
battle.
-- 
Michal Hocko
SUSE Labs
