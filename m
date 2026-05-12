Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FD14CA294
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 11:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778585040; cv=none; b=RwEVy7/hCiXxMCcAyg87i53h0NN9IOuJe6Mcdl9WrXJy3doh5LWHSXmD1261p+iqVY2AcFLhGPRLG+uZIMgBWhRBHINwLTzMaeJG1d/0/1kZV4gypV+KyMkEPwR2yXIHK3/+Fxy6NR6XfTAbfg+1s0zd/uxBuns8EGoD1hMegcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778585040; c=relaxed/simple;
	bh=Ii5vfft56FX4F+RKZElVmFFVKpx9tobbH8vxCfz2cG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hX71KVCXGVa3FZrikpmhDQNKLwcMukf7O85tKYxsr5pO7t2qI9xCfzP5IHzXo8VlZ+w6dxtXfEEFFX3qmZOAPAk8ByfYkmdApfuCJualhVAwPFptTXSCdkDmmC9D73kpGIOALKruei6VCsnLM9Bl8tazpAfrG93QmwGHfst6vpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIxGfSjm; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIxGfSjm"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-362e30526f8so2633504a91.3
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 04:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778585036; x=1779189836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pj3CnjNQfUpkH+U3gC/I8KUGZmw67J04qC2DMFV41gM=;
        b=VIxGfSjmcjUzUpbJew+AIUW4sJcq14xKnrh/GO2yGOw3UfPYn1+zBtN/bgnbnPST+b
         ragrcUE6N/VrUQ2hsQ9QUsXTByzWuECBOENMlW6ptT4KnQ57PRmQ0k/GkyoU3NzvK2Bj
         35+lN4j9SHEZCKMpRoMjvxcENHoQz/VsGbKbL4b60SfdMbFcMGWvEnV6mG1ao0rOwOoi
         1W6sjwTy0YwB46aPYg/T72xrBF4hnzDcBsSVyziTvhwx4H5Z6Fk6SjYlp+PdnkjzQn5u
         ld1lc2UGfKLzHPfj7JlW36Khk1MXrytX5gc6/hiFtZCA188YnM7UVzQWWd5nbPgZMVC7
         ND+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778585036; x=1779189836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pj3CnjNQfUpkH+U3gC/I8KUGZmw67J04qC2DMFV41gM=;
        b=ZTV295ENJ9xwO3FQg0tMxDsJ8qGqo+U/HrOhuASqRHEJFNwCYLWxYWKRY1dKQarQUN
         9GaVVRuOGZu0f3+u9KpOzmKPNnW+lPY8+iIkR9BMavu1mpSAAtqmMrQwAZE0NtPs0UVT
         qpWGvrEtW7+ndVm5O8ONs84GVMJMsc2wC0x+UgyBWOhwCDO/kzv6N5FG+Iyuj8JLyjEU
         VyHiaoKvr+CAur3ahd6Y7dH9H3HrnX8dw1b2Y14bEUJDzePS5+4zGNrW0ERDixEmMqmA
         FCcq1k72kxt4S9yhHptaVhrCoUrOSoNvEXJJWUelpbp9MQSC5ZqLD0NTH6Y+PMBTolgl
         fIkA==
X-Forwarded-Encrypted: i=1; AFNElJ+/TpCa2GuaHK740F/V15EB41u0vqobscyR4wz95rvDQBuuYR19AHH7LLfWVjfL6WnKj7NoR4dJEzU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1+C69indeu7eRIWfMvlzsMxAwj2juYVvYMOFkKhH7dfEst/XD
	Dz0yHDuPdJC867EEMGMq6w33CvSw9+Qs5lQF0SJa5HacyHJYW6BzbZGO
X-Gm-Gg: Acq92OEXwQorPqvIeOjDOA7lL9xnU8qbzyXB9GiWL6b7DYo+Q9bjQJKYgVaRe7UFz9D
	UfMr4FQl3MruhLr10xHYxhG5R3s0h6lwYh5xL1ASqyQueEWEdDK/hoYMHR6NiYqTeHkhwde4GLX
	BnMzUKSwfrZQdJChzhGdaIkabozgpe8hIFzDOSIY9rQ20D/6Z0voP5lBNjMSEeKofAsOGpgqkVp
	iZWKrtTft4vYIb50sBBucgk/QERpD6Rs11KjSNzvWVkfrHJ2+4EPvKwR6ioNGm120eJyzCzqAZA
	mgd+/evwAupHr23udA0sgBt4Xtxhfez1NmEpcw+cm/FPj89khURGTFNkzV85Rr2nKmlSalrzaNy
	tjoANskJi4kENz1NsmfwlpEk4RYenffRSXyQGBgdhME1aXEFYY4WIhMFy+HSOM9Wu5UEAyAffUy
	bgeGP8Kki2jhFUGgW5xMTwHOXCaFLR8gKNys1vhPQtJWk=
X-Received: by 2002:a17:90b:3808:b0:368:cff1:ed99 with SMTP id 98e67ed59e1d1-368cff20420mr1095608a91.18.1778585035935;
        Tue, 12 May 2026 04:23:55 -0700 (PDT)
Received: from [10.125.192.65] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3685d84aa55sm6286680a91.5.2026.05.12.04.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:23:55 -0700 (PDT)
Message-ID: <5e6cf3fe-40eb-4a57-4bbb-eda2c31b3210@gmail.com>
Date: Tue, 12 May 2026 19:23:32 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 0/3] mm/zswap: Implement per-cgroup proactive writeback
To: =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, yosry@kernel.org,
 nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260511105149.75584-1-jiahao.kernel@gmail.com>
 <agG-gNEclOVf-9WA@localhost.localdomain>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <agG-gNEclOVf-9WA@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/5/11 19:39, Michal Koutný wrote:
> On Mon, May 11, 2026 at 06:51:46PM +0800, Hao Jia <jiahao.kernel@gmail.com> wrote:
>> From: Hao Jia <jiahao1@lixiang.com>
>>
>> Zswap currently writes back pages to backing swap devices reactively,
>> triggered either by memory pressure via the shrinker or by the pool
>> reaching its size limit. However, this reactive approach makes writeback
>> timing indeterminate and can disrupt latency-sensitive workloads when
>> eviction happens to coincide with a critical execution window.
>>
>> Furthermore, in certain scenarios, it is desirable to trigger writeback
>> in advance to free up memory. For example, users may want to prepare for
>> an upcoming memory-intensive workload by flushing cold memory to the
>> backing storage when the system is relatively idle.
> 
> I can imagine the zswap writeout can come at the least possible
> moment...
> 
>> To address these issues, this patch series introduces a per-cgroup
>> interface that allows users to proactively write back cold compressed
>> pages from zswap to the backing swap device.
> 
> ...but I see this series is not only per-cgroup proactive reclaim but
> it's also age-based reclaim.
> 
> The per-cg consumption and limits (and regular memory reclaim) are all
> measured in sizes. This age-based invocations don't seem commensurable
> (e.g. how would users in practice determine what is the desired input to
> here).
> 

Thanks Michal — you are right. The series is both per-memcg *and*
age-based.

The interface carries a size budget, like memory.reclaim. The two
parameters play different roles:

   "write back up to <max> bytes, chosen from entries whose residency
    in zswap is at least <age>"

Size stays the unit of *amount*; age is just how we describe *which*
entries are eligible.


> Could you explain more reasoning behind this design?
> 

Context on the use case:

Our deployment runs a userspace proactive reclaimer driven by the
system's runtime state (memory/CPU/IO pressure, refault rate, ...)
and workload-specific policy. It uses memory.reclaim to drive
reclaim, which compresses cold anon pages into zswap as the first
stage. For entries that then remain in zswap past a policy-defined
age threshold, the reclaimer wants to write them back to the backing
swap device at a moment of its own choosing, to further reclaim the
DRAM still held by the compressed data.

Why age is a reasonable selector at this stage:

Pages in zswap have already passed a first-stage coldness judgement
(otherwise they would not have been compressed). For second-level
offloading, the question is which of them are cold *enough*.
Time-in-zswap is a natural proxy for that. A swap-in invalidates the
corresponding zswap entry and resets the clock, so by construction
an entry that has sat in zswap for N seconds has not been faulted in
for at least N seconds. Residency in zswap is therefore a strong
signal that the entry is not about to refault.

In our deployment the userspace reclaimer starts from a conservative 
threshold (the starting value depends on the workload) and adjusts it 
through closed-loop feedback:

   - on one side, the age distribution of zswap entries, to see
     whether there is a meaningful population past the threshold;
   - on the other side, the post-writeback refault rate and related
     signals, to confirm that entries written back were in fact cold
     enough.

Both <age> and max=<bytes> are tuned against these signals until the
realized writeback volume matches target. This is the same
control-loop style already used to drive the first-stage
memory.reclaim budget.

Thanks,
Hao
