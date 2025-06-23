Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AE523B0
	for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671511; cv=none; b=I5L04SpZzrLro2m5BIPuQfDI3nFbGwoIjqkD9yWEGNBUElDAO5iuvoqucaCZZxYAqXPmlBdtgwoymgRr7BnswqUfPMDmTwBVXuPMGl+yUr+yfT5Z9Mo4D8FmPdlWw89osXPSh1x49SfayOZ56uwWISA+o1sVcn4A9LZm11hAyIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671511; c=relaxed/simple;
	bh=zmxYSo5AGjhsjGFT1FiDxKSxdbj3s7NDSz6Od4OtU+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSQ4GHYz9/OTrUmG7Rp26po3b6JP2Eyu3YN157mI7NUpjlz0ZxiKuqo7mlC/BHB/JyGDLvpCW2YpuDhpAKSjJUdv66MG1+Y/5E9AO00SVzNQlNWoQFwtaVvGQk2RN24mCpZulYmuvGfeST2zF8pR7zD6cxle/9PwWZdqqHmAA+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RtB2pkC5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RtB2pkC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750671508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IIVV4Odk/40YQkkuI3HzwbM1/qiUedYKHsqurz6zGiU=;
	b=RtB2pkC52bEXxmfYPMIw58L4nFYpHxN6NMvGxMORKhskRkE8wO8rKq0HpnOz7gapNdtJk+
	LnWp4N9sb/KJR6URFNDpNhwYzi3flMKEMfjl+mY+rj56CJT440iEk/u95nNtuLkt1lFq+4
	MqBrbTx33oY1X3qv53dsKo8zgxLRseY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-I7oCBebfN-2W9Roc16Qb2A-1; Mon, 23 Jun 2025 05:38:27 -0400
X-MC-Unique: I7oCBebfN-2W9Roc16Qb2A-1
X-Mimecast-MFC-AGG-ID: I7oCBebfN-2W9Roc16Qb2A_1750671506
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so18546015e9.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 02:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750671506; x=1751276306;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IIVV4Odk/40YQkkuI3HzwbM1/qiUedYKHsqurz6zGiU=;
        b=keIVxqlLXCioF4+MBbEtjmDmoqu9cFasb5wck0dnwbQzRqoCB1aqD82hsygkKnJNHH
         BYRFQnuHmTpV2ygP/2IyLRzITIRdxZvGvGzsY1ur6UnIcG0RoZu507S+Im2N4JTolUr2
         G9BQOohObXfoi0PDm5eEnwdnlD+zIIx+cgoPKZ6jx8Byh+o7mgh3XhGANGZZrJGVIuqf
         8lidZW8p+rW3KAjy2ysCxOSL4pFVmW5q5QiAgFe5LTrEv3zoMyXCkG4FgN/0gxAo9Yid
         4AVg/0YTdwRdJ6UVQnFrOlNAaKCom5+FU8onjrdUFOSBiEp68EQg40zuOtu5Pt9oxu84
         gxPg==
X-Forwarded-Encrypted: i=1; AJvYcCUxnpnbDHjXkvjOFiT8Kb/BFzljcbd1a07Ahs5SLuVSKFnC0ggToHSQ/XO6LZ2u76TANxXihmYj3Rc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu5q+frCAfG/MagOr45pY1/THjfqIiNgGKAroyVm+x0SW+0me5
	zx9W9/fZW9P3B+xKun5YnLbL0wE/ZfH3WrEyChBCOLxYbAXlxx385DCML9LfZKzPnm8gNYVUDCr
	exTCcLWsdIRwDVMi5Og3M9ZBRzXGLYqROQxNUpoQykMzkh59nJTOVYfgz/lIA+g==
X-Gm-Gg: ASbGnctaIwlN+oqi9u8ZIuxgTRWLFvMzn9FuQdfBXibJ6LJd7aV+P68CkOZW0ULOk1z
	J/So4Iyzcw3rznlccJJEMwc76QyhIvJVojWfOejb/8yAXi1Ie9TxBhZQEhaYgSag1piEkKFDUI3
	PmOQtzI46V63PrpcE6Xbc58zbtGmy74SM9h0zEEuJixmD8N+3panHU7yJxb4JIZr+RpM1/KP7QR
	LC4muyi/bNgRw3zkpt88ozcWX1VkSgjBTqicaWcawGRg1R6sYZq+gGA4Kw4JPKqnW4JCjp1I4D+
	ILWFyUKF1+aQuN+baPWmykXS1j4MGPnxwx8lIiDJeFP9k40WnH4mxA5kermBJbB8us4nfDOSvHe
	j6G1hYp/rgtlAlLKCc+OIBrhtcrQV3k2n4LZ0YAjWdC/8cTcScw==
X-Received: by 2002:a05:6000:4813:b0:3a4:eef5:ae26 with SMTP id ffacd0b85a97d-3a6d12ec3ebmr9270688f8f.55.1750671506172;
        Mon, 23 Jun 2025 02:38:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNeH/Q4yLmahMqkIjn4uvM0AW32gFLukR2zBy4trCFoRCt8QGaF6j2Zkve6GtG1GSUzYUxkw==
X-Received: by 2002:a05:6000:4813:b0:3a4:eef5:ae26 with SMTP id ffacd0b85a97d-3a6d12ec3ebmr9270671f8f.55.1750671505788;
        Mon, 23 Jun 2025 02:38:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f10a4dsm8797463f8f.8.2025.06.23.02.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 02:38:25 -0700 (PDT)
Message-ID: <50e5227a-48e6-446a-83a9-6e4136478fe8@redhat.com>
Date: Mon, 23 Jun 2025 11:38:24 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/balloon_compaction: update Chinese docs for
 movable_ops
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Nick Huang <sef1548@gmail.com>, alexs@kernel.org, si.yanteng@linux.dev,
 dzm91@hust.edu.cn, corbet@lwn.net, akpm@linux-foundation.org,
 wangkefeng.wang@huawei.com, vishal.moola@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250622004249.9083-1-sef1548@gmail.com>
 <b16a1df5-0b81-4600-bd68-2d261d2a3780@redhat.com>
 <CABZAGRGvf9Ge5EvMgFP3FUHt2QOpq6xXe9nB4=it9zb+V1DNwg@mail.gmail.com>
 <CAD-N9QV5r4YyO6qbL477x0sJar2=WTdHH=x58P9Qatff_HC3Nw@mail.gmail.com>
 <3c5f4ecf-d71e-4e61-a3d2-b7cdb3043efe@redhat.com>
 <CAD-N9QVTWRotabnVi9O4GViEGCU+MPE8VRw1ccGiEQRgh7mpQQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAD-N9QVTWRotabnVi9O4GViEGCU+MPE8VRw1ccGiEQRgh7mpQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23.06.25 11:35, Dongliang Mu wrote:
> On Mon, Jun 23, 2025 at 5:23 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 23.06.25 11:12, Dongliang Mu wrote:
>>> On Mon, Jun 23, 2025 at 4:51 PM Nick Huang <sef1548@gmail.com> wrote:
>>>>
>>>> David Hildenbrand <david@redhat.com> 於 2025年6月23日 週一 下午4:08寫道：
>>>>>
>>>>> On 22.06.25 02:42, Nick Huang wrote:
>>>>>> Remove Non-LRU Page Migration and Add Movable_ops Page Migration
>>>>>>
>>>>>
>>>>> I'm afraid most people you CC on Chinese doc updates will not be able to
>>>>> help in any reasonable way.
>>>>>
>>>>> --
>>>>> Cheers,
>>>>>
>>>>> David / dhildenb
>>>>
>>>> How can I fix these things?
>>>
>>>   From my understanding, you can follow this how-to.rst[1] and submit
>>> your patches.
>>
>> Great, a how-to.rst in a language I don't know. So I assume you meant
>> "one can follow", not me in particular. Because I can only parse some
>> git commands etc in there that are in English.
> 
> Yes, this is only for Nick.
> 
> I should mention the name before the massage. Please ignore it.
> 
>>
>> Which bring us back to the problem: if you CC me (and many others) on
>> something that is Chinese, I will not be able to contribute anything of
>> value.
> 
> Yes. Nick should not cc you in this thread since this is only about
> the Chinese content update in my mind.

Ahhhh, got it. Thanks for clarifying.

-- 
Cheers,

David / dhildenb

