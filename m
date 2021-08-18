Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47802C4338F
	for <linux-doc@archiver.kernel.org>; Wed, 18 Aug 2021 19:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2158560BD3
	for <linux-doc@archiver.kernel.org>; Wed, 18 Aug 2021 19:15:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232885AbhHRTPd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Aug 2021 15:15:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34833 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232375AbhHRTPd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Aug 2021 15:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629314098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ptS7X8PW56n92I0moLrJCHuXcvagFzrTyl9zSuu1TCk=;
        b=dm23voAkV8dX0je2+gPyEDvwNSDzWXWGC/AoRRJw19w9KYmiX5uDq8yIazRHlwv/8Djd3S
        cfaZtfzlWO5P+qOB192SsfHtVM0x9MjuPwRRfpB8NEbi6UiymLGExHAyLCerqGgRED6PL8
        PeIzPTvf6Pf6/MNaY85ctliYlsnfZKs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-rI46o18iPeKAVrFklJeBxg-1; Wed, 18 Aug 2021 15:14:57 -0400
X-MC-Unique: rI46o18iPeKAVrFklJeBxg-1
Received: by mail-wm1-f70.google.com with SMTP id v2-20020a7bcb420000b02902e6b108fcf1so2571053wmj.8
        for <linux-doc@vger.kernel.org>; Wed, 18 Aug 2021 12:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ptS7X8PW56n92I0moLrJCHuXcvagFzrTyl9zSuu1TCk=;
        b=SKHwZOadSO3v/OFAugcF6Hl/XHsFjwdiUSTgdVf/dv7sYAPkFueOK9qwcEqUd5RHMx
         a9NStFRu2S/pRZtYTs1Ww+bX/sa/lsDdeCmMsPy5Zp5VteDz1H31pMcJiuMCnuwmRiFB
         PFRloyFun8EpbzyFg4l/FBbXRu/Nb8VOaNEGh9nAZWl8aGKsbZscjvGuwRIwjcX74Cmz
         R4/oHge72FcYdnlL/HHUl0769ub1jNNtCAV0fEdarGklBZIemsodhqK55qp/xkZeD2MJ
         WelOC6xIG4hnZrw/BiLhsv/0b0uUbOFW0ajcVKzr0qtVckG5uN+HiqBmqDYemyIy1Ujr
         1YiQ==
X-Gm-Message-State: AOAM531zOnx8E3zh4Mbkxf5g+QyVkKSA8ZO0YPQEHT0GhhSxIEdGnlTS
        0X+s3Srr887Jn/YfH0xt9Ci5DHrTXJxIc1z0W/l5phFEMpIi09WAJdSdeLbmoJJan0Az1XxPbsX
        h70bH98Cyvk9+Fm+8j1Jq
X-Received: by 2002:adf:f943:: with SMTP id q3mr12696964wrr.118.1629314095571;
        Wed, 18 Aug 2021 12:14:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqZI9YqEOvyyt2wdU8FIMQJkxlVy7xxYmXG7X44VjkH6MpzwgAB+l9FC/cxG0T3YuU5RyPIA==
X-Received: by 2002:adf:f943:: with SMTP id q3mr12696934wrr.118.1629314095308;
        Wed, 18 Aug 2021 12:14:55 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6417.dip0.t-ipconnect.de. [91.12.100.23])
        by smtp.gmail.com with ESMTPSA id s141sm517033wme.6.2021.08.18.12.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 12:14:54 -0700 (PDT)
To:     Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>,
        corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org
Cc:     peter.xu@redhat.com, ivan.teterevkov@nutanix.com,
        florian.schmidt@nutanix.com, carl.waldspurger@nutanix.com,
        jonathan.davies@nutanix.com
References: <20210812155843.236919-1-tiberiu.georgescu@nutanix.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] Documentation: update pagemap with SOFT_DIRTY & UFFD_WP
 shmem issue
Message-ID: <8f7d6856-7bcd-dedf-663b-cd7ef2d0827f@redhat.com>
Date:   Wed, 18 Aug 2021 21:14:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812155843.236919-1-tiberiu.georgescu@nutanix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12.08.21 17:58, Tiberiu A Georgescu wrote:
> Mentioning the current missing functionality of the pagemap, in case
> someone stumbles upon unexpected behaviour.
> 
> Signed-off-by: Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
> Reviewed-by: Ivan Teterevkov <ivan.teterevkov@nutanix.com>
> Reviewed-by: Florian Schmidt <florian.schmidt@nutanix.com>
> Reviewed-by: Carl Waldspurger <carl.waldspurger@nutanix.com>
> Reviewed-by: Jonathan Davies <jonathan.davies@nutanix.com>
> ---
>   Documentation/admin-guide/mm/pagemap.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
> index fb578fbbb76c..627f3832b3a2 100644
> --- a/Documentation/admin-guide/mm/pagemap.rst
> +++ b/Documentation/admin-guide/mm/pagemap.rst
> @@ -207,3 +207,9 @@ Before Linux 3.11 pagemap bits 55-60 were used for "page-shift" (which is
>   always 12 at most architectures). Since Linux 3.11 their meaning changes
>   after first clear of soft-dirty bits. Since Linux 4.2 they are used for
>   flags unconditionally.
> +
> +Note that the page table entries for swappable and non-syncable pages are
> +cleared when those pages are zapped or swapped out. This makes information
> +about the page disappear from the pagemap.  The location of the swapped
> +page can still be retrieved from the page cache, but flags like SOFT_DIRTY
> +and UFFD_WP are lost irretrievably.
> 

UFFD_WP is currently only supported for private anonymous memory, where 
it should just work (a swap entry with a uffd-wp marker). So can we even 
end up with UFFD_WP bits on shmem and such? (Peter is up-streaming that 
right now, but there, I think he's intending to handle it properly 
without these bits getting lost using pte_markers and such).

So regarding upstream Linux, your note regarding UFFD_WP should not be 
applicable, right?


On a related note: if we start thinking about the pagemap expressing 
which pages are currently mapped into the page tables ("state of the 
process page tables") mostly all starts making sense. We document this 
as "to examine the page tables" already.

We only get swapped information if there is a swap PTE -- which only 
makes sense for anonymous pages, because there, the page table holds the 
state ("single source of truth"). For shmem, we don't have it, because 
the page cache is the single source of truth.

We only get presence information if there is a page mapped into the page 
tables -- which, for anonymous pages, specifies if there is anything 
present at all. For shmem we only have it if it's currently mapped into 
the page table.

Losing softdirt is a bad side effect of, what you describe, just setting 
a PTE to none and not syncing back that state back to some central place 
where it could be observed even without the PTE at hand.


Maybe we should document more clearly, especially what to expect for 
anonymous pages and what to expect for shared memory etc from the 
pagemap. Once we figured out which other interfaces we have to deal with 
shared memory (minore(), lseek() as we learned), we might want to 
document that as well, to safe people some time when exploring this area.

-- 
Thanks,

David / dhildenb

