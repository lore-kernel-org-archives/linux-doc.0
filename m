Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41913CAA47
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485768; cv=none; b=r25ieysxuVuU7OdbXFKp/cv/Y9vQPkq+b2V0bRRxBxDkxWI5kTMc8BA1CHad6vXuAQlMpmEO+wllcJbDDYaEXKlJFWyd6+WmICncy6RBWB7yedZbuioyCpQzmRNxzE77G9/m7He30y3b/gm8d/d2sA4lPqmDrz+M/n3/txd0mXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485768; c=relaxed/simple;
	bh=PBmzY9Mio4AslOoNANTOa4rcMBhtLC4qWVMb7zbJVnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAvr6dQUrlxkroFjH4GbFQ7SM8N1FZXvlZ13bcf0CXUnL8DTV5G2mEbPltmQ5ekW2/n0Ca+76zG5wHHkNoMFQym/JYoh8FvniXFmnEUTUB6rl6BmPfMXgq2fYYHgjnNTRknl7CjudiFf5F0I/7HW6LpVUY9IZW0LxOzKyxnwa9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObJVdzjS; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObJVdzjS"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso3250412a91.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 04:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780485767; x=1781090567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZSbyRe0Cm9MsW0vFwS1Xzmiqu2z6riqDTx2v5DdObE=;
        b=ObJVdzjSvhTIWJj7/3c/m8bi+f0C2SYaSqu+iKtGTf3LHbWzpBW9+ojBk6ujAIFmdE
         mZ/aqeZrFXAH3QeZre45anP8DL3jK7wcSKJoIjORqHQUCX92yNXt7W1KWdCTxePYhGiq
         k//BKLdn+lHVyvbHVV5kOE4teL7Jx4UPo1Nni8iRi49lUs1zvKTac9Bmb61jMMEwN9Im
         61aOHtimiy0N7Y92wlR0dzqxZ8oeVAPKuJzmD4/tPD/JeS4dlxHmiIAuqMQddm5SnU0Q
         5sI3xYDXGjsM7o1syNHw8eKE/2/DHCvxMtcgbfaTF/ZRTmlEpj/mzYx5194ZeAzcJod2
         2oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485767; x=1781090567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lZSbyRe0Cm9MsW0vFwS1Xzmiqu2z6riqDTx2v5DdObE=;
        b=sBDhHYfeRNEcsXQl92DHGhGwQ6GI63WlhTcuUG6/5XQu+MvsoS+aggo9dR9B+R7aHI
         2wJ9Mmbwf/1yVcvL5scPkzzOxWrJiQWHFWj9y5ULVSHQCJfzX4sELWZ8s9+JXLINvT0N
         KikcXTX7YB7pgIahk0GmmMZUTk2dB3Z87O24OZ6Viag4XPcqZN4W/2N/rJ6l9LP1mkei
         c2HihhP+ePmyYiDBAoFP/Em5nLyY+F3i1TPrwCv1wVfST0Og8Bio6oBIRtGkuc+gMz71
         OJWOeOYm6cArUzHTFlYMTc8BZE0Bb1wmi0iDEzsReyvNJbTYJ2weP3sKyV47/AgxrOwF
         aN8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8UC/V5u43pt25+zG1EPUvBYFNtrDzC5lZJNkuHRxW/aamto8ktf3kHMZ1gY4MXVB79Vu9Of0YtOxc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqy8L/Zf+XlxOeprZfXaVGc5HNISLKolsg2dfb6gDnbgfjF1Hs
	5gq47UDnCaTUasGPeb7++I7BNYiaMAWbgVvKtvmidE5/6oySVavxxK6W
X-Gm-Gg: Acq92OETDDn+uAOB5ReZMyNGKzt4i9tqQKs/P9vupbTkkhi26IAnRDqn977Pl53Lnrx
	WHwROeNBsWT7JJbmoDFmv/nqjUeHaDNkMacyY+hlKz6ayfxe5FDyLFvb72xNo+OUgfTk3H0gKBl
	zts9haoFmERi0oEXL/Jra9uuU1Oua+gZgqoJWTOFAdDEuKFzXxe0kSbGDlHPpX9q0cQKUchrBRl
	T64bRii0tlCl2yzYItR+1O5yFmKo+DE36GMUYhf4rReFXdtwt4cUc7+BSV3T7U/tSMG04Fs2aRx
	dT/uBbsiadFORWv1ltGnxYHFJ+BNdrsIkHM9HHAl/xfrOdVUqmhfTogm0Xg699t8o6i4QKNGuTA
	hJFubMnLrankh0alpCHKYlO3B6w1c+ArEpj2Vvgh0W7go7g0z51WuqDGciYJ8q81NveTxey4mvD
	FpFzPNMhg9u+ueDVtmkJ4F/GuOP0twXoj/a3WXv+Z2Nc/9Rb1tlvJfOfGP0NXU08fE
X-Received: by 2002:a17:90b:4b47:b0:366:5c38:fd61 with SMTP id 98e67ed59e1d1-36e32f1676amr2884302a91.12.1780485766827;
        Wed, 03 Jun 2026 04:22:46 -0700 (PDT)
Received: from [10.125.192.75] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e6b904c88sm802459a91.0.2026.06.03.04.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 04:22:46 -0700 (PDT)
Message-ID: <6deeaea7-3cd1-4403-29fc-d2dc55c297f8@gmail.com>
Date: Wed, 3 Jun 2026 19:22:36 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 2/4] mm/zswap: Implement proactive writeback
To: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-3-jiahao.kernel@gmail.com>
 <CAKEwX=MQe_KFZe2vBXQYh0aa-x+E8AzNwmyjJGJk4tDoS9ML3A@mail.gmail.com>
 <aho_VtLCmIRsNyvO@google.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <aho_VtLCmIRsNyvO@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/5/30 09:40, Yosry Ahmed wrote:
> On Fri, May 29, 2026 at 12:58:09PM -0700, Nhat Pham wrote:
>> On Tue, May 26, 2026 at 4:46 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>>
>>> From: Hao Jia <jiahao1@lixiang.com>
>>>
>>> Zswap currently writes back pages to backing swap reactively, triggered
>>> either by the shrinker or when the pool reaches its size limit. There is
>>> no mechanism to control the amount of writeback for a specific memory
>>> cgroup. However, users may want to proactively write back zswap pages,
>>> e.g., to free up memory for other applications or to prepare for
>>> memory-intensive workloads.
>>>
>>> Introduce a "zswap_writeback_only" key to the memory.reclaim cgroup
>>> interface. When specified, this key bypasses standard memory reclaim
>>> and exclusively performs proactive zswap writeback up to the requested
>>> budget. If omitted, the default reclaim behavior remains unchanged.
>>>
>>> Example usage:
>>>    # Write back 100MB of pages from zswap to the backing swap
>>>    echo "100M zswap_writeback_only" > memory.reclaim
>>
>> Hmmm, so this 100MB is the pre-compression size? i.e if this 100 MB
>> compresses to 25 MB, then you're only freeing 25 MB?
>>
>> I'm ok-ish with this, but can you document it?
> 
> That's a good point. I think pre-compressed size doesn't make sense to
> be honest. We should care about how much memory we are actually trying
> to save by doing writeback here.
> 
> The pre-compressed size is only useful in determining the blast radius,
> how many actual pages are going to have slower page faults now. But
> then, I don't think there's a reasonable way for userspace to decide
> that.
> 
> I understand passing in the compressed size is tricky because we need to
> keep track of the size of the compressed pages we end up writing back,
> but it should be doable.

Agreed. Using pre-compressed size is probably easier to implement. IIRC, 
interfaces like ZRAM writeback_limit are also calculated using the 
pre-compressed size.

I'll clarify this in the documentation in the next version.

> 
> If we really want pre-compressed size here, then yes we need to make it
> very clear, and I vote that we use a separate interface in this case
> because memory.reclaim having different meanings for the amount of
> memory written to it is extremely counter-intuitive.
> 
Agree. This would indeed break the semantics of memory.reclaim. I will 
use a separate interface for proactive writeback in the next version.

Thanks，
Hao
>>
>> The rest seems solid to me, FWIW. I'll defer to Johannes and Yosry for
>> opinions on zswap-only proactive reclaim.
