Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB28E3DA5B3
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 11:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399972; cv=none; b=Xz9yAV3nNXhhFB9w4BmvbnDYwYFYQk8+KObtfGjeJ9mJeBz4boEAdq6ao1O1xfxxMMnQs5lqSRvMUHtdvNsUN6nLxHDQY4QaBiWRLHLHpEQvrhaEmET7rdzH2KMeNelNkhCppLH40zkX4AlKTXjz+V994Pn2vKXQftM66G8cG68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399972; c=relaxed/simple;
	bh=hsJj1CfMkHXWpn91odTR8H0K9jbzOaukZllClpaQHTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opi+5mk8hYez0SEESGhPszrrU7eOQZYgg21RWQQH4KuZ9nBa1n9Rn+AlAPisnuCCXHeyGgJ95uEt0ObsHA0IRFRzxXYiuh/M08+dzVK7t+/R4y8+7ZqhoWN90d1dChIPryEGrc1HReyDxsKWWwtc5oD/BDYR/BgmyGsr+QLpPMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJJPWGDi; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJJPWGDi"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8423f236418so1054382b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 04:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780399968; x=1781004768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWu0sre5Jwby9OB3KDM9noNXPSopPTpmyBRZ89OmKZ8=;
        b=iJJPWGDikjv1pMhRoMGhTYrdyT2dF5iEZwfIgORf2kdzrrpNZozpKmGaco8YsfqRA6
         KWDKVj1o6e8DvGK7RHxXV/Fbenzje4m1drhAUltR6IBS+hh0fRcva67ju4E3mo8eiN7y
         uh4aToVcjKEAOKhDA9KaZmjVy8JQ9RPvX5LoxSOb577CNggawaLUHar7ovQpgb479fHE
         hxilwtGsSlhitpwlMLBJY7/oW3AW5bh6vEb3iNpqLCtMywFIe5/MTEw/d8GuQCOfaLLT
         COeZCD4Y8cWQm00d5ZjExWmHUYcgeU6eCdEl9TofxxSrozLl/nt4dNasD8ejc5B1SP0q
         xRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780399968; x=1781004768;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWu0sre5Jwby9OB3KDM9noNXPSopPTpmyBRZ89OmKZ8=;
        b=VUwzT1EiOY9cJY6u0KNciovCV17qXLXImx0uVKv198umQkduFzVelnebRom2pQuy80
         D77ynosj5n7jIkL1QsfEcCx4DEIe24W7OIDLnTbKN3sfq3phAdGI82gWxkVuKOBECIli
         m6Tcu5H014HH77yUGiDjp7Vs8h8yWnr4nI1lB+N3CNMYWnvVBXZfPWNOqIRGk284vw9c
         O+JwNhRED2hodxb5RvgHO1vZhLdNYS9XYAoPDS3vpVkxxSOjTKSMFYsHX3dbqinMI7ng
         11jTHRO3u/8g+FvholWWVXaI00lZQ9Mq+KHuG30feflwvt0JE0eoc/oohbTCh3VlgTZo
         cdzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nLbuOu8Krgp1Qs+K+JpkW/2ZNyz9DF4wFOOLNq2E2LskVuvw+4XDnDo11ZmW7z2PzfEhAetX+eE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX0nNmXyuMfbR+SulyG+ZUhbL3k+iCCPpucFlmV+OlgxOHuKe5
	+AQygj8FnwojInKjzrE0OCl5RWGtY2IR1zLQx7oEhj1DmF48PY/1znRl
X-Gm-Gg: Acq92OHOXdPsMfjF28gzaZc3jokCi+lWwhm0JMQgAZJ8O9yaLNXqGAt+mhYiGrE1vP0
	WGsuUyad7F84DAWpChs8twyrwiUq5x8p46AwgRe4BLdIvEdnUkoJVRoUpChj/ph1pyuE2gdfVYP
	L0609UdX6USH+amIMa0FeKtZTBersAIVE6G+4kMIu/jj8w+5A+pprEa50RXyPSvySKuKTYyuAfR
	Hhad7qONnoQjblBPff5d+8buYEiF9hpsfhs9UkPBWpB9thcucmlV0IkqpYNoXOQcY35Z81r0Drt
	cY8uP+MvPememMcja8du1rdePyL6E0RWvxy6HF91PQiejPYyOqrF5Xz4JvZOahTXwBbh19hU8Zh
	VVJIBvElnqn097+pcau5fAh120OXT1gxsweF5/H1rtKYksKQbTqSZW7qQnO0XzUikMCJMgDB2kp
	s+QffX05LnD9IYo9xwzej51+zhiYGEwJl/BbUWOd5tO/YGcZbUoDYDfA==
X-Received: by 2002:a05:6a00:2389:b0:842:37d3:de21 with SMTP id d2e1a72fcca58-84237d3de5amr11841016b3a.40.1780399967742;
        Tue, 02 Jun 2026 04:32:47 -0700 (PDT)
Received: from [10.125.192.75] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423dc9f361sm8310801b3a.24.2026.06.02.04.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 04:32:47 -0700 (PDT)
Message-ID: <22473c1e-8448-fc18-e454-7bfb38e89561@gmail.com>
Date: Tue, 2 Jun 2026 19:32:35 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/4] mm/zswap: Make shrink_worker writeback cursor
 per-memcg
To: Nhat Pham <nphamcs@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, akpm@linux-foundation.org, tj@kernel.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org,
 mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-2-jiahao.kernel@gmail.com>
 <aho7nepN5jZtKmef@google.com>
 <8c0e60e1-5713-69f0-a687-088c87e75764@gmail.com>
 <CAKEwX=NoQNXOMDD0uTSOPWHQX-CMNU1dw=zEuFj=eLcS3fB-ow@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAKEwX=NoQNXOMDD0uTSOPWHQX-CMNU1dw=zEuFj=eLcS3fB-ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/6/2 01:08, Nhat Pham wrote:
> On Mon, Jun 1, 2026 at 4:07 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>>
>>
>> On 2026/5/30 09:24, Yosry Ahmed wrote:
>>> On Tue, May 26, 2026 at 07:45:58PM +0800, Hao Jia wrote:
>>>> From: Hao Jia <jiahao1@lixiang.com>
>>>>
>>>> The zswap background writeback worker shrink_worker() uses a global
>>>> cursor zswap_next_shrink, protected by zswap_shrink_lock, to round-robin
>>>> across the online memcgs under root_mem_cgroup.
>>>>
>>>> Proactive writeback also wants a similar per-memcg cursor that is
>>>> scoped to the specified memcg, so that repeated invocations against
>>>> the same memcg make forward progress across its descendant memcgs
>>>> instead of restarting from the first child memcg each time.
>>>
>>> Is this a problem in practice?
>>>
>>> Is the concern the overhead of scanning memcgs repeatedly, or lack of
>>> fairness? I wonder if we should just do writeback in batches from all
>>> memcgs, similar to how reclaim does it, then evaluate at the end if we
>>> need to start over?
>>>
>>
>> Not using a per-cgroup cursor will cause issues for "repeated
>> small-budget calls" cases. For example, repeatedly triggering a 2MB
>> writeback might result in only writing back pages from the first few
>> child memcgs every time. In the worst-case scenario (where the writeback
>> amount is less than WB_BATCH), it might only ever write back from the
>> first child memcg.
>>
>> Similar to how memory reclaim uses mem_cgroup_iter() (via struct
>> mem_cgroup_reclaim_iter) and the old shrink_worker() used
>> zswap_next_shrink, we need a shared cursor here.
> 
> I think each proactive reclaim invocation just walk the entire subtree
> for page reclaim right (see shrink_node_memcgs())? Would that be
> acceptable for you?

Our current approach is very similar to how proactive memory reclaim 
works in shrink_node_memcgs().
shrink_node_memcgs() first calls memcg = mem_cgroup_iter(target_memcg, 
NULL, partial);. By doing this, it uses 
target_memcg->nodeinfo[nid]->iter->position to retrieve the child memcg 
where the last reclaim left off, and then resumes the iteration.

The catch is that zswap can't just reuse 
memcg->nodeinfo[nid]->iter->position, as that would mess up the cursor 
used by the memory reclaim.


> 
> I also wonder if we can at least make this structure dynamically
> allocated... In a system, you only really invoke proactive reclaim
> against a few target cgroups, no?

It is possible to allocate it dynamically, but I am concerned that it 
might introduce a slight performance overhead. We would need to add a 
**check** like if (READ_ONCE(memcg->zswap_wb_iter)) every time 
zswap_mem_cgroup_iter() is called. Furthermore, to handle concurrent 
allocations, we might also need to introduce cmpxchg() to resolve race 
conditions.

The additional code would look something like this:

static struct zswap_wb_iter *get_zswap_wb_iter(struct mem_cgroup *memcg)
{
     struct zswap_wb_iter *iter, *new_iter;

     iter = READ_ONCE(memcg->zswap_wb_iter);
     if (likely(iter))
         return iter;

     new_iter = kzalloc(sizeof(*new_iter), GFP_KERNEL);
     if (!new_iter)
         return NULL;
     spin_lock_init(&new_iter->lock);

     if (cmpxchg(&memcg->zswap_wb_iter, NULL, new_iter) != NULL) {
         /* Lost the race, someone else installed first. */
         kfree(new_iter);
     }
     return READ_ONCE(memcg->zswap_wb_iter);
}

Thanks,
Hao
