Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECF2291C3B
	for <linux-doc@vger.kernel.org>; Wed, 16 Jul 2025 15:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679246; cv=none; b=X3CcPABKGlOZsQNS/G1P9v5WpdG178Ds6rRHciR7h9sm8E9HgpJE+7QmGHHhP/EHY/ouhrZK9a3WXiz0iDzgcH+IbrhK8zzgYr/bQzuYsGmBakEOPUjg6ZZ8xuG2PU0Ianv72SBdsGj4n+XwKjXU8tRch2E+mAT90TGDe2YHH6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679246; c=relaxed/simple;
	bh=YSCk/mhRrH4zzs6WIB4+cLd/DQ9I0q09f/8YYnhuS3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Z8Q6IkVkyOBKzlxegYolwpzBUWN0iGdGU2if1gx7kC8lBlWstgeJOzHotHTsW3hApaEiDzraDkH3Yc4ASDJEUF82E29MJFDMTaa5b4JTgSW2QNKJuApj3WpK/qqinbaWS/Eygilz3SZkZEmubLNT7JfTeLokriDpTMH1spqOBDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XwlqLQEs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XwlqLQEs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752679244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lYqVcGPl98IorByiIq9slG84y9r+OvSPRKagz1QeHjs=;
	b=XwlqLQEsYc4DBsSdu9pq+FHP1MghF06kmuHt8tKFTLIfDHxmbzBSZoFso/E4ShcrRNehC0
	Q+gGLNe/KPLpVV08W5+Rc3jGuULg3aavfmLEbgqEw5Wccb1dR6NLN1EorJiS3KVxuDsSik
	PyIzbJPvu5SGJ4RLsT/d9F2KFMbJsYY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-QLsONAXdNDmU2MjQqdb23g-1; Wed, 16 Jul 2025 11:20:42 -0400
X-MC-Unique: QLsONAXdNDmU2MjQqdb23g-1
X-Mimecast-MFC-AGG-ID: QLsONAXdNDmU2MjQqdb23g_1752679241
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-455e918d690so6653265e9.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Jul 2025 08:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679241; x=1753284041;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYqVcGPl98IorByiIq9slG84y9r+OvSPRKagz1QeHjs=;
        b=if6TbaXuusRJ5cTY9OxRrcshijYSgAk7fX9F6hBGnJM9v+aKBZ4P1Ep2JFhXoRcFEC
         iHD4RYUWSY3JoP/4JCct4+idHYPZ5OWEnhdrz1kcRx/xgbpesfBZBGBBzoxa1iW2jiev
         BovK383FtFvrX5Z9ctKlcteozyPX/BaMRXNAnjFPtovjyHmkjoH6NuLoeCgirnQ7QmKQ
         N58L/zoqLgUFFW2ruiHRmUsF+9dV1/3GNZ/Nw0hHJPx75Wpv72ZINTWealL4jrODEaXw
         jQjk2uzOL7czY5pqrslTHaZ0sOKQGO61Azu9/MwV7sX3AMG5qWQ3eTlC4qXQX2iFfvp6
         DQFw==
X-Forwarded-Encrypted: i=1; AJvYcCU64aQoT4CRHqxgq36SjpkxFewQAb22abYHx1iE10S0p1TyifXKGio5ZSTILXqVkkkzuWR4VYHJvWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoHS1dzX5IUdEManDHFGiE1Jnx0g3ztX+I1cp2FBDYxRkDtGiJ
	Nz7fPdCT+ssLr5G1jKTOTI8bekCEiohbgrEOobRg9QPoWcRET7ofe288J72EGk5IHGcC1dJZKl8
	5jqNwBbo7wE3e+BB9lVuPITOZ5UwRenWYi9S0agbNFWo7VYzBptTjGXCkU8MQTg==
X-Gm-Gg: ASbGncvD5s8hg/SoWPgkCZXWyZLbLDvcM3+IFGn2INh/4bbSsmslLDpTFBZV+sc3Qlh
	hh3f6G7MBNIt8sfHdyTYH/hGyaoPO0srEoxvXRC22d0yfVQSQvqLc2G6aT23JzOwH0wv5xR+z5A
	KZgyO7h2y8PQQleUmWtoHeMTSzhPWPTpCqnHlGPk8oBcYYHBGCaOr04z44+0p1JtTHMrEH1lNgY
	tWPsfplnxU+HrR1WjW/0wUe+aJeV59hkEXOTIkn57W4brPLUIkYQGw+eVsUP33qBy2cyrW3zxMW
	yS0yc2gO7sCqhKBAlrXPBv61nMtOiZtX5v6/RpYtecyYQfCvEjhmAkzCXk+i0SX8Vg0AHelM/9F
	YZd0E2JKdw2rBWTpIrMrUkt7B2Ze6QITyc0LndEGogHwWOR9HkgeVm026LW+M45wIJW0=
X-Received: by 2002:a05:600c:a11:b0:456:15a1:9ae0 with SMTP id 5b1f17b1804b1-4562dcc3596mr35066465e9.13.1752679241242;
        Wed, 16 Jul 2025 08:20:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRHERGcHpUYU+MGs4am6EvrtyXKGQ5MGu0qRLwnbuyH0kti86o4gVaDAAU7LSNJMHdUEg2ZA==
X-Received: by 2002:a05:600c:a11:b0:456:15a1:9ae0 with SMTP id 5b1f17b1804b1-4562dcc3596mr35065725e9.13.1752679240699;
        Wed, 16 Jul 2025 08:20:40 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:ed00:1769:dd7c:7208:eb33? (p200300d82f1ded001769dd7c7208eb33.dip0.t-ipconnect.de. [2003:d8:2f1d:ed00:1769:dd7c:7208:eb33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45627898725sm36468085e9.1.2025.07.16.08.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 08:20:40 -0700 (PDT)
Message-ID: <68b99621-31a1-4c80-b409-5557ffd9631b@redhat.com>
Date: Wed, 16 Jul 2025 17:20:37 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/14] khugepaged: rename hpage_collapse_* to
 collapse_*
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org,
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
References: <20250714003207.113275-1-npache@redhat.com>
 <20250714003207.113275-2-npache@redhat.com>
 <qgcvsfhoq3pnvxhdn73dopbtvi75oghbaydg27atqfp556u6sa@ixwdwi73lgkl>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <qgcvsfhoq3pnvxhdn73dopbtvi75oghbaydg27atqfp556u6sa@ixwdwi73lgkl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.07.25 16:29, Liam R. Howlett wrote:
> * Nico Pache <npache@redhat.com> [250713 20:33]:
>> The hpage_collapse functions describe functions used by madvise_collapse
>> and khugepaged. remove the unnecessary hpage prefix to shorten the
>> function name.
>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Signed-off-by: Nico Pache <npache@redhat.com>
> 
> 
> This is funny.  I suggested this sort of thing in v7 but you said that
> David H. said what to do, but then in v8 there was a discussion where
> David said differently..

Me recommending something that doesn't make sense? That's unpossible!

-- 
Cheers,

David / dhildenb

