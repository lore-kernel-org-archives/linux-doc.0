Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56B4C47082
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 08:09:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7869610A1
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 08:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhFGIKz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Jun 2021 04:10:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45134 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230128AbhFGIKz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jun 2021 04:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623053343;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3QjcZXjWMK0kRErypw6axOjNEeFt7y49TjRKf9dcPRU=;
        b=hJ+8UcINAp0HMxHmDjpm3J/G6cBsqcsRQW+Ni3icscVkQmvFnezHix6iwYPjsRawh82zK2
        OtrZGamirfipRRUtenlAPSLNF0SmnfrZ0A+AgHJ6rMkou6Gf2BAPg8QSxNAjZi/qwjQuH7
        vkwviqgNxRZqWOiMjAmQSoLW/cNPWlQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-mravF19VOKWO_pdvm2AZtQ-1; Mon, 07 Jun 2021 04:09:02 -0400
X-MC-Unique: mravF19VOKWO_pdvm2AZtQ-1
Received: by mail-wr1-f71.google.com with SMTP id e11-20020a056000178bb0290119c11bd29eso2654195wrg.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Jun 2021 01:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3QjcZXjWMK0kRErypw6axOjNEeFt7y49TjRKf9dcPRU=;
        b=orLCrX2pXvG2TXmeSMXnA2pfCxF+HFrJ2rW0h8Aw3+LamWUvUF6+gTHzhT1qF9zw8x
         4/Co0tbvk+li/ZUaDmVvhwyNbBs0YvaRcTHFs+z5Su08eTT/7wf8WbiXkIkAQm+NLuRv
         XJfyTm3toenQubOgHgDfHKrawigAfAIGD/lkoxP5AbmNhT8AVFgumBN5/CbTJQ01cItU
         e6Rxq7xaZx2m8uXqPtuNSFyPxVr7u64ZMLdeGK5keD2HkkA249PdUljXSj5JitgzEGfw
         RCtMbgC6yVCYBRnqwt0HGwXG/jG+Nc9yFMx9E55T+cixEhJYfCKNc6SMF4660/4s+aZY
         AyiA==
X-Gm-Message-State: AOAM533LCAyIuOEvDtHeVXuskLZU5D9EjqcqJPUDd0v9lmMvIDKK1q1L
        8I2VpeUA1sf1kbHYdAWs4339Yv8hy30+St0u6JpZXayBvddXmBvpTevES0qKSYcJ9Drp3aWxBGd
        pnBOpdRoIpTMEjVXeng8cfRtYhuc5pNxUUZThyTKfs+KGAOo2tYkgUD1XG1Iw9B9iWTJp
X-Received: by 2002:adf:ee50:: with SMTP id w16mr15621567wro.187.1623053341290;
        Mon, 07 Jun 2021 01:09:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFWqd+iQBPCe+bHMRZ3V9csrG0lRr6RZgXwXPgDK/h9+cxKbQWeldRF6cskZQdJlqB7yCmIQ==
X-Received: by 2002:adf:ee50:: with SMTP id w16mr15621527wro.187.1623053340959;
        Mon, 07 Jun 2021 01:09:00 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6188.dip0.t-ipconnect.de. [91.12.97.136])
        by smtp.gmail.com with ESMTPSA id u14sm16181358wmc.41.2021.06.07.01.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 01:09:00 -0700 (PDT)
Subject: Re: [PATCH v1] memory-hotplug.rst: complete admin-guide overhaul
To:     Michal Hocko <mhocko@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-doc@vger.kernel.org
References: <20210525102604.8770-1-david@redhat.com>
 <YL3QApMe/9R/xfLU@dhcp22.suse.cz>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <14b018b0-aa19-7d00-2861-50d0e5e2bea8@redhat.com>
Date:   Mon, 7 Jun 2021 10:08:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YL3QApMe/9R/xfLU@dhcp22.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07.06.21 09:51, Michal Hocko wrote:
> [Sorry this somehow slipped through cracks]
> 
> On Tue 25-05-21 12:26:04, David Hildenbrand wrote:
>> The memory hot(un)plug documentation is outdated and incomplete. Most of
>> the content dates back to 2007, so it's time for a major overhaul.
>>
>> Let's rewrite, reorganize and update most parts of the documentation. In
>> addition to memory hot(un)plug, also add some details regarding
>> ZONE_MOVABLE, with memory hotunplug being one of its main consumers.
>>
>> The style of the document is also properly fixed that e.g., "restview"
>> renders it cleanly now.
>>
>> In the future, we might add some more details about virt users like
>> virtio-mem, the XEN balloon, the Hyper-V balloon and ppc64 dlpar.
> 
> I haven't really checked the diff but rather looked at the final
> outcome. I have to say I like it a lot. Some places are going a bit too
> technical for an admin-guide but they are in minority (e.g. locking or
> altmap reference). If somebody feels strong then this could get into its
> own file but I wouldn't lose sleep over that.

I just realized that "Locking Internals" is still a duplicate with 
core-api/memory-hotplug.rst

I thought this (merge issue) was fixed long ago. I'll just remove it 
from this file, making sure core-api/memory-hotplug.rst is up-to-date

> 
> I would make one thing slightly more explicit though
> diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
> index c95f5c2b30dd..5b462aba89cc 100644
> --- a/Documentation/admin-guide/mm/memory-hotplug.rst
> +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
> @@ -568,6 +568,10 @@ Even with ZONE_MOVABLE, there are some corner cases where offlining a memory
>   Further, when running into out of memory situations while migrating pages, or
>   when still encountering permanently unmovable pages within ZONE_MOVABLE
>   (-> BUG), memory offlining will keep retrying until it eventually succeeds.
> +The offlining context can be terminated by a fatal signal. A timeout based
> +offlining can be easily implemented by
> +
> +        % timeout $TIMEOUT offline_block | failure_handling
>   
>   Locking Internals
>   =================
> 
> 
> In the future I would find some examples of a failure cases we have seen
> so far. E.g. offlining failure with dump_page example.


Thanks, I'll pick up your change and see if I can get rid of some 
low-level stuff. I'll address Mike's review shortly and resend.

-- 
Thanks,

David / dhildenb

