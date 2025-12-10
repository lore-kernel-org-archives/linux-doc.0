Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5654323416
	for <linux-doc@vger.kernel.org>; Wed, 10 Dec 2025 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765369808; cv=none; b=sQaPSFCKsL8WVuEN5MFgzSyVMXfRO06sQwuKlRmieYDFIz2XQh4c9ZB5vGRXe6R2pwvq7smjdElWRCKA//9pL4fjQ4gEPicUma2uxNFU1H37cGl0eskA+PfFHNYTUOBjnS/BH9JDtppcyBy0WlU8V+cG0k5QFwfbJ16KQTS6I20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765369808; c=relaxed/simple;
	bh=+pCVoqhDWf5N9CNZ0HM07+tiwxasFYS9L533FXsKelc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=geLLMz9nTawBZrwO9uY5cdrEGyjYKJD9YmALQaTR5Fr8VugMLCpULlNv9IJhjy8YTLO2YWRc2UTEmffLO2+bXkH8MAiMA6heHi/7FiuKqqDhw02k1ErE0p722oD+coe7QxoGbckmkbT60oCq0l/w2Umaynb8JMH5m6d5BJrrrGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvDsThK+; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvDsThK+"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-640e065991dso5330467d50.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Dec 2025 04:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765369805; x=1765974605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bs4Nvh7wcafrSDigF6jb9/xBl2rvyHdC6iSByDm1J7c=;
        b=XvDsThK+FUC3Zk/TUAYtZKVcRtbs74rrA6Oyarvbx/2IJpXHcbbC2zaqJuxqKe4NrB
         BBAa3spmVx+3VekRkm1dHqe4VjC5odeaZy6Cwpj5ukTABKh1odXJK8NQ5LJVrd7lliWZ
         CcI2IrSantBKMUJKzc7D7NR/xTJ6IYa13PdqQQG9/G9LVtF3tYIeiaFJ3gxlcLBLpT+r
         3VzS3bPNx8Np/wY1IBB1JfYBFnHRNwGNY23fr/zPvGRpWC+aJI4azkHc4DT7KO1bFodg
         4PGIAWJaw3dNJlslXAPGJ4NlOAchdlebRS1GB2KQx0Jsx0yWWweBmv3G+3f8efmd7vZI
         OK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765369805; x=1765974605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bs4Nvh7wcafrSDigF6jb9/xBl2rvyHdC6iSByDm1J7c=;
        b=nOlpOGFhsLERw43L7XhazWafxC+jcT8jPmLNGaevL3xO0OKAEehsE7sKjnMkTdVbzA
         ocld7tQUJkSv/BGNKbtphAIrQ9V1atoBPD+f3YrUL/r4oFOhJ6LZflgqGeO3lFYT6Fw/
         L1bS08NDVZKM16g40FiLtTXGXfwhPFpV8knR3vtOi3XRVWGSbskv29HeVtn9MNGQ7BmU
         KXqLrJ6oqjtkw5Dyc/4fK2JB96wySgQQV2AYwb8g2FjyWutXdh147UIZH0HyGI2WRIUZ
         NggRZQ20j6iI/zBJeqk820UNxBQIo8Q5OMs3UxN1gfAcJ4rH/KKlTCRABuYr9X5PgItq
         ewlA==
X-Forwarded-Encrypted: i=1; AJvYcCWd8gEt+nEa/Ec6bpzpep1VIyS+x9+HHMyMZAsOyPuEdhAxYeFkEwDfbirVrB7qWmLe2wIf6JshriU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzd1D0NJZ0hV4V1UZK2v24gnTt4UgqlaXmfmee5F065+FisIN2
	ev2/cGZLJOAbc4jck+eqF5b/nb5oCGxB7vi2QhAFsnjwKxWDOt0U40QY
X-Gm-Gg: AY/fxX78iRdJkE/7xghk0FCedTQUger/vJVUlZDYP1aJCR3wuib4zrfxl2Ydv1wP9Xk
	6Rf2mTih3aFhaCowTT/fsziGBbbRIXAqRo81J+jiDkYOy+mAsqBrdJwo9kR5uwyzhXYYA8pBARq
	px5Bmc0FgfLtXQFGtWfGq++InR6LHI35Prlf9c5A9pZt+F7Y0avI2WbBdJwetR3+Y/YBphha6nQ
	6F5Ld14XPk3Qg05unsH5UKw60hYIBBo4HbLfukFVtf7fevDsaYj1j5feS8PXX9AJEG/1fzi2nJE
	D/Foft+04YYdyoiS2ELe0fRiJPJxNchh/tpFWBzrc5ykfTWv07njXPMhbg5XBh2DAguAzUhrNNY
	X8vNt0oxP6CsTZlb/f4z0NUSFhmv11ydF4+VpZXeBUBnhzlyCUx9v70e3PFbwwc5S/P4LIsrWe7
	XzhXsR166G68AmlyGY3TxwqAyTq0HAhsY4
X-Google-Smtp-Source: AGHT+IFNh53RYGhBm0spY9cGU4hrvZl3rVUUUljhOpXEUJgWRnGD1AENe9Wq19Qn4XXLgG15AaZkgw==
X-Received: by 2002:a05:690e:2597:b0:63f:c52c:3828 with SMTP id 956f58d0204a3-6446e98333amr1349152d50.26.1765369805247;
        Wed, 10 Dec 2025 04:30:05 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:5c::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4ac94dsm70695807b3.9.2025.12.10.04.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:30:04 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: mawupeng <mawupeng1@huawei.com>
Cc: joshua.hahnjy@gmail.com,
	willy@infradead.org,
	david@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kernel-team@meta.com
Subject: Re: [RFC LPC2025 PATCH 0/4] Deprecate zone_reclaim_mode
Date: Wed, 10 Dec 2025 04:30:01 -0800
Message-ID: <20251210123003.424248-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <fc00c53c-ab54-42a2-979b-0ecb49ff6b48@huawei.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 9 Dec 2025 20:43:01 +0800 mawupeng <mawupeng1@huawei.com> wrote:
> 
> On 2025/12/6 7:32, Joshua Hahn wrote:
> > Hello folks, 
> > This is a code RFC for my upcoming discussion at LPC 2025 in Tokyo [1].
> >
> > zone_reclaim_mode was introduced in 2005 to prevent the kernel from facing
> > the high remote access latency associated with NUMA systems. With it enabled,
> > when the kernel sees that the local node is full, it will stall allocations and
> > trigger direct reclaim locally, instead of making a remote allocation, even
> > when there may still be free memory. Thsi is the preferred way to consume memory
> > if remote memory access is more expensive than performing direct reclaim.
> > The choice is made on a system-wide basis, but can be toggled at runtime.
> > 
> > This series deprecates the zone_reclaim_mode sysctl in favor of other NUMA
> > aware mechanisms, such as NUMA balancing, memory.reclaim, membind, and
> > tiering / promotion / demotion. Let's break down what differences there are
> > in these mechanisms, based on workload characteristics.

[...snip...]

Hello mawupeng, thank you for your feedback on this RFC.

I was wondering if you were planning to attend LPC this year. If so, I'll be
discussing this idea at the MM microconference tomorrow (December 11th) and
would love to discuss this after the presentation with you in the hallway.
I want to make sure that I'm not missing any important nuances or use cases
for zone_reclaim_mode. After all, my only motivation for deprecating this is
to simplify the code allocation path and reduce maintenence burden, both of
which definitely does not outweigh valid usecases. On the other hand if we can
find out that we can deprecate zone_reclaim_mode, and also find some
alternatives that lead to better performance on your end, that sounds
like the ultimate win-win scenario for me : -)

> In real-world scenarios, we have observed on a dual-socket (2P) server with multiple
> NUMA nodes—each having relatively limited local memory capacity—that page cache
> negatively impacts overall performance. The zone_reclaim_node feature is used to
> alleviate performance issues.
> 
> The main reason is that page cache consumes free memory on the local node, causing
> processes without mbind restrictions to fall back to other nodes that still have free
> memory. Accessing remote memory comes with a significant latency penalty. In extreme
> testing, if a system is fully populated with page cache beforehand, Spark application
> performance can drop by 80%. However, with zone_reclaim enabled, the performance
> degradation is limited to only about 30%.

This sounds right to me. In fact, I have observed similar results in some
experiments that I ran myself, where on a 2-NUMA system with 125GB memory each,
I fill up one node with 100G of garbage filecache and try to run a 60G anon
workload in it. Here are the average access latency results:

- zone_reclaim_mode enabled: 56.34 ns/access
- zone_reclaim_mode disabled: 67.86 ns/access

However, I was able to achieve better results by disabling zone_reclaim_mode
and using membind instead:

- zone_reclaim_mode disabled + membind: 52.98 ns/access

Of course, these are on my specific system with my specific workload so the
numbers (and results) may be different on your end. You specifically mentioned
"processes without mbind restrictions". Is there a reason why these workloads
cannot be membound to a node?

On that note, I had another follow-up question. If remote latency really is a
big concern, I am wondering if you have seen remote allocations despite
enabling zone_reclaim_mode. From my understanding of the code, zone_reclaim_mode
is not a strict guarantee of memory locality. If direct reclaim fails and
we fail to reclaim enough, the allocation is serviced from a remote node anyways.

Maybe I did not make this clear in my RFC, but I definitely believe that there
are workloads out there that benefit from zone_reclaim_mode. However, I
also believe that membind is just a better alternative for all the scenarios
that I can think of, so it would really be helpful for my education to learn
about workloads that benefit from zone_reclaim_mode but cannot use membind.

> Furthermore, for typical HPC applications, memory pressure tends to be balanced
> across NUMA nodes. Yet page cache is often generated by background tasks—such as
> logging modules—which breaks memory locality and adversely affects overall performance.

I see. From my very limited understanding of HPC applications, they tend to be
perfectly sized for the nodes they run on, so having logging agents generate
additional page cache really does sound like a problem to me. 

> At the same time, there are a large number of __GFP_THISNODE memory allocation requests in
> the system. Anonymous pages that fall back from other nodes cannot be migrated or easily
> reclaimed (especially when swap is disabled), leading to uneven distribution of available
> memory within a single node. By enabling zone_reclaim_mode, the kernel preferentially reclaims
> file pages within the local NUMA node to satisfy local anonymous-page allocations, which
> effectively avoids warn_alloc problems caused by uneven distribution of anonymous pages.
> 
> In such scenarios, relying solely on mbind may offer limited flexibility.

I see. So if I understand your scenario correctly, what you want is something
between mbind which is strict in guaranteeing that memory comes locally, and
the default memory allocation preference, which prefers allocating from
remote nodes when the local node runs out of memory.

I have some follow-up questions here.
It seems like the fact that anonymous memory from remote processes leaking
their memory into the current node is actually caused by two characteristics
of zone_reclaim_mode. Namely, that it does not guarantee memory locality,
and that it is a system-wide setting. Under your scenario, we cannot have
a mixture of HPC workloads that cannot handle remote memory access latency,
as well as non-HPC workloads that would actually benefit from being able to
consume free memory from remote nodes before triggering reclaim.

So in a scenario where we have multiple HPC workloads running on a multi-NUMA
system, we can just size each workload to fit the nodes, and membind them so
that we don't have to worry about migrating or reclaiming remote processes'
anonymous memory.

In a scenario where we have an HPC workload + non-HPC workloads, we can membind
the HPC workload to a single node, and exclude that node from the other
workloads' nodemasks to prevent anonymous memory from leaking into it.

> We have also experimented with proactively waking kswapd to improve synchronous reclaim
> efficiency. Our actual tests show that this can roughly double the memory allocation rate[1].

Personally I believe that this could be the way forward. However, there are
still some problems that we have to address, the biggest one being: pagecache
can be considered "garbage" in both your HPC workloads and my microbenchmark.
However, the pagecache can be very valuable in certain scenarios. What if
the workload will access the pagecache in the future? I'm not really sure if
it makes sense to clean up that pagecache and allocate locally, when the
worst-case scenario is that we have to incur much more latency reading from
disk and bringing in those pages again, when there is free memory still
available in the system.

Perhaps the real solution is to deprecate zone_reclaim_mode and offer more
granular (per-workload basis), and sane (guarantee memory locality and also
perform kswapd when the ndoe is full) options for the user.

> We could also discuss whether there are better solutions for such HPC scenarios.

Yes, I really hope that we can reach the win-win scenario that I mentioned at
the beginning of the reply. I really want to help users achieve the best
performance they can, and also help keep the kernel easy to maintain in the
long-run. Thank you for sharing your perspective, I really learned a lot.
Looking forward to your response, or if you are coming to LPC, would love to
grab a coffee. Have a grat day!
Joshua

> [1]: https://lore.kernel.org/all/20251011062043.772549-1-mawupeng1@huawei.com/
