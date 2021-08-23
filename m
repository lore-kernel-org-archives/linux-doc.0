Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAEEC432BE
	for <linux-doc@archiver.kernel.org>; Mon, 23 Aug 2021 08:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73CF261248
	for <linux-doc@archiver.kernel.org>; Mon, 23 Aug 2021 08:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235462AbhHWIl2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 Aug 2021 04:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25378 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235442AbhHWIl2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Aug 2021 04:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629708045;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0hrwKmAH2Kp6UIsRLYt3M54v3aOHS8zcn4SvPxdwEyc=;
        b=e/iH/g2HVhzjo0KLFnaIJedR2MPiMuq/maNyJxkGFu8RtaHrqTnJTgX1uZHyjoi19oVhbt
        YxrjF4UPQPL/r5B0YT1pGU8WSa1sDV4SAvfUaQZqHJ9PUCSOLwLQtEcsbdKY38qxJHpauN
        3u0s1798Te45MXL7MlrjJqyvQBVo0vA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-S1Rqw9B3OJe3hwj7lL5GMw-1; Mon, 23 Aug 2021 04:40:42 -0400
X-MC-Unique: S1Rqw9B3OJe3hwj7lL5GMw-1
Received: by mail-wm1-f69.google.com with SMTP id z186-20020a1c7ec30000b02902e6a27a9962so8156493wmc.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Aug 2021 01:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0hrwKmAH2Kp6UIsRLYt3M54v3aOHS8zcn4SvPxdwEyc=;
        b=sEbefIeaPnG+9c9+mXoWVV/ruYEmr77YuncR9m7PVRctUOqU/epPwRE5qTnxVJvEPE
         KvIYREkONKsB+fTz/48Ja57tnwd/3e00o088NDFnxLUEbqcxwPVirjzSN8VHUQfdFqIa
         tjKXmNvVwQub8c8WUxgR1/vrRHXksqSIYPPbMOVhGuyf/XtPIdSFD3Tr/hQ+SeJsaOPG
         cUSogf8QN/BhWdg/ieCeyre0l+w8co8y9BL96I3kxVHoMNkmunNBeLPNNph/8UWyO7ck
         AW5iAew+p5rxmUDLZfI2qCY13pQgbN9d9eCKemzDFl35yM1jEuN/26ZDhkH8JSwCoYBR
         rBoA==
X-Gm-Message-State: AOAM5313PmoOkOpjjbZIcAkrVMLesOvJmlJJJRS2kDXW6qcEbt/QZGrN
        jy2/JONimMI8amrgfqioS4zKyTUt9xMlZaasev38nIwmUpYq+9D9Id9lyCwvgoIvKh5y9dFwwY1
        hL8ttB4sMGQTlGM/3frFE
X-Received: by 2002:adf:dd92:: with SMTP id x18mr12460160wrl.123.1629708041101;
        Mon, 23 Aug 2021 01:40:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ+uax/R1wZ69T8ACt5FQUAJv7A+Ze42tjOIV9uXL/OB3tx7KoPSsR95dUhPeQl8qXlZlk2g==
X-Received: by 2002:adf:dd92:: with SMTP id x18mr12460147wrl.123.1629708040898;
        Mon, 23 Aug 2021 01:40:40 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f? (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de. [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
        by smtp.gmail.com with ESMTPSA id p8sm16962613wme.22.2021.08.23.01.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 01:40:40 -0700 (PDT)
Subject: Re: [PATCH] Documentation: update pagemap with SOFT_DIRTY & UFFD_WP
 shmem issue
To:     Peter Xu <peterx@redhat.com>,
        Tiberiu Georgescu <tiberiu.georgescu@nutanix.com>
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
 <F04C4283-0D25-4D0E-B3A8-05B36ACFF30D@nutanix.com> <YSAP0d8nxBShQiF+@t490s>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <3196e878-7ab3-a385-74e3-4c4bfbc66e36@redhat.com>
Date:   Mon, 23 Aug 2021 10:40:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSAP0d8nxBShQiF+@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20.08.21 22:25, Peter Xu wrote:
> Hi, Tiberiu,
> 
> On Fri, Aug 20, 2021 at 05:10:20PM +0000, Tiberiu Georgescu wrote:
>> Currently, the missing information for shmem is this:
>> 1. Difference between is_swap(pte) and is_none(pte).
>>      * is_swap(pte) is always false;
>>      * is_none(pte) is true when is_swap() should have been;
>>      * is_present(pte) is fine.
>> 2. swp_entry(pte)
>>      Particularly, swp_type() and swp_offset().
>> 3. SOFT_DIRTY_BIT
>>      This is not always missing for shmem.
>>      Once 4 is written to clear_refs, if the page is dirtied, the bit is fine as long as it
>>      is still in memory. If the page is swapped out, the bit is lost. Then, if the page is
>>      brought back into memory, the bit is still lost.
>>
>> For 1, you mentioned how lseek() and madvise() can be used to get this
>> information [2], and I proposed a different method with a little help from
>> the current pagemap[3]. They have slightly different output and applications, so
>> the difference should be taken into consideration.
>> For 2, if anyone knows of any way of retrieve the missing information cleanly,
>> please let us know.
>> As for 3, AFAIK, we will need to leverage Peter's special PTE marker mechanism
>> and implement it in another patch.
>>
>> [2]: https://lore.kernel.org/lkml/5766d353-6ff8-fdfa-f8f9-764e8de9b5aa@redhat.com/
>> [3]: https://lore.kernel.org/lkml/B130B700-B3DB-4D07-A632-73030BCBC715@nutanix.com/
>>
>> ============================
>> For completeness, I would like to mention Peter's RFC[4] and my own patch[5],
>> which deal with adding missing functionality to the pagemap when pages are
>> shmem/tmpfs.
>>
>> Peter's patch[4] adds the missing information at 1 to the pagemap, with very little performance overhead. AFAIK, it is still WIP.
>>
>> My patch[5] fixes both 1 and 2, at the expense of a significant loss in performance
>> when dealing with swapped out shared pages. This performance loss can be
>> reduced with batching, for use cases when high performance matters. Also, this
>> patch on top of Peter's RFC yields better performance[6]. Still 2x as slow on
>> average compared to pre-patch.
>>
>> Peter's patch has a config flag, and I intend to add one to mine in the next
>> version. So I wanted to propose, if alternatives are not implemented yet (mincore,
>> lseek, map_files or otherwise are insufficient), we upstream our patches (once
>> they are ready), so that users can toggle them on or off, depending on whether
>> they need the extra functionality or not. And, of course, document their usage.
>>
>> If neither sounds like a particularly useful/convenient option, we might need to
>> look into designs of retrieving the missing information via another mechanism
>> (sys/fs, ioctl, netlink etc).
>>
>> That is, unless we find that we can/should place this info in the pagemap still, for
>> the sake of correctness and completeness. For that though, we should convene
>> on what do we expect the pagemap to do in the end. Is shmem/tmpfs out of
>> bounds for it or not?
>>
>> [4]: https://lore.kernel.org/lkml/20210807032521.7591-1-peterx@redhat.com/
>> [5]: https://lore.kernel.org/lkml/20210730160826.63785-1-tiberiu.georgescu@nutanix.com/
>> [6]: https://lore.kernel.org/lkml/C0DB3FED-F779-4838-9697-D05BE96C3514@nutanix.com/
> 
> Thanks for summarizing the issues.
> 
> Before going further, I really would like to understand a few questions that I
> already raised in the other thread here:
> 
> https://lore.kernel.org/lkml/YR%2F+gfL8RCP8XoB1@t490s/
> 
> They're:
> 
>    (1) Whether does mincore() suit your need already?
> 
>    (2) What would you like to do with swap entries in pagemap?
> 
> I'm more interested in question (2) because I never figured it out before, and
> I really don't see how it would work even if the kernel can share swap format
> to userspace.  E.g., right after you decided to "zero copy" that page, the page
> can be faulted in right before live migration finishes, and it can be dirtied
> again.  Then the page on the shared network storage will be stall, the same to
> the swap entry you just scanned.

I wonder if one should much rather try using shared file-backed memory 
located on a network storage instead of hacking into swap here.

-- 
Thanks,

David / dhildenb

