Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD021F4606
	for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095807; cv=none; b=ILTEGskiHxrfmeZZyzNKJZLaCX0R9WikxaeZOQoXvU2vTZwVXKPyT7diXQPYW8/AZe3t0uph56FeeMtSEBmUh7DmVkUxD6Z5NzdXNPGoq93QaaMdh7Vm3ggkok4VDBCDmDTpb0//Bpt9W/t/IEDjNv8XtXGoPsekCnjgnza+OYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095807; c=relaxed/simple;
	bh=4gWRKYjPld+Y1uH823VRVyouLBLTGOzXlpdHtiU3vMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJKAPuEscXSNVFzMNXSduh/GUmT+PRZNK4munZ3F8HDDl3RYicUoIvwEGITemUVrUPN7b3V3quZZW9KrKcMiJZu+ymq24G7XTzRRZlTaDSk4RTotCfLuGHAqoOt5JgbphKg7oJGgUyM0pHb2P5hrI/+M2jr50eyh6Cwb7LKH+ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=qtN0Fnqz; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="qtN0Fnqz"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d3da67de87so77329585a.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 10:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750095804; x=1750700604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5/4yKvTkyWVd/1WyBWdEpHbqHXZjmiKnTF2OwJ8AWbI=;
        b=qtN0FnqztxqhC0GPXZamrnxaKrAQsZsiPXNW7I6FF0jhXmxbNgIShbCA/0S28U/gLn
         jlQM1ygmlnE78/29xY6mxZUvYyujXYKDbF3/4jQm2/LYIG5ya9S4Anc5+DfwY89WfiFQ
         yzjVXxguXu5/Ic7gQ3/kHFDl5ul+5ZClQsX5aiEFN4lEaXXuEYcptxyu2ADeC1mRnxJE
         2akvDxKuWCtfqaPWGt1pphWaP/XdLEcO8bIeSRYLtcP2fByoJSqo80fNJxH0wmDysT4v
         0CKVutcSRcqQJPIgIeYTTfUxkom0zfCUjKQUYHzaGPsR3mK0UCH/TvRHWGwNoX5DI/TH
         m0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750095804; x=1750700604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/4yKvTkyWVd/1WyBWdEpHbqHXZjmiKnTF2OwJ8AWbI=;
        b=cl0tvi3fHMyvPCzQa46Ilv6fwY7823OUH65UQWea96av6nQV+DWZfxg0BFtlzRHaA9
         xiGD/4dSJ1SMpE4dVkBhjrJY6IsUrKgjIJtxbCr68qYW2tYNCfSJL7O2rvAZAPOyl+Q1
         O0NMKh5PkMSSVjd9iOFxto6c6ZVu2lBhuXAcVFxW3mo4XWbUxFS/PMB+Cd7XT2OpUFC7
         J6qazBXuVMVXAcXmthwGOaugtHMA8fFUekQBFsRR03lYzJWg3fx8wEumQk6Q5YstFPrq
         gJ1oZuumMPYOXwqCZVEcfkqcSeFBi7QTVKWOyFp55owKk4JJYER60v/DmkVbmHzojzH4
         QHtA==
X-Forwarded-Encrypted: i=1; AJvYcCViQ0lEhgcj6ekXJ9hNYHKt3597Qx5UXlA8xOEJYWPp/1GQno6xIp3zBqy3OA9e1CYyemPiMNcpZNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZM341g0FlJA4az397PmSSjJBlUIrXSf6OzvlN8RIB9YM3pES6
	eyQjHovPBXFSvN6B7KCHwe4bFgNDEH4RHyB8tkXxow16bvFXZ0U3Hu8l1+amqwRRPmg=
X-Gm-Gg: ASbGncvVputNFm2nm44fWyqGuZO1r6C7G9tc4hC5UiC1zqLReXMcAC2hOBSwUWo7AVE
	fgPT+KraacwxAV18R7ctamkiEoxoh7BRc54wNOSMUo+ViW6mlhrTt7vMKuY0IHn7mDjp7euWjFJ
	ip7MUkO/mRlIjMwOVIFn8hL3udaKFAtg8Ovn/Q3jndxn3yWMoeOIw1RnzK6mS+/Ehj/W3gnDcE0
	NC14O55SQQ4HUcYDhrt5c5dlIDAnG3Uw6vkGJX1zyuER0PL/vJfg33zj8MxLqpIw1oZeQn4BIN+
	CoVsYTlXtrEVZkO7BmP4BKuy/27r7VInd0ye7rtwCSzf+ey6yqGqv9Tl+A==
X-Google-Smtp-Source: AGHT+IHUYY/n0yispU7eDUw6kgUep9wTEjSSBo8Jf7TL4kZ2IW3kTqXn60pb1DKcSyyGtFKJ/3beCA==
X-Received: by 2002:a05:620a:3728:b0:7d3:8c44:b7b1 with SMTP id af79cd13be357-7d3c6c0962emr1601991885a.3.1750095804599;
        Mon, 16 Jun 2025 10:43:24 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:cf64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a0fcd34sm51514371cf.0.2025.06.16.10.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 10:43:23 -0700 (PDT)
Date: Mon, 16 Jun 2025 12:43:21 -0500
From: Gregory Price <gourry@gourry.net>
To: Bijan Tabatabai <bijan311@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	sj@kernel.org, akpm@linux-foundation.org, corbet@lwn.net,
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com,
	apopple@nvidia.com, bijantabatab@micron.com,
	venkataravis@micron.com, emirakhur@micron.com, ajayjoshi@micron.com,
	vtavarespetr@micron.com, damon@lists.linux.dev
Subject: Re: [RFC PATCH 1/4] mm/mempolicy: Expose policy_nodemask() in
 include/linux/mempolicy.h
Message-ID: <aFBXuTtwhAV7BHeY@gourry-fedora-PF4VCD3F>
References: <20250612181330.31236-1-bijan311@gmail.com>
 <20250612181330.31236-2-bijan311@gmail.com>
 <5a50eeba-b26d-4913-8016-45278608a1ee@redhat.com>
 <CAMvvPS5U8exSvy0fknfhv8ym_dKgMVa7cfMOqn0fGyd+NSjSuQ@mail.gmail.com>
 <e40aa590-f0a2-4666-84b0-c33c8f4fef87@redhat.com>
 <CAMvvPS5bTUfAXy4g79tAq+1DWKX79b33Jt=UNBg-xR9BDa7FdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMvvPS5bTUfAXy4g79tAq+1DWKX79b33Jt=UNBg-xR9BDa7FdA@mail.gmail.com>

On Mon, Jun 16, 2025 at 09:16:55AM -0500, Bijan Tabatabai wrote:
> >
> > Which, you also have during the rmap walk.
> 
> There is another subtle dependency in get_vma_policy.
> It first checks if a VMA policy exists, and if it doesn't, it uses the
> task policy of the current task, which doesn't make sense when called
> by a kdamond thread.
> 
> However, I don't think this will change what seems to be our consensus
> of adding a new helper function.
> 

Hate to interject here, but this gets worse the further you dig in.  The
mempolicy interface as a whole has many, many, many hidden references to
current->mempolicy and current->mems_allowed.  External interface
references to a task or vma mempolicy is a problem i explored somewhat
extensively when I prototyped `set_mempolicy2()`. It did not go well.

Generally, mempolicy is not well structured to allow external actors on
a task's mempolicy.  Accessing a task's mempolicy requires operating in
a task's context or at least taking a reference on that task's mempolicy
(which requires taking the task_struct lock).

I will just say that mempolicy is *extremely* current-task centric - and
very much allocation-time centric (i.e. the internal workings don't
really want to consider migration all that much).  You'll probably find
that this project requires rethinking mempolicy's external interfaces in
general (which is sorely needed anyway).

I think this path to modifying mempolicy to support DAMON is a bit
ambitious for where mempolicy is at the moment. You may be better off
duplicating the interleave-weight logic and making some helper functions
to get the weight data, and then coming back around to generalize it
later.

~Gregory
