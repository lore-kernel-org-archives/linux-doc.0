Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAE41E1DEE
	for <linux-doc@vger.kernel.org>; Fri,  4 Apr 2025 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771325; cv=none; b=tuACNMS5S9wR/9k8hfUIEJClozoIl0ws5hIUcwSl3uBXGy2TWlAep111pp4pJScFCKdQyBo121Uw2/2+Kw4gfWD43QWHbpb30uyEHcusvP0b8mvxMiIjJOtPLujXi3H5K37TrqoB8nXqPEE5FbHr6EtSeelOtKFFumH/x1rw2mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771325; c=relaxed/simple;
	bh=kQhvnnm2l7HMnKW5oJ32mCUmfMkx36l9chfLuunJISU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jd50qs56KxnqbCNVfeOIvOsc7jMeytlduXe2tz/7h6UR/JJlGZw7KVyWs6U+z5hJOPCy+bhamUxllQ9q54ckjhTlbiw8YA16UufmYAtNrWV2RwZ1/6aFIepQFFHQW1BMO5ktIkbUwJlbDZYVP1Hk3inLj/XZznkgqT1hXc3nP08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dOnaPw1W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dOnaPw1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743771323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xkhGFt23aa/2AZ2ro0ZihwQoMTR8Kug7Bx96EP6cizo=;
	b=dOnaPw1WCv7dNm44jCwTvg6sYf83PE+xQquq1H0oyaYubnfRDkazEX0g7omqHqIzGuZKXo
	fODbqu3DgvAPJMrUKFkvx7JJAZ0jEWqaKtrfDPr4GKhyfUhBk0nqBVFTDGzKU8XpfzAaPE
	sTKcmyEFspnJlojdwiVA1JKS8AG1R28=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-eMf2bQkiOXqVqwA76WRfxw-1; Fri, 04 Apr 2025 08:55:22 -0400
X-MC-Unique: eMf2bQkiOXqVqwA76WRfxw-1
X-Mimecast-MFC-AGG-ID: eMf2bQkiOXqVqwA76WRfxw_1743771321
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso14500935e9.0
        for <linux-doc@vger.kernel.org>; Fri, 04 Apr 2025 05:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743771321; x=1744376121;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xkhGFt23aa/2AZ2ro0ZihwQoMTR8Kug7Bx96EP6cizo=;
        b=rlWwqlnC/kvNZcKGPPAQj0zbEpAIYcnEsw5wuHK3YuZyNypos4HxyOoDx7u8op93Ip
         AeET/jW/f4Xk+sJ0VSFglE8+Yx+M+4F3Hk6WGIcmL+52v8+QAEerGO3MimQUA6uZbnk4
         L2qxzi+pPOlXcXzc/d6IWF9895NQwrWwL+K0igVwX+y7EfZcAWTcegCUOMEniHkVwiSl
         tBOolaFdanAo433hC5k9wudZ3aT3Jls9TZHhc7+46ceNK5mMFcmPAxPYMQZdYyvJL9P+
         Y5cA+UELPT009bFAMYtBrB9e2qcwV/SgRqmkcMMmlenr7/18wymlvT+8vSNxCrdjPIlg
         GocA==
X-Forwarded-Encrypted: i=1; AJvYcCWYEIV7D0vu17/+LeEIR8vbeMxYh3VVgxHS6qLmK8eXfkV8JCLbRhQAOkAnZlYkSDOIK0uE8n5bUew=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSFDJ3MritlVCtbHrtM9LOwwlHi6T50HB2EylZga4tc2jrBPT7
	NTPn55EWUp6SvYUOjybUQdexv/8pjUb+l3fiwFl8MzOCrawOZOCxq3ZxMQw6nHU99pRABrsmMs5
	kHyIklsbh8rFHdau+j9ry7Q25Lo7sbdNJNAfOGhh+aTW0M5jRdwYymjm7EQ==
X-Gm-Gg: ASbGncvCfpveVn59gbqafBMx8KazqyNa9gV7AGeKgyJA65xDYjs0sx5I6YrJtX6AHd5
	CdMob3k5UTGOV+vyEa0L+aRIyXwFG7lfRPgzi0MyDEYGJnu6TA1W9e9dBBkmcv7RH0Lhbd6tQR0
	YCG/KPVyYmLY5zrO5eM6NXwQkyBxAbBd0rtchsfDxpoAB1+VHX+BirmGLx2FsfoQGV18ZSKvj/N
	OnnEMfNFoAgoUONJ3400iyCnaYGYGzaXN0RaRhKrAba9mH1h0Rpy8exmjdbatNA4SFwj9a6ujpn
	FwW83+gNmZq2RlfRq9O35I+TfOkwhgtg9k3h4cFdzoo7d58A4D8riua+groJ9A4LNgVljmWnPZ6
	lf0R5BRCMYcs+lUlF/sxJU9GAx4qHFk0ddcNnctyxcFg=
X-Received: by 2002:a05:600c:1387:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43ed0bde88amr28774325e9.13.1743771320882;
        Fri, 04 Apr 2025 05:55:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9B9+s0t0B5K9K7kvpZ1G+MK5yBDyiOw8AivkYABoCm9Fb2pyQU63TV6Hdl+izl22SEq3Zqg==
X-Received: by 2002:a05:600c:1387:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43ed0bde88amr28774045e9.13.1743771320496;
        Fri, 04 Apr 2025 05:55:20 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71b:7900:8752:fae3:f9c9:a07e? (p200300cbc71b79008752fae3f9c9a07e.dip0.t-ipconnect.de. [2003:cb:c71b:7900:8752:fae3:f9c9:a07e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec169b4e4sm48959365e9.20.2025.04.04.05.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 05:55:20 -0700 (PDT)
Message-ID: <d4b2748c-d23f-49da-bbbd-5ba8df1be7d5@redhat.com>
Date: Fri, 4 Apr 2025 14:55:18 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] docs: clarify THP admin guide about
 (File|Shmem)PmdMapped and ShmemHugePage
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, willy@infradead.org,
 Bagas Sanjaya <bagasdotme@gmail.com>, da.gomez@kernel.org,
 mcgrof@kernel.org, gost.dev@samsung.com, linux-doc@vger.kernel.org,
 Pankaj Raghav <p.raghav@samsung.com>
References: <20250404100159.27086-1-kernel@pankajraghav.com>
 <20250404100159.27086-3-kernel@pankajraghav.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250404100159.27086-3-kernel@pankajraghav.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.04.25 12:01, Pankaj Raghav (Samsung) wrote:
> From: Pankaj Raghav <p.raghav@samsung.com>
> 
> Move FilePmdMapped to previous paragraph for clarity, and clarify
> ShmemPmdMapped & ShmemHugePage.
> 
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>   Documentation/admin-guide/mm/transhuge.rst | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> index 01b7ce90d693..b0b9d578732b 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -465,13 +465,17 @@ AnonHugePmdMapped).
>   
>   The number of PMD-sized transparent huge pages currently used by
>   filesystem data (page cache) is available by reading the FileHugePages field
> -in ``/proc/meminfo``.
> +in ``/proc/meminfo``. The number of these huge pages that are mapped to userspace
> +is available by reading FilePmdMapped field in ``proc/meminfo``. To identify
> +what applications are mapping these huge pages, it is necessary to read
> +``/proc/PID/smaps`` and count the FilePmdMapped fields for each mapping.
>   

Having that change here looks weird.

I suggest to just squash both patches, they are intertwined.

> -The number of file transparent huge pages mapped to userspace is available
> -by reading ShmemPmdMapped and ShmemHugePages fields in ``/proc/meminfo``.
> -To identify what applications are mapping file transparent huge pages, it
> -is necessary to read ``/proc/PID/smaps`` and count the FilePmdMapped fields
> -for each mapping.
> +The number of PMD-sized transparent huge pages currently used by
> +tmpfs/shmem is available by reading the ShmemHugePages field
> +in ``/proc/meminfo``. The number of these huge pages that are mapped to userspace
> +is available by reading ShmemPmdMapped field in ``proc/meminfo``. To identify
> +what applications are mapping these huge pages, it is necessary to read
> +``/proc/PID/smaps`` and count the ShmemPmdMapped fields for each mapping.

Apart from that (and taking Bagas comment in account), LGTM.

Feel free to add

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

