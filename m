Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A14294A0A
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 08:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752828036; cv=none; b=U1pGcy+BvVjJd/exb59wOxT8RKC8RA06Bw6jzuVa7YIzn4zXsFXdGbj1YsOdpC5A6Q8raMjFqGaQOlnkVP8Tqu5x+Im+hqsqDraHzovP81+2xdgA/I8U3iZaPdBzM7kQ+QUBZDAOnCrjCX2grb/O9u/7pDm//CqU9niydfISZis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752828036; c=relaxed/simple;
	bh=NXIn0oOiAY5DyTFM5n21UQrMt/j12camTlktMJL+mRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qd9yqHJnUwK4D3EaqM9KSK5bGIBL2M9RzU6HyHH+i1rmoO75eUqpD67ZsS50WP8USuJJuzg3BspNHrmUzLW6FG6xoAiOekkbt7sGvkDH34hmb+CRu+NmK1f7/oIC0qmlWcdRJOHDwJSdSKRDO/3ddSbEOKLQnh1HNFp0clwHmn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aKVL2NEK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aKVL2NEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752828033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WPYZFlhAUKb/G740pk9MgxcQsgVOZ7ap5V10cruPzTI=;
	b=aKVL2NEK5nVj3QhfSgklM0jibKXwcqKgvanAFfBq5MsgB4Zn8MWpG7TgVLgDYW4DDjhPg1
	LQQiGDCfrJHP/Y4HS7uycG4lQlTgn5E92gXoJZTxK+h1Edz7NzVi2n/0c4/yfRT4eGpHVD
	ioRnU0RdPJjc2RTz2NMcukRT4j87TMQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-TQp7qMzAPPmDUfdc4SwLlQ-1; Fri, 18 Jul 2025 04:40:30 -0400
X-MC-Unique: TQp7qMzAPPmDUfdc4SwLlQ-1
X-Mimecast-MFC-AGG-ID: TQp7qMzAPPmDUfdc4SwLlQ_1752828030
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so923548f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 01:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752828029; x=1753432829;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WPYZFlhAUKb/G740pk9MgxcQsgVOZ7ap5V10cruPzTI=;
        b=tFcdq3veDFiuKkBwr54PQBT9oZdrkM56EJNbucdArbLNX1vJAloxWeyZi7a8OMHduL
         RTVmfyLt1+XsN8rx0jjJj4J9m4mSDH0Va/iKlkmCXB6iq3anCIkA0tX++6W6PVR6yzjo
         fezyJiPvuNm/FDyPwtmioViQdgqXv+HBr1rFU9az1OLnY8b46ouFiE/tJHb6rYHlp5JH
         wCOl6zRQn/fApomjNLV3XQYLSYgzf6RAgjRHzTABjrbDJsjBgaXiaqqBiyMsI9tCVJ3l
         xIHiWtO2mEVNJ1rlFWfZEhSXciDxq3lJCDk/jH3nDilfaWgXVqGM27KEgFYfNv7K9ZBs
         0bww==
X-Forwarded-Encrypted: i=1; AJvYcCVHRro23m41NlIDBh35lqCxZcFLfJXPJ6CrErfokh9jaW8TMz0e0y7ReaIbbbpqEtPL68lzLNw5Ej4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOkOdTgSIlFpL2bad2S22SYKPfED0PrPVmHou0e8yQ6ySATuO9
	9xaNaQljO0/jrTRem2p0dF2Tss1QU1ne0spB8XFqQZWxkAIMCUKN46VhnwOc0fpj13M9iFsWXkv
	eF2Q0atGOVuh/uH8Q3dkpFNeXQDHQ/NdJvLMx5pUOQUgKcb1k5YuyAVd8poQh+g==
X-Gm-Gg: ASbGnctfcMnPMWxGeCj4QjUXOknIYY7rhX4oTdXCUeRHBW2kUiYw2+W9Ilq6f01EwCa
	tDKiNWBYreYDO7S/VjgSUUjNDWfzrVKeudv1rZVrTvev8DoJA8juMocROaI+8M163FYSbaAcx6A
	CvT+aUnjoJRavrsetmOVPUt5FBufI18L/7Ci6BeTfDAvUA38JW6wylnctLuvBR5anSP9E6+wxYy
	6rEYGB9tyAVtyWqXmziyXXOwv0xInOC6TztKNgTAUaN6ESreNoFjojvVyHGtV+6FnI+B6dTf9Wz
	oUfuE+XYwN9orRWUv84+vPuZ938EexyZaExSmlEAirdT8fGXbIxEjqeZ2iUQWaQNEoCNe1jVXhV
	LlAceAwkFcLhr4PIRGU1v7vjnnntOKNzmPwIzxxMXaddlPyiRTCN6uZR/GqLFSoeTJ+4=
X-Received: by 2002:a05:6000:2f81:b0:3a4:f90c:31e3 with SMTP id ffacd0b85a97d-3b61b217fe2mr1583041f8f.31.1752828029643;
        Fri, 18 Jul 2025 01:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGw3GhDEO5aWcDmxGxplFA0hEIFhsrWZD2yMQYdssxAcVngYd7MFaN9vkiBTT7Ef4dOlRckA==
X-Received: by 2002:a05:6000:2f81:b0:3a4:f90c:31e3 with SMTP id ffacd0b85a97d-3b61b217fe2mr1582998f8f.31.1752828029080;
        Fri, 18 Jul 2025 01:40:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f43:8900:f364:1333:2a67:d49e? (p200300d82f438900f36413332a67d49e.dip0.t-ipconnect.de. [2003:d8:2f43:8900:f364:1333:2a67:d49e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2bb48sm1197825f8f.24.2025.07.18.01.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 01:40:28 -0700 (PDT)
Message-ID: <ab968af5-2034-446c-9844-533ec62ae14e@redhat.com>
Date: Fri, 18 Jul 2025 10:40:26 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/14] khugepaged: allow khugepaged to check all
 anonymous mTHP orders
To: Nico Pache <npache@redhat.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com,
 corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, akpm@linux-foundation.org,
 baohua@kernel.org, willy@infradead.org, peterx@redhat.com,
 wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com,
 vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com,
 yang@os.amperecomputing.com, kirill.shutemov@linux.intel.com,
 aarcange@redhat.com, raquini@redhat.com, anshuman.khandual@arm.com,
 catalin.marinas@arm.com, tiwai@suse.de, will@kernel.org,
 dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, zokeefe@google.com,
 hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com,
 rdunlap@infradead.org, hughd@google.com
References: <20250714003207.113275-1-npache@redhat.com>
 <20250714003207.113275-11-npache@redhat.com>
 <3b8d32dd-9d40-44b1-a0ab-8185073b9072@redhat.com>
 <CAA1CXcD2KphY8PEHyjQuYhZJf_oiNz-8UN1m9AtPF7j9O7U2sw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <CAA1CXcD2KphY8PEHyjQuYhZJf_oiNz-8UN1m9AtPF7j9O7U2sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17.07.25 09:25, Nico Pache wrote:
> On Wed, Jul 16, 2025 at 9:28 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 14.07.25 02:32, Nico Pache wrote:
>>> From: Baolin Wang <baolin.wang@linux.alibaba.com>
>>
>> Should the subject better be
>>
>> "mm/khugepaged: enable collapsing mTHPs even when PMD THPs are disabled"
> Thank does read better.
>>
>> (in general, I assume all subjects should be prefixed by "mm/khugepaged:")
> ehhh, seems like there's a mix of "mm/khugepaged", "khugepaged", and
> "mm: khugepaged:" being used in other commits. I prefer using
> khugepaged as it leaves me more space for the commit title

It's inconsistent, but we generally try to indicate the relevant 
subsystem (mm).  For khugepaged it's probably the case that it's not 
easy to confuse with another subsystem.

-- 
Cheers,

David / dhildenb

