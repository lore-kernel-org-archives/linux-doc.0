Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3006BC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 08:42:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EDEB60F93
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 08:42:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbhIPInZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 04:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233839AbhIPInY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Sep 2021 04:43:24 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BE4C061764
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 01:42:04 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id c13-20020a17090a558d00b00198e6497a4fso6969788pji.4
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 01:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=k/PqPd1xiOKmyZtqIYtnsu2EbJDbi6Weae7ssrSWY2M=;
        b=lFM72qvnql8Gi0BrFoVtqXEq7H2gzwZmLRl3uo+Q8TFKf4j6OBxOfL8EZIIl6nwG6k
         1rD/+1UG+hVERQxCokOnbvutvYmUbBU9XWxSgi5aYlwWcnxq1mh6azAGEjVZSprwuiAz
         6mC4F6CkTaCJTQBeqNG6SFCrNTbCSDLIx63IflPaXx2tOr3aI5Eha1PcC9VV4wlGaah+
         Uhu3QEdnVHsja54X20l36OV/vdef5j2M+DCP3jkJ+oxqtoN0HcFfdfBzm6PUHG7ZqXh4
         +x3Ey9nrzcLR1RjRCIR4krylXQH+KeQpOBv+pWYU2Wi8RLRFRftsgYZq8Pm17vjtSftC
         BrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=k/PqPd1xiOKmyZtqIYtnsu2EbJDbi6Weae7ssrSWY2M=;
        b=KZLRuOcr4HZ0j13hZUG4WDIy1t9fH4GCF6tbO+IStNv77E9yL2BAnR8wN/NgzwS6DU
         KGA8pQnfC37s887ffnmZfV3MxonTPZfrn+VLtNrahGVhhtCvA7cyoxn6FAySsau012lo
         H9N+PRz9KUHCTWeQ3ML2b7kxy5eJ3KT7GwFMkWDJJTwH/1iVD62fLIvBCx7tFi4DqIdl
         R35jqgWh9HqBb7DRjIQJL2kOHMVk41lsIUdY59ti5NF6zPP++ueNv65yQ+RH31zruXVL
         goSKtmz2vhlhGJ6zz826XfBRqJgcdmp4BtNCNIkgd+ZVDlsg6NHUUas8qSEViwAVMisF
         lhHA==
X-Gm-Message-State: AOAM5326Usq8MNaqlrNrPqS9BtWy5bodUb5BXb5awBVTJUgO81UHlthy
        dCdSUbpPJhRvGJXX0ypJ77mHCA==
X-Google-Smtp-Source: ABdhPJw6e4BTwxgsM/UjNPTgBViVxZTWeAbr81eOn2XSEZUvaUVaMsgHXZ1ubSN3W47yeAUgxwnMbw==
X-Received: by 2002:a17:902:7b84:b0:13b:90a7:e270 with SMTP id w4-20020a1709027b8400b0013b90a7e270mr3655442pll.21.1631781723597;
        Thu, 16 Sep 2021 01:42:03 -0700 (PDT)
Received: from [10.254.159.231] ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id a15sm2599933pgn.25.2021.09.16.01.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 01:42:03 -0700 (PDT)
Subject: Re: [PATCH v2 0/9] Free user PTE page table pages
To:     David Hildenbrand <david@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
 <5b9348fc-95fe-5be2-e9df-7c906e0c9b81@redhat.com>
 <41ceeec1-52c4-4e99-201c-e1e05b2afbbc@bytedance.com>
 <20210915145933.GH3544071@ziepe.ca>
 <d33a4349-a228-f98a-ab14-e221bf80dd4a@bytedance.com>
 <b7514329-7ae4-b78e-a4f1-4208c9cfe802@redhat.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <a8b3c8b1-43da-d2ad-505b-46ca7624238f@bytedance.com>
Date:   Thu, 16 Sep 2021 16:41:57 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b7514329-7ae4-b78e-a4f1-4208c9cfe802@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 9/16/21 4:30 PM, David Hildenbrand wrote:
> On 16.09.21 07:32, Qi Zheng wrote:
>>
>>
>> On 9/15/21 10:59 PM, Jason Gunthorpe wrote:
>>> On Wed, Sep 15, 2021 at 10:52:40PM +0800, Qi Zheng wrote:
>>>> I am going to split this patch series as follows:
>>>>
>>>> 1. Introduce the new dummy APIs, which is an empty implementation.
>>>>      But I will explain its semantics.
>>>> 2. Merge #6, #7 and #8, and call these dummy APIs in any necessary
>>>>      location, and split some special cases into single patches, 
>>>> such as
>>>>      pagefault and gup, etc. So that we can explain in more detail the
>>>>      concurrency in these cases. For example, we don't need to hold any
>>>>      pte_refcount in the fast path in gup on the x86_64 platform. 
>>>> Because
>>>>      the PTE page can't be freed after the local CPU interrupt is 
>>>> closed
>>>>      in the fast path in gup.
>>>> 3. Introduce CONFIG_FREE_USER_PTE and implement these empty dummy APIs.
>>>> 4. Add a description document.
>>>>
>>>> And I try to add a function that combines pte_offset_map() and
>>>> pte_try_get(). Maybe the func name is pte_try_map() recommended by
>>>> Jason, or keep the pte_offset_map() unchanged?
>>>
>>> It is part of the transformation, add a
>>> pte_try_map()/pte_undo_try_map() and replace all the pte_offset_map()
>>> callsites that can use the new API with it. The idea was that try_map
>>> would incorporate the pmd_trans_unstable/etc mess so searching for
>>> trans_unstable is a good place to start finding candidates. Some are
>>> simple, some are tricky.
>>
>> Yes, I will search pte_offset_map()/pmd_trans_unstable/etc, and then
>> analyze the specific situation.
> 
> Maybe propose the new API first, before doing the actual implementation. 
> Might safe you from doing some additional back-and-forth
> work eventually.
> 

OK, I prepare to propose all the dummy APIs in the step 1.

Thanks,
Qi

> 
