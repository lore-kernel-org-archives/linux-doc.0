Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E0DC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 17:38:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3306615A6
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 17:38:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348517AbhITRj5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Sep 2021 13:39:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35315 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343674AbhITRhn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Sep 2021 13:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632159372;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=joEmUTI4ZZjQtcXVOCrz/b3U1ugGJV5MEzLo31LXFyM=;
        b=i8TIiM/jE1lK36soC22bYhDiPafqZ4uFV1q81ITefXT+LtWEFPSkDomZa3sD9ZjrVkukEy
        WK0d2B4FwRejE49yYkcqinj0VobxMUt2ddTfghpNwtRrtx0r+PiNkfZWgK36YEsCzcnGdX
        CNI70ZFEiMTkEZK9nzFC7peXMRQi1Zg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-qCkmFmlWNleE1DiEIHNSUg-1; Mon, 20 Sep 2021 13:36:11 -0400
X-MC-Unique: qCkmFmlWNleE1DiEIHNSUg-1
Received: by mail-wr1-f69.google.com with SMTP id j16-20020adfa550000000b0016012acc443so1337175wrb.14
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 10:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=joEmUTI4ZZjQtcXVOCrz/b3U1ugGJV5MEzLo31LXFyM=;
        b=l25eacxGLlHPDUe+FPkX5WaMQeTTfT1xodF0ERGBfXwXJAua2d4QrBTCamQOymG7JZ
         zf9IOOqJCYwnXeWlwTtToqYJ/5xI2sK3DMQv9ofD/dYJ1byLtzKU6UxcV+sYlf7xi+Rh
         VK3olJQ1MC2h7CgpbBjngd1xRtPGF4MYkrxU81eG74/5MtvB9NcirWsLVoc7TMpmlXQN
         2m83wJBgOPlG/dlkh2FnH9zxUcSjpVHpxZaGngZTRCIl8C1NtWBYsW1gHbw4tb+IprQX
         XyjoWppVzuJ5TRDS1tvimGtYlsrZSyNQbWgrJh9sDaZ78DjUyK9QudEodHtfej4qir+i
         HEzA==
X-Gm-Message-State: AOAM533BgGsUzgm1SOROQEHSPvMmX34cyJPZXKARJNtliShHXcRhwnPA
        lgn1J1PtxswEOXNh3dGjlReY+BiwT/x/WUslBk7oX1/sxqsfcUCEF6zTFaPLFFdTznz1qoE4g22
        VfELJKX039HaqMJQgqSTq
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr29694377wrs.271.1632159370303;
        Mon, 20 Sep 2021 10:36:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd+Ecc/ldnyJDRLp7Hdo6uHjNnF8F4pT5VdfoRiLEQAWtep8SAoFkzsot/bUJ/fdK5Sue1gw==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr29694338wrs.271.1632159369854;
        Mon, 20 Sep 2021 10:36:09 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23e48.dip0.t-ipconnect.de. [79.242.62.72])
        by smtp.gmail.com with ESMTPSA id w1sm171783wmc.19.2021.09.20.10.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 10:36:09 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] Documentation: update pagemap with shmem
 exceptions
To:     Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>,
        akpm@linux-foundation.org, corbet@lwn.net, peterx@redhat.com,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Cc:     ivan.teterevkov@nutanix.com, florian.schmidt@nutanix.com,
        carl.waldspurger@nutanix.com, jonathan.davies@nutanix.com
References: <20210920164931.175411-1-tiberiu.georgescu@nutanix.com>
 <20210920164931.175411-2-tiberiu.georgescu@nutanix.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <a89b861e-e5ff-32cf-c511-5b17ef60c2dd@redhat.com>
Date:   Mon, 20 Sep 2021 19:36:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210920164931.175411-2-tiberiu.georgescu@nutanix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20.09.21 18:49, Tiberiu A Georgescu wrote:
> Mentioning the current missing information in the pagemap and alternatives
> on how to retrieve it, in case someone stumbles upon unexpected behaviour.
> 
> Signed-off-by: Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
> Reviewed-by: Ivan Teterevkov <ivan.teterevkov@nutanix.com>
> Reviewed-by: Florian Schmidt <florian.schmidt@nutanix.com>
> Reviewed-by: Carl Waldspurger <carl.waldspurger@nutanix.com>
> Reviewed-by: Jonathan Davies <jonathan.davies@nutanix.com>
> ---
>   Documentation/admin-guide/mm/pagemap.rst | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
> index fb578fbbb76c..ea3f88f3c18d 100644
> --- a/Documentation/admin-guide/mm/pagemap.rst
> +++ b/Documentation/admin-guide/mm/pagemap.rst
> @@ -196,6 +196,28 @@ you can go through every map in the process, find the PFNs, look those up
>   in kpagecount, and tally up the number of pages that are only referenced
>   once.
>   
> +Exceptions for Shared Memory
> +============================
> +
> +Page table entries for shared pages are cleared when the pages are zapped or
> +swapped out. This makes swapped out pages indistinguishable from never-allocated
> +ones.
> +
> +In kernel space, the swap location can still be retrieved from the page cache.
> +However, values stored only on the normal PTE get lost irretrievably when the
> +page is swapped out (i.e. SOFT_DIRTY).
> +
> +In user space, whether the page is swapped or none can be deduced with the
> +lseek system call. For a single page, the algorithm is:
> +
> +0. If the pagemap entry of the page has bit 63 (page present) set, the page
> +   is present.
> +1. Otherwise, get an fd to the file where the page is backed. For anonymous
> +   shared pages, the file can be found in ``/proc/pid/map_files/``.
> +2. Call lseek with LSEEK_DATA flag and seek to the virtual address of the page
> +   you wish to inspect. If it overshoots the PAGE_SIZE, the page is NONE.
> +3. Otherwise, the page is in swap.
> +
>   Other notes
>   ===========
>   
> 

Thanks!

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

