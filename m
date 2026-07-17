Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDED35838F
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277015; cv=none; b=H95eUwT5vaGMdI6MH3kb3M+17SC6AHcGbmTSHMNOBheL5Co3NfjNg1h3AY9LPP3hxONUQ7DhJNx5VdZzqHNox3uYNeQ303dEwaLJVsWQxzVAXcjt771OEuO0tDNqnZVh0bx0b2v9OIWuk6N5Y6P0uFkMZQHEflZniNB4RCvgY8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277015; c=relaxed/simple;
	bh=EHIYGO77P6cxsv069zJ+X8UpWTfJDAOiA6/SwLbfBp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXcJc2MxWTdXZdaH1uTAAnresY7cmrWMLbX6bmagoM25LxSfqF4Ha6h7DJC6+nvttI9/wtM5uljvujWba0klajdM+dzqn4pacfz1rsi4RBgYWDCBbEAzW9Ylzi678nSeB5CWVEAtvwzhrFVxJzLVFcgOZFrFE96PdY3IYo+KE04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKpV5l5R; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKpV5l5R"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so7440384b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 01:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784277013; x=1784881813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mfv8aCL6wb4m5PfnNNuufn2E5xtA362p0KwvX+fUtVA=;
        b=lKpV5l5RivOaGSfn319hGhzBJM0H/UDTDBFaN4wyryptkNxCWrAl81EckWbllbEnkg
         0vwzCMAElD4oBgCYcFr5ZcwmI7y7PnYSvCN2DGtdCnL1D8u66/E8QasCFtZCh9kkQeQ6
         SX2OAkMW/WhRSoLEuizsOCvPM37BUDU1FV8mAWzS/VY8xxYWkWx8+cZAdS8n8w6Vxu/d
         1n6qxZjTfIgtL9y7zA0gEHEdGlIBhad86EXG3Q+3XiU4NlOFbADV8NFvv3OtjIje3F3A
         igOklvdNsqwb1BRE08+YxTDb0ktIT6L667rtrfbWuqYUljYitBpNzWhY8Pbw7RF1g8sm
         7pSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277013; x=1784881813;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mfv8aCL6wb4m5PfnNNuufn2E5xtA362p0KwvX+fUtVA=;
        b=OsGtJkzFWZ/rhEKCJQvlMoMAZXrA/aClRkgFNGi6G8IuTrM55b2PabGTWbbH3xz+N3
         XyIWMZUAPMhU2WSZhDNPbzYI69bAU7eSGcDtsSqKpaCdKwldtY2vz0OV1aqx6BV5FeaE
         c65hfULDuutHAYqkmVABCbRAimR0c6fdTC8xVrlPLwhlcF6UTO4pobkE9SKYVQiE5unn
         sjnT3KQMlJzzVsn5Ke/xsUmATuqteG1ZXU/ALABYiFfEfNvCo9cEqykmZTjWzQXPpgcc
         3wifwgLVuW79A8fAAbgX5hs1tyE25Y7MZ540jbkaSh6yXR6qWQib64JxSFIynmoqsEIi
         j6Jw==
X-Forwarded-Encrypted: i=1; AHgh+Rp52x3Z1HQ/AKZonBJhq6BRTND6THNCGXEdjwL8Jv2jrFpHrBKQyTl7IDrnmzismOP+teZlfNEDjJs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9tpXDunYHJEEZQCQMr4uLror1yfl30Yj/cBUjn0fv2W2kxFBr
	iaYHE/WzEwUnq8KFBwBfTLBFQInaZcW1tgK1Ue3p+C9UR2sR35mz/LGl
X-Gm-Gg: AfdE7cnshGcGV0z68XUHW126Jt6BM65jGt7fJlPCFNS1tk5kswIcHCS29tLeNI8pFat
	XFwJOA/W75+9Z3l7SPBys8KKPfasuZcANsTsLFMH+0X3k+D0+X0uZZEK/77vOIAV86eqVilhNOM
	XqKasJIyUuCeX/eOzgxi34NVM7dGBchsJ0RWiFyvTe4rRZFRFe0ldxXOwh2r1tAzpnMJoEn5SmR
	6wm3NJK40GJIsLi2kpT48s0KsOpIDaG5ip7I057/ZvpHw8xnNxWlJ5GzX/sKZQtwmQjxdqaSfZ4
	y/EDGpsk/jZX2AsXbvQfLa6fw5K+1B0RF84RHW0wv5/ISy7UjnTXLJkX7WyG0GBBE+UQd6zTGXf
	v+teunbSPToeTpMotAmck+OHJSaRZRDuM/lo9pb5sgvKDyYcvcqKNsn9wbq2yH6po9jCG1/IUkh
	s2kI+M91gIlVLjiJF/sIWDBes=
X-Received: by 2002:a05:6a00:4fcd:b0:848:695f:eefd with SMTP id d2e1a72fcca58-84c292d1e22mr1495628b3a.6.1784277012966;
        Fri, 17 Jul 2026 01:30:12 -0700 (PDT)
Received: from [10.125.192.114] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2afae3afsm587264b3a.60.2026.07.17.01.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 01:30:12 -0700 (PDT)
Message-ID: <eaf6a7dc-f0b5-a137-5c54-c15a9f632c09@gmail.com>
Date: Fri, 17 Jul 2026 16:29:49 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Nhat Pham <nphamcs@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, akpm@linux-foundation.org, tj@kernel.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org,
 mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260714081510.16895-1-jiahao.kernel@gmail.com>
 <20260714081510.16895-3-jiahao.kernel@gmail.com>
 <CAO9r8zNiT63LUHx8X5i_aboX1UWuGkcFf+p9ch-pekURUuDdXg@mail.gmail.com>
 <2bc8e4f6-46a0-5b74-6eaa-59e7aef9227e@gmail.com>
 <CAO9r8zOFg_mnNGbFFd_h8FAwRCbQ9vXk47EF5f1CLg1cDVGB5Q@mail.gmail.com>
 <b910e870-9583-a2f5-b681-e69edb9af290@gmail.com>
 <CAKEwX=Mdi5au5aXWdx3C7d1N4_3o2uiJh2sZ=sf6kpKAdtD1zQ@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAKEwX=Mdi5au5aXWdx3C7d1N4_3o2uiJh2sZ=sf6kpKAdtD1zQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/17 02:04, Nhat Pham wrote:
> On Wed, Jul 15, 2026 at 7:54 PM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>>
>>
>> On 2026/7/16 00:14, Yosry Ahmed wrote:
>>>>>> Test Setup:
>>>>>> Total memory: 32 GB.
>>>>>> zswap settings: max_pool_percent=1, accept_threshold_percent=50,
>>>>>> shrinker_enabled=N.
>>>>>> Allocate 512MB of anonymous pages and fill them with random data (to avoid
>>>>>> compression), then use cgroup memory.reclaim to force a large amount of
>>>>>> anonymous pages into zswap. At an interval of 2ms, allocate a 4K anonymous
>>>>>> page where the first 4 bytes are random numbers and the rest are zeros, and
>>>>>> then trigger a reclamation of this 4K anonymous page through cgroup
>>>>>> memory.reclaim. When the pool threshold is reached, shrink_memcg() will
>>>>>> be triggered.
>>>>>>
>>>>>> The test data after running for 120s is as follows:
>>>>>>                               Baseline         Patched
>>>>>> shrink_worker wakeups          5363             85
>>>>>> shrink_memcg calls       11,345,012        188,264
>>>>>> written_back                  40214          40275
>>>>>>
>>>>>> Conclusion:
>>>>>> Under the same workload and run duration, the patched kernel shows a
>>>>>> significant reduction in both shrink_worker wakeups and shrink_memcg calls.
>>>>>
>>>>> Please also include data from the case where zswap store failures are
>>>>> observed and pages go to disk, and compare before and after this
>>>>> patch. I think that part is also really important.
>>>>
>>>> I retested and added some collected information. Perhaps
>>>> `pool_limit_hit` and `pswpout` can explain that batch shrinking of zswap
>>>> can reduce the number of pages that fail to be stored due to the pool
>>>> limit, allowing zswap to skip zswap and go directly to disk.
>>>
>>> Oh I meant the other test case with high memory pressure where we saw
>>> a lot more writeback with this patch. Do you have similar data from
>>> that test case?
>>>
>>
>> Below are the results from stress-ng (high memory pressure case), which
>> lead to a similar conclusion:
>>
>>                                 Baseline      Patched
>> shrink_worker wakeups         5,640           987
>> shrink_memcg calls        8,481,500     2,504,818
>> written_back pages               260       768,576
>> zswap_store calls           2,742,756     2,301,414
>>     store succeeded (ret=1)     934,640     1,308,686
>>     store rejected (ret=0)    1,808,116       992,728 <-
>>     store reject rate            ~65%           ~43%
>> pool_limit_hit delta        1,181,310       101,593 <-
>> pswpout                     1,808,376     1,761,304
>> pswpin                      4,288,497     3,902,658
>>
>>
>> pswpout = store rejected + written_back pages
>> Note that pswpout comprises two parts: the store rejected count (where
>> we skip zswap and go directly to disk) and the number of pages written
>> back by shrink_memcg().
>>
>> Therefore, we can directly leverage store rejected to evaluate the
>> scenario where zswap is skipped and pages bypass it to disk. This
>> provides a much clearer picture than looking at pswpout alone.
>>
>> Do we need to include both sets of test results along with the
>> comparison data in the final commit message?
> 
> I mean, it helps your case no? :)

Yes, I will add both sets of test results to the commit message in the 
next version.
> 
> But nicely done. My understanding is, this batching of the global
> shrinker reduces overall disk swap fallback, correct?
> 
> Other than Yosry's comment, the rest LGTM FWIW :) Thanks for fixing this, Hao!

Thanks for the review, Nhat!

Thanks,
Hao
