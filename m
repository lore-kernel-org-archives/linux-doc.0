Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FCEC4338F
	for <linux-doc@archiver.kernel.org>; Mon, 23 Aug 2021 08:52:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A19E96121E
	for <linux-doc@archiver.kernel.org>; Mon, 23 Aug 2021 08:52:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbhHWIxk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 Aug 2021 04:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50646 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229902AbhHWIxj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Aug 2021 04:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629708776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pfOHON14UeDduBGOj0dC9lNj/5YJZNAm23cZkconEzA=;
        b=XVJpPyiFNYTFbiMLKE6zVGCOksoemZB1pgfPkEYMxx2K8jI1uol4zxtD9PxQ2Kzm30wUAP
        EafFrr2ue6hdSjk/p4aD69VNgMcSXEnEV1keZa5XkDboHq7/ZiBOE4vxa9atVSFAaIA7cG
        Exa8rSzs90gp4VrhVoEQAcapTdZpuqU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-FQmvU5i1MaC455LLPmOF6A-1; Mon, 23 Aug 2021 04:52:54 -0400
X-MC-Unique: FQmvU5i1MaC455LLPmOF6A-1
Received: by mail-wm1-f69.google.com with SMTP id v2-20020a7bcb420000b02902e6b108fcf1so8155342wmj.8
        for <linux-doc@vger.kernel.org>; Mon, 23 Aug 2021 01:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=pfOHON14UeDduBGOj0dC9lNj/5YJZNAm23cZkconEzA=;
        b=czHVUHp7inG0W6XqiYLkbIU79FH7irfV/Bx0Fx6vLY9spOqO0XM/u9TD90yMxMNg8Z
         F/qUzTR0Bgp8460GeXsdpix3sCmoDMKTa4uCf5SlpGvE5o9BIJSx5UpAFzAzlR2LyQ59
         70pfh5XQ9evDbL7q4HJssxdOvlpuamx3kDtVXbxvI38aYd4uZepHIOiOq6VEsrIJkZkw
         H8eCKCsygQihIedmK52wICl7c5nlNy787e+aXzvQ3ILCbVaofWRmtOYZgJuOEA6GbiTb
         6eCHEJ8ire2A0cEuhZPCXs/4M7Lf0lyS9ohuqTkvmeYNZrRTBlQIGs0s1/WhKl/mrL4e
         9FDg==
X-Gm-Message-State: AOAM530LaDUls72QqN1/q/vQPjY7Wgu4V8viQisyj+Rgi1w94jCIxYYY
        B4WztaQJZ4X/nfS6OeP/5sApQCpa/KYbhkWUkHkz+ibJv/gDEoAEHUDD1nX8TlWKSFC6PXbQxME
        qjo4fHQaoN66Q3H9e93jf
X-Received: by 2002:a05:600c:3656:: with SMTP id y22mr14945911wmq.58.1629708773251;
        Mon, 23 Aug 2021 01:52:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysTRI6d9227QWZf4EJBfu7NI3bo57nBMrEQLUlt8TYv25W+ux9hU2oGk4Svcydi30oOETcQA==
X-Received: by 2002:a05:600c:3656:: with SMTP id y22mr14945896wmq.58.1629708773011;
        Mon, 23 Aug 2021 01:52:53 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f? (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de. [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
        by smtp.gmail.com with ESMTPSA id z137sm18365575wmc.14.2021.08.23.01.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 01:52:52 -0700 (PDT)
To:     Tiberiu Georgescu <tiberiu.georgescu@nutanix.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "peter.xu@redhat.com" <peter.xu@redhat.com>,
        Ivan Teterevkov <ivan.teterevkov@nutanix.com>,
        Florian Schmidt <flosch@nutanix.com>,
        "Carl Waldspurger [C]" <carl.waldspurger@nutanix.com>,
        Jonathan Davies <jond@nutanix.com>
References: <20210812155843.236919-1-tiberiu.georgescu@nutanix.com>
 <8f7d6856-7bcd-dedf-663b-cd7ef2d0827f@redhat.com>
 <F04C4283-0D25-4D0E-B3A8-05B36ACFF30D@nutanix.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] Documentation: update pagemap with SOFT_DIRTY & UFFD_WP
 shmem issue
Message-ID: <4187d379-759e-0dc5-eff8-c8d356828ae2@redhat.com>
Date:   Mon, 23 Aug 2021 10:52:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <F04C4283-0D25-4D0E-B3A8-05B36ACFF30D@nutanix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20.08.21 19:10, Tiberiu Georgescu wrote:
> Hello David,
> 
>> On 18 Aug 2021, at 20:14, David Hildenbrand <david@redhat.com> wrote:
>>
>> On 12.08.21 17:58, Tiberiu A Georgescu wrote:
>>> Mentioning the current missing functionality of the pagemap, in case
>>> someone stumbles upon unexpected behaviour.
>>> Signed-off-by: Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
>>> Reviewed-by: Ivan Teterevkov <ivan.teterevkov@nutanix.com>
>>> Reviewed-by: Florian Schmidt <florian.schmidt@nutanix.com>
>>> Reviewed-by: Carl Waldspurger <carl.waldspurger@nutanix.com>
>>> Reviewed-by: Jonathan Davies <jonathan.davies@nutanix.com>
>>> ---
>>>   Documentation/admin-guide/mm/pagemap.rst | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>> diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
>>> index fb578fbbb76c..627f3832b3a2 100644
>>> --- a/Documentation/admin-guide/mm/pagemap.rst
>>> +++ b/Documentation/admin-guide/mm/pagemap.rst
>>> @@ -207,3 +207,9 @@ Before Linux 3.11 pagemap bits 55-60 were used for "page-shift" (which is
>>>   always 12 at most architectures). Since Linux 3.11 their meaning changes
>>>   after first clear of soft-dirty bits. Since Linux 4.2 they are used for
>>>   flags unconditionally.
>>> +
>>> +Note that the page table entries for swappable and non-syncable pages are
>>> +cleared when those pages are zapped or swapped out. This makes information
>>> +about the page disappear from the pagemap.  The location of the swapped
>>> +page can still be retrieved from the page cache, but flags like SOFT_DIRTY
>>> +and UFFD_WP are lost irretrievably.
>>
>> UFFD_WP is currently only supported for private anonymous memory, where it should just work (a swap entry with a uffd-wp marker). So can we even end up with UFFD_WP bits on shmem and such? (Peter is up-streaming that right now, but there, I think he's intending to handle it properly without these bits getting lost using pte_markers and such).
> 
> If that is the case, I guess we should not end up with UFFD_WP bits on shmem
> ptes yet. Sorry for the confusion.
> 
> Great to hear Peter is upstreaming his patch soon. Is it this series[1] you
> mention?
> 
> [1]: https://lore.kernel.org/lkml/20210715201422.211004-1-peterx@redhat.com/

Yes, and that would take care of making the uffd-wp bit persistent.

>>
>> So regarding upstream Linux, your note regarding UFFD_WP should not be applicable, right?
>>
> Right.
>>
>> On a related note: if we start thinking about the pagemap expressing which pages are currently mapped into the page tables ("state of the process page tables") mostly all starts making sense. We document this as "to examine the page tables" already.
>>
>> We only get swapped information if there is a swap PTE -- which only makes sense for anonymous pages, because there, the page table holds the state ("single source of truth"). For shmem, we don't have it, because the page cache is the single source of truth.
>>
>> We only get presence information if there is a page mapped into the page tables -- which, for anonymous pages, specifies if there is anything present at all. For shmem we only have it if it's currently mapped into the page table.
>>
>> Losing softdirt is a bad side effect of, what you describe, just setting a PTE to none and not syncing back that state back to some central place where it could be observed even without the PTE at hand.
>>
> Yeah, that seems to be the case because shared memory behaves internally
> as file-backed memory, but logically needs to be swapped to a swap device, not
> to the disk. This turns shmem into an odd hybrid, which does not truly adhere to
> the rules the other categories comply.
>>
>> Maybe we should document more clearly, especially what to expect for anonymous pages and what to expect for shared memory etc from the pagemap. Once we figured out which other interfaces we have to deal with shared memory (minore(), lseek() as we learned), we might want to document that as well, to safe people some time when exploring this area.
> 
> I agree, as I found out first hand how eluding this information can be.
> Thank you for your comments and discoveries mentioned on Peter's RFC thread[4], particularly the usage of mincore(), lseek() and proc/pid/map_files in
> CRIU. I learned a lot from them. We should definitely add them as alternatives for
> parts of the missing information.
> 
> Currently, the missing information for shmem is this:
> 1. Difference between is_swap(pte) and is_none(pte).
>      * is_swap(pte) is always false;
>      * is_none(pte) is true when is_swap() should have been;

You can also have is_none(pte) if it should be is_present(pte).

>      * is_present(pte) is fine.

is_present(pte) is always correct when set, but might be wrong when not set.

> 2. swp_entry(pte)
>      Particularly, swp_type() and swp_offset().
> 3. SOFT_DIRTY_BIT
>      This is not always missing for shmem.
>      Once 4 is written to clear_refs, if the page is dirtied, the bit is fine as long as it
>      is still in memory. If the page is swapped out, the bit is lost. Then, if the page is
>      brought back into memory, the bit is still lost.

There are other cases that don't require swapping I think (THP 
splitting). I might be wrong.

> 
> For 1, you mentioned how lseek() and madvise() can be used to get this
> information [2], and I proposed a different method with a little help from
> the current pagemap[3]. They have slightly different output and applications, so
> the difference should be taken into consideration.

At this point I am pretty sure that the pagemap is the wrong mechanism 
for that. Pagemap never made that promise; it promised to tell you how 
the page tables currently look like, not the correct state of the 
underlying file.

> For 2, if anyone knows of any way of retrieve the missing information cleanly,
> please let us know.

As raised by Peter as well, there is much likely not a sane use case 
that should really rely on this. There might be corner cases (use case 
you mentioned), but that doesn't mean that we want to support them from 
a Linux ABI POV.

> As for 3, AFAIK, we will need to leverage Peter's special PTE marker mechanism
> and implement it in another patch.

Or come to the conclusion that softdirty+shmem in the current form is 
the wrong approach and you actually want to maintain such information in 
central place, from where you can retrieve reliably if shared memory has 
been modified by any user.

pagemap never worked reliably with softdirty/swap/present on shmem, so 
it's not a regression. It was always best effort.

-- 
Thanks,

David / dhildenb

