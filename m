Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984AF315790
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 15:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757691846; cv=none; b=E0Vg5N7KA/Q0VD9Hun2aFy3Iya2wEW8J8fS36k3uTyR3c1T8+CbJdjqDkcch33q6fBweOPbySw2Dpnn2DM3OEnv7vjkCjMfpSohT+ev/q4AES/Y3vUIdYminHhEgitPJe17x2I1MAxWU4jWA/Tfg/FXKdFACCCs21Ae0rWdUfTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757691846; c=relaxed/simple;
	bh=dA76umRtYdyD2FG2MILJYXTmfaMo72Kmp3AqM8eKLpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyEa373zXCIMyDWgj96kJ2z6w8YCK6gxPrTPbrbPsUxIKfKsWk0WHlDb77qXjaJNie5noxnEBTPKQI2qW/Q/EArCTObOng6uYwM0HDM/PeKmU5cmvAHUkKwrijMclPPEbjjXbzpY3VLyTUjjEd+mIAyd6ZcijQcQheJ4btLRDGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uog7mF18; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uog7mF18"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757691843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4DxtwTQCPiZwtY4nVnJikc9BconF4cFntYOMVXEuMbk=;
	b=Uog7mF18qmUIcSopGtkwoj10L09cFZm17N+M+862LCcyAC4sHyk2e6NO8LzbH6cvtxm8D7
	zFdvhevq6e5i8xd0FW+X1Tmk4XnFUC5Thk9R41FB2I3QJitL1kGcbMGjonD1fxUYIYVvqb
	zwfw2lVHW/WdVjGYoYss2U/IpDj4z0E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-z-pmMeLwNAWC4qdCG3_FrQ-1; Fri, 12 Sep 2025 11:44:02 -0400
X-MC-Unique: z-pmMeLwNAWC4qdCG3_FrQ-1
X-Mimecast-MFC-AGG-ID: z-pmMeLwNAWC4qdCG3_FrQ_1757691841
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3e751508f3aso1459505f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 08:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757691841; x=1758296641;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DxtwTQCPiZwtY4nVnJikc9BconF4cFntYOMVXEuMbk=;
        b=L/ePT1lplLfFUg/GWiTi5gGneARJ33oHiGsNF5Fj7jVs1Wqm5FN4HH/afqykWfJ01h
         B8mm9RsdjQENlMKKGuE71wpozZ9watnjJPpEmM27hgegQ2moXmO2LWn2E5DbOX0XiCvL
         KmCj3rbnHzqeUk4KzpSCiaKulL9aUw/BXfx3+bL2/bkK7WBk7IH0kjY5KY+Ghy2mvTqu
         cBR6sKuctIEZeWEDMpfiOQu+1LXNEA1sgHIxd8DX9PDoF37dGQ4rOibHuO5pRcmmjXWs
         KOQgG95xSeucNFHsf90r6jgCKh8ZiBV3OH0z6hwJxvI+Bq0LgukLNErYDhmNfor/7fN7
         lXRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRfmsJmzvP2Vy4ANw1H9M7Afm4E5gx3bhTRkJxuLH+6NfCFLdgzjARkWIRnoCgU/1IP20wQVL45gA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO+3c6xBzbm29XWEavT/Y07GPPK4ktB0M4KHGwzpbxRgjuBG/D
	bA4wtdgSocuK+lJ37lKIMDnOiCHfn9RCPfSgY5axjNNlWe2OLApaRAOzJDPcgfSacFWqYx8s9tw
	f0SWMbP70xXpvOeCBVjuKcBtj7HYRMu3CWa1lm6rKovKAzfwd2mEDK0M3Ts3xDA==
X-Gm-Gg: ASbGncsgdWFpTEqDpSO/R86NCTHFjWIv5QeI/34tJSRVCfNB7CGP8ntMDyuJMIaCKAh
	+sRY/5/BZPSnCB87fOErstypgbvaYIVtdAkqH2Ok3ZJFHfdtL0OfqCE0kKh5wQnF8+G1kPV9n/V
	I5c9PRFvGGKbTjv5jwU8w8APavEOwl+lHhpScJXIfoEOJuaH+rkyhlucap6fLFib7ce0AvakFWv
	stlbQytouL/FscJ89xUT8SATqwsi3kMdnSr56eTdond8nHF4D1zbNuDLAe1IAFj9VSLK5HvWvbw
	C+DoGVXy7pFAzH7si7u85Q5yI40o7u6vG/m70d2LCPqZ1g3ynoeNaDcySeohvxmKx6qZL7xN5ol
	2jGUc22xE1+Qr5AJPRn8z4iD2RkGfpVxO7TtYk/SUz5uKREoSlVIb87063+OUWCe2tmI=
X-Received: by 2002:a5d:5d09:0:b0:3e7:17d4:389b with SMTP id ffacd0b85a97d-3e765a1b499mr3701063f8f.52.1757691840731;
        Fri, 12 Sep 2025 08:44:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHknotLSLP2K1zWqBYgZh5DKvVl0wcu4M9IAeXq4lHdbs1Rpq78uPryI29GX5fXqxYpJvssiQ==
X-Received: by 2002:a5d:5d09:0:b0:3e7:17d4:389b with SMTP id ffacd0b85a97d-3e765a1b499mr3701014f8f.52.1757691840256;
        Fri, 12 Sep 2025 08:44:00 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f20:da00:b70a:d502:3b51:1f2d? (p200300d82f20da00b70ad5023b511f2d.dip0.t-ipconnect.de. [2003:d8:2f20:da00:b70a:d502:3b51:1f2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd691sm7166274f8f.32.2025.09.12.08.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 08:43:59 -0700 (PDT)
Message-ID: <aa15dcd0-15d3-45ad-b24f-737539bff861@redhat.com>
Date: Fri, 12 Sep 2025 17:43:56 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/15] khugepaged: mTHP support
To: Kiryl Shutsemau <kas@kernel.org>, Pedro Falcato <pfalcato@suse.de>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nico Pache <npache@redhat.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com,
 corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, akpm@linux-foundation.org,
 baohua@kernel.org, willy@infradead.org, peterx@redhat.com,
 wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com,
 vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com,
 yang@os.amperecomputing.com, aarcange@redhat.com, raquini@redhat.com,
 anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de,
 will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, zokeefe@google.com,
 rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org,
 hughd@google.com, richard.weiyang@gmail.com, lance.yang@linux.dev,
 vbabka@suse.cz, rppt@kernel.org, jannh@google.com
References: <20250912032810.197475-1-npache@redhat.com>
 <ppzgohmkll7dbf2aiwhw7f4spf6kxjtwwe3djkx26pwy4ekrnd@mgeantq5sn2z>
 <d0e81c75-ad63-4e37-9948-3ae89bc94334@redhat.com>
 <20250912133701.GA802874@cmpxchg.org>
 <da251159-b39f-467b-a4e3-676aa761c0e8@redhat.com>
 <hcpxpo3xpqcppxlxhmyxkqkqnu4syohhkt5oeyh7qse7kvuwiw@qbhiubf2ubtm>
 <k54teuep6r63gbgivpka32tk47zvzmy5thik2mekl5xpycvead@fth2lv4kuicg>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <k54teuep6r63gbgivpka32tk47zvzmy5thik2mekl5xpycvead@fth2lv4kuicg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> Maybe in the Great Glorious Future (how many of those do we have?!) it would
>> be a good idea to take this kinds of things into account. Just because we can
>> map a THP, doesn't mean we should.
>>
>> Shower thought: it might be in these cases especially where the FreeBSD
>> reservation system comes in handy - best effort allocating a THP, but not
>> actually mapping it as such until you really _know_ it is hot - and until
>> then, memory reclaim can just break your THP down if it really needs to.
> 
> This is just silly. All downsides without benefit until maybe later. And
> for short-lived processes the "later" never comes.

Right, that's why I've also been arguing against that (we discussed it 
recently in the THP cabal).

-- 
Cheers

David / dhildenb

