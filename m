Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C688B336EF7
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761061076; cv=none; b=Ad9maoCiVDYyaYZeHb2DJzUeRhKmnZF4G0ZImQj4dJIQZZiXERY4Y/CPhucUof64fqzkXpijauUQyC/Wr3/WfwYRUTeFeIWO0dmX3asH+s5saHtRrmLr9FPjJXloGy4/lgpklaxx/E9nMnSvtVjw9RGEbCDFx8EKJP6i9X/RNJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761061076; c=relaxed/simple;
	bh=8sJl3kVKaUChUtEmcByVQ+X5gAV5wcgI3nIvexX4qbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPtgnRX9UtScG3gclE8FengTdKJ7HyLZvdc50lJHfOs+oZLmf8HechoJ+sjzCDVozOB07XEYDDmrXoKO3d/lxU+Q8DQ0AHt9MBaX6RO1ppdVbSjFFt1KYYOVBa2nqkVh6M6PfK1tuur+h802UAn5vatT5jgAH+4h7J72LTwI/Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IxWIt941; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IxWIt941"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761061073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=E/7c5A5jjBJdHFU5IeWULrzoKt5LxZ5pQlNBoEOn3xM=;
	b=IxWIt941Mlh+TSW94v6yNjZ6afU2rhxnV3ni03Yb1eRqyUOJ7XtxlWPAx31KFKDipZnGh5
	OQlS7atkgHFaSDSlVoj7sb/CUBqzLhKl6DuFW2VV5lnGr7sm8kviyF8IK75fg0c8OMpsHf
	GviKtSz8KbtZqxm10VkPS2cl1str0u8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-hh0hh8wcNMW_4rnXh3O4sw-1; Tue, 21 Oct 2025 11:37:51 -0400
X-MC-Unique: hh0hh8wcNMW_4rnXh3O4sw-1
X-Mimecast-MFC-AGG-ID: hh0hh8wcNMW_4rnXh3O4sw_1761061070
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3ee130237e1so2504199f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 08:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761061070; x=1761665870;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/7c5A5jjBJdHFU5IeWULrzoKt5LxZ5pQlNBoEOn3xM=;
        b=nGxg3cB7QPNfRxvJpqZhHTzwc3m/IZtS238TZA9VqI0nKlAqbS7gvmnIBVays+Ybti
         ht0ijhtd0IhmxgWAuGlswJtXzMENBsPrpZpwkLq0jwIuozUdNA2uNjlJcsrXiMvJTKzE
         AWzl3dxXNLfrjQHy3QJR5j+bRbb3zUoF4XgYZ3JS9GIpvtFjybhQde+W9y6IMHUreJca
         AYLOeQ1KBLlEy/itthRgZniV3y8yI9J45i1937CiZo4DVpjslytEf4CXIxm7EzQ/s389
         l18Oe5eWQhz3qO0UHrnBoBQbtR0iUkiqgBtTZ0n1l0Bqa6MJTgyZwSyPdekGSsb6xTGr
         m2cA==
X-Forwarded-Encrypted: i=1; AJvYcCUiS9AsBg1C6hQtlnO9cewoIb5gdYnUE6MmMANX+rH9OPbcVD+IdXJKpXB4XnGpXdWgsexnXPQwLJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4hs3Zj4+U9nLQlMx4E7Kd7fWK3Fc3ffUDtRZOQqzzp6LBXlxU
	2H5AD5H8SX4N4y6B70sKpmq8CGb54TGDlr2hukw0FnBqUEbyUbo8Hb05wfFUz1w1v7OP7RlMxjv
	iONOkhGd87uELZGplEsG7yclWzH7m2QTB3vL4k5xv3D3qr9P5P7wT4hAf/voQGQ==
X-Gm-Gg: ASbGncut7F+zRsE34e5UwV+iKITD5uk8xw5sqgVfZ/HsWDAXPXNRZNpLOWLH1vAEEqv
	rHjzts8SdlbnWoGj+Qf+duiCgIM/V+DeK541nKOXGttxdYBOAnXGSTa7wqqSxmx6dcRpoAEywKf
	tdg4b9Z9z6Kx6n1d7H79H8tELYA72cEzapM3KbZdpWMGQQ1mI7VrZM8Z461UAvtSHlvdOH9KSNB
	zWE4ZJcYjZROvJSYZselr4q6fdJyHpmojDsqB8MKkG+3wp6MAVStHcq2xJurvSNiS+PQfS+nGov
	YBB407AB8qjgp/pu99vLuO8FRZ4JMWYhTlQdmo0w2PMicoLGJLPUTTjH1y4JqYpC6A1heHsyktI
	ET4s9MJW+8U1ZRZ6bunPzx9nZa4EnPE/qOQKnMuYffnpq5eM8GB6Ed3bBU9cONyZfA38Fg3atMe
	y4+r/+PqqGH4JqBcq7k8rSWoMDN2A=
X-Received: by 2002:a05:6000:2dc7:b0:428:4354:aa36 with SMTP id ffacd0b85a97d-4284354abd1mr6785967f8f.58.1761061069822;
        Tue, 21 Oct 2025 08:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV8Htnc2zerYOltHWq7nqPdBH+VgpCEEL3l5nIU7iiXfnT5bpNfFWhrGmLn4T4UZuxhmt8jQ==
X-Received: by 2002:a05:6000:2dc7:b0:428:4354:aa36 with SMTP id ffacd0b85a97d-4284354abd1mr6785942f8f.58.1761061069356;
        Tue, 21 Oct 2025 08:37:49 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a6c5sm21478704f8f.28.2025.10.21.08.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:37:48 -0700 (PDT)
Message-ID: <79f01115-3c9e-4316-92d5-bd050eeb3b76@redhat.com>
Date: Tue, 21 Oct 2025 17:37:47 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/23] mm/balloon_compaction: move internal helpers to
 memory_compaction.c
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-doc@vger.kernel.org,
 virtualization@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021125929.377194-15-david@redhat.com>
 <C2893E27-CA03-4416-9444-62929A740691@nvidia.com>
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
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <C2893E27-CA03-4416-9444-62929A740691@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.10.25 17:36, Zi Yan wrote:
> On 21 Oct 2025, at 8:59, David Hildenbrand wrote:
> 
>> Let's move the helpers that are not required by drivers anymore.
>>
>> While at it, drop the doc of balloon_page_device() as it is trivial.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   include/linux/balloon_compaction.h | 44 ------------------------------
>>   mm/balloon_compaction.c            | 38 ++++++++++++++++++++++++++
>>   2 files changed, 38 insertions(+), 44 deletions(-)
>>
> 
> In the email subject, s/memory_compaction/balloon_compaction/

Indeed, thanks!

-- 
Cheers

David / dhildenb

