Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5FC261B92
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777475530; cv=pass; b=mqoKH/chxG6KjzNnPhSLY5AKxZBt861eL7vdNEt55Uuq2curHew0wX73baYyHGD7I7Efv27BvwkLRfqkJgOGofEU7NO1KXzGdzcGdHNpnyPfdtI/s4eQVnebUaDXaTy3bAv3Lz7OMGBV6WGmIgRIRjV/xI3/gKl9Uk7pZynWkrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777475530; c=relaxed/simple;
	bh=+lpPzjQpVZqw2IwxWBU2dFkaVwLI04UBASsRDnxmpQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j3njIZzjj59CsjzH4dtHZsPPCr+gVoap8B+ba2VDaghT8HSlPsNWw5Cbv73P/J/q7apHa+n3UvnT5uEZBdXWvf41bodpAgPoe0CgZtjIy4T7cKc8yoFVWAQZpa6350/HuaafqvcDquUSzOhkPixlUmW7A/mDgk4wrCnxvmtL5Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X77e7OZy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=o6sbuF0L; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X77e7OZy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="o6sbuF0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777475527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MIFsdpU37KWnRnOSzyREX6cnqaju9TfHn4yZ6utUnI4=;
	b=X77e7OZy8hVYjmMbYBghxW4yk4PwDn385ZVXZKaZnAxa77/vGJY2jGQAZdS1eJ1T3gKYa9
	VgeljOQMzp9SJ5wsvcjjEI8Npq/97lIu70PxQ3+HFMhHfQz/ffnErL5fK8ojYZIVfqg3bR
	dgfgA8mFF1SrU4dw/hBNns8kqKaOrH4=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-__jcTAfxNL-ltygSe0MC0g-1; Wed, 29 Apr 2026 11:12:06 -0400
X-MC-Unique: __jcTAfxNL-ltygSe0MC0g-1
X-Mimecast-MFC-AGG-ID: __jcTAfxNL-ltygSe0MC0g_1777475525
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-390f7e98835so34334811fa.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 08:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777475525; cv=none;
        d=google.com; s=arc-20240605;
        b=HlsWtyCUw7WdR8E8RqXXufC4Oj6yI//hfP7keskVqeourYalDJqfAByhs3MttkaFuy
         Hm6dg/2s1E0KyK8EY3NHFB50TvLSE4tr/C4gQg/XMx72PQrcWWtqRxmai0ynyl9zRjoj
         73jq9HKGbVXPWF57iIi7Gy3Bs1aPIzhUNKkPwghjexFAULoxZaWtvGW63hFOBU2C7xWQ
         cPPjTn6j3oV5gZDWTR5R6Pij3Zmd3wSESH2xZVA4W3y0Z+amHM0ZuGsY2fqysbcnPGy1
         qo91Z4Wcdh8LdklAU1U6ucdLs+6ONx526+g6i6S/av5dixuT8/pqSqx2G8uYGIF78QWZ
         hSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MIFsdpU37KWnRnOSzyREX6cnqaju9TfHn4yZ6utUnI4=;
        fh=WF7SGJZyovIEfsUJGJDo3gWx5fOogDiuwCENz4t1YrE=;
        b=ANyGJVnn9c8h20OPrZlKa+CORu73irQykoRaOPhY4FBgGRSefi2Ug9GGqmzNfiNdBm
         uUSCttgKJ1Po9oqWqz9kr0ME2H1MIkAdGKNzAajri93S2Kr4/ByGdJgbZD3Xo9M67jZm
         Jcfz4UC2GNJme/jY/r9baWQ2r+jJyExYA8TV5XtvkoUSgDzAJtuv6rClPdUioyuhGvPW
         8Ty2eL4LBWEq4N/J8zoAyzhS/UHnkgBtNwp0eYELGL6T6VzL/k1m1gCYrJBpO2prZ9cx
         iEAvhBmvNTCFbuVQc5WuAHahfaXaNL7Rs9RqyZ1DMqOhY9udiKy0lACBsZrBEuQ7pbBq
         v76A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777475525; x=1778080325; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MIFsdpU37KWnRnOSzyREX6cnqaju9TfHn4yZ6utUnI4=;
        b=o6sbuF0LjDVitAcf+BdIBEYUfQaBH998Mrw05rHvFS/YNSDAJuA9snjH+uDZKpB9n/
         QH4sLXyU21M3vi7MCw6EUO99pcQxxlWt2lDQ3tEiUK//BgVZgVRNJ6Fo+BZXVrAkfqPb
         CweLqqKo0K9t8B/aBymB42dJ3PkK2T7ETIcBpMaKt+iezAgWp2UuPb99arYP7KzVsuf6
         DpGOLaVf8EDGXLhe/OSXhmL6LW8spoJ7sStInGRI6eY1CWqM76bxlW6lnsYj9QMBzjYj
         H8Ku6YLDDTYXF0RLtP/D5ETTml1ap6h/gZ2n1XwmCCTvwYwslB8f+zRtGgrOWh2yWeCN
         gBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777475525; x=1778080325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIFsdpU37KWnRnOSzyREX6cnqaju9TfHn4yZ6utUnI4=;
        b=ZtNDwz1QC7BCEnltvD08Q6S5v0wVG7X1S9ZcqxYDmpbGQ1hblm+kLa8btGeXO9XEza
         QfWGc89y/ZC6VDnOkTwrWqni4xuZqc1OEU966AZjVSbrk+FQQWhDd5TamRgdoKGIxBF0
         Li52B4YE/Xboc0sepYwMvnfIsYB+0pEHMDca2HyuQO5cHio/YMXftHrdVbqzSuuefneU
         jP3E/MpXL+FWo/BOIFAQG1magWqOOslDpZgjMryluKkBnXpEDK9MkxAlt3KGdjBHQsub
         9SBEogmaehO5Frz/IZd0X8EU+f+UsGucbJj9i9sxPoZgqcLKijV1zW0jpbs+CS0tVbLB
         pnAg==
X-Forwarded-Encrypted: i=1; AFNElJ+7d2VN6yI6hil60yK+EaKMswNBXRciqy9PU+l/ygfRx0ubqmJzRJ14QXZswuAr5NZpJUmV6+FW/ps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6CfnL+laWh2/8+6RptaV4LQyaVU2Ul0jBhsyHe6qnp0Q9EQF1
	u+Z7iEe90fooK4LUYINudFuj+7WlKTH8p4xRpWJGtQTj00VbVH2ow+OEeIORWXMeqr2E8NmCOWW
	I5DlNoWYFCmKtXvncoc7R7nfN6zeg3K7aqZ7I0M0vum1XMYt+X7UnWdLGiNHEkaNB17yA8ImPyL
	mTLGQLUKysVS6o54G2LGQMNVqioABmBzAaFdgs
X-Gm-Gg: AeBDieut+0ZAm2ANxZuRNGAM1r2LxU0Aywe53kl9l5jwFAPgUlNzBXKL7tntVMpEy3N
	ekKTc6PQI+vQavS3IYb7soPJ/htoTKOvNpCkhGvZArLqanPK7lKER4bcV6wJ0Terp0pPwkl3I3I
	JAY8gDVtRKFcUWXD3WtB+1TGjKnOwaiyb9KAehaBOs7gIDHEAp9qaOudxR+VVwsMEeNrsMDJC7f
	DStHLZy8ppTC7GqdPBhLUpALZc++Bd2iY5xOrmXv7OEm8Epq9U=
X-Received: by 2002:a05:651c:41d6:b0:38b:f0f0:e3f7 with SMTP id 38308e7fff4ca-39240cac934mr29426641fa.7.1777475524879;
        Wed, 29 Apr 2026 08:12:04 -0700 (PDT)
X-Received: by 2002:a05:651c:41d6:b0:38b:f0f0:e3f7 with SMTP id
 38308e7fff4ca-39240cac934mr29426101fa.7.1777475524415; Wed, 29 Apr 2026
 08:12:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419185750.260784-1-npache@redhat.com> <20260419185750.260784-5-npache@redhat.com>
 <e9dbe863-d125-4fe5-8ecc-91ad7293e5cf@kernel.org>
In-Reply-To: <e9dbe863-d125-4fe5-8ecc-91ad7293e5cf@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Wed, 29 Apr 2026 09:12:08 -0600
X-Gm-Features: AVHnY4JWHIajx86OyyAW4xEABiDRXdIc8my5jlzqHRFOcHufFZGfWfjdV3YP0YY
Message-ID: <CAA1CXcBfFcaXRvx0UnutjDV_ozcRXUmVCXZ6E6HH0buX=BYntw@mail.gmail.com>
Subject: Re: [PATCH 7.2 v16 04/13] mm/khugepaged: generalize
 __collapse_huge_page_* for mTHP support
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

On 4/27/26 2:07 PM, David Hildenbrand (Arm) wrote:
> On 4/19/26 20:57, Nico Pache wrote:
>> generalize the order of the __collapse_huge_page_* and collapse_max_*
>> functions to support future mTHP collapse.
>>
>> The current mechanism for determining collapse with the
>> khugepaged_max_ptes_none value is not designed with mTHP in mind. This
>> raises a key design issue: if we support user defined max_pte_none values
>> (even those scaled by order), a collapse of a lower order can introduces
>> an feedback loop, or "creep", when max_ptes_none is set to a value greater
>> than HPAGE_PMD_NR / 2.
>>
>> With this configuration, a successful collapse to order N will populate
>> enough pages to satisfy the collapse condition on order N+1 on the next
>> scan. This leads to unnecessary work and memory churn.
>
> You could add a link here to previous discussions.

Ack, not a bad idea for historical reasons.

>
>>
>> To fix this issue introduce a helper function that will limit mTHP
>> collapse support to two max_ptes_none values, 0 and HPAGE_PMD_NR - 1.
>> This effectively supports two modes:
>>
>> - max_ptes_none=0: never introduce new none-pages for mTHP collapse.
>
> "introduce" reads wrong in this context. And I don't know what a "none-page" is :)

Thats a page that is none duh ;P Ill clean that up

>
> "never collapses if it encounters an empty PTE or a PTE that maps the shared
> zeropage. Consequently, no memory bloat."

Thanks that does read way better!

>
>> - max_ptes_none=511 (on 4k pagesz): Always collapse to the highest
>>    available mTHP order.
>>
>> This removes the possiblilty of "creep", while not modifying any uAPI
>> expectations. A warning will be emitted if any non-supported
>> max_ptes_none value is configured with mTHP enabled.
>>
>> mTHP collapse will not honor the khugepaged_max_ptes_shared or
>> khugepaged_max_ptes_swap parameters, and will fail if it encounters a
>> shared or swapped entry.
>>
>> No functional changes in this patch; however it defines future behavior
>> for mTHP collapse.
>>
>> Co-developed-by: Dev Jain <dev.jain@arm.com>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> Signed-off-by: Nico Pache <npache@redhat.com>
>> ---
>>   mm/khugepaged.c | 124 ++++++++++++++++++++++++++++++++++--------------
>>   1 file changed, 88 insertions(+), 36 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index f42b55421191..283bb63854a5 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -352,51 +352,86 @@ static bool pte_none_or_zero(pte_t pte)
>>    * collapse_max_ptes_none - Calculate maximum allowed empty PTEs for collapse
>>    * @cc: The collapse control struct
>>    * @vma: The vma to check for userfaultfd
>> + * @order: The folio order being collapsed to
>>    *
>>    * If we are not in khugepaged mode use HPAGE_PMD_NR to allow any
>> - * empty page.
>> + * empty page. For PMD-sized collapses (order == HPAGE_PMD_ORDER), use the
>> + * configured khugepaged_max_ptes_none value.
>> + *
>> + * For mTHP collapses, we currently only support khugepaged_max_pte_none values
>> + * of 0 or (KHUGEPAGED_MAX_PTES_LIMIT). Any other value will emit a warning and
>> + * no mTHP collapse will be attempted
>
> Not sure if we discussed it (and maybe I had a different opinion back then ...),
> but could we simply to fallback to max_ptes_none=0, so we can avoid returning
> errors here?>
> max_ptes_none=0 is ok, because we will not waste any memory. The warning clearly
> tells the user that this combination is not supported as is.
>
> ... and it would make this function a lot easier to handle. In the warning, we
> can just state that "falling back to ... "max_ptes_non = 0".

We'd then be "violating" the uAPI expetation and is the whole reason we
have this 0/511 behavior in the first place ;/

If it wasnt for that issue I would have a completely different design.

>
>
> [...]
>
>>
>>   /**
>>    * collapse_max_ptes_shared - Calculate maximum allowed shared PTEs for collapse
>>    * @cc: The collapse control struct
>> + * @order: The folio order being collapsed to
>>    *
>>    * If we are not in khugepaged mode use HPAGE_PMD_NR to allow any
>>    * shared page.
>>    *
>> + * For mTHP collapses, we currently dont support collapsing memory with
>> + * shared memory.
>
> "do not"
>
> "shared memory" is misleading, as we do support shmem. What you mean is maybe
> "collapsing with anonymous memory pages that are shared between processes
> through CoW" or soemthing like that?

Ok ill clear that up thank you!

>
>> + *
>>    * Return: Maximum number of shared PTEs allowed for the collapse operation
>>    */
>> -static unsigned int collapse_max_ptes_shared(struct collapse_control *cc)
>> +static unsigned int collapse_max_ptes_shared(struct collapse_control *cc,
>> +            unsigned int order)
>>   {
>>      if (!cc->is_khugepaged)
>>              return HPAGE_PMD_NR;
>> +    if (!is_pmd_order(order))
>> +            return 0;
>> +
>>      return khugepaged_max_ptes_shared;
>>   }
>>
>>   /**
>>    * collapse_max_ptes_swap - Calculate maximum allowed swap PTEs for collapse
>>    * @cc: The collapse control struct
>> + * @order: The folio order being collapsed to
>>    *
>>    * If we are not in khugepaged mode use HPAGE_PMD_NR to allow any
>>    * swap page.
>>    *
>> + * For PMD-sized collapses (order == HPAGE_PMD_ORDER), use the configured
>> + * khugepaged_max_ptes_swap value.
>> + *
>> + * For mTHP collapses, we currently dont support collapsing memory with
>> + * swapped out memory.
>
> "do not". Given that this is also used for the pagecache, can we make this clearer?

Yeah! I originally didnt plan on using these helpers for the file
collapse operation but figured hell, why not clean them both up, might
end up helping (hopefully not hurting) when Baolin goes to add mTHP
shmem support.

Cheers,
-- Nico


>
>> + *
>>    * Return: Maximum number of swap PTEs allowed for the collapse operation
>>    */
>> -static unsigned int collapse_max_ptes_swap(struct collapse_control *cc)
>> +static unsigned int collapse_max_ptes_swap(struct collapse_control *cc,
>> +            unsigned int order)

