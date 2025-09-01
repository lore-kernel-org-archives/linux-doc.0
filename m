Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6628032F74A
	for <linux-doc@vger.kernel.org>; Mon,  1 Sep 2025 17:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756746391; cv=none; b=u+NgZvDamHWUO4wTDEag7tTAtrVwdQ80Uo3HEIMfM9NAMBzfFEjhf2EMMypP6gKVIt8HLIf3+7gnC6aAW32gfB1J4lTEtCdW9NBTRemQsUTKMVV7cneeBbv+huMH4+R1EUEtl5CjhhKPUaXLn5AOkSwBlKoQ1A7WbqVZDC6lIIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756746391; c=relaxed/simple;
	bh=eynrKSovxbfwBy/+BGT3YEyavhAj9YttRSHNGp91z6g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VH7+rJ3XqICinNtPZeAloWpIXbiAm6tiYXsklxipv5DIejq4rEdw+Xvh1WaXx2JA9JwU75C/hKt9h9k5a2EO/c8apOHP1AW6zfO1A3/Lh5dz9yvCyhtM/GxKxkS1VyMZxPlaUWlOe410qoGLSgbL55jRDEtkWffCEnuKCPl5E4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EVZ+yMWI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EVZ+yMWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756746389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eh14gSBsHlX8t4z8lOLowLFjFUmXdmvvFT/ssHquVjA=;
	b=EVZ+yMWIEBsDn5NSx704/BTtHmcDel0ngrzfz8ZI6O8gWzgFJU6gD5evjWyWezO/140JT5
	qt4nM+dborf2TpYw9Q/3iodbe/UCbl2nmGD12W8C0i/aV1HNSYMsJHFKXkCINJlOIJxxQ0
	5/bxrGtOC7epVWcTGTwFUr6DXpXrG9Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-zpQQN0JpM4K2HIyciZCV-g-1; Mon, 01 Sep 2025 13:06:27 -0400
X-MC-Unique: zpQQN0JpM4K2HIyciZCV-g-1
X-Mimecast-MFC-AGG-ID: zpQQN0JpM4K2HIyciZCV-g_1756746385
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45b8a2b9fcaso11531635e9.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 10:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756746385; x=1757351185;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eh14gSBsHlX8t4z8lOLowLFjFUmXdmvvFT/ssHquVjA=;
        b=LllJWdK2jkdmHF5n72cib8br+AbNfGILnvm1E0sLkf9Rox0v0wuG6juPdNKg3xwEGt
         u4TGPrgdm/8YouVT0eFP6KFgBZX1Hu6bGxlbcNyEtvGc6pLjCVFBg/9fiLkG5YYh/Lwb
         M/yl1zYUX0n5laZFXQM922S8ZLRdRB3ml9J1nMbt22gGGnvttFBeK2s0BDTc3X54fmb6
         7ABuZZjGEpO2bwBkMNV/iPsYxntzEsev0WFCnaB2DgZZZuX4jOwjlFiUwdW7nFDvKBPz
         iOLX7Fr2Cmw21h2hvEDCLuGI1hovYvbguNitAP/t2RP0ZOQl4Yos6rCdHKeBUMuwkqlW
         1rFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpXQI1qHJl8Rdlj3c70hpO40r4XXO6BbMRDDDjafbD9tqqcwnUxKSApH0J+Z+ALeNpTcznVDJ7KxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXQmqME3dX6ckaZsm4rJ9pmvKAf84bIHOORiJTCMe8La6bhniS
	PsaA+5jeYLCi+j7bpEFWRJoJXsLe4heUPFXLrBYMvDY/Cv/AZzaPqHdsPKhZYZ5faU2ZYFe61UM
	Ca1MuuSpcKsNQUGE0fdFbTSHMM2L1qFeKzBIqkyQLmb0I7ZzZNccJTlOV6j/t8A==
X-Gm-Gg: ASbGnctlNObfPWzdtdgL9GQHXNWbv+h2eCHLkDZenGI3lhZmrKODAcYFF06uKfs44WF
	U90WKE74aJ5FpgU2gV79vjUmZSQ+LcmtKPqD/AvTgq6ILml1vSOKjzOGvOvJ5L8d4HACOwMfJpJ
	50DOJW0rQRVoHfEwcv42t4NMvFfTQ8371UhTujGsL0cHzVJi7lx/1ObiO2kk/Fu8IutNafnlG2I
	Se1Kh9DwyQjXm4f0w/aMn70ZtxeAJISDRHll15G0FnJrmjW3Id+/7z/ifRbZFz/jfhUOfermpcn
	5Qdew+olzZ75HA0lpHMRutOjfjWPyLZ/75pWhFOigHVrhwJv9LscQrrL2sP/eH2f1FBU72bwzFH
	91M5QV4vLWiS+hH2dYCfDR/9Kd/iWXrZcrDleDvFEK/de/qGXt7oT+W3cLaGTGqfvGsA=
X-Received: by 2002:a05:6000:4205:b0:3d9:415c:b146 with SMTP id ffacd0b85a97d-3d9415cb164mr902864f8f.15.1756746384895;
        Mon, 01 Sep 2025 10:06:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtXV1RpZ3Z9Kk/q7xvuAzJpMudeH+8bX9H5YuBYHQqIOkcUcfv4sOsuljm2RvZo8tcSQgolw==
X-Received: by 2002:a05:6000:4205:b0:3d9:415c:b146 with SMTP id ffacd0b85a97d-3d9415cb164mr902818f8f.15.1756746384422;
        Mon, 01 Sep 2025 10:06:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c93sm247892275e9.14.2025.09.01.10.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 10:06:23 -0700 (PDT)
Message-ID: <bf03c2e2-66fc-4745-952a-de3fbf65c4ab@redhat.com>
Date: Mon, 1 Sep 2025 19:06:21 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/13] khugepaged: mTHP support
From: David Hildenbrand <david@redhat.com>
To: Nico Pache <npache@redhat.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com,
 dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, akpm@linux-foundation.org,
 baohua@kernel.org, willy@infradead.org, peterx@redhat.com,
 wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com,
 vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com,
 yang@os.amperecomputing.com, kirill.shutemov@linux.intel.com,
 aarcange@redhat.com, raquini@redhat.com, anshuman.khandual@arm.com,
 catalin.marinas@arm.com, tiwai@suse.de, will@kernel.org,
 dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, zokeefe@google.com,
 hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com,
 rdunlap@infradead.org, hughd@google.com
References: <20250819134205.622806-1-npache@redhat.com>
 <7d423d50-47e0-4c97-abaa-1fa865ec3e42@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <7d423d50-47e0-4c97-abaa-1fa865ec3e42@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.09.25 18:21, David Hildenbrand wrote:
> On 19.08.25 15:41, Nico Pache wrote:
>> The following series provides khugepaged with the capability to collapse
>> anonymous memory regions to mTHPs.
>>
>> To achieve this we generalize the khugepaged functions to no longer depend
>> on PMD_ORDER. Then during the PMD scan, we use a bitmap to track chunks of
>> pages (defined by KHUGEPAGED_MTHP_MIN_ORDER) that are utilized. After the
>> PMD scan is done, we do binary recursion on the bitmap to find the optimal
>> mTHP sizes for the PMD range. The restriction on max_ptes_none is removed
>> during the scan, to make sure we account for the whole PMD range. When no
>> mTHP size is enabled, the legacy behavior of khugepaged is maintained.
>> max_ptes_none will be scaled by the attempted collapse order to determine
>> how full a mTHP must be to be eligible for the collapse to occur. If a
>> mTHP collapse is attempted, but contains swapped out, or shared pages, we
>> don't perform the collapse. It is now also possible to collapse to mTHPs
>> without requiring the PMD THP size to be enabled.
>>
>> With the default max_ptes_none=511, the code should keep its most of its
>> original behavior. When enabling multiple adjacent (m)THP sizes we need to
>> set max_ptes_none<=255. With max_ptes_none > HPAGE_PMD_NR/2 you will
>> experience collapse "creep" and constantly promote mTHPs to the next
>> available size. This is due the fact that a collapse will introduce at
>> least 2x the number of pages, and on a future scan will satisfy the
>> promotion condition once again.
>>
>> Patch 1:     Refactor/rename hpage_collapse
>> Patch 2:     Some refactoring to combine madvise_collapse and khugepaged
>> Patch 3-5:   Generalize khugepaged functions for arbitrary orders
>> Patch 6-8:   The mTHP patches
>> Patch 9-10:  Allow khugepaged to operate without PMD enabled
>> Patch 11-12: Tracing/stats
>> Patch 13:    Documentation
> 
> Would it be feasible to start with simply not supporting the
> max_pte_none parameter in the first version, just like we won't support
> max_pte_swapped/max_pte_shared in the first version?
> 
> That gives us more time to think about how to use/modify the old interface.
> 
> For example, I could envision a ratio-based interface, or as discussed
> with Lorenzo a simple boolean. We could make the existing max_ptes*
> interface backwards compatible then.
> 
> That also gives us the opportunity to think about the creep problem
> separately.
> 
> I'm sure initial mTHP collapse will be valuable even without support for
> that weird set of parameters.
> 
> Would there be implementation-wise a problem?
> 
> But let me think further about the creep problem ... :/

FWIW, I just looked around and there is documented usage of setting 
max_ptes_none to 0 [1, 2, 3].

In essence, I think it can make sense to set it to 0 when an application 
wants to manage THP on its own (MADV_COLLAPSE), and avoid khugepaged 
interfering. Now, using a system-wide toggle for such a use case is 
rather questionable, but it's all we have.

I did not find anything only recommending to set values different to 0 
or 511 -- so far.

So *likely* focusing on 0 vs. 511 initially would cover most use cases 
out there. Ignoring the parameter initially (require all to be !none) 
could of course also work.

[1] https://www.mongodb.com/docs/manual/administration/tcmalloc-performance/
[2] https://google.github.io/tcmalloc/tuning.html
[3] 
https://support.yugabyte.com/hc/en-us/articles/36558155921165-Mitigating-Excessive-RSS-Memory-Usage-Due-to-THP-Transparent-Huge-Pages

-- 
Cheers

David / dhildenb

