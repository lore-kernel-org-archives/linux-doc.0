Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E013DBD41
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 11:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400022; cv=none; b=Askj8njT4nqTAF4zss2rile0I4HLfuVlNU1LxFX3AFBXJrTNKUlnJCamAi5OvuZWc9kt8Cmn2cQtiG9WfeKpvRsK2WOHJ9TSGql/ROchKijbLC7t9iXxJ/4Q/+80vQQ//TAnaQPu7/ga7hEkLV2dcpVET6ccyCQ6fKDG3F30DtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400022; c=relaxed/simple;
	bh=rk2qXnirgz2T3QaVJGm3JzpjDEs5mETRb5exZH4r79g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVxQn6gbsTkCkEKjl/nh3gsCtQPoFk7IC8aYLrc215l1sNaNOB97ezd90GryQ6G+dQeSLuMZa0WRq57G1iHwB/7wPmZNE/IwSnRDWCh3MayuWN0Zc1PqHGjbGHUVOq/gdqnezUZGw6uitnitTq+HgxI2u+ONiYpfhjW0oVlUak4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnOf+rAV; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnOf+rAV"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84229481d44so1108537b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 04:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400019; x=1781004819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIjyJAxkpOo0qq8iJhBIp/NwJ9Q4HsURAYxn5PS3IMk=;
        b=TnOf+rAV1A2c6jc6ywohXsuMdHOSs9QEU2F8lJ9DVuEl1Y10ap9+R/bzkF8Wvk5B8L
         dZQJfkeWZoJcTq39yj86PggZf/QXwUC6G8LmtBA9KqCio2ULPpNHljp8qx/5EGcv9SIn
         RtlOgDjAfqY2d1/gbV7maWSSinAvM7EPFEaiPQMOWA4FFPMRtN4m1jctlsZ81D/953rz
         XPo4jra12AtW6XiV2vQoSscJrWl6eeiMOrzCQ+P5PkJBj/VHu1HMKUG4ETb3YMJMeEBp
         ctQ26VhYgmgig6sTC4EOVXv1tHESfvjo+bzG2Gfn8DStYlaQ2RZ4yt2hKW5GAq74Z/aM
         2icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400019; x=1781004819;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JIjyJAxkpOo0qq8iJhBIp/NwJ9Q4HsURAYxn5PS3IMk=;
        b=XKQQ9qsRyDLYiEd5idlccaB8UcIIr9VOZCGDtqICex15MAHMfnr6H37MPsWRWdJdMi
         POCWC5Kf3TPT2jfrFWVolWHy0P1NKCB+Qfcms6r5iq63zWYSorw+WPP/cDrOeyWMbhoi
         eqGIfCJ5uVuxKzlSe+pYbSLZcrO1V5Y7/hveXvfM3Y44aLQRcYME43QLjkE+YQgG/mPF
         OeqaMs3Ht7hmyeP/NJNAQcV3kS7Lh4NOfKHWU7WeLnB2B+iKp//8qtd9J0E7VKRMIhGm
         OBj48H4WK0Idzjr9TWNtDPMYrbwzJ2veq7xUAgIOp7aBTzbUpHgPdimZtBq+4zDf45Xj
         g/dQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3yokf8Q1Qkkn0dRUhuBkzdc5R3xL0nOZjz7HFy0OJ8dfukyV9TFVpI2b7ww4fwF5+JQfsuP/Yc+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGJDT8zDmYzf3ktbirKZQxpR7m+xAvvmHsDc69s/RYatL1VtS6
	HE2T5gg3EJNODRs4Hpk7wKvwNDX00crHTm5KX7cCw+JrqA3Q7GEFAWaw
X-Gm-Gg: Acq92OH/aK7vp6lkeaFAY3TRIkn1KT4Yr5eoq86e89VMu7UU4+WY9BzqbbZ0xC53hhB
	7xnmrGVH+HN0OsHfDxBSKhORTP5SEQEUoaFpsPR5k1AOXzlVQbcpLu8SiojzX/KDtJEd/6PjImT
	IvqxCWIiGx4k76ezep/6eBYez3KYXJOIl9N3eL9X5vD7uizmVs5oyR9pF8IJ0I9E9wsx09ym9wM
	dwAqWTSbE+2J/mw47cyvbRwt73JL/JpH7OCKAHKhLKx2BUAvs9yLvE8p5KsphuXNNycYkDBs5IU
	jlYwXrXNasSCLlQKi8b93Ug6kS+yL8OvsYmydGzjk0hQMyTd+ea7YDksZDdjqXtsNNJvQ4Xw3dS
	iKnHskhlWX47rSu+nbxZ9hvgH+vfr2Mt0x29lmSzCjmSkH1OIKRrWOcfCbuOKzn+J4bff5Kru8c
	7WonWFuLNbsXUDCbDa+bV2sXFbV8g4pNtVa43uLtwxMKwkdvXVya+ouw==
X-Received: by 2002:a05:6a00:4488:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-842253d0998mr14098844b3a.7.1780400018894;
        Tue, 02 Jun 2026 04:33:38 -0700 (PDT)
Received: from [10.125.192.75] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214ce85d2sm12730415b3a.51.2026.06.02.04.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 04:33:38 -0700 (PDT)
Message-ID: <ff344c9f-51da-8b3a-e7a9-c4a7f4702ef8@gmail.com>
Date: Tue, 2 Jun 2026 19:33:28 +0800
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
To: Yosry Ahmed <yosry@kernel.org>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-2-jiahao.kernel@gmail.com>
 <aho7nepN5jZtKmef@google.com>
 <8c0e60e1-5713-69f0-a687-088c87e75764@gmail.com>
 <ah4ZZGl7GYJf54Wz@google.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <ah4ZZGl7GYJf54Wz@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/6/2 08:31, Yosry Ahmed wrote:
> On Mon, Jun 01, 2026 at 07:07:45PM +0800, Hao Jia wrote:
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
>> Not using a per-cgroup cursor will cause issues for "repeated small-budget
>> calls" cases. For example, repeatedly triggering a 2MB writeback might
>> result in only writing back pages from the first few child memcgs every
>> time. In the worst-case scenario (where the writeback amount is less than
>> WB_BATCH), it might only ever write back from the first child memcg.
> 
> Right, so a fairness concern?
> 
> I wonder if we should just reclaim a batch from each memcg, then check
> if we reached the goal, otherwise start over. If the batch size is small
> enough that should work?

Even with a small batch size, for small writeback requests triggered by 
user-space (e.g., 2MB, which is batch size * N), it might still 
repeatedly write back from only the first N child memcgs. This could 
cause the user-space agent to prematurely give up on zswap writeback.

> 
>>
>> Similar to how memory reclaim uses mem_cgroup_iter() (via struct
>> mem_cgroup_reclaim_iter) and the old shrink_worker() used zswap_next_shrink,
>> we need a shared cursor here.
> 
> Right, I understand that in theory we need a cursor. I am just wondering
> if the complexity is justified in practice. Reclaim is a much larger
> beast than zswap writeback. I wonder if we can just get away with
> scanning a batch from each child memcg -- for per-memcg reclaim, not
> global.
> 
> We can always improve it later with a cursor if there's an actual need.
> 
>>
>>
>>>>
>>>> Naturally, group the cursor and its protecting spinlock into a
>>>> zswap_wb_iter struct, and make it a member of struct mem_cgroup to
>>>> realize per-memcg cursor management. Accordingly, shrink_worker() now
>>>> uses the lock and cursor in root_mem_cgroup->zswap_wb_iter.
>>>
>>> If we really need to have per-memcg cursors (I am not a big fan), I
>>> think we can minimize the overhead by making the cursor updates use
>>> atomic cmpxchg instead of having a per-memcg lock.
>>>
>>
>> Because mem_cgroup_iter() always calls css_put(&prev->css), we cannot simply
>> update zswap_wb_iter.pos via cmpxchg() after calling it. Doing so could lead
>> to a double css_put() issue on prev->css.
>>
>> Therefore, if we switch to the cmpxchg() approach, we wouldn't be able to
>> reuse the existing mem_cgroup_iter() logic. We would have to write a new
>> function similar to cgroup_iter(), and its implementation might end up
>> looking a bit obscure/complex.
> 
> What if we do something like this (for the global cursor):
> 
> 	do {
> 		memcg = xchg(zswap_next_shrink, NULL);
> 		memcg = mem_cgroup_iter(NULL, memcg, NULL);
> 		/* If the cursor was advanced from under us, try again */
> 		if (!try_cmpxchg(zswap_next_shrink, NULL, memcg))
> 			continue;
> 	} while (..);
> 			
> 

Regarding the code above, IIRC, both the global and per-cgroup cursors 
suffer from race conditions. This race can cause mem_cgroup_iter(NULL, 
NULL, NULL) to return the root memcg or its descendants, leading zswap 
to write back pages from the wrong memcg.

Additionally, since mem_cgroup_iter() puts the prev memcg ref and gets 
the next memcg ref, a try_cmpxchg() failure on CPU1 might also lead to a 
ref leak for memcg1.


	CPU1                                       CPU2
memcg1 = xchg(pos, NULL)
                                memcg2 = xchg(pos, NULL) memcg2 = NULL;

memcg1 = mem_cgroup_iter()
                        mem_cgroup_iter(NULL, **NULL**, NULL) error memcg
                                 try_cmpxchg(pos，NULL，memcg2） succeed
try_cmpxchg(pos，NULL，memcg1） **fail**



I took a stab at implementing a cmpxchg()-based zswap_mem_cgroup_iter() 
modeled after mem_cgroup_iter(), and it actually doesn't look that 
complex after all :)

Of course, as Nhat mentioned, we definitely need to add plenty of 
comments for this function.

static struct mem_cgroup *zswap_mem_cgroup_iter(struct mem_cgroup *root)
{
	struct cgroup_subsys_state *css;
	struct mem_cgroup *pos, *next;

	if (mem_cgroup_disabled())
		return NULL;
	if (!root)
		root = root_mem_cgroup;

	rcu_read_lock();
restart:
	pos = READ_ONCE(root->zswap_wb_iter.pos);
	css = pos ? &pos->css : NULL;
	next = NULL;

	while ((css = css_next_descendant_pre(css, &root->css))) {
		if (css_tryget_online(css))
			break;
	}
	next = css ? mem_cgroup_from_css(css) : NULL;

	if (cmpxchg(&root->zswap_wb_iter.pos, pos, next) != pos) {
		if (next)
			css_put(&next->css);
		goto restart;
	}
	rcu_read_unlock();

	return next;
}

> There is a window where a racing shrinker will see the cursor as NULL
> and start over, but that should be fine. We can generalize this for the
> per-memcg cursor.
> 
> That being said..
> 
>>
>> Currently, this lock is only used in shrink_memcg(), proactive writeback,
>> and mem_cgroup_css_offline(). Note that shrink_memcg() only acquires the
>> lock of the root cgroup, and mem_cgroup_css_offline() is unlikely to be a
>> hot path.
> 
> ..this made me realize it's probably fine to just use a global lock for
> now?
> 
> IIUC the only additional contention to the existing lock will be from
> userspace proactive writeback, and that shouldn't be a big deal
> especially with the critical section being short?
> 

In the current patch implementation, this lock protects the cgroup's own 
cursor variable. During each writeback, we only acquire the spin_lock of 
the target cgroup itself; we do not attempt to **spin on any child 
cgroup's lock while iterating through the descendants**.

Specifically:

  - shrink_memcg() will only attempt to acquire the root cgroup's lock 
throughout the entire process.
  - Proactive writeback will only acquire the lock of the target cgroup 
**itself**.
  - Only mem_cgroup_css_offline() might attempt to hold locks of other 
cgroups, but normally, this shouldn't be a hot path.

Therefore, even if proactive writebacks are triggered concurrently on a 
parent cgroup and its child cgroup, there will be **no** lock contention 
at all (specifically referring to zswap_wb_iter.lock).

Lock contention would only occur if user-space **concurrently** triggers 
proactive writeback on the exact **same** cgroup. And IIRC, in such a 
scenario, the bottleneck is more likely to be on other locks anyway.


>>
>> So, should we keep the spin_lock or go with the cmpxchg() approach?
>> Yosry and Nhat, what are your thoughts on this?
> 
> I think we should experiment with the global lock first. See if you
> observe any regressions with workloads that put a lot of pressure on the
> lock (a lot of threads in reclaim doing writeback + a few userspace
> threads doing proactive writeback). See if the userspace threads
> actually cause a meaningful regression.

Sorry, it seems there are some implementation issues with the global 
lock approach.

In practice, our user-space agent mostly operates in the following two 
scenarios:
  - Triggering proactive writeback on the same cgroup at different times 
(sequentially).
  - Triggering proactive writeback on different cgroups at the same time 
(concurrently).

In both cases, there is no lock contention. So, the current lock works 
perfectly fine for us.

However, if we really hate zswap_wb_iter.lock, I can try replacing it 
with the cmpxchg() approach.

Thanks,
Hao
