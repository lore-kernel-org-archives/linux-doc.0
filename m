Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BFC1990D6
	for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 13:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721135974; cv=none; b=lts0jfm/ziw8xGd/aLMCSEtW6s2Lhu9hD77FviiKU0AUtblwlk4MADEFeNlx38TmxMsLU7GhkLWnxG2EXd98XR2psOFxr+9Q+DE/UHZEno+ZDoHZxNHQJgQCvCmq6xLSmGnSx6h8q4ACozxpAACYT/enpPcGEwiNuxKz3aOidK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721135974; c=relaxed/simple;
	bh=WTugn9Q1KNgE9p5PV4NC3ozQPXXa0gX5GdqP2g+iyWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4p5ZtjY58JlsPg1aq79BB9YEkge+yw5ux7tQ88HesyyTh3U4P9wemrsAKTRLAwtYI6JVEGPVJVnos0fNFMUVlQ1/qBUoEIQxfOiH7WcLarXI3xw8yxuPhFZJpgLlIc/7GTkhtC8PcTwZSTiTvT7rn0FnneYnn4cjj3/00+6dCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aawiP+2H; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aawiP+2H"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52e9944764fso6369543e87.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 06:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721135969; x=1721740769; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TAlKCocTKV2Z8OTI/zDyKU1Nj0a/ekaC0DzlUNA8/NA=;
        b=aawiP+2HZlJsT+7i8ESkmGcUfAL4E3Lt9J5tBa5JEHZyQFryNu9lS0GC7br9t2VNoC
         xvrjVNwGGXY/GApM6cVrLAIG0WgLGOUV37RTPbB/ApcOqA/VoduVdIlHkkbcZMHcF18+
         4xKThyiuGnnIMsMPmqVu5OFr7ixp4ZWdsgmUaVtul5zS8Q4MFOJwmy6qyWqDLHrRfFDk
         TaeBbQOhatHYniRwvE8NLvzZxmGrigikUTP1upfpmNKheWKLYWESpP/8tkryMKR7PE0w
         dLOeaItwjPY1hB/f1S2bvnukLWavLOwMjD+Z20AlN/akIDfqWprgETE/bP091S2mVqO0
         0xSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721135969; x=1721740769;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TAlKCocTKV2Z8OTI/zDyKU1Nj0a/ekaC0DzlUNA8/NA=;
        b=PN2pQGb2wLCU0Z+d9OVMtj/dZNAd1CqpgZKtPbaCfSYn7rdzT+hNTqHVbD8SWIL2wn
         exTdnD0uCPPkMJBCGo5UKph9f73ce7KAOfAXKQyQUqp6U8PxcLWZooTKYgM5KcDOyxN1
         sQkAVw/mb6+SGFWnOGjmAjD4W54P0t4aukfXcCAPuuQLGFvrKwRU0Ewv4nCIeW7Mouhk
         GCS4n051uP//ldavy1xCw2IDA9IodIkkdX4bbO6TkihalTmNgkTd+pKkc9Rv9f4w42G7
         c+OjYzXt0v+VZYH9kvBTgWii4vdnSTXNuL15VvSKvgOQXS8zRoTR/h9fHNhezx/rD3uS
         jKHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+gNe80ddrjKNN1yAPzM9uf7HSiLj0j7FEQzd07zoyLURgHa0e4TCdhd5zBOTgpj2DZ/XyQ6yJi1N9OU6aAuEull/5WpRbkkeS
X-Gm-Message-State: AOJu0YxBYmo2fiSgKFjxoIvCPr2fBRKsscKd3T+vEop8CnlP5/WJhWFz
	r8esyqBWOSQ1bs0n9/YdI/pGaE1QKgeWrZtwDTLF7wxM5IfUZJbrCh2A6+JbCFY=
X-Google-Smtp-Source: AGHT+IGZhu210XhKfrl+D1o9RMwwEuk7GJineTGDspE4fOHXEfuk0VNWxNHYri5ev4eeWcldkYD7VQ==
X-Received: by 2002:a05:6512:23aa:b0:52d:b1e4:b337 with SMTP id 2adb3069b0e04-52edef1e04bmr1616823e87.21.1721135969582;
        Tue, 16 Jul 2024 06:19:29 -0700 (PDT)
Received: from localhost (109-81-86-75.rct.o2.cz. [109.81.86.75])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b255275ccsm4956445a12.49.2024.07.16.06.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 06:19:29 -0700 (PDT)
Date: Tue, 16 Jul 2024 15:19:28 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Finkel <davidf@vimeo.com>
Cc: Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, core-services@vimeo.com,
	Jonathan Corbet <corbet@lwn.net>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shuah Khan <shuah@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH] mm, memcg: cg2 memory{.swap,}.peak write handlers
Message-ID: <ZpZzYM6kdQmq7TPI@tiehlicka>
References: <20240715203625.1462309-1-davidf@vimeo.com>
 <20240715203625.1462309-2-davidf@vimeo.com>
 <CAFUnj5Oh_OsP4TikWTGT6cKKTnWLaBYpE5PGzcxLTp7b=UqLkQ@mail.gmail.com>
 <CAFUnj5MahNvM+B2zynVtcnYKJ7LZHwBNEcPKGAdz-tesDeOXcw@mail.gmail.com>
 <ZpYfKI6W1uSMkt5i@tiehlicka>
 <CAFUnj5Mb82Yjih4-xZMS2Ge+1Oj+zm-ZVaoTak_SisZnv6G-0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFUnj5Mb82Yjih4-xZMS2Ge+1Oj+zm-ZVaoTak_SisZnv6G-0w@mail.gmail.com>

On Tue 16-07-24 08:47:59, David Finkel wrote:
> On Tue, Jul 16, 2024 at 3:20 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Mon 15-07-24 16:46:36, David Finkel wrote:
> > > > On Mon, Jul 15, 2024 at 4:38 PM David Finkel <davidf@vimeo.com> wrote:
> > > > >
> > > > > Other mechanisms for querying the peak memory usage of either a process
> > > > > or v1 memory cgroup allow for resetting the high watermark. Restore
> > > > > parity with those mechanisms.
> > > > >
> > > > > For example:
> > > > >  - Any write to memory.max_usage_in_bytes in a cgroup v1 mount resets
> > > > >    the high watermark.
> > > > >  - writing "5" to the clear_refs pseudo-file in a processes's proc
> > > > >    directory resets the peak RSS.
> > > > >
> > > > > This change copies the cgroup v1 behavior so any write to the
> > > > > memory.peak and memory.swap.peak pseudo-files reset the high watermark
> > > > > to the current usage.
> > > > >
> > > > > This behavior is particularly useful for work scheduling systems that
> > > > > need to track memory usage of worker processes/cgroups per-work-item.
> > > > > Since memory can't be squeezed like CPU can (the OOM-killer has
> > > > > opinions),
> >
> > I do not understand the OOM-killer reference here. Why does it matter?
> > Could you explain please?
> 
> Sure, we're attempting to bin-packing work based on past items of the same type.
> With CPU, we can provision for the mean CPU-time per-wall-time to get
> a lose "cores"
> concept that we use for binpacking. With CPU, if we end up with a bit
> of contention,
> everything just gets a bit slower while the schedule arbitrates among cgroups.
> 
> However, with memory, you only have so much physical memory for the outer memcg.
> If we pack things too tightly on memory, the OOM-killer is going to kill
> something to free up memory. In some cases that's fine, but provisioning for the
> peak memory for that "type" of work-item mostly avoids this issue.

It is still not clear to me how the memory reclaim falls into that. Are
your workloads mostly unreclaimable (e.g. anon mostly consumers without
any swap)? Why I am asking? Well, if the workload's memory is
reclaimable then the peak memory consumption is largely misleading
because an unknown portion of that memory consumption is hidden by the
reclaimed portion of it. This is not really specific to the write
handlers to reset the value though so I do not want to digress this
patch too much. I do not have objections to the patch itself. Clarifying
the usecase with your followup here would be nice.

Thanks for the clarification!
-- 
Michal Hocko
SUSE Labs
