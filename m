Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CB9384CC4
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 07:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785482754; cv=none; b=ix0dnU4T1io5+jpvTAUupC67cs7lF2LG+kdKPDjem5kxAApMD+FNlhz7LlHzntbr0DRmqJa1Pm3TDR4rlO6TDgG4oAyD/bIgEGcqT7J+iE9RaXB0v9Nnl5RTxl4+1nB8Hv5KubqIsK1zNK/m6h7ANaTOmBSt+zkRoOKI1/tVRXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785482754; c=relaxed/simple;
	bh=cBGqzSHgpyf2ylHr8NeGS/tmGuJCS2IoNCewnJbgURQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FVyRgvaPrre7xZwIrysxhrmAFXgWtiUtyM+a27KrD2jfR+3oDl/eEtaPBvnwSKS+EZrGZLYeREJE8MOTY4l+jq9JkTie8+ivTruKdPX97moJamqHi5FkhlfKjZFIvXr5C2g+WFWOJbtKDTTVhd4az6qAjPYFwEuebV6YKRbyzFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvar3cFu; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvar3cFu"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84e04df8c46so776405b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 00:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785482752; x=1786087552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V1iIJadxoIBnwpT+OgXeZPORL6qjCPJ2u2L6lNdVtGE=;
        b=hvar3cFu1BykuNlFDX0W8gUMXq3OvBXWoApDKilq7D4JPkxcwsB8TsIoW9DeDAHH0I
         ZRGqgcP6p5r38CAwinCfrmeuqrAC25eRwZICJyNscevcyfYCc4ykyPGyssDnJBCdASCu
         z9wTeaLF4WNOBV+Go0t71S1My/WcX3LK4DQzjufihPU5icCE5zHUvgKwPD8WBXu+NQQK
         vZuJQzGRHFJFHaijzdyw1RglVRvTWV8ld7wpM+Im5asTTvS2LGGad6unIdAQt05WHLxd
         G0irfN5/5Xrws60qmA393XFWNlTr9WdhSNoNouSA09DaZgyO0W2YoJu6Gb3rknnOASpn
         vhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785482752; x=1786087552;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V1iIJadxoIBnwpT+OgXeZPORL6qjCPJ2u2L6lNdVtGE=;
        b=TXow8jOjx4aQrz1/8qUpi2W8V5jGyFFmMnbfLmtYsYHeLMvTUlkMVXQklxEYzPcpFn
         dtc4dce12dAoulg6XfCyx/a03D633ENdKskIjKzSWniRWezWR0vOhPa0hC5WFtbirq6W
         w0Lezjn1ejUkrMREInZ3Ym5cn3iP6LRoV1fOMFjEnaO8ewRwBbPFUjdO2nCxiFUlLtwH
         HxFWjno7XgzrdP0uGubE/Ut+78pnAqQ4sV0WoO6e00rSrf/HiT5RBacIHJWTUzr5/Ume
         2qp8iQv6uAkezUR9KxLhZVzERFbwlqxLbUaS4H5tfVM/n/3UcYtcqqV+EwNE1iJNf5Wu
         dwNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZMl77f3AnOHEI5wJmpuoFDjpLxdcOSgtOdEeIXfFSeeFpPbrw1wx9ls/g+NNERLeWWqNRxuQLQrw=@vger.kernel.org
X-Gm-Message-State: AOJu0YylAq1yekI5+iZVyHCN5+cYLrVFiQJBktv2W8bvDK0nHMblHQ9L
	PneGV09zom0/haV9qj4XHsAGdhX33/vCJ3ulybYm+X8+YJO57FBFVujU
X-Gm-Gg: AR+sD13e+/rr+hl99v4vqNaLBPqaBwE9zdXN7kJ77eV1FlGEA/hNNYO6QZqMBy0rwFk
	XUsJocL5alh5nZyLiaLBIYocWCaHPlfxVtoO56mktg6+9AeXNz7aFeJTtHj+5A0LQ9+RO7WR71N
	iLZo0rXg8kHyWyMBv2PtcQxEipO5/gN4/kkfF86IGsfOxIesqYhCrlkFxRM8T15iB3kiBcdg7M2
	/04/z2xeYr15ehg6tZej49CYy1B6nBRM11pcpl8Y4A0bT+2ZgQLpR8rBubYKHdpQlo5cSIXaMi8
	qlkX6cAtDCF/tSOCO2zawrspIaopjTuCcaxzBc4ozrV6xMyEUMdWZpYJueQ6CagMocVCvkrEiYZ
	GXiXMNfO2dbO1GaYjVn0dDA53EDorAneAdKZha9kYTjsDC4B/2dQIkF5dmlRKEkPCpHUm5aY/kP
	FXaYV9glweG83lihhICY5wU4Ny6Bw5qSlLFVCGuLF4cr35EdYgdkRtqUaIFQpSBfG0NTj8Q39bq
	fcYhf1K/g==
X-Received: by 2002:a05:6a21:62c7:b0:3c3:64cb:9b99 with SMTP id adf61e73a8af0-3c91b0de414mr911570637.6.1785482752052;
        Fri, 31 Jul 2026 00:25:52 -0700 (PDT)
Received: from [10.125.192.117] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3963e2aasm225078a12.2.2026.07.31.00.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 00:25:51 -0700 (PDT)
Message-ID: <a2ca877d-52a5-15c5-b70e-2f60284d6bef@gmail.com>
Date: Fri, 31 Jul 2026 15:25:40 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/2] mm/zswap: Fix global shrinker when memory cgroup
 is disabled
To: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 tj@kernel.org, shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
References: <20260729084206.77793-1-jiahao.kernel@gmail.com>
 <20260729084206.77793-2-jiahao.kernel@gmail.com>
 <20260729155858.c7aabff48166a9bca4d68ac3@linux-foundation.org>
 <CAO9r8zNhBCghP8T_98z2p==Cfs_=kamcRN_3ROxaj3R8PN2Qvw@mail.gmail.com>
 <c4c95102-72e2-a44f-f16e-4134ba6bb060@gmail.com>
 <CAO9r8zOSTYC3D_2CxapgvXGaZRUdnGetPGz2XgdUO8OygfuEiw@mail.gmail.com>
 <amufiuAaZbuDdKkQ@cmpxchg.org>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <amufiuAaZbuDdKkQ@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/31 03:01, Johannes Weiner wrote:
> On Thu, Jul 30, 2026 at 10:48:38AM -0700, Yosry Ahmed wrote:
>>>> Yeah, it isn't. Probably we should drop "Closes". I assume Hao added
>>>> it because checkpatch annoyingly complains if you add "Reported-by"
>>>> without "Closes", so Hao just linked to the thread where I pointed out
>>>> the bug.
>>>
>>> Yeah, checkpatch will complain if it's missing.
>>
>> We often ignore checkpatch if it's unreasonable.
>>
>>>>> AI review asked a couple of questions:
>>>>>           https://sashiko.dev/#/patchset/20260729084206.77793-1-jiahao.kernel@gmail.com
>>>>
>>>> The review on patch #1 is something theoretical, we discussed it at
>>>> length in previous versions.
>>>>
>>>> For patch #2:
>>>>
>>>>> Does this batching logic break NUMA fairness?
>>>>>
>>>>> Because for_each_node_state() always starts from the lowest node
>>>>> ID and breaks when the scan budget is exhausted, subsequent
>>>>> calls to shrink_memcg() will restart at the lowest node ID again.
>>>>>
>>>>> If the lowest node (typically Node 0) consistently has enough
>>>>> items to exhaust the scan budget, wouldn't we exclusively evict
>>>>> pages from it while ignoring older pages on other nodes? Could
>>>>> this cause LRU inversion across nodes, keeping older pages in
>>>>> memory on Node 1 while hot pages on Node 0 are evicted?
>>>>
>>>> Yes, unfairness is possible.
>>>>
>>>> For global shrinking, it's probably not an issue. We reclaim until we
>>>> hit the acceptance threshold and it's very unlikely this will happen
>>>> before iterating all nodes (given that the batch size is 32 pages).
>>>> However, with the shrink_memcg() path, we only reclaim one batch, so
>>>> there's a chance we'll always reclaim it from node 0.
>>>>
>>>> Maybe we should just drop the early bailout and accept potentially
>>>> doing more writeback than needed. Hao, WDYT?
>>>>
>>> If we scan and attempt to write back SWAP_CLUSTER_MAX zswap entries per
>>> node, it might lead to excessive writeback on machines with many NUMA
>>> nodes. Furthermore, I'm concerned about introducing higher latency in
>>> synchronous shrink paths like zswap_store()—especially on systems with a
>>> large number of NUMA nodes, where it could end up writing back hundreds
>>> of pages in a single call.
>>>
>>> Maybe we could do something like this instead? That way, in the
>>> worst-case scenario, it falls back to the baseline behavior without
>>> introducing any extra latency risks.
>>
>> This basically errs on the side of honouring the batch size
>> (under-reclaim) instead of doing more writeback, right?
>>
>> I think I prefer erring on the side of doing more writeback, as it
>> would ultimately result in less LRU inversion, and we are already
>> doing writeback proactively during reclaim through the shrinker.
> 
> Yes, LRU inversions are worse than reclaiming a few extra pages from
> the cold tail of the LRU. It's not cumulative after all, it just means
> we take a bigger bite and can take more stores before the next shrink.
> 
>> The other option we can explore is keeping the existing logic with the
>> bailout, but start iterating the nodes at the folio's node in the
>> zswap_store() path. Basically pass an nid to shrink_memcg() and always
>> start there. This will avoid always reclaiming from node 0, and the
>> node of the folio being stored is more likely to be under pressure and
>> need the writeback. I am not sure how complex this would be and
>> whether it's worth doing.
>>
>> Johannes, Nhats, any thoughts on this?
> 
> What happens if simply we do a hard SWAP_CLUSTER_MAX on each node?
> 
> With cgroups, we put the zswap entry on the list_lru head of the node
> and memcg where the incoming page was.
> 
> So if you're going after one specific cgroup, it's not like you
> *actually* reclaim 32 entries on each node of the system. You just
> write back from nodes where that cgroup has entries.
> 
> The global shrinker also does one cgroup at a time (zswap_next_shrink)
> before checking the limit again, so that's fairly fine-grained too.
> 
> Without cgroups, you could have zswap entries on all nodes. But if you
> have so many nodes that this would constitute hundreds of pages,
> presumably that's still a drop in the bucket compared to overall
> memory capacity. SWAP_CLUSTER_MAX isn't that big a number.
> 
> So I don't think we need to get fancy. Just do SWAP_CLUSTER_MAX on
> each node. Delete that nr_to_walk carry-over between them.

Thanks for the input! I've posted the new implementation—please take a 
look when you have time.

https://lore.kernel.org/all/20260731071900.38942-1-jiahao.kernel@gmail.com

Thanks,
Hao

