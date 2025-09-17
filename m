Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF2929898B
	for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 07:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758092584; cv=none; b=qQx066ELL3UgMrI8jGWxkOxPQdmuaSiYhIPmpX/CUrzH9IxPjnwKNVd0uFiLyyXC4w3iE1AmHaqfjTrPnMFWZDKYJZWcfxvB/QxL/S72VJgaZE0w+ZQip9mRTp0s9aniQMi5WgJbgEyjbtRGckqLUUPV+utdG+KTzVmSV9Jqhls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758092584; c=relaxed/simple;
	bh=ko/99fPEHJQwgLb5nCPWVD8uy5wLTxH5KAinDw/smNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kgy8kzDPp9xR+7DJPMx/4sRVhyPLbvybDsfx4s2bvT/ajOGrHAtzaF2PB2TqxkmFlo2luOWtKBKusec6n2RJiC1u1rmxHp2GbdDGcoG5E+f5ncwecL/6O2rCOEBZf2Io/ZTEjsSMa6SNz0J7DWVIOhhUNsMgreH4n/mypWYn5b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rs/0kaYy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rs/0kaYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758092581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nawTqrlEeqSv7zVujc+JzfalbuSXfxtcl1SSEsQficc=;
	b=Rs/0kaYyBONENmZNXCGrPlFtnbnQCTHQYIfwwsI5JjDhsUmBfBQ3i79UEqWXu0/s5J/cJY
	uB+ZVkZr6jizbMQJr0hUm9nsRuPkeyeWPFTgQMnN7lXZQe4AoA+hx5GPqy40vnjCQY1Z5W
	iP5gPf6ZPcUdGTYxJXO/7vs02ZuJnVk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-7bZNRtnUNS64tOoFeWC6dA-1; Wed, 17 Sep 2025 03:03:00 -0400
X-MC-Unique: 7bZNRtnUNS64tOoFeWC6dA-1
X-Mimecast-MFC-AGG-ID: 7bZNRtnUNS64tOoFeWC6dA_1758092579
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45b920a0c89so33234375e9.2
        for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 00:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758092579; x=1758697379;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nawTqrlEeqSv7zVujc+JzfalbuSXfxtcl1SSEsQficc=;
        b=e9IlZMxsIoo2xnaoxkKKu+Yjq51+4rJv+y3No5x5/tDZpMgghASls0fCe47azlCNJA
         9cr6Ar6Z11h3G8onqyelQQTDx3ql73S+M/dC3SW5lCvorA7RyiJi57yEFGQdATyMczqt
         JvkM2rQQZ97MEW5U0/Ty6CuhOmPONerYG2i1CBxI3ULGtHHMStt9acW3oH3U153nA05K
         TRCggOd93xSY3E2R2bUtYpPJ5hj3Lym5qVlc4UuDxAc3zkLHKL48ScVyIHlioi1PePvF
         q+MQXIxdkfgLWxAPWTkrjXw3Xkbqv0wMxFQyPkNtVDJ+iN4K5YBuQl0TweAH/dJP35z6
         czEw==
X-Forwarded-Encrypted: i=1; AJvYcCXq0xhcNGzwZHahPKAWpY+3nr7VPSZ0G1xfMtGD0NN3ia2J6bfAQ7hulqrQu8N3cOXs5vqtpr1I3gY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqBJz+J/m2NJfx3OL8ZCKIP0xS5fqE3xn7pfa5BoHi8EPnwdB1
	TsIFS7pPc/U8eT89U0DRpirM6L+FduqFou647YiQmNWOriqJjK7fTAAjIgcmq0fdwQrTzk6Flne
	FHSQ0DyMOqnuHkioF6qyRPvVmSml1gX500mvxF1JSgWFogIu4RWREQKh8XQA46w==
X-Gm-Gg: ASbGncvjvzpHGl1TYuXaJmPz4Hn8RskNGCWwqusCLGCY+rXrNYYHcL/K3n3u5V3IY1q
	UIfciPoYYVTG6OP930WICfoocBvi6PoOXkyOfS4o43oTF7edEd0/GxX5jx+Rf+sED9qUTxUzd80
	nfEyomPvIQ3YGpbrOG8TJZPrHpQAjpieSZH1NFQdDVzJHuSH6EsUV5I5TLaHzQQYs/Yafjm46O5
	FAqkn29DNQ8worGN4q41FKCNKiaJ2rR0ZbpCsCt/QPLKYpckUzvnilPqR8ZxeEt7Ol55Qmb6p/R
	Q7Mi35x/8sM0i407IATDiLCuLAkkxjMy/p50226pjIkzJszJF9JiYCDTrLX/NyOBrbN675W5bZW
	T/2iRmPda3grfom9RmL5nvFEMRA3xYlDHMJixZhuH1fE/7KoTxBe5dUbwrDSmR0Bw
X-Received: by 2002:a05:600c:1e88:b0:45c:b56c:4183 with SMTP id 5b1f17b1804b1-46205adf753mr8270765e9.18.1758092579140;
        Wed, 17 Sep 2025 00:02:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCHXqLZgubOsFpSEryXy6qEwTu5TBAMNWT2kDUAPReOb9ESdWMxgF+theDpncx+aIUqSILpQ==
X-Received: by 2002:a05:600c:1e88:b0:45c:b56c:4183 with SMTP id 5b1f17b1804b1-46205adf753mr8270405e9.18.1758092578660;
        Wed, 17 Sep 2025 00:02:58 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:6d00:7b96:afc9:83d0:5bd? (p200300d82f276d007b96afc983d005bd.dip0.t-ipconnect.de. [2003:d8:2f27:6d00:7b96:afc9:83d0:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46137a252fasm23338645e9.7.2025.09.17.00.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 00:02:58 -0700 (PDT)
Message-ID: <8c3188da-7078-4099-973a-1d0d74db2720@redhat.com>
Date: Wed, 17 Sep 2025 09:02:55 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/memory-failure: Support disabling soft offline for
 HugeTLB pages
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Kyle Meyer <kyle.meyer@hpe.com>, akpm@linux-foundation.org, corbet@lwn.net,
 linmiaohe@huawei.com, shuah@kernel.org, tony.luck@intel.com,
 jane.chu@oracle.com, jiaqiyan@google.com
Cc: Liam.Howlett@oracle.com, bp@alien8.de, hannes@cmpxchg.org, jack@suse.cz,
 joel.granados@kernel.org, laoar.shao@gmail.com, lorenzo.stoakes@oracle.com,
 mclapinski@google.com, mhocko@suse.com, nao.horiguchi@gmail.com,
 osalvador@suse.de, rafael.j.wysocki@intel.com, rppt@kernel.org,
 russ.anderson@hpe.com, shawn.fan@intel.com, surenb@google.com,
 vbabka@suse.cz, linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
References: <aMiu_Uku6Y5ZbuhM@hpe.com>
 <a99eb11f-a7ac-48a3-a671-c5f0f6b5b491@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <a99eb11f-a7ac-48a3-a671-c5f0f6b5b491@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> +
>> +	0 - Enable soft offline
>> +	1 - Disable soft offline for HugeTLB pages
>> +
>> +Supported values::
>> +
>> +	0 - Soft offline is disabled
>> +	1 - Soft offline is enabled
>> +	3 - Soft offline is enabled (disabled for HugeTLB pages)
> 
> This looks very adhoc even though existing behavior is preserved.
> 
> - Are HugeTLB pages the only page types to be considered ?
> - How the remaining bits here are going to be used later ?
> 

What I proposed (that could be better documented here) is that all other 
bits except the first one will be a disable mask when bit 0 is set.

2 - ... but yet disabled for hugetlb
4 - ... but yet disabled for $WHATEVER
8 - ... but yet disabled for $WHATEVERELSE

> Also without a bit-wise usage roadmap, is not changing a procfs
> interface (ABI) bit problematic ?

For now we failed setting it to values that are neither 0 or 1, IIUC 
set_enable_soft_offline() correctly?

So there should not be any problem, or which scenario do you have in mind?


-- 
Cheers

David / dhildenb

