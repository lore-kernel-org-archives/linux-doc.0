Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942FC2DAFCB
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 02:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539123; cv=none; b=PQxZrtNkKBZWT9eNutUb2QSF4KZl2Pd/lZjPSurEAgLWeFAxljxYea53Kk9gr5YXSyCjp8svquNBQtoS73WjwKkctR3BBDBCcJEl3olfSu1QZfBzMDu1zjcMgiOszb/Sj/D+22oaPU1eUymCZG967eW3aW86C5AA2DBIuh3cUS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539123; c=relaxed/simple;
	bh=pfu0XBliitmT90qC4mnmnZe/qaWtHxzRCoJUBx1uXGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=puu/tzKeLI6h5s2IC1rt1MeKPa9/dqBM0/+/PgyMc+jO+LCSlSDADhqkagM8Ynb4v3rbA214qPemubGoSRHFlGFeky0s9fBE8lr7C8LNkSLkvaek/FmFejnFcjN4IeFAdC211hBcptUxOwamsSEp23s8k3virS7t5LxIhjld8NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZqgqLen; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZqgqLen"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36b9d265355so67710a91.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 19:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780539122; x=1781143922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SZO2PTw2KcbXgjzwwx+KH4Kf8JNmzc6dqKetjt7KYo=;
        b=TZqgqLenHg40dCHs1JO2CIp+lkzAD6twlAI9eAF4rrMloTmDvy+LiqLg+uC6Tqoq0W
         vEfkLzcLTSGxzzUCBgA93HzJuWDtsYNl6Vv95PHB+wPDh+B/OWlfGgcy1eHNf1izyNnF
         z+V1aMmigesigFzEl58+P3pZk2VMFPt5AXi0HLqpuROyEGDOrMJVaJd3ZGdM3+/DY5Y7
         6WtDzU5UpQY7w3dEwjt/GCFnTjE1+KB7/SoFH9E4KU2Q/VGiGZhJ7NGAPmA8FB14Gc2t
         AiXwvvM8t2pZ37EclkH6PTmLHu1vGymVEY0nXpc/8enm0oTXDUiyCY2ZyUa/y2WpSrAt
         rC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780539122; x=1781143922;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6SZO2PTw2KcbXgjzwwx+KH4Kf8JNmzc6dqKetjt7KYo=;
        b=O6XEyEb/Qwe9oNVx78N8A7+C0c6UGbmL3folm3uMTVsuiyr5GR3e8shflJAnWJSH9f
         51ak5KlqQwGbh99I9Y3edUnyvu/pFxrz/+quvTKfRDii67km/uaKmjPwuyRyQLsB+Rdj
         U5iqWyILLHZCUvQMbZQSi13WnopwIOgcU/LsUC8mgYThM15OG+31azBFsFalWuT90OuX
         L8Le73eCZ1gI1SYrgwhyTw0wtzErI2DSuoGCg9xo8IXvVbN95bAE0f0M7goeodTrVRwO
         TcypRQ10yxj1qsaQQLYLxOLSnYi6mTG910xfyEgQaNoACWfulkZJStLjvscZlXunnn6D
         jX4A==
X-Forwarded-Encrypted: i=1; AFNElJ+x8iU7YyJ7a5WY2ulAt6PIOLHQsVfFdhggPBd6OzTi1IEzTY9eUZVauHS6lbfG/vEvQebbUQHredI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOclVN5aJdkqG0z1eNWM2bjGCkTF8FRimZDUmVQ7WrbIe0maj6
	5JmechUaGzW/3jx+kU0TS26Z98mTwhqH7G40MfYLlkaU7rpP0pgpxpe4
X-Gm-Gg: Acq92OFERKJybQrR3HHHNG69M2Smtm0JMMeNOokkhXt6LvMZOMfxu+QHzNR2s/SG7Js
	l/aqufK3SiaABJ3zxx7TeAXnLXV49Cnm6voa41rPS1htOkV/2ieuzWMh4ymyARcBtZAFFTEuVy0
	wcpdZGUZb1yvS6ieQeNtmC0MTlNXKEGYVbk0IJJsFzzOidx7tuUX8g86LnOYol665A/+iq5P4bP
	ATcyY8Vda1mPzjN7LI5Tvx8DuMAa8I0jkdq7hzjx2aXIuBe81WH5I5VizthDaJ0ppcb1Z/fRuEW
	QWkefo5ArshTKT6ju66mD3vELZPc7PEs0sw07vhTHDZl4f69vvqZRpXC56reI568Rl0GzS4bjKU
	wsJzjzXSrSa7v9qRFZpi14jdfwmEbw5Hnks+7VbmO/DvvBzjOfrzr2YkaI1G8kv1AfULyqovGo2
	0Gvge/vBBfQ59zYkFj4H5OwdwGinwjdxX8qlKiLFx2nz6++RZZL66KSA==
X-Received: by 2002:a17:90b:4ac7:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-36e30a2adf0mr5186933a91.18.1780539121743;
        Wed, 03 Jun 2026 19:12:01 -0700 (PDT)
Received: from [10.125.192.75] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f68b03ef6sm1101582a91.0.2026.06.03.19.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 19:12:01 -0700 (PDT)
Message-ID: <6db27a22-cc7a-9a94-db3f-c912fd39aa32@gmail.com>
Date: Thu, 4 Jun 2026 10:11:43 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 2/4] mm/zswap: Implement proactive writeback
To: Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, akpm@linux-foundation.org,
 tj@kernel.org, shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-3-jiahao.kernel@gmail.com>
 <CAKEwX=MQe_KFZe2vBXQYh0aa-x+E8AzNwmyjJGJk4tDoS9ML3A@mail.gmail.com>
 <aho_VtLCmIRsNyvO@google.com>
 <6deeaea7-3cd1-4403-29fc-d2dc55c297f8@gmail.com>
 <aiBqzOtEv5iAC_qC@google.com>
 <CAKEwX=OhxUxRCEfvZMnWzXy=Fa4jgzL3DuP-RmaVzdK65m4bew@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAKEwX=OhxUxRCEfvZMnWzXy=Fa4jgzL3DuP-RmaVzdK65m4bew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/6/4 02:14, Nhat Pham wrote:
> On Wed, Jun 3, 2026 at 10:58 AM Yosry Ahmed <yosry@kernel.org> wrote:
>>
>> On Wed, Jun 03, 2026 at 07:22:36PM +0800, Hao Jia wrote:
>>>
>>>
>>> On 2026/5/30 09:40, Yosry Ahmed wrote:
>>>> On Fri, May 29, 2026 at 12:58:09PM -0700, Nhat Pham wrote:
>>>>> On Tue, May 26, 2026 at 4:46 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>>>>>
>>>>>> From: Hao Jia <jiahao1@lixiang.com>
>>>>>>
>>>>>> Zswap currently writes back pages to backing swap reactively, triggered
>>>>>> either by the shrinker or when the pool reaches its size limit. There is
>>>>>> no mechanism to control the amount of writeback for a specific memory
>>>>>> cgroup. However, users may want to proactively write back zswap pages,
>>>>>> e.g., to free up memory for other applications or to prepare for
>>>>>> memory-intensive workloads.
>>>>>>
>>>>>> Introduce a "zswap_writeback_only" key to the memory.reclaim cgroup
>>>>>> interface. When specified, this key bypasses standard memory reclaim
>>>>>> and exclusively performs proactive zswap writeback up to the requested
>>>>>> budget. If omitted, the default reclaim behavior remains unchanged.
>>>>>>
>>>>>> Example usage:
>>>>>>     # Write back 100MB of pages from zswap to the backing swap
>>>>>>     echo "100M zswap_writeback_only" > memory.reclaim
>>>>>
>>>>> Hmmm, so this 100MB is the pre-compression size? i.e if this 100 MB
>>>>> compresses to 25 MB, then you're only freeing 25 MB?
>>>>>
>>>>> I'm ok-ish with this, but can you document it?
>>>>
>>>> That's a good point. I think pre-compressed size doesn't make sense to
>>>> be honest. We should care about how much memory we are actually trying
>>>> to save by doing writeback here.
>>>>
>>>> The pre-compressed size is only useful in determining the blast radius,
>>>> how many actual pages are going to have slower page faults now. But
>>>> then, I don't think there's a reasonable way for userspace to decide
>>>> that.
>>>>
>>>> I understand passing in the compressed size is tricky because we need to
>>>> keep track of the size of the compressed pages we end up writing back,
>>>> but it should be doable.
>>>
>>> Agreed. Using pre-compressed size is probably easier to implement. IIRC,
>>> interfaces like ZRAM writeback_limit are also calculated using the
>>> pre-compressed size.
>>>
>>> I'll clarify this in the documentation in the next version.
>>>
>>>>
>>>> If we really want pre-compressed size here, then yes we need to make it
>>>> very clear, and I vote that we use a separate interface in this case
>>>> because memory.reclaim having different meanings for the amount of
>>>> memory written to it is extremely counter-intuitive.
>>>>
>>> Agree. This would indeed break the semantics of memory.reclaim. I will use a
>>> separate interface for proactive writeback in the next version.
>>
>> But doesn't it make more sense to specify the compressed size, which is
>> ultimately the amount of memory you actually want to reclaim.
>>
> 
> I personally prefer compressed size to pre-compressed size. That's
> kinda what user cares about, no?
> 
> One thing we can do is let users prescribe a compressed size, but
> internally, we can multiply that by the average compression ratio.
> That gives us a guesstimate of how many pages we need to reclaim, and
> you can follow the rest of your implementation as is (perhaps with
> short-circuit when we reach the goal with fewer pages reclaimed).

Got it. I will change it to use the compressed size in the next version.

Yosry, Nhat, should we continue using the zswap_writeback_only key to 
trigger proactive writeback?

Thanks,
Hao
