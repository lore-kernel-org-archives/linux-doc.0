Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9732882DD
	for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692376; cv=none; b=sd1aa9exxkNwnb3Z8/l3ljaLecLDaHS3raeqSDbGbDI5fA+dEc1a/EdsjExH11nYxv6MQpj6YozqGYfbTnRQQSzHXYmQND2pUJkVSXD6pIaa3qYoZMd7zzR63rUISygL9x2DsjMxc/EUGO5psPt8iNapUp0N26SAT/vr7zL7MHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692376; c=relaxed/simple;
	bh=9WkkSDw8tmOek/IeGfBmFEWN9Dq+68hL6BqxWrW4HDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDkZebs33bdACDC/DM6hYXVANin+TgarxMvt0LyaAzWBW9p9ZZ0jtCwzg7/xSv+RsKdaVjcBl1+S0QS4A8iHyouTEKNEPKaEEmBIj3Vz3UxJh3yhq37fIILHRXrcrzk4CyUX45Km4rxWq+mJiKqSaiBf+LHCPfiI7i3AsdqIO/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PGx+r0bh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PGx+r0bh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750692374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LfnsJNwnopUCMOcQWvVWb39kYZClfhVnA47NiR2APjM=;
	b=PGx+r0bhw2Yxb3PLEwStbq3JZ1uCHLMxOMbFdNenP9LEB4MnTcclEMn238LZ9uZjRsxYO4
	oSAFE9Kb93Y0pve00zYDRlGQbdV22iEOJfgzLNKlt0ASf+RkpUjh2ipfVkvYR7SEuksMEH
	5fwvfRULCPZG6G0lOTgq3di0fgwFF/M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-wM9WZV7JOmigFOHlWQhBkg-1; Mon, 23 Jun 2025 11:26:10 -0400
X-MC-Unique: wM9WZV7JOmigFOHlWQhBkg-1
X-Mimecast-MFC-AGG-ID: wM9WZV7JOmigFOHlWQhBkg_1750692370
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4530ec2c87cso22885765e9.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 08:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692370; x=1751297170;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LfnsJNwnopUCMOcQWvVWb39kYZClfhVnA47NiR2APjM=;
        b=ZdwhDKaUiPiZTVaPjEAwAF6bprx2Y1B8Yys9k/Ubkn05wuj9JT7qroSwDNsRAnN8bY
         KTK0g+WO8UajfihxTiX0U6yaGiFGcH/ie2LI4l1OTt0I5h4Pp/MaxOdSpbavaETJjqnR
         LwtasGpvdMsJRYNZDOfZQJfDE5YjZYSq0gqM9BIXs6v6iWRiJUq2zxIXBQlCeTPQJC2P
         gSSUw9pReCSfyUMbjtZfbQZ31txERTMaan9dJ1GZs116BXgXfGx2+5NTGKN2jw/d06AI
         hXTi2AHqv5v1SwWWPydI5gBpypDOq7x+Om3GlD7H7QMPGlJ7fPg5YXF7RYNP1RiJ24pG
         1/pw==
X-Forwarded-Encrypted: i=1; AJvYcCVShdz2BlXnLZyu3m7ECq7fHvJPmFjdeFLH8Zrb5HwZorWyKSDkK0Tbaw6q7ZV01sy553zMcsU7cwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGqXS8DLoRfNMRR2B4aRiIYDfVikOUUQ45yxMNkH3Po0Kv8lzZ
	eRXI77XP3965iF+xCBQJ8TjNw1gCwl404i6PH4GtzRpz6Efk/qR2U3kBebAGWikaUxCFYmIseIZ
	upQWzNYwTMYbETofoZTS9Ua1W5W01vEhnWgPhcvdU1zMqZSAptR+KqRPLHst06A==
X-Gm-Gg: ASbGnct5GG+D3XlVjFa8MBp4NmjLEQ7sf35AH8NOGg/5C8Sa10qj5zYWgcgwHOnTpVv
	ulN7EbABTUuFBw43HY5OLjW0F91Q4aYxbiHcn88Qdk2M/f9a5C8l+2PSTqIioTLsPdY0l7LDgr+
	Aa8WtyBmgywuFqUgV52o2b/90Gvi985Lxi9LV9CSihOEep1M//Y3yi7riR1vDHxJOykYG18uVky
	ScD5v/9TqsWJ3MziEz6JS7VmJ9VlFENfUTyXRCejXCtlcIdyU/J/nbnaZNTl0Ce5gKZOowgk64T
	6kiAX/ti2dVzoM0bRqHXASibWKXvlPldSgyNOhFTbuY6Stv8E48KdO6UFrZUVKPFrU3PiEVtaCp
	U2rwrGDRbnLtSdZ23ctzTfl8EY2JTIy4Ygh0lBspI9cTp6ythow==
X-Received: by 2002:a05:600c:c48e:b0:453:8a6:d8de with SMTP id 5b1f17b1804b1-453659c483emr103725395e9.1.1750692369560;
        Mon, 23 Jun 2025 08:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNRVVyXINDL7jZY1JkLGKvD6g8kads4JqMObyTsbdAPuaz4KvSAWgxOrlnqAthyUwCZZZneA==
X-Received: by 2002:a05:600c:c48e:b0:453:8a6:d8de with SMTP id 5b1f17b1804b1-453659c483emr103725115e9.1.1750692369103;
        Mon, 23 Jun 2025 08:26:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536470826fsm112280375e9.36.2025.06.23.08.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:26:08 -0700 (PDT)
Message-ID: <18ef9192-168f-4d07-a29a-952f2ce3a4f0@redhat.com>
Date: Mon, 23 Jun 2025 17:26:05 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/29] mm/page_alloc: allow for making page types
 sticky until freed
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-5-david@redhat.com>
 <D80D504B-20FC-4C2B-98EB-7694E9BAD64C@nvidia.com>
 <D718A3EA-89E2-4AD8-A663-2DDA129600C4@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <D718A3EA-89E2-4AD8-A663-2DDA129600C4@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.06.25 20:08, Zi Yan wrote:
> On 18 Jun 2025, at 14:04, Zi Yan wrote:
> 
>> On 18 Jun 2025, at 13:39, David Hildenbrand wrote:
>>
>>> Let's allow for not clearing a page type before freeing a page to the
>>> buddy.
>>>
>>> We'll focus on having a type set on the first page of a larger
>>> allocation only.
>>>
>>> With this change, we can reliably identify typed folios even though
>>> they might be in the process of getting freed, which will come in handy
>>> in migration code (at least in the transition phase).
>>>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>   mm/page_alloc.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>>> index 858bc17653af9..44e56d31cfeb1 100644
>>> --- a/mm/page_alloc.c
>>> +++ b/mm/page_alloc.c
>>> @@ -1380,6 +1380,9 @@ __always_inline bool free_pages_prepare(struct page *page,
>>>   			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
>>>   		page->mapping = NULL;
>>>   	}
>>> +	if (unlikely(page_has_type(page)))
>>> +		page->page_type = UINT_MAX;
>>> +
>>>   	if (is_check_pages_enabled()) {
>>>   		if (free_page_is_bad(page))
>>>   			bad++;
>>> -- 
>>> 2.49.0
>>
>> How does this preserve page type? Isn’t page->page_type = UINT_MAX clearing
>> page_type?
> 
> OK, next patch explains it. free_pages_prepare() clears page_type,
> so that caller does not need to.
> 
> I think the message is better to be
> 
> mm/page_alloc: clear page_type at page free time
> 
> page_type is no longer needed to be cleared before a page is freed, as
> page free code does that.
> 
> With this change, we can reliably identify typed folios even though
> they might be in the process of getting freed, which will come in handy
> in migration code (at least in the transition phase).


I'll change it to

     mm/page_alloc: let page freeing clear any set page type
     
     Currently, any user of page types must clear that type before freeing
     a page back to the buddy, otherwise we'll run into mapcount related
     sanity checks (because the page type currently overlays the page
     mapcount).
     
     Let's allow for not clearing the page type by page type users by letting
     the buddy handle it instead.
     
     We'll focus on having a page type set on the first page of a larger
     allocation only.
     
     With this change, we can reliably identify typed folios even though
     they might be in the process of getting freed, which will come in handy
     in migration code (at least in the transition phase).
     



-- 
Cheers,

David / dhildenb

