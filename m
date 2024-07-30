Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4EA1A00CB
	for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2024 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722350144; cv=none; b=UR3BmjgJf5Oh00QOJQ4m+vuH7e3IOYDTKMZuW2eg/ihhDMQBGQ4jepbYFBgAQf+kFekBVjfc6E3sQMitECwERiXv4IaDgFP+kfOUdRW/QB7TIFphSctGWaYUcaoK28WHF04VdB1SBZByihk3XfZajrCQ4vjwRIaDA/Qv1fg1JXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722350144; c=relaxed/simple;
	bh=QviMwUk1MMIVfWdkqEBjf29q0fy9FY6KSbemF2AbXec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUnSh/efTDoNmGocF/e7b21uJqZNKW8uvU7RSlfB9g1uuzzLZE7rbb+e9yoEmWvlWXD7O3sNeq2NI1ruDkLIPGlzYn4dJ/ohI21jyIodgqMs4TQkIXnIDQu7VUebkKnx1YPpg46YrLSCjMdC69AZKSeTNW3v67Irow1CtPI6t6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DksnCjMc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DksnCjMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722350141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HyNTsZ0eTHP8x+yF8X//tcl+9eR+q0un71fNBVFYvGc=;
	b=DksnCjMcMH7k5wR5xKSoypduqTasKG8UI+6REt3lPVrTrjM7HezHelz4TXNrv70G1f/bJF
	o35itcezgCGUaVrmynVls1/GZ5ycgR1mybEqINtQ3VApwTygXjcLb7CB6wn6m9L4B5MTpa
	k2DGf65bmVwmh51Nm0I8e3wmTuFsi/o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-OvXYTopsOL6vJYg7rPJd0g-1; Tue, 30 Jul 2024 10:35:39 -0400
X-MC-Unique: OvXYTopsOL6vJYg7rPJd0g-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-368665a3fdfso2192232f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2024 07:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722350138; x=1722954938;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HyNTsZ0eTHP8x+yF8X//tcl+9eR+q0un71fNBVFYvGc=;
        b=Hx4PY/RCHKRdVDAegM+fGyqlUahEKrnt6EP5aOXCen5DZoTxyffofrceh01JPswH5I
         x4HLpCXmerc79vK4VoIVXAtr74Yh8IL5c3fsyMphNRWCopTwImQ0j/atcZMajAkZxxJw
         pgVUl9KsER8BYlbBtjtHgA0qB++6OzlaKJiC+yKnKd2Eq4Pblsb1Xx4PFX0Pzt/odKVE
         fBsWroCLxd442snIyH+Pg1MiBJsgddgmohXB1UOESnCyNAjmSUgw9n+jtUM3uwMapZpT
         G7MxloCXUhNLO5QLthw257V3YzkLCZ1/+TN48xSY4mLbGa+p8UGr/tErcjbk3dx2G2sM
         Q/fA==
X-Forwarded-Encrypted: i=1; AJvYcCWWRXMtI61m/fLZmpww5HQI7IzoqHyucGfnscy6xDmJuxHiYZQpPyH4LNPsFezAayoQ4Adc6y3woO7oPYEjjylEPzAlhmlX07RJ
X-Gm-Message-State: AOJu0Yw0u9PIqNIqwWVtCP0Jrymg8ybGI5xMgqDu+6MilOKM4YtQRD8w
	ynlPKJi8BJ5Qs1kH2Eu2mBB2bRn5AspjY4RMJ4aqKfmSGuDyYhpYjoN4OwE1rqM1wDmWB3ApiS2
	viVJdeGyieG4fG9QYoF5hwEPL3tTpjZHLQQ+zuBIHya+g47lMCfhqXeTPoQ==
X-Received: by 2002:a5d:4a89:0:b0:367:91d8:a1d2 with SMTP id ffacd0b85a97d-36b5d03cdc2mr6575620f8f.30.1722350138572;
        Tue, 30 Jul 2024 07:35:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHOTTPDW/6vfyso7cTFCs6Rbm7SA8XoT3LC9zFP0VhqGHyOzKQXT4nNIsID5Rezc+82Gg4SA==
X-Received: by 2002:a5d:4a89:0:b0:367:91d8:a1d2 with SMTP id ffacd0b85a97d-36b5d03cdc2mr6575596f8f.30.1722350137902;
        Tue, 30 Jul 2024 07:35:37 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:4e00:31ad:5274:e21c:b59? (p200300cbc7064e0031ad5274e21c0b59.dip0.t-ipconnect.de. [2003:cb:c706:4e00:31ad:5274:e21c:b59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367fc624sm14709673f8f.57.2024.07.30.07.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 07:35:37 -0700 (PDT)
Message-ID: <dc00a32f-e4aa-4f48-b82a-176c9f615f3e@redhat.com>
Date: Tue, 30 Jul 2024 16:35:36 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] mm: split underutilized THPs
To: Usama Arif <usamaarif642@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev,
 roman.gushchin@linux.dev, yuzhao@google.com, baohua@kernel.org,
 ryan.roberts@arm.com, rppt@kernel.org, willy@infradead.org,
 cerasuolodomenico@gmail.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20240730125346.1580150-1-usamaarif642@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240730125346.1580150-1-usamaarif642@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.07.24 14:45, Usama Arif wrote:
> The current upstream default policy for THP is always. However, Meta
> uses madvise in production as the current THP=always policy vastly
> overprovisions THPs in sparsely accessed memory areas, resulting in
> excessive memory pressure and premature OOM killing.
> Using madvise + relying on khugepaged has certain drawbacks over
> THP=always. Using madvise hints mean THPs aren't "transparent" and
> require userspace changes. Waiting for khugepaged to scan memory and
> collapse pages into THP can be slow and unpredictable in terms of performance
> (i.e. you dont know when the collapse will happen), while production
> environments require predictable performance. If there is enough memory
> available, its better for both performance and predictability to have
> a THP from fault time, i.e. THP=always rather than wait for khugepaged
> to collapse it, and deal with sparsely populated THPs when the system is
> running out of memory.
> 
> This patch-series is an attempt to mitigate the issue of running out of
> memory when THP is always enabled. During runtime whenever a THP is being
> faulted in or collapsed by khugepaged, the THP is added to a list.
> Whenever memory reclaim happens, the kernel runs the deferred_split
> shrinker which goes through the list and checks if the THP was underutilized,
> i.e. how many of the base 4K pages of the entire THP were zero-filled.
> If this number goes above a certain threshold, the shrinker will attempt
> to split that THP. Then at remap time, the pages that were zero-filled are
> not remapped, hence saving memory. This method avoids the downside of
> wasting memory in areas where THP is sparsely filled when THP is always
> enabled, while still providing the upside THPs like reduced TLB misses without
> having to use madvise.
> 
> Meta production workloads that were CPU bound (>99% CPU utilzation) were
> tested with THP shrinker. The results after 2 hours are as follows:
> 
>                              | THP=madvise |  THP=always   | THP=always
>                              |             |               | + shrinker series
>                              |             |               | + max_ptes_none=409
> -----------------------------------------------------------------------------
> Performance improvement     |      -      |    +1.8%      |     +1.7%
> (over THP=madvise)          |             |               |
> -----------------------------------------------------------------------------
> Memory usage                |    54.6G    | 58.8G (+7.7%) |   55.9G (+2.4%)
> -----------------------------------------------------------------------------
> max_ptes_none=409 means that any THP that has more than 409 out of 512
> (80%) zero filled filled pages will be split.
> 
> To test out the patches, the below commands without the shrinker will
> invoke OOM killer immediately and kill stress, but will not fail with
> the shrinker:
> 
> echo 450 > /sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none
> mkdir /sys/fs/cgroup/test
> echo $$ > /sys/fs/cgroup/test/cgroup.procs
> echo 20M > /sys/fs/cgroup/test/memory.max
> echo 0 > /sys/fs/cgroup/test/memory.swap.max
> # allocate twice memory.max for each stress worker and touch 40/512 of
> # each THP, i.e. vm-stride 50K.
> # With the shrinker, max_ptes_none of 470 and below won't invoke OOM
> # killer.
> # Without the shrinker, OOM killer is invoked immediately irrespective
> # of max_ptes_none value and kill stress.
> stress --vm 1 --vm-bytes 40M --vm-stride 50K
> 
> Patches 1-2 add back helper functions that were previously removed
> to operate on page lists (needed by patch 3).
> Patch 3 is an optimization to free zapped tail pages rather than
> waiting for page reclaim or migration.
> Patch 4 is a prerequisite for THP shrinker to not remap zero-filled
> subpages when splitting THP.
> Patches 6 adds support for THP shrinker.
> 
> (This patch-series restarts the work on having a THP shrinker in kernel
> originally done in
> https://lore.kernel.org/all/cover.1667454613.git.alexlzhu@fb.com/.
> The THP shrinker in this series is significantly different than the
> original one, hence its labelled v1 (although the prerequisite to not
> remap clean subpages is the same).)

As shared previously, there is one issue with uffd (even when currently 
not active for a VMA!), where we must not zap present page table entries.

Something that is always possible (assuming no GUP pins of course, 
which) is replacing the zero-filled subpages by shared zeropages.

Is that being done in this patch set already, or are we creating 
pte_none() entries?

-- 
Cheers,

David / dhildenb

