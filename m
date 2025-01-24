Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AA71D9A6E
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737704968; cv=none; b=YagnJj6S186my6VpFxy9c5q03HEGeLWxhRER8ExW7oHj8vkOSTLu9cWg3HUYpPyqSGL7IXmiuTPeEzkR9hSPeU5AP0EWoJEWva1e5oLwwcQ+lCIIyjzTUOMMWRy0GNZnY5NclJsrHUuVZi/npz1vXUFLjfXvu4t3jknQDIW1i0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737704968; c=relaxed/simple;
	bh=Awy505UaJPkp48e9y2lfNPkRKflzoPa5yjo9vK5w14k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZE4LSpJpP7nwsnQsjFJ2eigyBJPFeT0q9xpo7GE46Z8UwlJ6XYZ7gvIEzsfAtiy+m1t+FCBCBXl8CveAlTrYQMi+fqu9LDCGCNLWxPYoKYntHOU85fxUefXAGhV4fT+0NyOe4ZPv204NIGhIuHjEV4Bc0dObq9BClpybR2Vpteg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fuzhoy4v; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fuzhoy4v"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f2f5e91393so405949a91.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 23:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737704966; x=1738309766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uws+ehspnEbk0q5oAsWqCHUTLRfxlLuAIbCiJ7MZofs=;
        b=fuzhoy4vXPA51vYuY7HJCUOZwXpEZNi/OlOcckgVfDhSFWssvRSLH60pPxagdml84e
         Zs6/oNQm9j3KZlx09kvqr8Kg91BBL+cOBARHOpIg+8CYdt9Al2X8rbx5w3wNAd7b9sUW
         fwVIudEbRp8u7YnC+HQqyWDSPwNbEnlsVg7hxNGdd/Hcz+e5x0WE0TIiiqBbLSn5AU+y
         xwGyqGBvi1x/yDQNExKXZ+VWgzm8nDBoIqjG52XC0RqQlbGba859N33Gfe5NOWwrR96v
         QGvv2U4CJwJXyZdFFzE2TU1a0MBSHKFUGefmoarziTFCPlvpT4P6xhq5el2Q8twWwkkh
         VmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737704966; x=1738309766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uws+ehspnEbk0q5oAsWqCHUTLRfxlLuAIbCiJ7MZofs=;
        b=XSOXcG62vOgfdg3JsFO/u85kum45WeHTs3O4SmrdWsPWCdvyAkDymRdOJSQdtgfY+1
         mohmQ6CoOe4ETrS79soJvbm6moVscRTR4+T+yHUL6wURNgmXDFa3tgM4roEDLU6+jdEU
         J86131meFYGWKlb9vr/zYTHiFCpB5/tVHDXAbWFIPImo1Bbm40cSmSZha9VotmFhLhEZ
         265ZIKrV2vExxq4Ues6gdIvUbnh9YesCK0OwxuBfOo+RVYx0ETaI1aAFlIPw63QszBuq
         cQKiMTpinu3IM0BNOyiTSXEUGg9oJ6kQcBSc8IwYmxv4rn0W8N6al8cwx/+Pk9JePUA3
         xZhw==
X-Forwarded-Encrypted: i=1; AJvYcCXjCl0nPzGLY/S45G+2V7YLoWBJ5ecyM1Wbz3UpgJNIxR6YvOAuXGPKHZVNdSLtsxF9ue0VgiplgkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2O0lPOtPQO7haOdfAaPDPe7RbbWnyWu+vdXWZLPQaUNr80GLj
	EQBIJgTKsJmB7O7UtIG58SBGFiJBCu7QGV0r1tyd2Y57H6m9vd0NB56ec05m9P0=
X-Gm-Gg: ASbGncuFC4+JvTIkSc/5gdvOnfLuXviZaR4U7wkNsSMunFWcgBjd5l11hQ6MoYKtLqB
	pOwb6cq/Tdozh0tejHzyEZ1cWHN0PO0VIWnsAdKXI9LB7E+0NPNk+PPmIoPmms3/ld1rKfU/Uh2
	BtlOFdmXCX/oZ1BckPFPY2no7Wnieo92mLR0OxlnzoMfnvtlnQzcjUs74ZYKMW6QH1Hj6KnOq8Z
	tyq2KYilM4l8QxXXRDqQXohpBrFqNIWzLZDEsIysJdmUg0HF6DNR7ZEszXa7mgurkIoc79Hwkwo
	9VQIFFrpSJG8fIOKqvGd1rHdZWtHdQ==
X-Google-Smtp-Source: AGHT+IEEJ+74un4tMKpaPeLW04njmN5HnJ938utpDTqTFM2Z68P/2bjYtoGBIV/UH9qBePmOk/E0og==
X-Received: by 2002:a05:6a00:1894:b0:725:e499:5b94 with SMTP id d2e1a72fcca58-72dafa6b3a7mr13902096b3a.4.1737704965963;
        Thu, 23 Jan 2025 23:49:25 -0800 (PST)
Received: from [10.254.144.106] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a69f5fdsm1208111b3a.5.2025.01.23.23.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 23:49:25 -0800 (PST)
Message-ID: <2bba87cf-69aa-4fac-ae1a-c50e2f376e2a@bytedance.com>
Date: Fri, 24 Jan 2025 15:49:16 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH 1/3] cgroup/rstat: Fix forceidle time in cpu.stat
Content-Language: en-US
To: chenridong <chenridong@huawei.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Yury Norov <yury.norov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bitao Hu <yaoma@linux.alibaba.com>
Cc: "open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250123174713.25570-1-wuyun.abel@bytedance.com>
 <20250123174713.25570-2-wuyun.abel@bytedance.com>
 <853d2669-e05b-435e-9ac1-86311ead56e5@huawei.com>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <853d2669-e05b-435e-9ac1-86311ead56e5@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/24/25 9:47 AM, chenridong Wrote:
> 
> 
> On 2025/1/24 1:47, Abel Wu wrote:
>> The commit b824766504e4 ("cgroup/rstat: add force idle show helper")
>> retrieves forceidle_time outside cgroup_rstat_lock for non-root cgroups
>> which can be potentially inconsistent with other stats.
>>
>> Rather than reverting that commit, fix it in a way that retains the
>> effort of cleaning up the ifdef-messes.
>>
>> Fixes: b824766504e4 ("cgroup/rstat: add force idle show helper")
>> Signed-off-by: Abel Wu <wuyun.abel@bytedance.com>
>> ---
>>   kernel/cgroup/rstat.c | 29 +++++++++++++----------------
>>   1 file changed, 13 insertions(+), 16 deletions(-)
>>
>> diff --git a/kernel/cgroup/rstat.c b/kernel/cgroup/rstat.c
>> index 5877974ece92..c2784c317cdd 100644
>> --- a/kernel/cgroup/rstat.c
>> +++ b/kernel/cgroup/rstat.c
>> @@ -613,36 +613,33 @@ static void cgroup_force_idle_show(struct seq_file *seq, struct cgroup_base_stat
>>   void cgroup_base_stat_cputime_show(struct seq_file *seq)
>>   {
>>   	struct cgroup *cgrp = seq_css(seq)->cgroup;
>> -	u64 usage, utime, stime, ntime;
>> +	struct cgroup_base_stat bstat;
>>   
>>   	if (cgroup_parent(cgrp)) {
>>   		cgroup_rstat_flush_hold(cgrp);
>> -		usage = cgrp->bstat.cputime.sum_exec_runtime;
>> +		bstat = cgrp->bstat;
> 
> Thank you for finding that.
> In my version 2, I used to assign cgrp->bstat to bstat.
> This is Tj's comment:
> https://lore.kernel.org/linux-kernel/ZoQ2ti7nnz9EJSc3@slm.duckdns.org/

Thanks for pointing out. Using memcpy() is fine for me, but I see
cgroup_base_stat_flush() is using the same pattern, and if we don't
want copy like this, it would be better unify them in a separate
patch.

But IMHO in either way, I don't think reading forceidle time outside
cgroup_rstat_lock is the right thing to do.

Best Regards,
	Abel

