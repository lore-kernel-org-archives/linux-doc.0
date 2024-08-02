Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8B41537A4
	for <linux-doc@vger.kernel.org>; Fri,  2 Aug 2024 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722614274; cv=none; b=XV2dJG5PUdEp1uuuisnIxMfdndBhA3HjdJiyAaMxqBU2VKdXziXzuJT44ydTEpN25lxpXYyt8CGnzCzrhZ7rHm0ilAwKSw4lu3nnesnAMO7c5uXvZXFuIk7PsclyqgatVQbumL6nYe7+4d0hCMyGEqAEsV0zcxcvWOY4k+E5xTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722614274; c=relaxed/simple;
	bh=JjynDV1hhOJHzj07YzBxKkFXQ+7j3t5lUDVQGJ/KsMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ul9rpUDUeUJeyuJGY3xFsQCH/EdytnPmSaxVOXAaywja5TtlEhOEtQJuNVHV0IZ3wWuh8y83josrlk+ovcTl9R8RmpLD07mIbmAfj09jM0R+1H7cCPfP9LiohaFCiuVM6wng999s+U+2xdT+QxYcltRFF/Prmfsb52eHDgXLnXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sj9MWFFx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sj9MWFFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722614272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=o8CyxVqweIF0ieon88U7x8sp9PNeNO828g6IWuk2Csg=;
	b=Sj9MWFFxUgI/K7g5/7GTPVynLlZZiNJ1fJuMVG7bJvrsideshMW6pSnxN8SklSR6cOViIF
	Ebn7n7FPOAqZFmBloPbXgCT4xKxQ3avJyHr10YhcqAQedJtGj//Dv2e+ipwl+eZNqurD5U
	QSxI8XCJOADNGzQgCshsl2Hw6PNOPuM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-Suj8mtSZOI2q0N0LQ_k33A-1; Fri, 02 Aug 2024 11:57:51 -0400
X-MC-Unique: Suj8mtSZOI2q0N0LQ_k33A-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-428ec88e02bso3011455e9.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Aug 2024 08:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722614270; x=1723219070;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o8CyxVqweIF0ieon88U7x8sp9PNeNO828g6IWuk2Csg=;
        b=FsNZrI+biPwRdf6BCbo1tkhauPsz+61wE1zb4s9aylZKthZ/A+XS+jgzA6zqSQJvty
         Zx2kJtKsqmz91A8KnWiejXYiOfOokdDurfIulYKd1tN7Ssr3VpDNeY1Sejp8M6hP8FNo
         pk+JlnbWMBwkPXhl6lzHa1dm65N4Mc17Ob/zSV19fIEwcS2pUAtvUf/UyfyqW1zQzLT9
         7r+hGZCCne9tezOBKWhUrSSe10+9GWUP3mW+72+Ia5t6CeyYPI7jpAEYFOxK1hlXUPv4
         Yf+TA61J5wCKrjMuWhexXGkeUvXzZxfDwdvM547EU9CHHRnRH0FyLl0HpvkoZiNAlMep
         1QkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXggGTTKPP3OJZLq8Uy2Xs12Bx/t4ILzTWdO27Qa4Q7/Wv94e5Su5MGgbLBaf7H0OcsqW3aNif821xG6GfbGqrUIm6mJMUy3c4e
X-Gm-Message-State: AOJu0YxxCIZw57G1z/6mGcXt/jH1ZwJuGn4pG/lOdMCv6kwW1eiDNQrO
	Xm4grGcvl06g+O7LG9G34Jc8DZW0TUqaZMRf04286oUwtfKguzEB6TM7bmUSmALUVHS7yyl3QuC
	KpJz+l2BUQ6O9AuPUobQ/MRamjCApv2+xHrOiyF82AvO2Ec3jJnHFAdjS3g==
X-Received: by 2002:a05:600c:3b92:b0:426:6388:d59f with SMTP id 5b1f17b1804b1-428e6f88ab5mr25998135e9.1.1722614269694;
        Fri, 02 Aug 2024 08:57:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAB/iWp0kcpjrY5OhvPv/Oyo/lMW/wjh0JrgfYiA+llWqgY/XCkve1AK7hUM/XO2A+l7mNIQ==
X-Received: by 2002:a05:600c:3b92:b0:426:6388:d59f with SMTP id 5b1f17b1804b1-428e6f88ab5mr25997875e9.1.1722614269088;
        Fri, 02 Aug 2024 08:57:49 -0700 (PDT)
Received: from ?IPV6:2003:cb:c717:e700:a3df:9aa8:9edb:dcac? (p200300cbc717e700a3df9aa89edbdcac.dip0.t-ipconnect.de. [2003:cb:c717:e700:a3df:9aa8:9edb:dcac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b89a86dsm98639065e9.1.2024.08.02.08.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Aug 2024 08:57:48 -0700 (PDT)
Message-ID: <1ea7a0d2-e640-4549-ac0e-8ae0df8d8e6a@redhat.com>
Date: Fri, 2 Aug 2024 17:57:46 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] mm: Add fast_only bool to test_young and
 clear_young MMU notifiers
To: James Houghton <jthoughton@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ankit Agrawal <ankita@nvidia.com>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>,
 James Morse <james.morse@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>,
 Raghavendra Rao Ananta <rananta@google.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Sean Christopherson
 <seanjc@google.com>, Shaoqin Huang <shahuang@redhat.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Wei Xu <weixugc@google.com>,
 Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>,
 Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20240724011037.3671523-1-jthoughton@google.com>
 <20240724011037.3671523-6-jthoughton@google.com>
 <37ae59f2-777a-4a58-ae58-4a20066364dd@redhat.com>
 <CADrL8HUmQWDc-75p=Z2KZzHkyWCCh8xnX=+ZXm5MZ-drALjKTA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CADrL8HUmQWDc-75p=Z2KZzHkyWCCh8xnX=+ZXm5MZ-drALjKTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02.08.24 01:13, James Houghton wrote:
> On Thu, Aug 1, 2024 at 2:36 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 24.07.24 03:10, James Houghton wrote:
>>> For implementers, the fast_only bool indicates that the age information
>>> needs to be harvested such that we do not slow down other MMU operations,
>>> and ideally that we are not ourselves slowed down by other MMU
>>> operations.  Usually this means that the implementation should be
>>> lockless.
>>
>> But what are the semantics if "fast_only" cannot be achieved by the
>> implementer?
>>
>> Can we add some documentation to the new functions that explain what
>> this mysterious "fast_only" is and what the expected semantics are?
>> Please? :)
> 
> Thanks for pointing out the missing documentation. How's this?
> 
> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index 45c5995ebd84..c21992036dd3 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -106,6 +106,18 @@ struct mmu_notifier_ops {
>           * clear_young is a lightweight version of clear_flush_young. Like the
>           * latter, it is supposed to test-and-clear the young/accessed bitflag
>           * in the secondary pte, but it may omit flushing the secondary tlb.
> +        *

Probably makes sense to highlight the parameters like @fast_only

> +        * The fast_only parameter indicates that this call should not block,
> +        * and this function should not cause other MMU notifier calls to
> +        * block. Usually this means that the implementation should be
> +        * lockless.
> +        *
> +        * When called with fast_only, this notifier will be a no-op unless
> +        * has_fast_aging is set on the struct mmu_notifier.

"... and will return 0 (NOT young)." ?

> +        *
> +        * When fast_only is true, if the implementer cannot determine that a
> +        * range is young without blocking, it should return 0 (i.e.,
> +        * that the range is NOT young).
>           */
>          int (*clear_young)(struct mmu_notifier *subscription,
>                             struct mm_struct *mm,
> @@ -118,6 +130,8 @@ struct mmu_notifier_ops {
>           * the secondary pte. This is used to know if the page is
>           * frequently used without actually clearing the flag or tearing
>           * down the secondary mapping on the page.
> +        *
> +        * The fast_only parameter has the same meaning as with clear_young.
>           */
>          int (*test_young)(struct mmu_notifier *subscription,
>                            struct mm_struct *mm,
> 
> I've also moved the commit that follows this one (the one that adds
> has_fast_aging) to be before this one so that the comment makes sense.


Makes sense, thanks!

-- 
Cheers,

David / dhildenb

