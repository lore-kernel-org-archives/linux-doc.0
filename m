Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CE230D40E
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 02:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784170497; cv=none; b=JfGLYtbWJOuqcTXBRduVHwr9BC+/miuQFbIkG4SSPzETsttJdnOv35JVhiH4ms6RcOMy1VyIDYifLVMPt6MpApLcizlcZwqPvaHqvBfvj34jsqdcKZp5IUs8rVJl0v+HT4gQywANlhY/fXsQlzlRNFIMJVdeCBSTdHqUZr8TNtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784170497; c=relaxed/simple;
	bh=ZXltjYWRd3GC72LDHiJtxk/4tURo6pR4KrEPFHYNZUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bydC8ZFEWiZWAb22mL1af0nMb8o4c0DyRcoMMUcYF2O4lxvd4BX8pvXJLu6yQfU+/o0JQoovnyCVXQU7FeNLZeqbf850QMQkq2t6/HJk0rn7bIcIditC2e+zcR5cGK3HkmP7bAcCZTfJ5D4reCt9dXXQNytKxiWwXTwAVeu8oMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkWih8+d; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkWih8+d"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so101568735ad.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 19:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784170496; x=1784775296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O+M+DkQSkCWTSLDLxTihHDZGPSSRCJtMCVMSJqC4VhU=;
        b=GkWih8+d/drgBnEDQ5zBgcomuakqe/qR7TX/XyY2YPjIFnzoKZDMTeAEvEyJSwJ+i5
         sjcj8Z1XN2tQHP5pu7U/VJsxT8RslA4jgKAVUTNg2ox1rrZaMl5W+9sZ0P0/hPU8hJuO
         Byj5S2AcymPHOFK097cwzvZXf1Qh2K/6IWVvznmHAq9qck7TMZoDEbKXuaAjJGpr+glz
         QyyRBMvnoV0rojBI1KWSpUKfjH9DuqlvCc3Me6hUjtCAwLJTPyekUWE81KJ2QL1ivsrg
         wuObxAbEf5L7u6pb2Ht2z7YHoI3i9BAMorNDyNHQxBEXw2BCtZBJKXDfKQbhlFzkEOKu
         yQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784170496; x=1784775296;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+M+DkQSkCWTSLDLxTihHDZGPSSRCJtMCVMSJqC4VhU=;
        b=iU8kjsSkDIz9uJYHDACO1lCy7HVZAvkOPgysDhhCpFLp2UNQxSM0t5bZ9A8/G4sRPH
         smwbrF/i1eaoXCli+tmB0XYJkhpYL6FogkJ0rJ7MhIIxRRydmikoq8n4hmo3E5JxvClF
         E9n3Byzq6HxctovqZ2X+IONQ6KY1lfjHHbtihuySCCu/6qDnYbOLKG/DCBIqviXTG1YJ
         iVa0swH3KpTlRksz3AiudFtOnTrrpWwr7DrLYreRzv4pUzTKE9Os+OIWYcUs3DBaZSu2
         RCcLbILh+D6H03UmFDiHeAaAV9+JX+mkHR1apkENJPtC6MLOFRY5F/q73sIEQrShHn+p
         0J7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqkvtgW0xh1XAoxORwUSN+9EVuvmM5SPUsfL15nv9wHThacdwiUCrMgk04dwETau724xmeIMc2wqEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5r87JeA4gL+cLDh7fwYjuHj61J2HpFnCtq/5GzCsBF9j0+Vzx
	/2LdjT0/tJhVyX4YYevyseI2Ac7W8HsN6MuYCYTCPPolW1ApUvCtWFkk5Kf5eg==
X-Gm-Gg: AfdE7cnST/cNWFiKi353E1M3d/gBACv4mtFpyVpFZNKF0cl1DS+yzhOP4zILFQT3uvw
	ZSUK9wHNk65veVoRLjEeNbc6GwC5lCCz04KiKO+vDYVoY+TPPce5ka27ZhdOPOokbVpvvdgB0qM
	CteG+NjHD/lQW0h8YOp3igN1d3gLjz+GGvGe3BSx4hHnBdnsNprfw424LARV6mo14eS9gG41EUI
	eQWUnMtPpDQwrMDT1mhyX3ynTuNYHIf8ktcFo2cdzw12at5195JmKA1HlvdsIK9dD3B3AYCrGSE
	F4q6D728WqUwiu96luf3t9s50hkKLPvSw9O057+gEJkuU0IHm+pzcoi9KwZkiFOCZWiburWBIVy
	yfmveYcD1j608japLlnExHo4wOHfRCTLwtpn544vDAHVB5InZp4nibSZf2atdLrg75aHoOTq3kV
	rkatMBU2pEdYs+Runxhqxzuu4=
X-Received: by 2002:a17:902:cec9:b0:2ca:1bd2:d57b with SMTP id d9443c01a7336-2cef10f538bmr91527655ad.0.1784170495560;
        Wed, 15 Jul 2026 19:54:55 -0700 (PDT)
Received: from [10.125.192.114] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf10161ef2sm11913255ad.35.2026.07.15.19.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 19:54:55 -0700 (PDT)
Message-ID: <b910e870-9583-a2f5-b681-e69edb9af290@gmail.com>
Date: Thu, 16 Jul 2026 10:54:37 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Yosry Ahmed <yosry@kernel.org>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260714081510.16895-1-jiahao.kernel@gmail.com>
 <20260714081510.16895-3-jiahao.kernel@gmail.com>
 <CAO9r8zNiT63LUHx8X5i_aboX1UWuGkcFf+p9ch-pekURUuDdXg@mail.gmail.com>
 <2bc8e4f6-46a0-5b74-6eaa-59e7aef9227e@gmail.com>
 <CAO9r8zOFg_mnNGbFFd_h8FAwRCbQ9vXk47EF5f1CLg1cDVGB5Q@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zOFg_mnNGbFFd_h8FAwRCbQ9vXk47EF5f1CLg1cDVGB5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/7/16 00:14, Yosry Ahmed wrote:
>>>> Test Setup:
>>>> Total memory: 32 GB.
>>>> zswap settings: max_pool_percent=1, accept_threshold_percent=50,
>>>> shrinker_enabled=N.
>>>> Allocate 512MB of anonymous pages and fill them with random data (to avoid
>>>> compression), then use cgroup memory.reclaim to force a large amount of
>>>> anonymous pages into zswap. At an interval of 2ms, allocate a 4K anonymous
>>>> page where the first 4 bytes are random numbers and the rest are zeros, and
>>>> then trigger a reclamation of this 4K anonymous page through cgroup
>>>> memory.reclaim. When the pool threshold is reached, shrink_memcg() will
>>>> be triggered.
>>>>
>>>> The test data after running for 120s is as follows:
>>>>                              Baseline         Patched
>>>> shrink_worker wakeups          5363             85
>>>> shrink_memcg calls       11,345,012        188,264
>>>> written_back                  40214          40275
>>>>
>>>> Conclusion:
>>>> Under the same workload and run duration, the patched kernel shows a
>>>> significant reduction in both shrink_worker wakeups and shrink_memcg calls.
>>>
>>> Please also include data from the case where zswap store failures are
>>> observed and pages go to disk, and compare before and after this
>>> patch. I think that part is also really important.
>>
>> I retested and added some collected information. Perhaps
>> `pool_limit_hit` and `pswpout` can explain that batch shrinking of zswap
>> can reduce the number of pages that fail to be stored due to the pool
>> limit, allowing zswap to skip zswap and go directly to disk.
> 
> Oh I meant the other test case with high memory pressure where we saw
> a lot more writeback with this patch. Do you have similar data from
> that test case?
> 

Below are the results from stress-ng (high memory pressure case), which 
lead to a similar conclusion:

                               Baseline      Patched
shrink_worker wakeups         5,640           987
shrink_memcg calls        8,481,500     2,504,818
written_back pages               260       768,576
zswap_store calls           2,742,756     2,301,414
   store succeeded (ret=1)     934,640     1,308,686
   store rejected (ret=0)    1,808,116       992,728 <-
   store reject rate            ~65%           ~43%
pool_limit_hit delta        1,181,310       101,593 <-
pswpout                     1,808,376     1,761,304
pswpin                      4,288,497     3,902,658


pswpout = store rejected + written_back pages
Note that pswpout comprises two parts: the store rejected count (where 
we skip zswap and go directly to disk) and the number of pages written 
back by shrink_memcg().

Therefore, we can directly leverage store rejected to evaluate the 
scenario where zswap is skipped and pages bypass it to disk. This 
provides a much clearer picture than looking at pswpout alone.

Do we need to include both sets of test results along with the 
comparison data in the final commit message?

Thanks,
Hao

>>
>>                                 Baseline      Patched
>> shrink_worker wakeups         5,363            85
>> shrink_memcg calls       11,373,201      180,928
>> written_back pages            40,212       40,236
>> zswap_store calls            161,190      168,741
>>     store succeeded (ret=1)    102,743      127,644
>>     store rejected (ret=0)      58,447       41,097
>>     store reject rate            ~36%         ~24%
>> pool_limit_hit delta          55,826       14,062
>> pswpout                       98,659       81,333
>> pswpin                            2            1
>>
>>
>> Thanks,
>> Hao
