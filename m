Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAC7C001DE
	for <linux-doc@archiver.kernel.org>; Thu, 10 Aug 2023 17:48:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235397AbjHJRsZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Aug 2023 13:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235467AbjHJRsW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Aug 2023 13:48:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE29270F
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 10:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691689662;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oU7y2MwySKI8Jyjp8rHjmRFDUK7yH9mFWODVue0LC6k=;
        b=BFKwT3q+eac3E0nKyEA2Ok0/KdO5Y5UfZ/4rgBkLSPUHEZPCKj/1NMzt7TEvQUOU7swXEr
        edEAGOSwa6c4JBdQ/oXPGDqM1nw2ekOMLdjkvIm4IxEfo6vTyg+o5PAS/ZrIsDyNiXk9ZW
        v3/GOhJ18I3Neq3Gw1UzKjUx5VYLZy0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-o2oXMA16Ox-Fp2SbXlLx0g-1; Thu, 10 Aug 2023 13:47:38 -0400
X-MC-Unique: o2oXMA16Ox-Fp2SbXlLx0g-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-317df1add39so721803f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 10:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691689657; x=1692294457;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oU7y2MwySKI8Jyjp8rHjmRFDUK7yH9mFWODVue0LC6k=;
        b=jez0Rfgo9WXOXnDGAeuzea844EiVW7M2aK806p4PxpBlrkahLuZ7xhlffRfl1Aol7a
         sFJNhG2LOMPP6i9h6J41JqayM/3r2NoU7CSZOu6qpFuL7dt8BIZAMzy9zKJz76GraIn9
         EqB9iwd46Y1V0DCacji6ANCxRdv6V4GRY7yivCsUofviFSliC8JMbRL24+MVhXkUtBAw
         X2C7ui4RmoWjOBahoiFAm88ACnf6FfbLIVvf/TjxCfaXqsUJK6fnRJAO7JeXv83LSmoc
         ps+TY6NVb1DjUpvCQ0BvzNJshJj7j98E696hcb0Guau47qsPkdwxFULCMxOjKk+nugnR
         vfLQ==
X-Gm-Message-State: AOJu0YyhyspQErQK257rIlyjW8Ege9KWS8jsaoEM25IK9wHO75KHknjr
        pm28Okpc4hugRztdx4jRAbDUko+elG9wuETBcZI7oHxCKKZ4pGrt7VgxSxuUTScCvlbsFer7X2e
        zrYw/exzcZhy3vbi+AbsQ
X-Received: by 2002:a05:6000:1010:b0:317:5ed6:887 with SMTP id a16-20020a056000101000b003175ed60887mr2589675wrx.66.1691689656983;
        Thu, 10 Aug 2023 10:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd5a43eooBSZBw90DEpfdZTNsoD/ddgvcTiFpWbNXO7eJpBo5l/9LyJ4ZEFkBQfsQWoHPcFg==
X-Received: by 2002:a05:6000:1010:b0:317:5ed6:887 with SMTP id a16-20020a056000101000b003175ed60887mr2589655wrx.66.1691689656528;
        Thu, 10 Aug 2023 10:47:36 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71a:8a00:8200:f041:4b87:a8be? (p200300cbc71a8a008200f0414b87a8be.dip0.t-ipconnect.de. [2003:cb:c71a:8a00:8200:f041:4b87:a8be])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bce09000000b003fe2120ad0bsm5663845wmc.41.2023.08.10.10.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 10:47:36 -0700 (PDT)
Message-ID: <db3c4d94-a0a9-6703-6fe0-e1b8851e531f@redhat.com>
Date:   Thu, 10 Aug 2023 19:47:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Hugh Dickins <hughd@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Yin Fengwei <fengwei.yin@intel.com>,
        Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>
References: <20230809083256.699513-1-david@redhat.com> <ZNQD4pxo8svpGmvX@x1n>
 <e5e29217-11d3-a84b-9e29-44acc72222f3@redhat.com>
 <155bd03e-b75c-4d2d-a89d-a12271ada71b@arm.com> <ZNUbNDiciFefJngZ@x1n>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH mm-unstable v1] mm: add a total mapcount for large folios
In-Reply-To: <ZNUbNDiciFefJngZ@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10.08.23 19:15, Peter Xu wrote:
> On Thu, Aug 10, 2023 at 11:48:27AM +0100, Ryan Roberts wrote:
>>> For PTE-mapped THP, it might be a bit bigger noise, although I doubt it is
>>> really significant (judging from my experience on managing PageAnonExclusive
>>> using set_bit/test_bit/clear_bit when (un)mapping anon pages).
>>>
>>> As folio_add_file_rmap_range() indicates, for PTE-mapped THPs we should be
>>> batching where possible (and Ryan is working on some more rmap batching).
>>
>> Yes, I've just posted [1] which batches the rmap removal. That would allow you
>> to convert the per-page atomic_dec() into a (usually) single per-large-folio
>> atomic_sub().
>>
>> [1] https://lore.kernel.org/linux-mm/20230810103332.3062143-1-ryan.roberts@arm.com/
> 
> Right, that'll definitely make more sense, thanks for the link; I'd be very
> happy to read more later (finally I got some free time recently..).  But
> then does it mean David's patch can be attached at the end instead of
> proposed separately and early?

Not in my opinion. Batching rmap makes sense even without this change, 
and this change makes sense even without batching.

> 
> I was asking mostly because I read it as a standalone patch first, and
> honestly I don't know the effect.  It's based on not only the added atomic
> ops itself, but also the field changes.
> 
> For example, this patch moves Hugh's _nr_pages_mapped into the 2nd tail
> page, I think it means for any rmap change of any small page of a huge one
> we'll need to start touching one more 64B cacheline on x86.  I really have
> no idea what does it mean for especially a large SMP: see 292648ac5cf1 on
> why I had an impression of that.  But I've no enough experience or clue to
> prove it a problem either, maybe would be interesting to measure the time
> needed for some pte-mapped loops?  E.g., something like faulting in a thp,

Okay, so your speculation right now is:

1) The change in cacheline might be problematic.

2) The additional atomic operation might be problematic.

> then measure the split (by e.g. mprotect() at offset 1M on a 4K?) time it
> takes before/after this patch.

I can certainly try getting some numbers on that. If you're aware of 
other micro-benchmarks that would likely notice slower pte-mapping of 
THPs, please let me know.

> 
> When looking at this, I actually found one thing that is slightly
> confusing, not directly relevant to your patch, but regarding the reuse of
> tail page 1 on offset 24 bytes.  Current it's Hugh's _nr_pages_mapped,
> and you're proposing to replace it with the total mapcount:
> 
>          atomic_t   _nr_pages_mapped;     /*    88     4 */
> 
> Now my question is.. isn't byte 24 of tail page 1 used for keeping a
> poisoned mapping?  See prep_compound_tail() where it has:
> 
> 	p->mapping = TAIL_MAPPING;
> 
> While here mapping is, afaict, also using offset 24 of the tail page 1:
> 
>          struct address_space * mapping;  /*    24     8 */
> 
> I hope I did a wrong math somewhere, though.
> 

I think your math is correct.

prep_compound_head() is called after prep_compound_tail(), so 
prep_compound_head() wins.

In __split_huge_page_tail() there is a VM_BUG_ON_PAGE() that explains 
the situation:

/* ->mapping in first and second tail page is replaced by other uses */
VM_BUG_ON_PAGE(tail > 2 && page_tail->mapping != TAIL_MAPPING,
	       page_tail);

Thanks for raising that, I had to look into that myself.

-- 
Cheers,

David / dhildenb

