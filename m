Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63D9193438
	for <linux-doc@vger.kernel.org>; Thu,  7 Nov 2024 06:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730962053; cv=none; b=auV+/0TUgo1CEMw9ViNS8jvAN3Lib9T5sgT5v/v6Ha2bdtS8SAXRlF0TbjNN8qu9fxXpZdzGuF7ALkEcjpyWCFK6prig2VpB9WCdJ/3kXcU0p+mWqZScIDNM9gUzr70gtBlYPS7T/R3bx9rucQhK/XGE3bk5zbYc3MKRk4FVA+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730962053; c=relaxed/simple;
	bh=ocy21hewhSAxDYmjcwPkCD/e6H5tK1tO/YDxSNJA5gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHjykJYqsxUfOkea7LsyJh9IPbaewO6raTMGqHlpvo/mW+qrsyjrUpsZuUmHl0MRwTJ70GbLyA/vEhLHXun5n28/KyRWZ3R3vDpkkM0j48owdj1B1tZQQMifgTVzmAmZbTovdEhl00bBfMg6R9828lFJiQ9B4sTl8d+zufGWQHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=IGwfooxI; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="IGwfooxI"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-72041ff06a0so471203b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 06 Nov 2024 22:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1730962051; x=1731566851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4sYJYVbNn+8nZHewUYqHaSq6iJqGNPs8Z77SlmIpAU=;
        b=IGwfooxItxr2eZv0Z6GebPYXkNiKtZQTDa9+C3jDPMSvd/nreT/SlUrmCsqHMsEl8R
         7c75cPpXaqCny/fci5KFlGzHiAxNlUddAKefRPmnjedzIfmCk1p2PEHiYfIaLbUzJOEE
         1XiVsRDxPbSyelvE5M/qPlRwKw+/VsuqsXYsD6v0dtpSlS2HcwWMyokYhwzh3ND4moY/
         weS3OEE0Kji4mKge3Yid4t6k+jujD1MhNQag1LmNOtvWwV7vkjFxo2duEBf/FfyE4aTq
         0R75mpU43oVS4RNy2MD0iQWIp5PrZrO+03MAj6I8E25kd/fGADokFuecyqZ/xtp+EsHo
         cb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730962051; x=1731566851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4sYJYVbNn+8nZHewUYqHaSq6iJqGNPs8Z77SlmIpAU=;
        b=rWfWKq9UtGTOJqEgzKAcVQukHN6MT3Cg9OtfIF088NusLPskrNiAFjxcDrONovErzW
         FOhKSUeQfnXpGT4Wa5WbcFjV87pb8iJG2S1sAB7757NdaJsc0HejaJMBVLAfCYAcoCAQ
         KW1J9VKM8HzvwteXeOoicQPBzUWlXkKc7rGI2aBjfyoQqggqdbD6qU7fybKcDlUsB4mb
         6QkDN2HajAw9eAwQ+7xyRfUFXzySuINF5ajYjDA2D9OHVskS2GXJTjAXwrJs+FZFG3xN
         zYXr1tjSY2riig0KaIOh//2Mf3PdVgecTGqd4wPZSQkVMRw5S0mNFmS0V+btYQjUJSCz
         ydRA==
X-Forwarded-Encrypted: i=1; AJvYcCVs8jufQNI2zZGkfOZi9qYx3MaJ+PV4/ObHeGnCKHz5jJ3Kfiiim7klCpWW+XKZ40wFtcgQjQCQmXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxrToCj+Mzr9zr1vwdITKa4qph1f8ijtMX+0MRXolyJHp6XIhz
	e8SAI/Us373e84B/CJwc4Xkqv8f68Dl3omp0geVqpJUpWhKEJIzDZmABla1OX8k=
X-Google-Smtp-Source: AGHT+IGp00cwnqhnTxAKDFFNKj94JDLmBpGJ7s9/Sh6DkVmQYzY5A32qRipE+c1ujUWd9JYadTCp2w==
X-Received: by 2002:a05:6a00:3917:b0:71d:e93e:f542 with SMTP id d2e1a72fcca58-720c9990c4amr28075226b3a.21.1730962051155;
        Wed, 06 Nov 2024 22:47:31 -0800 (PST)
Received: from [10.84.149.95] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078ce169sm722303b3a.86.2024.11.06.22.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 22:47:30 -0800 (PST)
Message-ID: <356ef11a-02aa-4661-b8af-4c72cef5c9b5@bytedance.com>
Date: Thu, 7 Nov 2024 14:47:21 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] docs/mm: add VMA locks documentation
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Alice Ryhl <aliceryhl@google.com>,
 Boqun Feng <boqun.feng@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20241101185033.131880-1-lorenzo.stoakes@oracle.com>
 <CAG48ez0qsAM-dkOUDetmNBSK4typ5t_FvMvtGiB7wQsP-G1jVg@mail.gmail.com>
 <2bf6329e-eb3b-4c5e-bd3a-b519eefffd63@lucifer.local>
 <5969f498-a515-4394-a2b6-5d3abe2872aa@bytedance.com>
 <ad882462-0ae9-4ca7-bbf7-7728de71c422@lucifer.local>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ad882462-0ae9-4ca7-bbf7-7728de71c422@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/11/6 19:28, Lorenzo Stoakes wrote:
> On Wed, Nov 06, 2024 at 10:56:29AM +0800, Qi Zheng wrote:
>>
>>
>> On 2024/11/5 00:42, Lorenzo Stoakes wrote:
>>> On Sat, Nov 02, 2024 at 02:45:35AM +0100, Jann Horn wrote:
>>>> On Fri, Nov 1, 2024 at 7:50 PM Lorenzo Stoakes
>>
>> [...]
>>
>>>>> +
>>>>> +Page table locks
>>>>> +----------------
>>
>> Many thanks to Lorenzo for documenting page table locks! This is really
>> needed. And at a glance, I agree with Jann's additions.
> 
> Thanks!
> 
> Will be respinning with all comments taken into account relatively soon.
> 
>>
>>>>
>>>> (except last-level page tables: khugepaged already deletes those for
>>>> file mappings without using the mmap lock at all in
>>>> retract_page_tables(), and there is a pending series that will do the
>>>> same with page tables in other VMAs too, see
>>>> <https://lore.kernel.org/all/cover.1729157502.git.zhengqi.arch@bytedance.com/>)
>>
>> Thanks to Jann for mentioning this series, I just updated it to v2
>> recently:
>>
>> https://lore.kernel.org/lkml/cover.1730360798.git.zhengqi.arch@bytedance.com/
> 
> Yeah I need to read through a little bit as I was unaware of these paths (mm is
> a big and sprawling subsystem more so than one might expect... :)
> 
> Could you cc- me on any respin, as at least an interested observer? Thanks!

Sure, will cc- you in the next version. ;)

> 
>>
>>>
>>> Ugh wut OK haha. Will look into this.
>>
>> Thanks!
>>
> 
> :>)
