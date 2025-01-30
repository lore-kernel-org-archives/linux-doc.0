Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDD418F2DD
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738229085; cv=none; b=bl11zKBpv84BDM5hO2cf6aDwDxhGd9uVMxDTScjCSZqULRARJrXbMGR8LU2CzoHMqM+EPFQN/9RzNMWEacpvPbTWzXa9RcopgNqpvMH83uOQpVkwDWXh3CJWvcZ2gjqsNQwQ+bAesEWBrwlpz1Kp6mijwjnO9ddJHMWvFPYnv5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738229085; c=relaxed/simple;
	bh=oloF2T5TDO6m9NKDVzl0e3LX7kA2V+eNJsL7RD/jhBY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TT1ViMlm+etfjM5WWDOYFH0eWxSGNGmGHxl3hRAiKpFNIJxn0CvIIXlcrlL3BKx2oPGyttq9uttu3N6JPme0N3vhG2FCXz5xumlopG6GddUEIOQUSZAQ4KCz66/xI0/qdA3iWr0ArQQEdMWJb3Lb/xV5kAf/WIftvzu4vAVBNoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PfU9G+Yu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PfU9G+Yu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738229083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AgWsEgCc4GvIDD2B+IjlgI9qdTH1nhae1Uz1TWiWBYA=;
	b=PfU9G+YuQK695JgzplyXHP3FJfPkKxcNcUTX2Wr2mv1C9Ux+YKl/x2a71HaB7k589kaNkY
	F6VY2oRPS1E6JjdFoGHzetemKzbgNH0ho6GM30metCIULcSLTAPKuz59IyFVxEXf6lzul6
	OhGcbx6eSfvQwFm2U1zlN3LGlnSlFoo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-xqeLV2sjOiGDoqLLA4EY5Q-1; Thu, 30 Jan 2025 04:24:41 -0500
X-MC-Unique: xqeLV2sjOiGDoqLLA4EY5Q-1
X-Mimecast-MFC-AGG-ID: xqeLV2sjOiGDoqLLA4EY5Q
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3862e986d17so218350f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 01:24:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738229080; x=1738833880;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AgWsEgCc4GvIDD2B+IjlgI9qdTH1nhae1Uz1TWiWBYA=;
        b=n7ASDKy2qnm6aF/Y++T8z0X9arMpxzkwCUZvFbuubek1wJy/pofH32pt3la612vCqL
         mROZzNqyXv8KQhZsUpFbQvBiVS9rMVr5IhXgrs0xpKNPqFi5RxzSNgefZK+8gaJNNVFp
         Q3zmVEae4Q6V/fBG5jya95STJ9t2cj9ZOITlBlPlBfwYfMyAy48Go+2TMc/GRHTzAXD7
         mcoTnBjcKgsbLCx6NHqMr5DiYOJrYBwpUa1KpP3Cdwlc5Ix5mWfTfUkRvO6Oq7L/ZqaH
         5Be6/Uct2Vh+oYUnKlICFN5xhm7vwpi5XxTD0KBwzE0MJNhoVDl1k+h8SYCWNpb5CfxV
         QDIA==
X-Forwarded-Encrypted: i=1; AJvYcCXVoJVqq5Yj6KbgZbG20LHlAGGZTQ0Hbu+CzbsPBuSjucNs8herNjjcGv+mgXLZiCvCdKJiiytPWDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfRwZxL2ghN8W8jeh1VZ6cUleLv+B2/re1yMhH3c5Tm2C+OxTG
	g7j7fxqD2XG4aP7Uh4fCsj30vB3nf6CjCUOZ8xqhqL28SZZ6MQ88BV8fbu8V6jk4h52U92Y8yxg
	v3xrmmuy2/nbjL2YDKAgRdHLTt73MNCQMFza0GGfzzxO0r/+I95302KIK4Q==
X-Gm-Gg: ASbGncu+116stYPKkyczbsAHBHwcj9K5COmdibMJSiPwALU09eD6XPgJNcoc2EnMg8z
	j/cpXepukf/Q04XeuNI1znLDYM+zhbV3o/epkBuF1WpvbU++W68/ipJc1mKfikux8fss/jhksht
	EYus10yEwNrrvaLoAhxeM/TeOvf+c38dme9CTMdj44CZlnOZ944ibnmXbS2e1nDHgvLJhFjSj57
	Znmy59cpoBgTH/CSZMBg9K042CclKCQVS9GXTV77zILdYiTZ+baQHnkQ7FpFqzGY3pvIhAigpqE
	PFr58EEfr5H60szWNbDcaaFDO+UxMBNX0IrmQp6Ow6vL
X-Received: by 2002:a5d:47c5:0:b0:385:f092:e00 with SMTP id ffacd0b85a97d-38c520975b7mr5464491f8f.50.1738229080237;
        Thu, 30 Jan 2025 01:24:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPsT0tp7MlPmJ5d1a4j+wbYUvfNepMnGtnz6DBjlfLio8haZQowpOaHS464RFpM5lmeYL4CQ==
X-Received: by 2002:a5d:47c5:0:b0:385:f092:e00 with SMTP id ffacd0b85a97d-38c520975b7mr5464464f8f.50.1738229079878;
        Thu, 30 Jan 2025 01:24:39 -0800 (PST)
Received: from ?IPV6:2a01:599:904:96e0:a245:aa9f:6c57:eb41? ([2a01:599:904:96e0:a245:aa9f:6c57:eb41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b5492sm1389915f8f.73.2025.01.30.01.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 01:24:38 -0800 (PST)
Message-ID: <c5befaa4-bd00-4784-ae66-ddbf16dfe1d9@redhat.com>
Date: Thu, 30 Jan 2025 10:24:37 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive() using
 folio_walk instead of rmap walk
From: David Hildenbrand <david@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
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
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-5-david@redhat.com>
 <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
 <180e9c2f-51fe-44ba-ac68-5aa7b7918ab0@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <180e9c2f-51fe-44ba-ac68-5aa7b7918ab0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.01.25 10:01, David Hildenbrand wrote:
> On 30.01.25 07:11, Alistair Popple wrote:
>> On Wed, Jan 29, 2025 at 12:54:02PM +0100, David Hildenbrand wrote:
>>> We require a writable PTE and only support anonymous folio: we can only
>>> have exactly one PTE pointing at that page, which we can just lookup
>>> using a folio walk, avoiding the rmap walk and the anon VMA lock.
>>>
>>> So let's stop doing an rmap walk and perform a folio walk instead, so we
>>> can easily just modify a single PTE and avoid relying on rmap/mapcounts.
>>>
>>> We now effectively work on a single PTE instead of multiple PTEs of
>>> a large folio, allowing for conversion of individual PTEs from
>>> non-exclusive to device-exclusive -- note that the other way always
>>> worked on single PTEs.
>>>
>>> We can drop the MMU_NOTIFY_EXCLUSIVE MMU notifier call and document why
>>> that is not required: GUP will already take care of the
>>> MMU_NOTIFY_EXCLUSIVE call if required (there is already a device-exclusive
>>> entry) when not finding a present PTE and having to trigger a fault and
>>> ending up in remove_device_exclusive_entry().
>>
>> I will have to look at this a bit more closely tomorrow but this doesn't seem
>> right to me. We may be transitioning from a present PTE (ie. a writable
>> anonymous mapping) to a non-present PTE (ie. a device-exclusive entry) and
>> therefore any secondary processors (eg. other GPUs, iommus, etc.) will need to
>> update their copies of the PTE. So I think the notifier call is needed.
> 
> Then it is all very confusing:
> 
> "MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
> longer have exclusive access to the page."

So the second sentence actually describes the other condition. Likely we
should make that clearer:

--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -43,10 +43,11 @@ struct mmu_interval_notifier;
   * a device driver to possibly ignore the invalidation if the
   * owner field matches the driver's device private pgmap owner.
   *
- * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
- * longer have exclusive access to the page. When sent during creation of an
- * exclusive range the owner will be initialised to the value provided by the
- * caller of make_device_exclusive(), otherwise the owner will be NULL.
+ * @MMU_NOTIFY_EXCLUSIVE: (1) to signal a device driver that the device will no
+ * longer have exclusive access to the page; and (2) to signal that a page will
+ * be made exclusive to a device. During (1), the owner will be NULL, during
+ * (2), the owner will be initialised to the value provided by the caller of
+ * make_device_exclusive().
   */
  enum mmu_notifier_event {
         MMU_NOTIFY_UNMAP = 0,


-- 
Cheers,

David / dhildenb

