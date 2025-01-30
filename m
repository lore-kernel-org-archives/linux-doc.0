Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4AA1E990E
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738252356; cv=none; b=JDANkudtGTaQw9pKcd/fG7hXehXlB+fsEa6CEXH1K3Mk1ksjGbpNEkK1WC0LAAa8J4XlXRTThuP2RM9oRPAa1+6+dDefhXko8VZWvAjseTzzQk3NcNe75RyX0Bztj5ODoRP8yRUQW8N462CDUbVomCu8T/q5f8faXZMqeCq5tt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738252356; c=relaxed/simple;
	bh=0UBh4IrjiEjDd77vKqWxioTsLVFBeF1j56hIZbpnmIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LRfqBLDytQsdzEFraJ1dh0WuismIzbLi64y2lc9l3uG9vy/eUnUUk7QyF928nqqKyERknP8sFCAyKXyNrIYdc/zLM4i0iIcfhqEc3eFqTLOGZnVAgg+8jjR4lXYmIn69nIl6Nu/vBS1phkrWoK/Y5cmAEw5OphznljWaxiN3PWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FuFwLHM9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FuFwLHM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738252353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TsPelXXasc7TSuPc4lSN7EB9eFx6gV0MKgk7ChJm0z4=;
	b=FuFwLHM9AQ2YLxKJqr1apWxo6Ez+UvAim6f6/ve1O6YFfa3Nj1hAX2oLYmwbHXEA1aeM4k
	ot4PAOnmG3g2NCLc6H2C1i78MGzPCBNF906g2KeE1iNoBpuqeqeu8R9sg/eTHFrB5ijGZ7
	4HkIvUPs1TOJhgXrt7S+GZB8jBCXzmY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-KptKAwy7Pr-zS_pgWn0VZA-1; Thu, 30 Jan 2025 10:52:32 -0500
X-MC-Unique: KptKAwy7Pr-zS_pgWn0VZA-1
X-Mimecast-MFC-AGG-ID: KptKAwy7Pr-zS_pgWn0VZA
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-438da39bb69so6158255e9.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 07:52:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252351; x=1738857151;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsPelXXasc7TSuPc4lSN7EB9eFx6gV0MKgk7ChJm0z4=;
        b=VD75/K3/Cc4AEWfJGph+eXJxGOwMr84roAvmeAwU/xk0GlzK3DqGAsAz1ZoRIgkUKY
         UKkvd2Ae97CHoYVtbArMggkeu47aMFagpT2fmB0d/dJhmq0oUmAqV8JF8UIL1N6YpUHp
         85ewE523oGJNsRUU8AUGWGgxWtrNNWTwWBnEUDySibg9esUF7f+/cMCv/4Er9uQ1g60f
         fE2r26b4pC35qg54GMJi4GJgz+tajsYZJRaGWF8LFHuwqPRe98vDMr0KE9bMSkjIZ2II
         HI1bH4SNGSWHqnnkGs6Dp8hN3XgNdDbf/4Z2tWsp+cRNrEFSLAzx1Hn+24PwHhxS1xXo
         tB2g==
X-Forwarded-Encrypted: i=1; AJvYcCXhhmUg0P/sQLpHMhRKwf2KA+bZc1KZ+0irWPc+UUPXRg0jYMCMT+aFw0ZgcK8hSSnHlMvLQrkQ9v4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDykDOpkFQiYQ93a0vbXJq4xzgAAQyw0OTSaAER9EALsE3rzFb
	L9Z/L1z5WDomtBjxTCh+6j9BrWC5nO/wZ0frofm4vQ8kXrrRk+TePG0vPuH/6PvlgP5a7SUqpHb
	F5BwOPBSmGye55fkS1tqfdBZcz38bMaXP67QFifsVt+t/Xxj5fY2Zp8h2Xw==
X-Gm-Gg: ASbGnctarf4jscszRunrOs8ZX54qs57Ufca+gRZrln5Mp4MAP0b5Vm1PuZnDdTCvkRv
	/1lnUmjnv7fuRSyjwOouFxpgsQe8KIs0rfi8CFm2J07aBir74UNUxlrxJ7oSmW1MgfOua10/7Xn
	hWb+DPo48k2Eh1TJQX55ZXzvnjoKKkDWu0TR3U+K2Ox8xMCpkJAao2Ez9ijuzwHCL9D2AvJli0n
	opqkXMX+ZP+vwypFNquJROAI3TplzrBcyaCUzD1bxbRy0HIKuQ8vtrf1pWmjgnst4hz3q2e+tH+
	8+Q0nIgB8Y9XsdK9Iv4X537k1yBt3wtxfXQn2HCpRndzFqgexH+pG9XmhRScFs+/yBNX3uP+tyM
	1x3v6Fk59NhhpH/GrgMXTOM/yfh5IUUbM
X-Received: by 2002:a05:600c:19d2:b0:435:330d:de86 with SMTP id 5b1f17b1804b1-438dc34b37bmr77183625e9.0.1738252351152;
        Thu, 30 Jan 2025 07:52:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLc0GSKvGNrlFwZzVzr9jAXl07EKtr7grPLdJmtHhU8CpAS0lhJAYux5tQ0FGwaQWq8rUmUA==
X-Received: by 2002:a05:600c:19d2:b0:435:330d:de86 with SMTP id 5b1f17b1804b1-438dc34b37bmr77183245e9.0.1738252350748;
        Thu, 30 Jan 2025 07:52:30 -0800 (PST)
Received: from ?IPV6:2003:cb:c713:3b00:16ce:8f1c:dd50:90fb? (p200300cbc7133b0016ce8f1cdd5090fb.dip0.t-ipconnect.de. [2003:cb:c713:3b00:16ce:8f1c:dd50:90fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438d755375bsm63310815e9.0.2025.01.30.07.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 07:52:29 -0800 (PST)
Message-ID: <0b3a38cc-b956-4db4-8b13-c8180926d2a3@redhat.com>
Date: Thu, 30 Jan 2025 16:52:27 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/12] mm/rmap: handle device-exclusive entries
 correctly in try_to_unmap_one()
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-9-david@redhat.com>
 <Z5tQL60SNNGCkfQR@phenom.ffwll.local>
 <59feb709-dadc-4d19-857e-49320cca3d98@redhat.com>
 <Z5t5RKFwl34vpqU4@phenom.ffwll.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5t5RKFwl34vpqU4@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.01.25 14:06, Simona Vetter wrote:
> On Thu, Jan 30, 2025 at 12:08:42PM +0100, David Hildenbrand wrote:
>> On 30.01.25 11:10, Simona Vetter wrote:
>>> On Wed, Jan 29, 2025 at 12:54:06PM +0100, David Hildenbrand wrote:
>>>> Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
>>>> we can return with a device-exclusive entry from page_vma_mapped_walk().
>>>>
>>>> try_to_unmap_one() is not prepared for that, so teach it about these
>>>> non-present nonswap PTEs.
>>>>
>>>> Before that, could we also have triggered this case with device-private
>>>> entries? Unlikely.
>>>
>>> Just quick comment on this, I'm still pondering all the other aspects.
>>>
>>> device-private memory is entirely owned by the driver, the core mm isn't
>>> supposed to touch these beyond migrating it back to system memory in
>>> do_swap_page. Plus using rmap when the driver asks for invalidating
>>> mappings as needed.
>>>
>>> So no lru, thp, migration or anything initiated by core mm should ever
>>> happen on these device private pages. If it does, it'd be a bug.
>>
>> I was not 100% sure about HWPoison handling, that's why I added that
>> comment. In other regards I agree: reclaim etc. does not apply.
> 
> So maybe I'm just entirely lost, but unless you have a coherent
> interconnect I don't think hwpoisin should get involved with device
> private memory? And for a coherent interconnect it's just device memory,
> which isn't treated very special.

I would have thought that in a scenario Jason describes, that you would 
still want to zap the page from the page table (try_to_unmap()) and 
install a hwpoison entry instead.

But yes, right now this should never ever happen: memory_failure() does 
some ZONE_DEVICE specific things, but likely doesn't call try_to_unmap() 
on these folios.

> 
> Also to clarify, I meant this as a general comment for all subsequent
> patches that have the same paragraph.

Yeah, I'll rephrase that to "We'll never hit that case for special 
device-private pages."

-- 
Cheers,

David / dhildenb

