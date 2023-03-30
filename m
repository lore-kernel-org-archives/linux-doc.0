Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF756C761A6
	for <linux-doc@archiver.kernel.org>; Thu, 30 Mar 2023 14:41:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbjC3Ols (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Mar 2023 10:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbjC3Olr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Mar 2023 10:41:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D81A246
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680187252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EBPUuk2JCRV9N/XVlREPZ4qIQldNVbbnB+3Y+KyNIMg=;
        b=I6NQAe7Y1DDcH5JyJZYQdDpkHvs4on0pjESlrqbj5OL2WFGM+ZMr/I7xyciaj2kdZJYguQ
        SJbgGuHUq2bqNVvij36/fMaMvuFaEquLjYnlR3Ac6JJto5kAZ0SzttAGJr8m1r3ZQPsPgs
        unnwqOPOXnFQ4dAgI2MOdt2K1EATH2Y=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-DA5RHRVrMN-OSvYbEGWDjQ-1; Thu, 30 Mar 2023 10:40:51 -0400
X-MC-Unique: DA5RHRVrMN-OSvYbEGWDjQ-1
Received: by mail-pg1-f200.google.com with SMTP id d34-20020a630e22000000b005039e28b68cso5518888pgl.13
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 07:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680187250;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBPUuk2JCRV9N/XVlREPZ4qIQldNVbbnB+3Y+KyNIMg=;
        b=z2AEsZsyyCAqcvHiduWmKoCMbWEQ15RzIj0VkXnrTJm7Q6lpN72d10rdHqFHQSlA8q
         Jx6dth1fYaBrgd3RWWwfLMDo5xue4hAu0yFn2NdKqaCCEHI40uVwcOnXPzXxePtDF4iF
         Pm9PXIY6y+GblpYvThua0vT5t8Ycm9D/JYYFqlhaUd6onC3tpG7SOrfZwrnp2k1t6VQB
         2g6p331D1NUw8yqX8hWHbbDzgcRSt3DOMV+MRAwYqNEBgIcXd5Vm4IOFoQs0ym3wilkR
         DKE2naEyn+1ig2dXxluwSRHig7oSkvkWQE1Ycw8n0i9ZKAX1N0bT7rONin5drsutlrhy
         yoQA==
X-Gm-Message-State: AAQBX9fbhzwv+YwaYozuUHbVYAoQzHeIl5g51im/WVsoiaK4BctxiWcU
        Xcl2o62m37sAd3O83f8fy1lREul5v8joPA1sj/OMjl+WsSyfjNAqKemtNDW5JE9u7FXSo2scCWz
        JY/0t0ntURc3M6ihofIFD
X-Received: by 2002:a17:90a:86c3:b0:231:248c:6ac4 with SMTP id y3-20020a17090a86c300b00231248c6ac4mr25890645pjv.7.1680187249918;
        Thu, 30 Mar 2023 07:40:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350YRnh6kqb08u4czJc76hdyMex7f7wBhD8J6ELIXqGjTnfL30swP4TDll3Hnd/sy8n5Lpfm+kg==
X-Received: by 2002:a17:90a:86c3:b0:231:248c:6ac4 with SMTP id y3-20020a17090a86c300b00231248c6ac4mr25890606pjv.7.1680187249419;
        Thu, 30 Mar 2023 07:40:49 -0700 (PDT)
Received: from [192.168.35.160] ([64.114.255.114])
        by smtp.gmail.com with ESMTPSA id mh11-20020a17090b4acb00b0023cfbe7d62esm8363577pjb.1.2023.03.30.07.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 07:40:48 -0700 (PDT)
Message-ID: <ff599dc1-729d-52dc-d605-8a8ac890ad15@redhat.com>
Date:   Thu, 30 Mar 2023 16:40:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com,
        linux-mm@kvack.org, riel@surriel.com, mhocko@suse.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        Hugh Dickins <hughd@google.com>
References: <20230310182851.2579138-1-shr@devkernel.io>
 <20230328160914.5b6b66e4a5ad39e41fd63710@linux-foundation.org>
 <37dcd52a-2e32-c01d-b805-45d862721fbc@redhat.com>
 <ZCWcJelF5bEdF4N3@cmpxchg.org>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 0/3] mm: process/cgroup ksm support
In-Reply-To: <ZCWcJelF5bEdF4N3@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30.03.23 16:26, Johannes Weiner wrote:
> On Thu, Mar 30, 2023 at 06:55:31AM +0200, David Hildenbrand wrote:
>> On 29.03.23 01:09, Andrew Morton wrote:
>>> On Fri, 10 Mar 2023 10:28:48 -0800 Stefan Roesch <shr@devkernel.io> wrote:
>>>
>>>> So far KSM can only be enabled by calling madvise for memory regions. To
>>>> be able to use KSM for more workloads, KSM needs to have the ability to be
>>>> enabled / disabled at the process / cgroup level.
>>>
>>> Review on this series has been a bit thin.  Are we OK with moving this
>>> into mm-stable for the next merge window?
>>
>> I still want to review (traveling this week), but I also don't want to block
>> this forever.
>>
>> I think I didn't get a reply from Stefan to my question [1] yet (only some
>> comments from Johannes). I would still be interested in the variance of
>> pages we end up de-duplicating for processes.
>>
>> The 20% statement in the cover letter is rather useless and possibly
>> misleading if no details about the actual workload are shared.
> 
> The workload is instagram. It forks off Django runtimes on-demand
> until it saturates whatever hardware it's running on. This benefits
> from merging common heap/stack state between instances. Since that
> runtime is quite large, the 20% number is not surprising, and matches
> our expectations of duplicative memory between instances.

Thanks for this explanation. It's valuable to get at least a feeling for 
the workload because it doesn't seem to apply to other workloads at all.

> 
> Obviously we could spend months analysing which exact allocations are
> identical, and then more months or years reworking the architecture to
> deduplicate them by hand and in userspace. But this isn't practical,
> and KSM is specifically for cases where this isn't practical.
> 
> Based on your request in the previous thread, we investigated whether
> the boost was coming from the unintended side effects of KSM splitting
> THPs. This wasn't the case.
> 
> If you have other theories on how the results could be bogus, we'd be
> happy to investigate those as well. But you have to let us know what
> you're looking for.
> 

Maybe I'm bad at making such requests but

"Stefan, can you do me a favor and investigate which pages we end up
deduplicating -- especially if it's mostly only the zeropage and if it's
still that significant when disabling THP?"

"In any case, it would be nice to get a feeling for how much variety in
these 20% of deduplicated pages are. "

is pretty clear to me. And shouldn't take months.

> Beyond that, I don't think we need to prove from scratch that KSM can

I never expected a proof. I was merely trying to understand if it's 
really KSM that helps here. Also with the intention to figure out if KSM 
is really the right tool to use here or if it simply "helps by luck" as 
with the shared zeropage. That end result could have been valuable to 
your use case as well, because KSM overhead is real.

> be a worthwhile optimization. It's been established that it can
> be. This series is about enabling it in scenarios where madvise()
> isn't practical, that's it, and it's yielding the expected results.

I'm sorry to say, but you sound a bit aggressive and annoyed. I also 
have no idea why Stefan isn't replying to me but always you.

Am I asking the wrong questions? Do you want me to stop looking at KSM code?

-- 
Thanks,

David / dhildenb

