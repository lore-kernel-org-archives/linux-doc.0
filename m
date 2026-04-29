Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE9C1E25F9
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 14:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777474091; cv=pass; b=Qy89yTfB5Zf91UscMpdzLUlxb6i6oPRN6tyi9WhEExZmNck517ij6txttKLDw47Vhv2ur+zKgMJPGXf3ce+OcFgv511+TM6/Co5PTyCTuWUZnLkOuuwc3gk7h9RYk6rce5ECYWDblVXtpX+OHvYxjxZG+dkbLkqBTmSE0hrQd2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777474091; c=relaxed/simple;
	bh=5kXxN1buPCEibtli7PNMck74QLCWKVIezrFApVtyX7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLj3LRweU4XvXdS8kmw6JpQZDmwzS5W8KeYOl0a/rE6E1fS+HxS2OoZ1xf8fWvUsL//Tijtomm0jOpZkZ8u6FGcvrY8mMcAvNAVK3OgwRK0+9HqrZn/OnXRoamakLvoQIxBFxvXDocJ6bIvGlFLJ8dpgf4/byfcDn9EBx5sljIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XMPPOG5Q; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qqmcRifw; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XMPPOG5Q";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qqmcRifw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777474087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LvYLtl/btGLGL1tvGyFSRjjJ5sO/Papa+85rbGP6yJ4=;
	b=XMPPOG5QUFcYqc84JR6Hlq4vREHt4rd5ZgkhuYIpjhoTaO6F9MDsDzI+reAijYslpQ08fL
	7upUl0oXNTg63JtJ0J7d7SgHp8+Y8Iv5SOxv8NScc66IYnYaM8jRlV7b/zhgFEUtRAwGGA
	Zu6B67QdqZTcbfWo0ygU7Q0KT38OSrk=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-fgnh8c_ZOt2lzx08asx1TA-1; Wed, 29 Apr 2026 10:48:06 -0400
X-MC-Unique: fgnh8c_ZOt2lzx08asx1TA-1
X-Mimecast-MFC-AGG-ID: fgnh8c_ZOt2lzx08asx1TA_1777474086
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-649deeeb00fso4956105d50.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 07:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777474085; cv=none;
        d=google.com; s=arc-20240605;
        b=GNpwRMSbTfQK9ZLAkU8bQNG2HpSPkw/Hp5kfPm4fgGdPA0TLfxvbnOx0C3DFizaQRs
         9TXNApCDdEOIvb20zcnZZ8/p+vV3TNWbbKIxbdMOv64/F18bOkrNpzQQxqftGB7y3Eky
         pL+ArpqXeB6H20UZlvSMA7HEjJP3rzUZ36s8qXal+BoOETYFIMksct944u7VsDEto/IE
         7XCBEP6nyhyqOA1AIrPDhxKkCH0PRYox29Z4YeIId/j/CqR0zP3rxKFtQqePyKAY7BMU
         Tzq6WPlX4xM3ZQnqj4uL7/F+ti7UA7iOe7dAuYUomffvoF0vEIpp/8vHEJNKjAXD3DMB
         LaIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LvYLtl/btGLGL1tvGyFSRjjJ5sO/Papa+85rbGP6yJ4=;
        fh=Yz3FSXrj7BAZIEhBafjJxGdft+jcMEx5jGzBSTSckmc=;
        b=HZXekl9t9OztaHUi+D93R3fK+rSbEv7RyckgWfHXPcQJG4pCVxwgb/8JFedwlrTa40
         yDKcIoZGim+K+Op4EOrdVDSBqKwqxKkKOIOYIrfC2mFDSndnXo+NP03D4LSK7MhrdB8X
         WcfbbpHji4Ry8HOd/uQW7JccgArf/clkCbntyXzajKO5hjCp7cC6gpYpUzAhc1LjW5nW
         Plom9ADdkaeyIMwN6bucdzUXF9+v2muwzDRTeHUaSk3US9h0g9YXdkSJxl54rceHYePt
         V0pKA6vl91yHz4/8J4C5FEJ3t/2/qKf5f2dvP8c0+uzZcDrbAV9CcRU7EQJKL8RkFLDH
         zerA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777474085; x=1778078885; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LvYLtl/btGLGL1tvGyFSRjjJ5sO/Papa+85rbGP6yJ4=;
        b=qqmcRifwc8B3/SEMV5RqNwHQen9E7G0p49jewpayT8Go119yG9G711Gu/wNshuQcR0
         i169zHEmtrWot4wJwG0kNxE8Q0NuYipohmJcXamNXXJ47p0hMIdfoTKXxWkWrLALY9Ey
         ykJLvtkGXNVflvTGVLL3nU9zFC+Hq3Ssz1CTwCWPmB7LWiiMzOu3H3rT17AwhDUsTvXa
         uAvrTKfxVyPo626X+EDXfbZ98D1LkhKJtPulgdtbIZehUkXE8joFBGf/6aEXZVqDeOxA
         +AkuR78+uXUeshOlroNwOAx0V0TZWn41PoISbdW9JHjtB3Q4uMy5ztaBfcOz9ZLO22dO
         HEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777474085; x=1778078885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvYLtl/btGLGL1tvGyFSRjjJ5sO/Papa+85rbGP6yJ4=;
        b=lKkTboKatXcMlcWNb9FMQlF2pefWsv3Sfk3OEZwIYpUZqQo6J/PV45H++Z4sv0VvaV
         /IPomN5u9vw6iWYYZ0IormWTdqot/sORNCUxHFn5wBnl4Hyxo7x4O2roiaGSkiXkw3zU
         IExi8txsuQVUUAFzKm7rEcLTIm0cTs7obYJgSjEKtTRP0x9wMnvWnL6kQxHP9Cx1KEY1
         7z6AkudZlGx3XcuvnP+jeCpKX70Qb+YKj3sbkTYXew8Kbu72FCRIqRCtBfxy6Bc8yKV5
         RuZEFZvI6dokX3pAdzX4/HUQBXO+DjOcwMu4jW7vjhyP4ZEfmY6JEWCscwJ+df8LlOar
         I82g==
X-Forwarded-Encrypted: i=1; AFNElJ/qVMJJalpNmp75dG0L1PU8ooUdchXEigzfjiApnBVRoKbIsSbMU3FLcdPRjd7QaMG0MQHRYzUY4sg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw08srQDso3EXgkzVG+HDZOObaWu0RC+hjtwq7InEp2k1ZXXe3v
	pimDTe2yRe+nD8JGtoD0hxM2kv79+mFrjueWiwGJCxerKmBcSvjMc/INIJP3aL6hyj7EjN5jZWX
	bjR84AtCCYBawGe3xIBPNVDA12R2ssGbq4F4LyJWWGOT+uuYtzW3MI3UcXwSEqqfOHA1FasPnkY
	BAGStHP4WeJodMdV8aPfOBP0r+zDajYTPBp7jV
X-Gm-Gg: AeBDieu6j2gusZQwtvRedvHwJhMnHOpIpqBUojV+Xhd8wEkUgSc1vqQupTri9lnYKpm
	rIM4YnQyrrrLv8ke/Z0AC3R5cbl+A7/GlNjqKKoOJKBayPFxQi8dO6j/hMsdAmqPJJCbL5d7bDy
	JV6AbGVZfxk0uy1sjwuDsOQG3N/HDqAqN4ybCN9kydBSoDPlDlchTZ2sdel++7W40olO44JVBA2
	CMTEsUdr4Ok+AwHU87Isuxfr4cGbiQ77MxNm9tZROHHXtMwoK4=
X-Received: by 2002:a05:690e:4388:b0:651:bb21:e7fd with SMTP id 956f58d0204a3-65bfb6e20f6mr3328291d50.42.1777474085464;
        Wed, 29 Apr 2026 07:48:05 -0700 (PDT)
X-Received: by 2002:a05:690e:4388:b0:651:bb21:e7fd with SMTP id
 956f58d0204a3-65bfb6e20f6mr3328242d50.42.1777474084850; Wed, 29 Apr 2026
 07:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419185750.260784-1-npache@redhat.com> <20260419185750.260784-4-npache@redhat.com>
 <c82a0b73-67ff-45e6-a792-e610b35a5b2f@kernel.org>
In-Reply-To: <c82a0b73-67ff-45e6-a792-e610b35a5b2f@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Wed, 29 Apr 2026 08:48:10 -0600
X-Gm-Features: AVHnY4KJXyCS0pyZ03HCURX89EqHRn0KObQgQxv-NQzUy6bFSsVv_67rAsVp3HM
Message-ID: <CAA1CXcCNpLHkRO82m+XZUVEKsNrvQgUFWVbV7=4PwL8M7jmsug@mail.gmail.com>
Subject: Re: [PATCH 7.2 v16 03/13] mm/khugepaged: rework max_ptes_* handling
 with helper functions
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

On 4/27/26 1:52 PM, David Hildenbrand (Arm) wrote:
> On 4/19/26 20:57, Nico Pache wrote:
>> The following cleanup reworks all the max_ptes_* handling into helper
>> functions. This increases the code readability and will later be used to
>> implement the mTHP handling of these variables.
>>
>> With these changes we abstract all the madvise_collapse() special casing
>> (dont respect the sysctls) away from the functions that utilize them. And
>> will later in this series to cleanly restrict mTHP collapses behaviors.
>>
>> Suggested-by: David Hildenbrand <david@kernel.org>
>> Signed-off-by: Nico Pache <npache@redhat.com>
>> ---
>>   mm/khugepaged.c | 114 +++++++++++++++++++++++++++++++++---------------
>>   1 file changed, 78 insertions(+), 36 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index afac6bc4e76d..f42b55421191 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -348,6 +348,58 @@ static bool pte_none_or_zero(pte_t pte)
>>      return pte_present(pte) && is_zero_pfn(pte_pfn(pte));
>>   }
>>
>> +/**
>> + * collapse_max_ptes_none - Calculate maximum allowed empty PTEs for collapse
>
> empty PTE or PTE mapping the shared zeropage ? That should be clarified also below.

Ah fair point, "empty" isn't the best representation of a "none"/zeropage.

>
>> + * @cc: The collapse control struct
>> + * @vma: The vma to check for userfaultfd
>> + *
>> + * If we are not in khugepaged mode use HPAGE_PMD_NR to allow any
>> + * empty page.
>
> Not completely accurate due to uffd. And it's not really "empty page".

Sorry I forgot to update this comment. I originally planned on skipping
the VMA passing, but then figured later that it would make the code even
more uniform (as you suggested)

>
> Is that information really necessary for the caller? I'd suggest you drop this
> here and instead add a comment inline above the "return HPAGE_PMD_NR;".

Yeah, I'm not really sure; I can shorten them. I was heeding to lorenzos
request to add these with docstring headers

>
>> + *
>> + * Return: Maximum number of empty PTEs allowed for the collapse operation
>> + */
>> +static unsigned int collapse_max_ptes_none(struct collapse_control *cc,
>> +            struct vm_area_struct *vma)
>> +{
>> +    if (vma && userfaultfd_armed(vma))
>> +            return 0;
>> +    if (!cc->is_khugepaged)
>> +            return HPAGE_PMD_NR;
>> +    return khugepaged_max_ptes_none;
>> +}
>> +
>> +/**
>> + * collapse_max_ptes_shared - Calculate maximum allowed shared PTEs for collapse
>
> "shared PTE" is not quite clear.
>
> "PTEs that map shared anonymous pages" ?

That works for me, thank you

>
>> + * @cc: The collapse control struct
>> + *
>> + * If we are not in khugepaged mode use HPAGE_PMD_NR to allow any
>> + * shared page.
>
> Same comment as above.

ack

>
>> + *
>> + * Return: Maximum number of shared PTEs allowed for the collapse operation
>> + */
>> +static unsigned int collapse_max_ptes_shared(struct collapse_control *cc)
>> +{
>> +    if (!cc->is_khugepaged)
>> +            return HPAGE_PMD_NR;
>> +    return khugepaged_max_ptes_shared;
>> +}
>> +
>> +/**
>> + * collapse_max_ptes_swap - Calculate maximum allowed swap PTEs for collapse
>
> We're actually checking non-present page table entries (anonymous THP collapse)
> or non-present pagecache entries (file THP collapse).
>
> I wonder if there is an easy way to clarify that here, at least in the
> description (confusing name can stay unless we find something better).

I'll update the comment to include some form of this. In my mind the
name should probably stay relatively consistent to the sysctl value.

>
>> + * @cc: The collapse control struct
>> + *
>> + * If we are not in khugepaged mode use HPAGE_PMD_NR to allow any
>> + * swap page.
>
> Dito.

ack!

>
>> + *
>> + * Return: Maximum number of swap PTEs allowed for the collapse operation
>> + */
>> +static unsigned int collapse_max_ptes_swap(struct collapse_control *cc)
>> +{
>> +    if (!cc->is_khugepaged)
>> +            return HPAGE_PMD_NR;
>> +    return khugepaged_max_ptes_swap;
>> +}
>> +
>>   int hugepage_madvise(struct vm_area_struct *vma,
>>                   vm_flags_t *vm_flags, int advice)
>>   {
>> @@ -546,21 +598,19 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
>>      pte_t *_pte;
>>      int none_or_zero = 0, shared = 0, referenced = 0;
>>      enum scan_result result = SCAN_FAIL;
>> +    unsigned int max_ptes_none = collapse_max_ptes_none(cc, vma);
>> +    unsigned int max_ptes_shared = collapse_max_ptes_shared(cc);
>
> These could be const, right? Or will that change in future patches?

Yes I believe these can be const now! Thank you

>
>>
>>      for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
>>           _pte++, addr += PAGE_SIZE) {
>>              pte_t pteval = ptep_get(_pte);
>>              if (pte_none_or_zero(pteval)) {
>> -                    ++none_or_zero;
>> -                    if (!userfaultfd_armed(vma) &&
>> -                        (!cc->is_khugepaged ||
>> -                         none_or_zero <= khugepaged_max_ptes_none)) {
>> -                            continue;
>> -                    } else {
>> +                    if (++none_or_zero > max_ptes_none) {
>>                              result = SCAN_EXCEED_NONE_PTE;
>>                              count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
>>                              goto out;
>>                      }
>> +                    continue;
>>              }
>>              if (!pte_present(pteval)) {
>>                      result = SCAN_PTE_NON_PRESENT;
>> @@ -591,9 +641,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
>>
>>              /* See collapse_scan_pmd(). */
>>              if (folio_maybe_mapped_shared(folio)) {
>> -                    ++shared;
>> -                    if (cc->is_khugepaged &&
>> -                        shared > khugepaged_max_ptes_shared) {
>> +                    if (++shared > max_ptes_shared) {
>>                              result = SCAN_EXCEED_SHARED_PTE;
>>                              count_vm_event(THP_SCAN_EXCEED_SHARED_PTE);
>>                              goto out;
>> @@ -1270,6 +1318,9 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
>>      unsigned long addr;
>>      spinlock_t *ptl;
>>      int node = NUMA_NO_NODE, unmapped = 0;
>> +    unsigned int max_ptes_none = collapse_max_ptes_none(cc, vma);
>> +    unsigned int max_ptes_shared = collapse_max_ptes_shared(cc);
>> +    unsigned int max_ptes_swap = collapse_max_ptes_swap(cc);
>
> Same question here.

ack! will adjust.

>
>>
>>      VM_BUG_ON(start_addr & ~HPAGE_PMD_MASK);
>>
>
>
> In general, LGTM. With the doc fixed up
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thank you Ill get those updated.
>

