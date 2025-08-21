Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E07835E4D4
	for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755809023; cv=none; b=VWz4pqlFax40wEsPPN97OH2ll2qsE1n0nxBvOOwZ8eo7YccyD7NlKZV0+QgjvYvqCJWAmJfTgY5ioZ7evc8qcbyCA9kte5TgsGlx07jU6XWMVWIjeCzG475fbnRCwUQxxFC7mC80V12SxOgKxdUHZasCKrOLRtqP/KwdYfyGVrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755809023; c=relaxed/simple;
	bh=6uFSmbinVkEFLrrGHB1ZwGY2fBbLdOPoyQB/GveJ0Eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BPTK5qlL7V4TsG8Y4gxSOUgnRzuyqTT5/dUDP99DI/wUmsOZ3iKDY1tMEqd8NvTI4dm6zINYO2YWWRMjTsRIFEXa1AjwnMB2dWlxFNx7oaMJR2nlBBdiKZiMNtrqDG+q8OATTDu5x7djfCnrStGMfZzRQDxPLlY5B6BFSA4SmoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bFhOeYbT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bFhOeYbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755809021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=h/fo68/IS9K7j0Ewx5SO22U2/CaLZSJBW37TgxTQuZY=;
	b=bFhOeYbT1n0MQdkahblIIES2Iz4ba9Z3xNJ1ixOE9oiz5Dv3DJT2AVPAAr3bnB/woMs4mM
	cUsyuBaPfUg8ukSrm7WnK+5i0KLMdZ3WLxM++JGI3LsOftbUDIFBMr4mvTl4wlN55kK9KL
	D4y+IsxVDHDv1VqtImmd5jqClys8wPI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-lraMDHAmPWK0zGoyxIw5jA-1; Thu, 21 Aug 2025 16:43:39 -0400
X-MC-Unique: lraMDHAmPWK0zGoyxIw5jA-1
X-Mimecast-MFC-AGG-ID: lraMDHAmPWK0zGoyxIw5jA_1755809018
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45b4e345ce4so4009485e9.2
        for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 13:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755809018; x=1756413818;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/fo68/IS9K7j0Ewx5SO22U2/CaLZSJBW37TgxTQuZY=;
        b=qBl6QglDxOBG1lCQV5/68C+EvAGGkiJvINlqudyheYJCiky1QmalUlA8INOqktqqic
         B0ItOUulGVebkk08XpwbQl5qxsuXWqECffh81CMHUECpjlmUbG4BmD2rmFq9Lz9MG5Aw
         lr/ATVZM9on4jgNX6HZH7aXEM/6199SuQ+hAZd9NjJ3vLF4Hq3Ld/d6MOmSgYdAuUIyD
         8RpveZ851dpBM0xWGYGn+aG8FFCoQ25a7Ycf/+dUzeLuR9ht+Of6Z+c+9lFcTagzLHhW
         z+2CcRoTexkM/lIJZVph6gMGnx+3SYLznuUAV4Xk7kIQO4/b73mw+hh4dkgkxRNchuuq
         iKlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhJiJMPC8RRGV/lW973xXDAgzskQXPFgUTqXasl9FvoHw9tT/lPWp0gW3cVWa0RLEUsapE1fDZUMk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3QgSWbmGMl0RQ88J20zl+FAArSIrl42Z4x219ksYR6FptEids
	Xnm3aRXFF0bQKzY7rplH4TRT4U1QIiDSK+OAxAqaJF1RSaMptWbbAAYomdc0lAyOjQGZsRnyccp
	6C1ucLlPvVJwMoX+ZBTjSCl3HrkJvGvOnhP+Vc4zrah0hKfIVXqtmBnsIKOYoog==
X-Gm-Gg: ASbGncsS/N9+RSBmqIIY2NPS0eDcgk3pmBvMMpiAcW3F7Ae05DTZTqLA65jnz5MKjU5
	eXUV8zG8UK7/QJcFk++79LE7ynMHcJ+lLGnz1EX4rpChwRLAbSIduL2QMXahJzJuniwnLDDRNHu
	L8Z2bMkmxVcAUUKz3liM9+4XMZiDeiO0CMKR+2elJ+G82EGpUKnFHh2rKE/TrvvcibDUhUqCHQw
	CquawnjbdjhmDF2ekCN4f6qXDZMAY9D9qZiHGKPXNrOueTBOmBDVF9tGM+KmtTPSypEpBJ/xDXu
	r4lf8r+1NmV4iA8EhsV6zTbJttil3oVFjyshw4XRocPP46DoAXXYXGKV6dOBmaA3dHalE1v1j9b
	q5NIF9tjFkeR2VcioFl042SZjJirorp0sik7WoPpOfTR9vg1g4PQvpOkSAfuXzA==
X-Received: by 2002:a05:6000:1acc:b0:3b9:1d32:cf2f with SMTP id ffacd0b85a97d-3c5dd8aafeemr255817f8f.38.1755809018381;
        Thu, 21 Aug 2025 13:43:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKIuRxKND46b3AmB7y/Xw/b9KvWRYzcjy+ul/Xngby02wgViPbY5Y0WYNrMrywVt99HnqEQw==
X-Received: by 2002:a05:6000:1acc:b0:3b9:1d32:cf2f with SMTP id ffacd0b85a97d-3c5dd8aafeemr255783f8f.38.1755809017884;
        Thu, 21 Aug 2025 13:43:37 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f26:ba00:803:6ec5:9918:6fd? (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50dd02ebsm10113115e9.9.2025.08.21.13.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:43:37 -0700 (PDT)
Message-ID: <95012dfc-d82d-4ae2-b4cd-1e8dcf15e44b@redhat.com>
Date: Thu, 21 Aug 2025 22:43:35 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/13] khugepaged: mTHP support
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Nico Pache <npache@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 ryan.roberts@arm.com, corbet@lwn.net, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 akpm@linux-foundation.org, baohua@kernel.org, willy@infradead.org,
 peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com,
 sunnanyong@huawei.com, vishal.moola@gmail.com,
 thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com,
 kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com,
 anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de,
 will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, zokeefe@google.com,
 hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com,
 rdunlap@infradead.org, hughd@google.com
References: <20250819134205.622806-1-npache@redhat.com>
 <e971c7e0-70f0-4ce0-b288-4b581e8c15d3@lucifer.local>
 <38b37195-28c8-4471-bd06-951083118efd@arm.com>
 <0d9c6088-536b-4d7a-8f75-9be5f0faa86f@lucifer.local>
 <CAA1CXcCqhFoGBvFK-ox2sJw7QHaFt+-Lw09BDYsAGKg4qc8nSw@mail.gmail.com>
 <CAA1CXcAXTL811VJxqyL18CUw8FNek6ibPr6pKJ_7rfGn-ZU-1A@mail.gmail.com>
 <5bea5efa-2efc-4c01-8aa1-a8711482153c@lucifer.local>
 <CAA1CXcBDq9PucQdfQRh1iqJLPB6Jn6mNy28v_AuHWb9kz1gpqQ@mail.gmail.com>
 <d110a84a-a827-48b4-91c5-67cec3e92874@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <d110a84a-a827-48b4-91c5-67cec3e92874@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> 
> The one thing we absolutely cannot have is a default that causes this
> 'creeping' behaviour. This feels like shipping something that is broken and
> alluding to it in the documentation.
> 
> I spoke to David off-list and he gave some insight into this and perhaps
> some reasonable means of avoiding an additional tunable.
> 
> I don't want to rehash what he said as I think it's more productive for him
> to reply when he has time but broadly I think how we handle this needs
> careful consideration.
> 
> To me it's clear that some sense of ratio is just immediately very very
> confusing, but then again this interface is already confusing, as with much
> of THP.
> 
> Anyway I'll let David respond here so we don't loop around before he has a
> chance to add his input.
> 
> Cheers, Lorenzo
> 

[Resending because Thunderbird decided to use the wrong smtp server]

I've been summoned.

As raised in the past, I would initially only support specific values here like

0 				  : Never collapse with any pte_none/zeropage
511 (HPAGE_PMD_NR - 1) / default  : Always collapse, ignoring pte_none/zeropage

Once could also easily support the value 255 (HPAGE_PMD_NR / 2- 1), but not sure
if we have to add that for now.

Because, as raised in the past, I'm afraid nobody on this earth has a clue how
to set this parameter to values different to 0 (don't waste memory with khugepaged)
and 511 (page fault behavior).


If any other value is set, essentially
	pr_warn("Unsupported 'max_ptes_none' value for mTHP collapse");

for now and just disable it.

-- 
Cheers

David / dhildenb

