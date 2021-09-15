Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B4CC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 15 Sep 2021 14:52:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1D4B610E8
	for <linux-doc@archiver.kernel.org>; Wed, 15 Sep 2021 14:52:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237109AbhIOOyH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Sep 2021 10:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233819AbhIOOyG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Sep 2021 10:54:06 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31060C061575
        for <linux-doc@vger.kernel.org>; Wed, 15 Sep 2021 07:52:47 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so5121963pjc.3
        for <linux-doc@vger.kernel.org>; Wed, 15 Sep 2021 07:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=C2Pv2ooTfdce7tXkTH8ROpCuvqDgdiR8s/9mMjPOHH4=;
        b=dcxJIWqlAzb5DYTIYG8AwlXIJweAuseXT6s6HKLdu5Mso6GT3PxeeDVzZEBwDe3QPx
         hv5Le8wmx3cu5sEv8OmHm7HNZkoVplar0UGIB/u/munG/AYe3w/nqfzXpejeVPCswqeU
         tfcF/S7wumQ2gzp8dF4CBzqA44VbIKwQjhVACCFjyVwxiUH0B5DD2Xu4BAB05bPu9Iet
         6dlQsN9bgjJ5w3TRcqfCOwny6iODsYmDtWsf0/tUXI7t0XlzL/tPjg1lXrv8AFfyImZE
         fiA0sQdsPGJZUkZmNKeyRJIw5/lwpQ/qVBReNAij12Qcm5XngiCXJCocg5uTfOU4qION
         3ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=C2Pv2ooTfdce7tXkTH8ROpCuvqDgdiR8s/9mMjPOHH4=;
        b=pvm4p/Vi6ZAKbKnecLz/v6ELov/r6Hj8NhnUP+RHMxd7b0rgY59VhWSoV5HulhYRKf
         20Cy3FRj5hRfJZga60osig68/BCBCZC23vdNso7MkN3sFQUfUMzn/t0yEYYSUkdRg0Sx
         1lUCuRkDss4x+27r3W66An6N+cc3WSIDUw6jn0KQ8h3VyseeZAcNoLC4oGOoNjj+ZtAf
         Kt4vgQ7bjYtLDl2T6odTCO8jRgEnc+Tp4CBD8tOavHor50DRjtBwvHJ+8muDOu95i5Dc
         alfqC8jpqpfymSemLtxInxUZQ3FTG900TneawAkcs+qZ4jWCY1glz5ZA8EmndLMS7exA
         qR1g==
X-Gm-Message-State: AOAM533bSzJSbULS4GaqYsUFfyCpraWuORuLR9kK/4gvne9TnS8spqze
        ywRcx9GIK0yQB5TZrYt6zxzGXQ==
X-Google-Smtp-Source: ABdhPJwSZ7CGy9apdu4GbVHSFYzv1SRtVFZ1FNwd4u1nYPQGpLKeKoeqfN08ZNJIqTPyJgbdGYhXsg==
X-Received: by 2002:a17:90a:428f:: with SMTP id p15mr9138753pjg.75.1631717566490;
        Wed, 15 Sep 2021 07:52:46 -0700 (PDT)
Received: from [10.254.148.129] ([139.177.225.252])
        by smtp.gmail.com with ESMTPSA id b10sm198777pfl.220.2021.09.15.07.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 07:52:45 -0700 (PDT)
Subject: Re: [PATCH v2 0/9] Free user PTE page table pages
To:     David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com, kirill.shutemov@linux.intel.com,
        mika.penttila@nextfour.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
 <5b9348fc-95fe-5be2-e9df-7c906e0c9b81@redhat.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <41ceeec1-52c4-4e99-201c-e1e05b2afbbc@bytedance.com>
Date:   Wed, 15 Sep 2021 22:52:40 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5b9348fc-95fe-5be2-e9df-7c906e0c9b81@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 9/1/21 8:32 PM, David Hildenbrand wrote:

Hi David,

>>
> 
> 
> Some high-level feedback after studying the code:
> 
> 1. Try introducing the new dummy primitives ("API") first, and then 
> convert each subsystem individually; especially, maybe convert the whole 
> pagefault handling in a single patch, because it's far from trivial. 
> This will make this series much easier to digest.

I am going to split this patch series as follows:

1. Introduce the new dummy APIs, which is an empty implementation.
    But I will explain its semantics.
2. Merge #6, #7 and #8, and call these dummy APIs in any necessary
    location, and split some special cases into single patches, such as
    pagefault and gup, etc. So that we can explain in more detail the
    concurrency in these cases. For example, we don't need to hold any
    pte_refcount in the fast path in gup on the x86_64 platform. Because
    the PTE page can't be freed after the local CPU interrupt is closed
    in the fast path in gup.
3. Introduce CONFIG_FREE_USER_PTE and implement these empty dummy APIs.
4. Add a description document.

And I try to add a function that combines pte_offset_map() and
pte_try_get(). Maybe the func name is pte_try_map() recommended by
Jason, or keep the pte_offset_map() unchanged?

> 
> Then, have a patch that adds actual logic to the dummy primitives via a 
> config option.
> 
> 2. Minimize the API.
> 
> a) pte_alloc_get{,_map,_map_lock}() is really ugly. Maybe restrict it to 
> pte_alloc_get()
I also think pte_alloc_get{,_map,_map_lock}() is ugly, but I can't
figure out a more suitable name. Maybe we can keep the
pte_alloc{,_map,_map_lock}() without any modification? But I am
worried that the caller will forget to call the paired pte_put().

> 
> b) pmd_trans_unstable_or_pte_try_get() and friends are really ugly.
> 
> Handle it independently for now, even if it implies duplicate runtime 
> checks.
> 
> if (pmd_trans_unstable() || !pte_try_get()) ...
> 
> We can always optimize later, once we can come up with something cleaner.
> 
> 3. Merge #6, and #7, after factoring out all changes to other subsystems 
> to use the API
> 
> 4. Merge #8 into #6. There is a lot of unnecessary code churn back and 
> forth, and IMHO the whole approach might not make sense without RCU due 
> to the additional locking overhead.
> 
> Or at least, try to not modify the API you introduced in patch #6 or #7 
> in #8 again. Converting all call sites back and forth just makes review 
> quite hard.
> 
> 
> I am preparing some some cleanups that will make get_locked_pte() and 
> similar a little nicer to handle. I'll send them out this or next week.
> 
Thanks,
Qi
