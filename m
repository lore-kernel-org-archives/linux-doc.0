Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F94F28D85F
	for <linux-doc@vger.kernel.org>; Wed,  6 Aug 2025 20:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754511290; cv=none; b=XFnSdEpE4mlK+A7YGr6h6qE+DrgBcsDKd70HvPkXu2ZndH+J11F6YmBdq6XzXsPpbFycPW7d5bqhqnw8P8QmjpPGxMsYOwSBpXciROkpc3fupjATJBlcRbbPCRGlNe7IbB+sWN8EWpGiH80xLE4Spl3p1yluPHBIOb7eKyTqvJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754511290; c=relaxed/simple;
	bh=NgXUl4YxXuF66+PoNM170cp1mBj+O8qZdlaedoWYNHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMEOp5TOvT6FFVXrHgTFJRYFE9dgJ1yFrDh8YDkd10qUGVUee/9z0x3TDwTOCHXSDgD09uaX1ly0G2KOzlOmq/xHIGTp213u6Nw8RB/6GB4g1W/3clq5ns3efLGsJeWYLwbDILp8+Jfojenci7bpxHdSH3c+s5JW1RaJo/VChaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSyw6pAJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSyw6pAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754511287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=d5P3sES8n4ihLK1cm4EwCWnvXovipYsvkDDRkGH7Rt8=;
	b=MSyw6pAJxSUT0Tx+RdqBNE6oRUwUi0RQ3aXMZC28AndKF5Dv/N9/JGDinVyDtQf0UN7JE8
	7VqSRDFYnEUR7w9vzxV9HtpWKzSnnOdqYWsyBdtPjzYo38Yd8rfhqPqYeqDxtA6gF1dOaT
	jfD88F4C/vJZ18LrrZf2zsBvSJ352CI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-eBsEMvxTNmu9P6r4zICk5Q-1; Wed, 06 Aug 2025 16:14:43 -0400
X-MC-Unique: eBsEMvxTNmu9P6r4zICk5Q-1
X-Mimecast-MFC-AGG-ID: eBsEMvxTNmu9P6r4zICk5Q_1754511283
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b7961b3c82so67045f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 13:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754511283; x=1755116083;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d5P3sES8n4ihLK1cm4EwCWnvXovipYsvkDDRkGH7Rt8=;
        b=IxqB8aqU83kwLubBIVoBl2AW2JrksMgHEH0+nBL2AUnQKOt8ojXwxKxYQDejkK+W6O
         xSW9EKS8SUOqfZaask+XuakRfszRWXgWs59+sPnpDcj8/zwU6ZNcF82UGInmrAPf5G4D
         jdDi5Kt3WmuUoB7K466g3SdOlucVLCStz0lbKbDAmvGuZgrp3rhWg0vFfCFT8r6jNm1G
         WSqYv4/aSYxi+sn3fDI92ROlY394kgw+vbCPVLZxMMXobFRlXBDvv+4AMTdxVTZ/pcZS
         jcQvRd0FHxStEwOrRHuUdtfDQpjngMPID5Zk3WY07h6Le7kwfOEsdUCFRetpP7OQTB9m
         GpaA==
X-Forwarded-Encrypted: i=1; AJvYcCUlrntN4hlnzHfqHTiqVIR+FJkDKfTsclnTUNkIigpvZeZi/x7JTOqyOdboZDYvTKONgriDnnQSt2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxpp2x6Ow/ixcQHXvm+02j1Pf8F61F6x3mZsJznV2CeAaWv4Iu
	XDslGw+usVYh3qw0a1+aq6R4uqZ78D3BumCP8zwfb9BGt/Z/6el408mu2EJuehw4KW7abMkvu0k
	oc/GsZ/CTgssmE9/yz5Ie5y98GP6d5DAsTITRKRqhnrTuuIG4Pvbd+z5i5RxICD9w34AkHg==
X-Gm-Gg: ASbGncvldQ+7TEnLQnV1vHV+lCQNUXnLjNOilbnGNfES95XojBdc5VuKA3FVapGtwAB
	bWWs+qyv4RK6GHNyh5FKyZE70Y6JAsJd5SErLdDYjmyTJbfrCdMqEJLQu/dbn9rOkQ6V3VBZmdE
	3nBuFIQnxNsgNssUXX8m7nhNqti2t8bzWaj9nQfP/rzH35/aQuhs2rZfnSrJAq+Sed9v+ZAdLCS
	M+6ob8zae7+N7E4+L/vSMXMK04/5p6EHeRk/c5YdcxZ/IZO0jJNp76FqcNxMZMf2dR5Jm2QPLeu
	b3CVhnTjNx7ums2U7bkHCl5eD5iAI0F+gKlaLmsWBtht9cOkZN5hb1IQUJ6qec/6AWHScaaX3Pa
	mhVyJSMTbeZDSdR+Hv54dtvhXcqFXadw5NdCHBVPwzHqp2ksbFwZ6GVj3NmR7QC0mZxE=
X-Received: by 2002:a05:6000:2388:b0:3b7:8146:4640 with SMTP id ffacd0b85a97d-3b8f9f79c9emr194013f8f.56.1754511282658;
        Wed, 06 Aug 2025 13:14:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG0bY644qbBT42RA/yeTwcYjH2tuKmM7gFFv+ZX33Fj0TwtCMSS0ZQLo9cfyNEiDWpFtTRyg==
X-Received: by 2002:a05:6000:2388:b0:3b7:8146:4640 with SMTP id ffacd0b85a97d-3b8f9f79c9emr193986f8f.56.1754511282226;
        Wed, 06 Aug 2025 13:14:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f42:da00:badf:cc55:23d5:1679? (p200300d82f42da00badfcc5523d51679.dip0.t-ipconnect.de. [2003:d8:2f42:da00:badf:cc55:23d5:1679])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed0ecsm81898565e9.4.2025.08.06.13.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 13:14:41 -0700 (PDT)
Message-ID: <055a8a69-731d-43b8-887e-54d8718877cb@redhat.com>
Date: Wed, 6 Aug 2025 22:14:39 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] mm/zswap: store <PAGE_SIZE compression failed page
 as-is
To: Nhat Pham <nphamcs@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Michal Hocko
 <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Yosry Ahmed <yosry.ahmed@linux.dev>, kernel-team@meta.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Takero Funaki <flintglass@gmail.com>
References: <20250805002954.1496-1-sj@kernel.org>
 <761a2899-6fd9-4bfe-aeaf-23bce0baa0f1@redhat.com>
 <CAKEwX=MVBJ+Okfsob4Z30_5Y4P8c2DWoS1dYN4dF5dgp4+CexA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <CAKEwX=MVBJ+Okfsob4Z30_5Y4P8c2DWoS1dYN4dF5dgp4+CexA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05.08.25 18:56, Nhat Pham wrote:
> On Tue, Aug 5, 2025 at 3:47 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 05.08.25 02:29, SeongJae Park wrote:
>>> When zswap writeback is enabled and it fails compressing a given page,
>>> the page is swapped out to the backing swap device.  This behavior
>>> breaks the zswap's writeback LRU order, and hence users can experience
>>> unexpected latency spikes.  If the page is compressed without failure,
>>> but results in a size of PAGE_SIZE, the LRU order is kept, but the
>>> decompression overhead for loading the page back on the later access is
>>> unnecessary.
>>>
>>> Keep the LRU order and optimize unnecessary decompression overheads in
>>> the cases, by storing the original content in zpool as-is.
>>
>> Does this have any effect on the movability of the given page? IOW, does
>> page migration etc. still work when we store an ordinary page of an
>> shmem/anon folio here?
> 
> Good question. This depends on the backend allocator of zswap, but the
> only backend allocator remaining (zsmalloc) does implement page
> migration.

Right, but migration of these pages works completely different than 
folio migration.

But I think the part I was missing: we are still performing a copy to 
another page, it's just that we don't perform any compression.

So I guess *breaking* movability of folios is not a concern.

But yeah, whether these "as is" pages are movable or not is a good 
question as well -- in particular when zsmalloc supports page migration 
and the "as is" pages would not.

Maybe someone familiar with the code could shed a light on that.

-- 
Cheers,

David / dhildenb

