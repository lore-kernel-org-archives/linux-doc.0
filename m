Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2761F5435
	for <linux-doc@vger.kernel.org>; Sat,  6 Dec 2025 17:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765042571; cv=none; b=SUABPl0ekYslwrHFDE/j5/WoPrjR9XEP4x1v29WOLnmvK2hGdTvtYLg1rfXRM/2119lfWdGInXPohPEmJ6zFy97iMhNPX1IwI8HlbZLC83QU9kUUZ5RQ5zVOPRoLMMz3gvn+CNigoqKTAFLRQjTL8qVZ7DkJDLcxrcricmzfbs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765042571; c=relaxed/simple;
	bh=BV8UsvTRLmfp6zETwfZ2SYkpGDxQC10drZ+vPnj8UdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhCQTc1UpuUvNB8XsCZMzfAdPnEe/CLWV2P0jGUy5mJaHn9Yn0cr72W6UP59NLS7NDBj2AoWGqDyDufn4gjEeC0OaCnjL1Acpiy/wQYldoVzahNZHsCfdI+8RhWfO5T1WvJvJy8w4mCmV2jJAQeVnXwlOXhYCOz6U7wgjCLTvfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdIYgKmZ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdIYgKmZ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2b80ab25so1371621f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 06 Dec 2025 09:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765042568; x=1765647368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/U8Y9phErjUz8U7ddzGo+Qu6i3pvwgAePj2NAkmM20=;
        b=PdIYgKmZiw/ZN96knLSbABaHxp8e63Kz8f7liOtX/Zm8ISjdM8adS76wJSImkh8/39
         8v98OdKEFf328vNESGBD4jdo5FJ5EDn0za7ZsDdfUN1lAKyq6vnJHiZMcwfFcSnsTPJh
         UkyNC1URtdrtlrA299FkYoyUa4YpvjnE6b9zpSEB2AytTafnZjz+48nN8FP0kInmbT15
         FFYpY8uhGU1tRoOyFRwKerqmg9XeaALydcQ7PT/GXUxANB7PHFou74Dj6xhO3lMx2h0b
         4NiaxK5O52njWP9okr8zApHsRvpgAjeBYYghybOy0iveDQB4zpvShsIbjPJ9KgU12Clz
         WQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765042568; x=1765647368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/U8Y9phErjUz8U7ddzGo+Qu6i3pvwgAePj2NAkmM20=;
        b=BpmOzlvta1ENE+Ud/1gmMgccZMVpvQOabKNhyXKOeGp0arYAS4/rFSYzH5Uwi/+Xbs
         UVQBFJykxYabUhZ+iKhnypNbx/1Bqtm9VbRx5HDdA4q5s/02ixxTKfqg5AY719aVoXIn
         Wl/c3kNN8zwHK8Sia0tn2wri3vWQzeNreFHADDWiLttw+uY2Yuj8mQR7yuei34cjAech
         fqA71pajmBTFqsY/Pg9BGaoLWX2qgTEj7LE0i3pobTrndHC1wlIK2/8cN1zsUEV8ccev
         e8OamW5LW3FGx6sBbSLKJHs8MnQ5wXNRImXnQR70J9cpk+/LbB8QvgiiD+a573Xw0Ukt
         3jFA==
X-Forwarded-Encrypted: i=1; AJvYcCXxOPSBDivRwfAxsXJ+uQ+hIH6RMFkTFwXjCAomYGFXscrHjmiAaEML9N8Ja2IUC8LFTGZnqam2HsM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ftaJUQmmlYQZIB9J01VDSuLrvLHuyeXo3QaE1AhxVEW72dG7
	Z3BStkRVAnDsi1dYAs6lFf5kXQ29ImM2OqrSb3VXuXbMbos6Qr6LTM5Y
X-Gm-Gg: ASbGncsiuv+OlCQDEafDX8f44NsMLvQhkNtl1oUr2nIAmSPfUnySK/3mSfXrR1dkY2t
	PEc11foDSzPg/eIrn3VclBA/cop4UziVERQAhFoxN86Yewb6/B05oKGNu62mjvO+5LKKKfts9rW
	p0GXWZgzrXJ8hNd9a+RHg/QXcpedq7YBSfiJ69CYQwyIItevxEgUyZY+l23kOcs38MJFoINLxBy
	dWopOKdwcu7o0N7zDpue9z03jHHopS2I2clqa8rLeqlNinkV9r2wRiaUzjWNg7CYsMbNv9r4L2G
	ISqcPv8+vg5aje5LVglWiphH1B0T18FnrsEBnpH3L7abQs74sKmf7Ipbx1+ry+zQsZk0R+61PSq
	0GA5N1Rgzzm+gY0tPhqug1DLDJOCBDPoxGM6DuNMQAVCGgVLccWO3fHu2kkGArMGZs9OjjLr+Bl
	r9kfrnQHOlTD2wBLCew3LMagr29aT9qXGjTkrnR7jh38jvmLpcqry8rVFa8lx5k9Xw0/ewHKdzd
	6xByxbJFiig
X-Google-Smtp-Source: AGHT+IHW3WHErMLLfXSoVJIYGy2e1YQjfbipOXf9Or0j6jft2XgmGzZiak+evTlontTlfAzYxJ0Zqg==
X-Received: by 2002:a05:6000:1889:b0:427:167:c2ce with SMTP id ffacd0b85a97d-42f89f57076mr3112854f8f.42.1765042567565;
        Sat, 06 Dec 2025 09:36:07 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e750:1800:450:cba3:aec3:a1fd? ([2a02:6b6f:e750:1800:450:cba3:aec3:a1fd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe9065sm15517384f8f.8.2025.12.06.09.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 09:36:06 -0800 (PST)
Message-ID: <996d8153-a69a-4075-aa1a-945ffe3630e9@gmail.com>
Date: Sat, 6 Dec 2025 17:36:06 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
Content-Language: en-GB
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251205194351.1646318-1-kas@kernel.org>
 <20251205194351.1646318-5-kas@kernel.org>
 <22609798-e84b-46ca-9cb5-649ffba4a2a4@gmail.com>
 <t3z3msqpbtnkgwqs5fxvnd4zsymclxzzr6vcaubv7z5jtqd46i@g5vtuktue54s>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <t3z3msqpbtnkgwqs5fxvnd4zsymclxzzr6vcaubv7z5jtqd46i@g5vtuktue54s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>> hmm my understanding reviewing up until this patch of the series is that everything works
>> the same as old code when struct page is not a power of 2. Returning page here means you dont
>> fix page head when sizeof(struct page) is not a power of 2?
> 
> There's no change for non-power-of-2 sizeof(struct page) as there's no
> fake heads because there's no HVO for such cases.


Yeah, I forgot that while reviewing :). I see its mentioned in vmemmap_dedup.rst as well.
I think might be good to add a reminder in the commit message that HVO doesn't apply to
non-power-of-2 sizeof(struct page), but no strong preference :)

> 
> See hugetlb_vmemmap_optimizable_size() as I mentioned in the comment.
> 
>>
>>>  	/*
>>>  	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
>>>  	 * struct page. The alignment check aims to avoid access the fields (
>>> @@ -223,10 +230,13 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
>>>  		 * because the @page is a compound page composed with at least
>>>  		 * two contiguous pages.
>>>  		 */
>>> -		unsigned long head = READ_ONCE(page[1].compound_info);
>>> +		unsigned long info = READ_ONCE(page[1].compound_info);
>>>  
>>> -		if (likely(head & 1))
>>> -			return (const struct page *)(head - 1);
>>> +		if (likely(info & 1)) {
>>> +			unsigned long p = (unsigned long)page;
>>> +
>>> +			return (const struct page *)(p & info);
>>
>> Would it be worth writing a comment over here similar to what you have in set_compound_head
>> to explain why this works? i.e. compound_info contains the mask derived from folio order that
>> can be applied to the virtual address to get the head page.
> 
> But this code is about to be deleted. Is it really worth it?

Ack, hadn't gotten to that commit.

