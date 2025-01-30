Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4601E1C22
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738252622; cv=none; b=QafnOe87KL9DnFVlWo/bzjPKEnh4M9hqIsUU4YWpmMH/2yqrwQvhobJuduHBO01aN4kSQwN2dEQExTNxahnZTm4d/EgraszagjQQmrtX7bEnNlpoEUcHRwRzXv6wtnJJmhfXl+kKQOOTw4WK64MiCjNP4zG1dxQeUbhK+skW8e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738252622; c=relaxed/simple;
	bh=9JDIcctY3oDVP/oeNeNQzAEx2leaB81gXrw3Dn1eZ5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IlKZW3PFtGQTs6Fz891L5JkPF2czDSs4Xogml+7+qm6upBK0+ZtsZHtOA0uypxeuUgltMG5xDerx7GqLAHtC8N46qJ9+oMxmc0lbKTOoz5Pl/CfNuOhsAUK2W1YQBsI2OYD+hn1ANVdeTDR9j73z815hiXXEegXY/UsAizno9ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jOSLZdc6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jOSLZdc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738252619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qM4w+1es2FaHKiaH8UoDw9Cy8vwIlmWEd0tDR6y0hSI=;
	b=jOSLZdc6Ko+RRFvSNXoQ9Gg+mlLY07fVf/qGGF9ZLCisrJ04aszVAi+dlqw2HNsYQam8G+
	y+YQEP5wIqhvS1MGmHQIq7tIDTM5rOcJrQiDmpL9/NdZ0GZmiuE4MOa9eDOkp1tYP1Y/gF
	+BL4GHRnKnrVI6N1Em3jb2xJjS8rIn8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-G9w3wSOJONaqreQ_G5dsEA-1; Thu, 30 Jan 2025 10:56:58 -0500
X-MC-Unique: G9w3wSOJONaqreQ_G5dsEA-1
X-Mimecast-MFC-AGG-ID: G9w3wSOJONaqreQ_G5dsEA
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4362b9c15d8so4629705e9.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 07:56:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252617; x=1738857417;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qM4w+1es2FaHKiaH8UoDw9Cy8vwIlmWEd0tDR6y0hSI=;
        b=MiTHvqCZci5uHuL6i333z7gDQaSzXrU8TG7JdE/gKvb/tPOJQmjKSZm7Lutky9+Yys
         S7dJzth87Fpl3bPvb1Gf0MAIVWV54T6xSeAFdstRdkQO2MsQPSrfqmes4hYWgkbjVKtX
         kMXgldbBD9qTJWZaoXW8yXBrS+q9/U90rsg+yWftory0vOvOswJiJzfAk8WoXqvVSqRo
         PTp5U5kHu+L0RfjAaRXABDmzXcThkJ5WrtbU19mWycW1CxWO1+k/CFv6uChAWZITd6Qm
         LygKkb130bBahic5zjhPGILEIpz3Ag37T/MA6hbXtMYzhfJ4yc1U29GoJJWOgCM06iiU
         He+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUm6MKeYwsuyQblz/wOVxovg7L4V8CWjxSkZPff1p2zFYZat9ePcOUC2vfNbRMFWjY8ZitXdTMotXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDHBWUYW0UGIiL/AkTF/T0/e4d2Kg/PYAX0q5jxzIRH+o2oqLN
	nr7x+HKE9Ada7WB/souvVdzHn67ZjkNz4vBPqMhmT2atV+Q1U54sMUYFuxeCBVUXeAIzSohtoOa
	PxnvV3Y3wXcR2r5NTaT513C6VOnQwBe+SnqqAmg1ywTJ5MSFycpKynBNgng==
X-Gm-Gg: ASbGncsdYH1kDDuq9C2PqM3gXRHGDexkqwqAqIc+aMj6PftvLZbCubUYSQtNW0yBO09
	/MK6pwvlVLEcSPCKCG1gnov3eUTaLRaqsht5QgDJa7C4nEwhxTB9WpQwYah2IH0X2xUAdwFaxey
	R0s5CYobkndR3oXLlMRPPzAaUZ8SW/RwEIZg1acMNPKSdferCVtspG3OsmQryu6i79Tq8UHUQpL
	DXUbwanywNSc0sS3evHcZb65G5eKlztRfiqOa5zwZ1vRAOIgjpygYzxrNsbciy9ClhEy0ndhmjz
	KvYDkGWP8LYepeodRu2dLWUvfnqfvmCFeb0xQlFL5rg1lVI42SS2eOYvTKMhwG+d8DYtjF16hQL
	JrbylypryzWWzW2Omv+Te+z6h5SVeasrU
X-Received: by 2002:a05:600c:154f:b0:434:a367:2bd9 with SMTP id 5b1f17b1804b1-438dc3ca79fmr78295515e9.14.1738252616887;
        Thu, 30 Jan 2025 07:56:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLqpKxoaB1vnd8r+/yn1qDNliwYunVoFg0sF0T9rGcNmbMw4yKk/QmEFTvnqEpMXpqQwFnhg==
X-Received: by 2002:a05:600c:154f:b0:434:a367:2bd9 with SMTP id 5b1f17b1804b1-438dc3ca79fmr78295145e9.14.1738252616483;
        Thu, 30 Jan 2025 07:56:56 -0800 (PST)
Received: from ?IPV6:2003:cb:c713:3b00:16ce:8f1c:dd50:90fb? (p200300cbc7133b0016ce8f1cdd5090fb.dip0.t-ipconnect.de. [2003:cb:c713:3b00:16ce:8f1c:dd50:90fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc6dfb5sm64700345e9.31.2025.01.30.07.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 07:56:55 -0800 (PST)
Message-ID: <84bc05e7-f47a-4941-a151-a3b2ab18ad62@redhat.com>
Date: Thu, 30 Jan 2025 16:56:52 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/12] mm/rmap: convert make_device_exclusive_range()
 to make_device_exclusive()
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
 <20250129115411.2077152-4-david@redhat.com>
 <Z5uCw9nzN81B4N8Z@phenom.ffwll.local>
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
In-Reply-To: <Z5uCw9nzN81B4N8Z@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.01.25 14:46, Simona Vetter wrote:
> On Wed, Jan 29, 2025 at 12:54:01PM +0100, David Hildenbrand wrote:
>> The single "real" user in the tree of make_device_exclusive_range() always
>> requests making only a single address exclusive. The current implementation
>> is hard to fix for properly supporting anonymous THP / large folios and
>> for avoiding messing with rmap walks in weird ways.
>>
>> So let's always process a single address/page and return folio + page to
>> minimize page -> folio lookups. This is a preparation for further
>> changes.
>>
>> Reject any non-anonymous or hugetlb folios early, directly after GUP.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Yeah this makes sense. Even for pmd entries I think we want to make this
> very explicit with an explicit hugetlb opt-in I think.
> 
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Thanks, I'll fold in the following:

diff --git a/mm/rmap.c b/mm/rmap.c
index 676df4fba5b0..94256925682d 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2525,6 +2525,10 @@ static bool folio_make_device_exclusive(struct folio *folio,
   * programming is complete it should drop the page lock and reference after
   * which point CPU access to the page will revoke the exclusive access.
   *
+ * Note: This function always operates on individual PTEs mapping individual
+ * pages. PMD-sized THPs are first remapped to be mapped by PTEs before the
+ * conversion happens on a single PTE corresponding to @addr.
+ *
   * Returns: pointer to mapped page on success, otherwise a negative error.
   */
  struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,


-- 
Cheers,

David / dhildenb

