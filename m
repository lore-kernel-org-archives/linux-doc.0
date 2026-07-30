Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A473822B4
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 19:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785438101; cv=none; b=iI4eyYo0QTVaL1Ei13Og1/MfZDyyDjdnRRQOB4ul+VsZTAduFRVBrh/WpD+CIblsZAPk0DjCTpi1713p6b28wAQWCU+9p4pdAf+Y5mgiNEt4BgKbdmTRxPw9h2uRofJ71N2hKYK+2xwY5ga2AIN9yO66vDcROnUnkblbizq90Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785438101; c=relaxed/simple;
	bh=013H1I9/4OHiS5zhZMxrwaHnsOF1mfy4INGhmCqtxrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiW/xeJgu4zIdktVnRsj5S8bhYBUToViTHwUD2kq4UzVciE/PsxOwfRlbq++B+Byp12ut0a101D3cQYafKAVsquvLmxVLKXSrKiBwdaGIta9hA0pl03JqlH5DcvvgQdaXAeNcyi3NQcE2xpF6emcQ304a+FTemdo1sRHRhcLwRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=QFcqjoKc; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="QFcqjoKc"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92ed3993c1eso11602485a.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 12:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1785438097; x=1786042897; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n1yOof5RfumCoH1r75oUvzt/UONr8poJqHsdkRardoM=;
        b=QFcqjoKcW6iPffgLqoIHhWQ4utMB9jyxNH/1Afj8gLmoqtLzEBlEFmNrzJ6IMacaGF
         Xz45eCgYvpIuNa4upxj/UUuK/BE132u/DPz+BN0h4eP1yEz+aHem2640tSxa2xHYSdwx
         aIwxUFE1oi7ZGxwiMHWMpRG4pgtEkM2F77emlqFNenvBPwq8iRUJEnWr/oQIv6Mm4Sgy
         LcKgUNWke8p08NZprUbrzOeu+V0IJYLB71PYV1F1Qy1k9JkA7GLj0hqBB/zo+8C+KmKs
         0rQt8y+qzN4Uyjx+WppkDfF5Xjdbgxyhtw9px53beDY6A/p5HCdiyV+Q5YYusHJfGcsC
         doLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785438097; x=1786042897;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n1yOof5RfumCoH1r75oUvzt/UONr8poJqHsdkRardoM=;
        b=pa3FVJbbqQsOaUKqhHmIhHMeLXYM65iMFAL4OjiQH/U9pMIK+vlheWQc4p4L3I5UIB
         CtPFk76IxoIu1djeP4CDha33h+cS3hf6Ahx7SXkDCDlzI3mI7CibcTyA7LrE1zsoC4MG
         eh30uobqp64QWPEeCbmBx0oqI6RteT8AB0+XStENe8CywJ3XVkUVMO3IZWemJySCO+wc
         vUDDrt9hhpg9OwxfukZqqVFlsxpqfMATih6wNUQxiR+q9CM5CYp7Dx+so0my1LDkdsEq
         hZ4HwVe6Jd8cJmzDdHiIZVB3nGl1iuXR+7E+fUALcE8pCVv9Pts4eDfZa31fEAZFosYD
         KdsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rotwk4mgqdZke5Q1WaOoGIK6GaCzByxmS6hUFoLph3th5Zfi5pKIczAEgilZL6F3P07iyP3rLw4eqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO4wiBOhx0GEAmc56YJ1AxKxMgItuCTXBMTNkC5TdFxlmk/0wX
	7PN+GJgXKF/+/EaFQ5PpYXrTYuXS/7J3xAOTzzF3aNA0B4NYeS5zQMWIR46Mf4kvVk0=
X-Gm-Gg: AR+sD10sY6oLdHieaNHy7QVAwX9JgyDWgQfYy1v+I9DwqkbcSZLskFnp9zAQmP0P1QR
	B7kqcmaWpnd4bU2IyQ4rb9B+RRFCk2LQFSfl5Vk6Nz0FPRVB+uOWkGyY7Ex2b2XFuR9ZUQfwZIl
	nk0Gym+Koqd9C4Zx1SdQNpsk1CffMfCqGb2S0z9RnhLu5CaSv9Yw1hqbhT416PhQ8hPOZ4zB6LH
	NLAySt+ExxPPckDzDlIjnmO7Ks3rTmFPY/+dJna3sYoE92EnT32cWWfr6CKW3R0PSbJYQaJJigW
	T3LEuEsHyetJAot1gnmhApksDdilSZVC8mgbn8582vR6czD+V7HuTP7mbUsv46o59sydg6zdplK
	FpT6rOHhLJ6CYiAYfK/UUPv2iFszi0DO+g+Hoq0LrgzbFjb+BZlzbvzERf0/7VIJ9xa09WZH46x
	a62Ba7ln4w2nAiUtxvE5lFzYXR/cmME5BI0MblHU/3vb/xh27Q065qtXcn35I=
X-Received: by 2002:a05:620a:460a:b0:932:dd83:c54 with SMTP id af79cd13be357-93485ff2ecemr442630085a.42.1785438095030;
        Thu, 30 Jul 2026 12:01:35 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e712fc05sm475477685a.29.2026.07.30.12.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 12:01:33 -0700 (PDT)
Date: Thu, 30 Jul 2026 15:01:30 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, Nhat Pham <nphamcs@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, tj@kernel.org,
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
	chengming.zhou@linux.dev, muchun.song@linux.dev,
	roman.gushchin@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mm/zswap: Fix global shrinker when memory cgroup
 is disabled
Message-ID: <amufiuAaZbuDdKkQ@cmpxchg.org>
References: <20260729084206.77793-1-jiahao.kernel@gmail.com>
 <20260729084206.77793-2-jiahao.kernel@gmail.com>
 <20260729155858.c7aabff48166a9bca4d68ac3@linux-foundation.org>
 <CAO9r8zNhBCghP8T_98z2p==Cfs_=kamcRN_3ROxaj3R8PN2Qvw@mail.gmail.com>
 <c4c95102-72e2-a44f-f16e-4134ba6bb060@gmail.com>
 <CAO9r8zOSTYC3D_2CxapgvXGaZRUdnGetPGz2XgdUO8OygfuEiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zOSTYC3D_2CxapgvXGaZRUdnGetPGz2XgdUO8OygfuEiw@mail.gmail.com>

On Thu, Jul 30, 2026 at 10:48:38AM -0700, Yosry Ahmed wrote:
> > > Yeah, it isn't. Probably we should drop "Closes". I assume Hao added
> > > it because checkpatch annoyingly complains if you add "Reported-by"
> > > without "Closes", so Hao just linked to the thread where I pointed out
> > > the bug.
> >
> > Yeah, checkpatch will complain if it's missing.
> 
> We often ignore checkpatch if it's unreasonable.
> 
> > >> AI review asked a couple of questions:
> > >>          https://sashiko.dev/#/patchset/20260729084206.77793-1-jiahao.kernel@gmail.com
> > >
> > > The review on patch #1 is something theoretical, we discussed it at
> > > length in previous versions.
> > >
> > > For patch #2:
> > >
> > >> Does this batching logic break NUMA fairness?
> > >>
> > >> Because for_each_node_state() always starts from the lowest node
> > >> ID and breaks when the scan budget is exhausted, subsequent
> > >> calls to shrink_memcg() will restart at the lowest node ID again.
> > >>
> > >> If the lowest node (typically Node 0) consistently has enough
> > >> items to exhaust the scan budget, wouldn't we exclusively evict
> > >> pages from it while ignoring older pages on other nodes? Could
> > >> this cause LRU inversion across nodes, keeping older pages in
> > >> memory on Node 1 while hot pages on Node 0 are evicted?
> > >
> > > Yes, unfairness is possible.
> > >
> > > For global shrinking, it's probably not an issue. We reclaim until we
> > > hit the acceptance threshold and it's very unlikely this will happen
> > > before iterating all nodes (given that the batch size is 32 pages).
> > > However, with the shrink_memcg() path, we only reclaim one batch, so
> > > there's a chance we'll always reclaim it from node 0.
> > >
> > > Maybe we should just drop the early bailout and accept potentially
> > > doing more writeback than needed. Hao, WDYT?
> > >
> > If we scan and attempt to write back SWAP_CLUSTER_MAX zswap entries per
> > node, it might lead to excessive writeback on machines with many NUMA
> > nodes. Furthermore, I'm concerned about introducing higher latency in
> > synchronous shrink paths like zswap_store()—especially on systems with a
> > large number of NUMA nodes, where it could end up writing back hundreds
> > of pages in a single call.
> >
> > Maybe we could do something like this instead? That way, in the
> > worst-case scenario, it falls back to the baseline behavior without
> > introducing any extra latency risks.
> 
> This basically errs on the side of honouring the batch size
> (under-reclaim) instead of doing more writeback, right?
> 
> I think I prefer erring on the side of doing more writeback, as it
> would ultimately result in less LRU inversion, and we are already
> doing writeback proactively during reclaim through the shrinker.

Yes, LRU inversions are worse than reclaiming a few extra pages from
the cold tail of the LRU. It's not cumulative after all, it just means
we take a bigger bite and can take more stores before the next shrink.

> The other option we can explore is keeping the existing logic with the
> bailout, but start iterating the nodes at the folio's node in the
> zswap_store() path. Basically pass an nid to shrink_memcg() and always
> start there. This will avoid always reclaiming from node 0, and the
> node of the folio being stored is more likely to be under pressure and
> need the writeback. I am not sure how complex this would be and
> whether it's worth doing.
>
> Johannes, Nhats, any thoughts on this?

What happens if simply we do a hard SWAP_CLUSTER_MAX on each node?

With cgroups, we put the zswap entry on the list_lru head of the node
and memcg where the incoming page was.

So if you're going after one specific cgroup, it's not like you
*actually* reclaim 32 entries on each node of the system. You just
write back from nodes where that cgroup has entries.

The global shrinker also does one cgroup at a time (zswap_next_shrink)
before checking the limit again, so that's fairly fine-grained too.

Without cgroups, you could have zswap entries on all nodes. But if you
have so many nodes that this would constitute hundreds of pages,
presumably that's still a drop in the bucket compared to overall
memory capacity. SWAP_CLUSTER_MAX isn't that big a number.

So I don't think we need to get fancy. Just do SWAP_CLUSTER_MAX on
each node. Delete that nr_to_walk carry-over between them.
