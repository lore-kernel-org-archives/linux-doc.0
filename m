Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39B23D75AB
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 08:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778746398; cv=none; b=YUtLCo+QuwoMdWoBBfyPD7b7dcHwbobQu7WpGXBvjd5r5yaTpiO7HSJTFYX/e++fKrB074IK9A7oyppP0mCT2b1LTV6piYhXV6K6LqBPBAfs6LjE6r79r+EZydMRJynVkNGhSDnFpHHjvMTbUFWlGlojENBtliuDhTFGBEo7qS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778746398; c=relaxed/simple;
	bh=NcPxqFXtdJSzLFs+u6XpxtuRnOT77nJVdPY9bb2XxnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JACJ+laM/+zqlI5UsE5zZDZ2qFF/gYS/Nh2IY/nmHLHqLEmDbIUQT3Sy6SfSC56R5+II5Igo7zlJkBX9SaFrCHPgyWhVDjx4gHtWwGyUdKN6RSTipkvHqqMy9lGp1+XbBdSDWSjClJCKn/tn3nYklAVoijgpvYd3o7nA8m/KQzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijtfEVDS; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijtfEVDS"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-83f249dcadfso152714b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778746396; x=1779351196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0M2iptptb250Psp+ZWNGxv8OhRpj/x6t+2FKnbK4Kg=;
        b=ijtfEVDSeR+8p98ogDKwIpLL/wzJTcZrBnnkFwrrocc9hSKAhqmGfj7ICSbwVZirYk
         yfq2cte9rYV1b0dFWbWUiH4MRnO7dmSWX+lzqiaAuczCd20EuJhBphYE9QxAgeO3EDzO
         HV9yEy+HCJY+hXQYxgCGW/PPWcyy+JP3gnVAhTMFfL2Mzy2hYOFRfu/4WzfsMs53of71
         uHibkJ67yACYGZ2o5KkFDygFCut01io2NGJ+o0A4P11t/tdRUMi0efDK2ywQUqNIe37l
         3/cLaKsZ0o2ea0xK6ZWmIivFu0bYMKBrb5MArycaU8mAhKbGNtjsw7/uYJEYNXMpOjzY
         bSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778746396; x=1779351196;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i0M2iptptb250Psp+ZWNGxv8OhRpj/x6t+2FKnbK4Kg=;
        b=o4GWJr63yJDhavM6/0v9I5W2QoujGur/moBdjcPTRwec7/PQVW1BxW58nuHrmu/j/l
         VygWgDSC6Yl8ZcXv00hB35GFrYPuOHAPEjJ9AjDw1w/TjbcN4aflYkmB/FclW7XiE3V5
         SbsPHul4GRsL33qRvPB5GiGa11IGjlwuc6m0S0a7POs4nhzotmraZPiC3HjYhrTZqmgl
         nO0Dapn3MBvF9rnrNzVml5HsW0kWeep1Pz9mB21nVAxwSkhSG+kXWA0ROB9hXXuLktYX
         JTRBLQ5CvUWKGOAAyprIVPfHej+AtSZvROYpZGtaKm0FEQlGOh3RttX/Ryks7zmg1IPz
         Gubg==
X-Forwarded-Encrypted: i=1; AFNElJ9zXJoV3PK2ARWSLqEq8A34Z8YLz36uf7YTBJHQtf6F1yH8Gf3XieNiJwaYcV1BosXywR9P9EflRug=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWRX9HSK95a/q2W8LXQX98Ykk8hztzSE8THbVOGyoWq/dKWF9G
	XRTq1eRN7Jakq6nLH0pmBNeXH4HjCBLgkyBb6rxAsGFvRKXy6UfQEhVi
X-Gm-Gg: Acq92OEUZ4LZoc6rbWqK4JDAi0Dhw0gJtChiVaxkKei/upz0NdDlNaHE8cRls6KWB7t
	KeCRLrGH1ZtkG9ZxSwZRf3BKf5I3hXK5qTaR+9vxkUYWiggCFMf8gLzobPsM1nwWUiH5L895TOA
	hZ2OQNWmJDpl8uc33qeKYSn7/0lbGGBdKHQIGffbBHkvfdRvCf0GhuqYgmIgE6mVw79QKuwPzjd
	ts/G/KeaTVyM/GzdG8X8BKLPhGoKRMrnJCSbaa4scFByuwZL+CLAAEATrZrSxUbt4Rq1jr4PsDV
	OVQzVoyrlCWEa1Tt/5NkWI4ASi3HCLxeX2XSC7nYuVbmVPTwoH9y3688BwuxU0tju/YrgvZ+XNH
	C9Fq/mr3ams6ahjayWEIZXMtOlLNFcZYoKhqu3oA5sydxQjXmTdsAHpsVXBBuGTS/gmEi00ATER
	c98PVvB1uQPyfgwwMadPe4/JfbrY0zhvrxT4oOBhZrsk8=
X-Received: by 2002:a05:6a00:4ac8:b0:83a:7565:3505 with SMTP id d2e1a72fcca58-83f03e95beemr7192464b3a.8.1778746395930;
        Thu, 14 May 2026 01:13:15 -0700 (PDT)
Received: from [10.125.192.65] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cd19sm1845320b3a.54.2026.05.14.01.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 01:13:14 -0700 (PDT)
Message-ID: <8fa07929-ed41-b716-c888-0368f883a020@gmail.com>
Date: Thu, 14 May 2026 16:13:03 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 2/3] mm/zswap: Implement proactive writeback
To: Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>,
 hannes@cmpxchg.org, mhocko@kernel.org, tj@kernel.org
Cc: akpm@linux-foundation.org, shakeel.butt@linux.dev, mkoutny@suse.com,
 chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20260511105149.75584-1-jiahao.kernel@gmail.com>
 <20260511105149.75584-3-jiahao.kernel@gmail.com>
 <CAKEwX=PLFRkfUvZyaYfwBv0QJ-8KAktvZvGA02Hod04H-RsS-Q@mail.gmail.com>
 <CAO9r8zNOPdpJuTmccvQ6ZAVS+tXxp-_ofA765DbnfaUZOPPO-g@mail.gmail.com>
 <12e4784e-2add-d849-7e54-bde8abfa6e78@gmail.com>
 <CAKEwX=MOixJAUGiwUcMQa0Stvg-mR-MvpDRD8WA4YMtRvnUYTg@mail.gmail.com>
 <6fc7fdf0-368c-5129-038e-623f9db2aa88@gmail.com>
 <CAO9r8zPvgB-MG2ufmdn4HoS+QEPBAehU9u7fQmYs+47NF-C9aw@mail.gmail.com>
 <CAKEwX=OY_nws-vf3VgnD54G205TK2YjkoAwRCyB9jvW=Oz3PpQ@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAKEwX=OY_nws-vf3VgnD54G205TK2YjkoAwRCyB9jvW=Oz3PpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/5/14 04:53, Nhat Pham wrote:
> On Wed, May 13, 2026 at 11:55 AM Yosry Ahmed <yosry@kernel.org> wrote:
>>
>>>> Zswap objects are organized into LRU and exposed to the shrinker
>>>> interface. Echo-ing to memory.reclaim should also offload some zswap
>>>> entries, correct? Are there still cold zswap entries that escape this,
>>>> somehow?
>>>>
>>>
>>> Yes, the memory.reclaim path does drive some zswap writeback, but
>>> it is not enough for our case.
>>>
>>> 1. For a memcg that has reached steady state (a common case being
>>> when memory.current is below the policy target), the userspace
>>> reclaimer may not invoke memory.reclaim on it for a long time,
>>> and so no second-level offloading happens through
>>> memory.reclaim. In this state we want
>>> memory.zswap.proactive_writeback to write back entries that
>>> have sat in zswap past an age threshold, to further reclaim
>>> the DRAM still held by the compressed data.
>>>
>>> 2. Even when memory.reclaim is running, the fraction of zswap
>>> residency that ends up reaching the backing swap device is
>>> still very small for many of our workloads, and the userspace
>>> reclaimer has no way to participate in or control the
>>> granularity of zswap writeback. So in our deployment we prefer
>>> to leave the zswap shrinker disabled, decouple LRU -> zswap
>>> from zswap -> swap, and use a dedicated proactive-writeback
>>> interface that lifts the writeback policy into userspace where
>>> it can evolve independently of the kernel.
>>
>> To be honest I see the point of proactively reclaiming compressed
>> memory in zswap. If you use memory.reclaim, you are also reclaiming
>> hotter memory in the process, and you are not necessarily getting as
>> much writeback as you want. The memory in zswap is a more conservative
>> choice for proactive reclaim because it's memory that's guaranteed to
>> be cold(ish) and not being accessed.
>>
>> That being said, the interface is not great any way you cut it :/
>>
>> I don't like the 'memory.zswap.proactive_writeback' name, maybe we can
>> stay consistent by doing 'memory.zswap.reclaim', but that just as
>> easily reads as "reclaim using zswap". Maybe
>> 'memory.zswap.do_writeback' or something, idk.
>>
>> I also don't like having two proactive reclaim interfaces, so a voice
>> in my head wants to tie this into 'memory.reclaim' somehow, but that
>> includes adding a pretty specific argument (e.g. 'memory.reclaim
>> zswap_writeback_only=1'.
>>
>> I don't like any of these options, and we also need to consider what
>> the memcg maintainers think. I see the use case of proactive writeback
>> but I am struggling to come up with a clean interface.
>>
>> I also think we should take the 'age' aspect out of the conversation
>> for now, it can be a separate discussion. Well, unless we decide to
>> tie it to memory.reclaim. If memory.reclaim broadly supports age-based
>> reclaim then zswap writeback can be a natural part of that without
>> requiring a specific interface.
> 
> Yeah perhaps extending memory.reclaim is best... Sort of analogous to
> the way we have swappiness to balance file v.s anon....


Thanks for the suggestions, Yosry and Nhat.

My only concern is that if we eventually need to add more parameters to 
zswap_writeback (such as age or others) in the future, would it make the 
parameter parsing and the functionality of memory.reclaim overly complex?

As you mentioned, if the memcg maintainers have no objections, I will 
attempt to implement it in v2.

How about something like this?
echo "100M zswap_writeback_only" > memory.reclaim

Thanks,
Hao
