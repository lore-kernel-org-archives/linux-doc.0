Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB7441B361
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 18:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486905; cv=pass; b=BIeYZFD2buOi1XH2IHKAuOCTySpvb0dn7+KewS7DJcz/n3QADUIT3DQHMOi73Fm3N1C82h99JdQ52EvJF/ZyWvpQjjAHysqObKQFi01d5qcbk6ufsoAokuXEcBBIwvsIQ+gM6jBeQi++0GZAlc7sbv+PqC/wEkURLGarApRs/gQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486905; c=relaxed/simple;
	bh=zOH4706QFtvPpHCn7hxOyOFo31Xjg5Ci7H1MCZS6+GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1byt/KNxZ35KQf+cjUrVT81gHHQTM9gReS2FQtRa0XPgp601DUjC2zaTftwt6OFdURCXEYKbMA9/sjP2urAXl+xAS0au9K+BreiVdiiaBxn5qH2Wl6DwrHjXlV8xAuNrM0yK5q1UtR4yOSAPV+BUFVw2FHEESAPUap2vdW450I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PKd2b15s; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NZ8AGV3g; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PKd2b15s";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NZ8AGV3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777486901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dxp2OvQZDPavnweLX6lwyfQ94IEOmBtp4q9eBxrMuPM=;
	b=PKd2b15sYmlUuc15dgZ8pGIfYJ4vOS/vLpIaS0+VmutNquf+sjaN/7kh2uN9LtSxE2sM/X
	toIgdrfYs3OVQiqTCFlCebJinTH/oBJtAxroMX7P73+2JqC4I85IL2skzEL/P1qe8/jazL
	tnHGQKqkdGcVE6qi2N1OMv5gU05/kvw=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-fk8hXnElPOuLDwi8x7_YWg-1; Wed, 29 Apr 2026 14:21:39 -0400
X-MC-Unique: fk8hXnElPOuLDwi8x7_YWg-1
X-Mimecast-MFC-AGG-ID: fk8hXnElPOuLDwi8x7_YWg_1777486899
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-649df163c11so51282d50.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 11:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777486899; cv=none;
        d=google.com; s=arc-20240605;
        b=NMl9DJNeiXAFMwVsr6qLsxXzyScE48pOVuKGhbW2dR6LWAgqr18VoC72X+xl7pAZug
         w3cITYY5DX8ZnLW+W/JYOdlIsaqJJvApeGaj95PG6xFuyB02LhjWut2KINtlSHRmfYrx
         ViJpjbquYHIcmIvQLO1Bv+AXHls2sfnAPlVc4nZEdFCWF8D4EVR4J2wSmb2RTu/VJuZb
         7uCMllEqcoYv8T0f/0YQFaSOG8DdSF/d8MF1B1ZRe3j3PQEaabayC3yZ69VHGewLYSTX
         XTx5DwZpt7cmo/GwlhN6azBErw7yS2pCdx6ZN2psDZqvOm8U0kYDwshrsT3DkpjnmGGN
         /Svw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Dxp2OvQZDPavnweLX6lwyfQ94IEOmBtp4q9eBxrMuPM=;
        fh=Ua9t1eFg3x7XDHWlCwqDni2mxOb5omq0+/pdP/OyTAA=;
        b=UMX3/xvfiMAdo8ISnCiGMtMC8E++HyEEMqSD0xIeLVZrxW3Kh6r6J0Z71PrYVrOol/
         a4UwHKFUZg+0JDkAnVKc0NZx6Fbe8MeoJs2JsNJvNDJBJ2PeCKYCb0ltNYMEJcOFVPLa
         YeJEj2j5kaYCvfCSyg7gyHoYJ/EnWcLMW39DT0j/QzT9VUN6QcZChnC1JVi+XRibIXIi
         JgwrSBwMpf75k2o7RVhKQO2j85FjIK5FFuELevXjuUXBI0ZcdxQzyRfd9QSdSCCfkUfT
         vtaTpseGeQvg9id1VzhoL8dymVl7dcog20V5MZHFRbDbG4BMrYgXKqD9opuU64zmgB8l
         94KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777486899; x=1778091699; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dxp2OvQZDPavnweLX6lwyfQ94IEOmBtp4q9eBxrMuPM=;
        b=NZ8AGV3gXThmnV7GmKI/tllWoEBREqt/UEskekvgI7AvfcPN8OA2B+7GOmIMZ9iwv8
         eR0WTp/D/7hQgtYO0Yle3Z8wMJlrPnFF8eI7kGjsKeCX2TWqobFz6tdrVgLgDH4yRexB
         zeiWRtnJDTuIznTwAyrrunQzciPGHDNIJKCDtdQfQA9teZC5B9MPmUQFLIzVXXUgVuOy
         at74a8J+4g/t/UrLer6Yn+ltHXdUyvPCCff+zsHXE/5yMLDKRAOnNe4RIsfvs755MLU6
         Tmm7PfmLSLigWCKfLhDIm1HbeKRA+asNjgaeT5Q9VXM6ors8gStM1jzVhXcOQEzCxPSh
         iNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777486899; x=1778091699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dxp2OvQZDPavnweLX6lwyfQ94IEOmBtp4q9eBxrMuPM=;
        b=Q0KS9zeRd0oJldGROnIMOFEl0YybiH8IVnuLPrQ7vhU7zcEOSTYxXR9xeJmNVNgRAD
         oWtmqE5PZno9vfLVBMZZMNe9NW7iwLu6ZZz4mjyL8jIBKZqhocwALJ2LPAvgJd5rYg3L
         LueRgCHxa1rxKPH78viEz+CF0/07NAzOAyOGJhpn6Jh5tXyPoTJYY6hccdnJp4JM+CzI
         wonaU65ufUA2VZgdAdeOGK9LlHAhb50/wEXezKbR3kJa/OUuNuRrbwCmC2YAcjDS3fFi
         0A9i8yDvqJV86hJKHR0F+tUgdiGkPkYjjw0ASUilesBcvTE0EbNmQOgKhWQM9Gc9s/fC
         8wVw==
X-Forwarded-Encrypted: i=1; AFNElJ/MmDJizIvWxjaCqFI3Gkc/wGnZNcYUiwYDotZ9RCwb78Tt7DiZRVVOy/ZoK4SXiGbgcCATsK6ZmJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmguaHdUyY2Zv8uvniQsGKjaqsENDxZNurEustMIXiz54y9TLF
	KPMOPCuDHPwjrEyMQ6oHv6S5VpqfF4Vrb6Zg+vjKgjHdHzQkZgzTvjwEayLFiiVUjxLUdrZFSsI
	/l2+cO8jv+TQMqhr6v2ElfeueWTSsVTChtbQg7nPhVvabkmZ/8FGygMLQ47bEW8xLgN1BrAdZ1l
	MW4vDFw/5IAwDn7Oq8+2zi1Xk/PY3yEX/O5wez
X-Gm-Gg: AeBDiesXn/W5TV3Deb8l67/wlsGAF/Z8hes/GZv+sQiYSnJF8cGsw9tgwtVRuKmNOd3
	fziaYNNxr+vHZD1PqA4DO9n3Bu29ip9i0youD21a5Q8AhFVEVfU376V3bXvBCL47qovH9QpzwC0
	HfB62hKMTlfIIcd6W3I816aqyLm+ztoe9fxavkhyN+07CtdEbE+JDOnztVynef33UDFkkhjd4qV
	y3wkWTZcT20I8C2kWHnQfXxUgwvt1DoAa787iszi+1QGwBiUWM=
X-Received: by 2002:a05:690e:118a:b0:651:d047:caf5 with SMTP id 956f58d0204a3-65beeba82dbmr8444903d50.0.1777486899059;
        Wed, 29 Apr 2026 11:21:39 -0700 (PDT)
X-Received: by 2002:a05:690e:118a:b0:651:d047:caf5 with SMTP id
 956f58d0204a3-65beeba82dbmr8444840d50.0.1777486898433; Wed, 29 Apr 2026
 11:21:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419185750.260784-1-npache@redhat.com> <20260419185750.260784-8-npache@redhat.com>
 <f05f4506-2930-44ba-918a-e0e5bcb9d0f9@kernel.org>
In-Reply-To: <f05f4506-2930-44ba-918a-e0e5bcb9d0f9@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Wed, 29 Apr 2026 12:21:44 -0600
X-Gm-Features: AVHnY4J7CcVYR4f6zugXAbo8lWmkYfpdhB-nBSIbQmMf8QVrNFkAXtwT9seofNU
Message-ID: <CAA1CXcA-YtEiWYZaBW05Y9B_JMixu4SXaQO9KZoG-hNCF9oPHA@mail.gmail.com>
Subject: Re: [PATCH 7.2 v16 07/13] mm/khugepaged: add per-order mTHP collapse
 failure statistics
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org
Cc: aarcange@redhat.com, akpm@linux-foundation.org, anshuman.khandual@arm.com, 
	apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	byungchul@sk.com, catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	lance.yang@linux.dev, Liam.Howlett@oracle.com, ljs@kernel.org, 
	mathieu.desnoyers@efficios.com, matthew.brost@intel.com, mhiramat@kernel.org, 
	mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, 
	raquini@redhat.com, rdunlap@infradead.org, richard.weiyang@gmail.com, 
	rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com, 
	surenb@google.com, thomas.hellstrom@linux.intel.com, tiwai@suse.de, 
	usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"

On 4/27/26 2:21 PM, David Hildenbrand (Arm) wrote:
> On 4/19/26 20:57, Nico Pache wrote:
>> Add three new mTHP statistics to track collapse failures for different
>> orders when encountering swap PTEs, excessive none PTEs, and shared PTEs:
>>
>> - collapse_exceed_swap_pte: Increment when mTHP collapse fails due to swap
>>      PTEs
>>
>> - collapse_exceed_none_pte: Counts when mTHP collapse fails due to
>>      exceeding the none PTE threshold for the given order
>>
>> - collapse_exceed_shared_pte: Counts when mTHP collapse fails due to shared
>>      PTEs
>>
>> These statistics complement the existing THP_SCAN_EXCEED_* events by
>> providing per-order granularity for mTHP collapse attempts. The stats are
>> exposed via sysfs under
>> `/sys/kernel/mm/transparent_hugepage/hugepages-*/stats/` for each
>> supported hugepage size.
>>
>> As we currently dont support collapsing mTHPs that contain a swap or
>
> s/dont/do not/
>
>> shared entry, those statistics keep track of how often we are
>> encountering failed mTHP collapses due to these restrictions.
>>
>> Now that we plan to support mTHP collapse for anon pages, lets also track
>
> "We will add support for mTHP collapse for anonymous pages next; let's also ..."
>
>> when this happens at the PMD level within the per-mTHP stats.
>
> What about file collapse? For example, we do adjust
> count_vm_event(THP_SCAN_EXCEED_SWAP_PTE) and
> count_vm_event(THP_SCAN_EXCEED_NONE_PTE) there.
>
> Wouldn't we want to update the HPAGE_PMD_ORDER side of things there already? or
> would we want to use a different counter for that?

Maybe? My thought process was that because we dont support mTHP in Shmem
that those stats shouldnt be updated? not sure the right answer tbh--
hence why this comment says "now that.. for anon pages, lets track..".

>
>>
>> Signed-off-by: Nico Pache <npache@redhat.com>
>> ---
>>   Documentation/admin-guide/mm/transhuge.rst | 24 ++++++++++++++++++++++
>>   include/linux/huge_mm.h                    |  3 +++
>>   mm/huge_memory.c                           |  7 +++++++
>>   mm/khugepaged.c                            | 21 +++++++++++++++++--
>>   4 files changed, 53 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
>> index c51932e6275d..eebb1f6bbc6c 100644
>> --- a/Documentation/admin-guide/mm/transhuge.rst
>> +++ b/Documentation/admin-guide/mm/transhuge.rst
>> @@ -714,6 +714,30 @@ nr_anon_partially_mapped
>>          an anonymous THP as "partially mapped" and count it here, even though it
>>          is not actually partially mapped anymore.
>>
>> +collapse_exceed_none_pte
>> +       The number of collapse attempts that failed due to exceeding the
>> +       max_ptes_none threshold. For mTHP collapse, Currently only max_ptes_none
>> +       values of 0 and (HPAGE_PMD_NR - 1) are supported. Any other value will
>> +       emit a warning and no mTHP collapse will be attempted. khugepaged will
>> +       try to collapse to the largest enabled (m)THP size; if it fails, it will
>> +       try the next lower enabled mTHP size. This counter records the number of
>> +       times a collapse attempt was skipped for exceeding the max_ptes_none
>> +       threshold, and khugepaged will move on to the next available mTHP size.
>
> Why is everything after the first sentence worth documenting here? This doesn't
> read like it belongs to a failure counter?
>
>> +
>> +collapse_exceed_swap_pte
>> +       The number of anonymous mTHP PTE ranges which were unable to collapse due
>> +       to containing at least one swap PTE. Currently khugepaged does not
>> +       support collapsing mTHP regions that contain a swap PTE. This counter can
>> +       be used to monitor the number of khugepaged mTHP collapses that failed
>> +       due to the presence of a swap PTE.
>
> Can we similarly simplify that (and make it consistent with the one above) to
>
> "The number of collapse attempts that failed due to exceeding the max_ptes_swap
> threshold."
>
>> +
>> +collapse_exceed_shared_pte
>> +       The number of anonymous mTHP PTE ranges which were unable to collapse due
>> +       to containing at least one shared PTE. Currently khugepaged does not
>> +       support collapsing mTHP PTE ranges that contain a shared PTE. This
>> +       counter can be used to monitor the number of khugepaged mTHP collapses
>> +       that failed due to the presence of a shared PTE.
>
> Same here
>
> "The number of collapse attempts that failed due to exceeding the
> max_ptes_shared threshold."

These all used to be very similar to what you have here. But Lorenzo
asked me to expand all this (IIRC) several times. So here we are! I
believe I even mentioned in the V15 that these are probably the "best"
defined counters in the whole doc lol.

Cheers,

-- Nico

>
> ?
>
>> +
>
> [...]
>

