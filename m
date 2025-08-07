Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8528A1D7995
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 05:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754546136; cv=none; b=VKk6o8oM+dQiLmhJ66N9Ql20+WxWkUh5DGNAwavNV2TprogoXb7WOlz5lYNwJ0Rq7Ey2UTY5l4Vu/z8ApacM7/CC3Viy286lelixaUNNqGhpjp79j0ZhXc4hNLF6TNJuvmB1V2/Q27B98R8V+5rlsQTsX4e+8B3BCyNkaBYdQtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754546136; c=relaxed/simple;
	bh=q91oghgucfy4d/4IJR8jb5aBP3fpyShUx8waoI1W7mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EkfYOuYa2l7GX4qNL1PJ+a+MQWky9OYOPEfyFYeolXNmv9Vv/ODUqquLMKw1PKsXUiCYjX8fJL60azyya2JkO+zQmwz4jCNaeg+Ygbm8JZPPrre7KaQxOgDBhGFl3iChz/TRD/LVZf8XRMpmJQsE6N0KwWr4XsriWUZoDOmUnFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h2uFP84d; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h2uFP84d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754546133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=p7T7nHeTlN9HwipzMNJDP8Bfwjs2xG35T+M5i7PC0Cw=;
	b=h2uFP84dl9xSVyEYTkHVkzkDcMdxudigd4MPN86Mlg2FdJyZEzQY+KqXC5uChYZJ07Z6C6
	ij9UPmfgmwYihCM1DD7VRXHoMM6lhXLVQx2Ny2Fw4G59DKlIR+yJLdSF/RI4IuZ2ylATPw
	AjQCiknyEpO+92ItTQmVZU7t47bDnoM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-DhinY9_yPEeb46Ej-tXa9w-1; Thu, 07 Aug 2025 01:55:31 -0400
X-MC-Unique: DhinY9_yPEeb46Ej-tXa9w-1
X-Mimecast-MFC-AGG-ID: DhinY9_yPEeb46Ej-tXa9w_1754546130
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-459de8f00cfso2333785e9.2
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 22:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754546130; x=1755150930;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p7T7nHeTlN9HwipzMNJDP8Bfwjs2xG35T+M5i7PC0Cw=;
        b=govnV6o+NS+EAzf2ELOOu23KYXdGi4i7MMsEuwID+BqTcqsBvMgZVCkNL5RLiEdK4A
         +NuUpPge1/rUeBmj4b2Mc6BbHd0gMLo76Mdmq9JEcRcE/I79wdDj9rcGptnA5Fh49U4f
         mkbVGw6sxxtL54TQ2nl57hggGxqKOjoTDL2h9zumf97kIBn6FPlk53ZXZ+SZg6CDOuYb
         q7VQMI1Xxqsy8G98BoAyVh67fUCd0Uj/sT6LyezKbPImZ3e8RFYAIzRMo8m1oorzi5qk
         lK5lx2tXsc1GubbTkEHYxYwT1Pjyd0+aKKwL2wCiZoC22vs8JqXKIYM6Myb5FkluZEOU
         IZwg==
X-Forwarded-Encrypted: i=1; AJvYcCUQggiYZWh5lmViZljlHw9NWi92f7Fikt6L1JspX+PaQi0AmDXkHIgwHB8JMdAarCPH2CbqTw0+x7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA/ej76P2HByknqTC4KRQZN2axkBAKSSru00yttG54mmXAHFBu
	9+Ei0JQLimX8FXBiDXrK+ipObKZOSV9KnJm/pwG/QXJkWOFvWkPE7QH2QHRdMZiZbr955V7F8SW
	g6KNvghbgCKRlwCUw0NcGOmS+zNwUIBPvsNUyEdU4zSIerdfWaL5SfYlfLdbeww==
X-Gm-Gg: ASbGnct5KT5QdB1YI7DSopBnf4f+Dz/TKOqWi2Tb9l0kCKnycD168+H9sJlAlMskvV3
	50XnxPnnpgAxRBdLUdpTAfEC7O/bwTje3KHbSI7Y2HZBtObzwN4lgLrEl1lgm8rJbWixCkrBICg
	zwlzEPqOpqYq3bcslCZN1uQxIOt8ornpt6yewyGjBQpI1eeEUns/faQ9ZVfhamyIwKoHgMGt/or
	yCUvbcoAOXzzCLOEY6i94+jg1LDCzL75fcQlKw5XfDKBUqZYX0yV+YfRUfVG7u+38eW5mr8j5ji
	M1nEkoOxiBTWuRlmNQ5XKG4Dx6lPo5b8K1OUfY3RG8Ml5pVaBvfYEymJRyTiZnTAT9qPOA==
X-Received: by 2002:a05:6000:4308:b0:3b7:99a8:bf6e with SMTP id ffacd0b85a97d-3b8f41d50afmr4804882f8f.51.1754546129972;
        Wed, 06 Aug 2025 22:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrCIxSNpL5yXQYQfvCpzINdTrOpqDRRm3qfN0xJSXs+Wik+zOu53yB4YxDQ7mNhDwLqABUIg==
X-Received: by 2002:a05:6000:4308:b0:3b7:99a8:bf6e with SMTP id ffacd0b85a97d-3b8f41d50afmr4804861f8f.51.1754546129574;
        Wed, 06 Aug 2025 22:55:29 -0700 (PDT)
Received: from [192.168.3.141] (p57a1aa57.dip0.t-ipconnect.de. [87.161.170.87])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac115sm25527853f8f.12.2025.08.06.22.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 22:55:28 -0700 (PDT)
Message-ID: <2fa2f288-bb82-4a9b-8dec-3a4c768fb970@redhat.com>
Date: Thu, 7 Aug 2025 07:55:27 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] mm/zswap: store <PAGE_SIZE compression failed page
 as-is
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Nhat Pham <nphamcs@gmail.com>, SeongJae Park <sj@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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
 <055a8a69-731d-43b8-887e-54d8718877cb@redhat.com>
 <jn2fzoodgcxmyld5c7k6jifigkmbhmq2gftvxx7k4ei2kz6r72@vlrndnijfgrf>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <jn2fzoodgcxmyld5c7k6jifigkmbhmq2gftvxx7k4ei2kz6r72@vlrndnijfgrf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.08.25 01:48, Shakeel Butt wrote:
> On Wed, Aug 06, 2025 at 10:14:39PM +0200, David Hildenbrand wrote:
>>
>> But yeah, whether these "as is" pages are movable or not is a good question
>> as well -- in particular when zsmalloc supports page migration and the "as
>> is" pages would not.
> 
> By "as is" page, do you mean the page which the reclaim code is trying
> to reclaim or the page within zsmalloc on which the content of original
> pages are copied as is?

I mean whatever the "dst" is here.

+	if (zswap_save_as_is(comp_ret, dlen, page)) {
+		comp_ret = 0;
+		dlen = PAGE_SIZE;
+		memcpy_from_page(dst, page, 0, dlen);

IIUC SJ correctly, in case of zsmalloc "dst" is just the same page that 
would have stored encrypted data.

If that is the case, nothing should change, really.

Thanks for clarifying, all!

> Most probably you meant the page which the reclaim
> code is trying to reclaim. This page is on its way to get freed after
> [z]swapout is completed and this patch is not changing any behavior for
> that path.

Yeah, that's the "page" in the hunk above I guess.

-- 
Cheers,

David / dhildenb

