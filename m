Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA8A802
	for <linux-doc@vger.kernel.org>; Thu,  7 Nov 2024 07:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730963263; cv=none; b=j7/ov6ZTLIka5stW8l3Ugndqg40FZsyJpDkm6DtsUdNC6lnsoATMa0OrPkymBe5TtX5ovSV0zbWO7x6xyfcyuc0to7ALBGn9i7vkWqyLZdJxl02fKyr3r7WaX9c8MzaWjDewO3UROzam/UWkXbiay5uAdlEYlKW76R96Xt1ntrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730963263; c=relaxed/simple;
	bh=NYEYaszDCKS6MIiIuxuXn81pOqKy8MbBGIZkvXZMufI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uF7huU9DwTsR+qEJGvItTozjykbF/E1Xr0JJdAGnqyujDiIQEb6ECXi/JmSEHtYLUff065cnRJytEGtnpg1cHOm2SEXjLyWk5KU8mL+NXTTbXibpx/5I8Y/lz+vjcRgWRjLHQ+C2eB3FMmzceOJ9Z2sLZscZg9mkX5jNAUbAoIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KKR17yro; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KKR17yro"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-656d8b346d2so481518a12.2
        for <linux-doc@vger.kernel.org>; Wed, 06 Nov 2024 23:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1730963261; x=1731568061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t9J6ZkVLkF9TjYcxor30Dw8R0oFPmno4Aqm71Ans3kY=;
        b=KKR17yrog/KDtRshwJRhQviUDHtks3uUp39ng9SGrhvwa7cfY/faa2aZeEUYGke1eZ
         4LyNypexRNdMRe6/zqy6tIh/I9vV8Azg79XfXQdj4Wlmp7ns+q+uKqjCNU1Gbas59p4e
         tGZQjfzzFNim5f0cTMZVpXT4gThkIC3/X0APSQZc9kDzLeFp4XQRqFEw0mxtWl1CPuko
         7NFZ9XN8MmQOG5xxD44zwoSYMJxWX96qXv4z8scMmGYJODqieVLUQN515dXJryC9yqvG
         8wcME2PS4qK0ujB3r52KZcw7LTBR3SMasw/jlNtJ93k6tUg9VSwFyTEpjaqLFGHDVg8h
         uumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963261; x=1731568061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9J6ZkVLkF9TjYcxor30Dw8R0oFPmno4Aqm71Ans3kY=;
        b=wTSgdsIMnkhHk3wC+Wvgc6XD9/DXU3RVw7IhUs6CgtlALLV3KidHLeZr1/mwLbsr8F
         k3yADwaduyyJc29+ZLq50pwMtEs2thuDKqFR83L5fxYck1katnFL62/U97hjob3tECWu
         KKLaNmEWdPNS8tQB+1rMkszhp3uXmFjEN7mI6K93itarjKgKTzp/rkAUyF02cHdi07+C
         gh3BhzEPuk5ftvFhi0WTkF0fEExtvFFuZwfdf8UedJJ9aTdCnIhBNZhfVa1UBUiUV8yM
         KD5zYABxjjTg5/hLvLuSHpguKvFe0uznioR4jay9Va4kJIR3xh+79cc/ykhTv3L7o09x
         u/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXK8uqg0/poICerOdja+Xmq9lA+rEET9MecU/Hnp5phYHnJI75V5bDqhymDDzdMHWCT0qcmN6fzvbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOExNqCDibUVnmEez9Fjfp7eYxeVwyY5kQiNFTOK8oHoVUqVoG
	GBAbxsTdSSq6CmGBh6/AC9VqQwzW8JJ2nRBLRnfTazqRtTtWF0OmGXGCQjiI9dI=
X-Google-Smtp-Source: AGHT+IHf4CApQHJTCaTaCg14Ohd9icv9JUFttYZZ8i+nL6y8/wPd1vccYgmdOWC5BimsZ1SOppfnwA==
X-Received: by 2002:a05:6a21:3382:b0:1db:e0ad:8ff6 with SMTP id adf61e73a8af0-1dbe0ad944amr16241954637.1.1730963260628;
        Wed, 06 Nov 2024 23:07:40 -0800 (PST)
Received: from [10.84.149.95] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a17ebcsm746789b3a.138.2024.11.06.23.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 23:07:40 -0800 (PST)
Message-ID: <28a9f8d6-3b8e-44c6-9458-062a7fe2b8e1@bytedance.com>
Date: Thu, 7 Nov 2024 15:07:32 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] docs/mm: add VMA locks documentation
Content-Language: en-US
To: Jann Horn <jannh@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Alice Ryhl <aliceryhl@google.com>,
 Boqun Feng <boqun.feng@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20241101185033.131880-1-lorenzo.stoakes@oracle.com>
 <CAG48ez0qsAM-dkOUDetmNBSK4typ5t_FvMvtGiB7wQsP-G1jVg@mail.gmail.com>
 <2bf6329e-eb3b-4c5e-bd3a-b519eefffd63@lucifer.local>
 <CAG48ez1eeQatc0GC_hfOM_mvwjwQ=89JDmp_U5_diLy7ycjEdQ@mail.gmail.com>
 <c0f64fa7-81fd-4691-86b5-2ad39ba9d8a7@bytedance.com>
 <CAG48ez3hyaymBo_Y9V2Hpx8TRHbE2WyZoeLhi1n0VW9Np7iw2Q@mail.gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <CAG48ez3hyaymBo_Y9V2Hpx8TRHbE2WyZoeLhi1n0VW9Np7iw2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/11/7 02:09, Jann Horn wrote:
> On Wed, Nov 6, 2024 at 4:09 AM Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>> On 2024/11/5 05:29, Jann Horn wrote:
>>> On Mon, Nov 4, 2024 at 5:42 PM Lorenzo Stoakes
>>
>> [...]
>>
>>>
>>> I think it's important to know about the existence of hardware writes
>>> because it means you need atomic operations when making changes to
>>> page tables. Like, for example, in many cases when changing a present
>>> PTE, you can't even use READ_ONCE()/WRITE_ONCE() for PTEs and need
>>> atomic RMW operations instead - see for example ptep_get_and_clear(),
>>> which is basically implemented in arch code as an atomic xchg so that
>>> it can't miss concurrent A/D bit updates.
>>>
>>
>> Totally agree! But I noticed before that ptep_clear() doesn't seem
>> to need atomic operations because it doesn't need to care about the
>> A/D bit.
>>
>> I once looked at the history of how the ptep_clear() was introduced.
>> If you are interested, you can take a look at my local draft below.
>> Maybe I missed something.
>>
>> ```
>> mm: pgtable: make ptep_clear() non-atomic
>>
>>       In the generic ptep_get_and_clear() implementation, it is just a simple
>>       combination of ptep_get() and pte_clear(). But for some architectures
>>       (such as x86 and arm64, etc), the hardware will modify the A/D bits
>> of the
>>       page table entry, so the ptep_get_and_clear() needs to be overwritten
>>       and implemented as an atomic operation to avoid contention, which has a
>>       performance cost.
>>
>>       The commit d283d422c6c4 ("x86: mm: add x86_64 support for page table
>>       check") adds the ptep_clear() on the x86, and makes it call
>>       ptep_get_and_clear() when CONFIG_PAGE_TABLE_CHECK is enabled. The page
>>       table check feature does not actually care about the A/D bits, so only
>>       ptep_get() + pte_clear() should be called. But considering that the
>> page
>>       table check is a debug option, this should not have much of an impact.
>>
>>       But then the commit de8c8e52836d ("mm: page_table_check: add hooks to
>>       public helpers") changed ptep_clear() to unconditionally call
>>       ptep_get_and_clear(), so that the  CONFIG_PAGE_TABLE_CHECK check can be
>>       put into the page table check stubs (in
>> include/linux/page_table_check.h).
>>       This also cause performance loss to the kernel without
>>       CONFIG_PAGE_TABLE_CHECK enabled, which doesn't make sense.
>>
>>       To fix it, just calling ptep_get() and pte_clear() in the ptep_clear().
>>
>>       Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 117b807e3f894..2ace92293f5f5 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -506,7 +506,10 @@ static inline void clear_young_dirty_ptes(struct
>> vm_area_struct *vma,
>>    static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
>>                                 pte_t *ptep)
>>    {
>> -       ptep_get_and_clear(mm, addr, ptep);
>> +       pte_t pte = ptep_get(ptep);
>> +
>> +       pte_clear(mm, addr, ptep);
>> +       page_table_check_pte_clear(mm, pte);
>>    }
>>
>> ```
> 
> ptep_clear() is currently only used in debug code and in khugepaged
> collapse paths, which are fairly expensive, so I don't think the cost
> of an extra atomic RMW op should matter here; but yeah, the change
> looks correct to me.

Thanks for double-checking it! And I agree that an extra atomic RMW op
is not a problem in the current call path. But this may be used for
other paths in the future. After all, for the present pte entry, we
need to call ptep_clear() instead of pte_clear() to ensure that
PAGE_TABLE_CHECK works properly.

Maybe this is worth sending a formal patch. ;)

Thanks!

