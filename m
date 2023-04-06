Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB167C7618D
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 14:42:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239233AbjDFOmA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 10:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239081AbjDFOlr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 10:41:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E646CCA07
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 07:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680791940;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j895ymwzo5cFUK4EnI2MaN8LhhF7WBFR4yyDeDEaR/E=;
        b=WUY0OWrAQpngkqCKEL6vymLQmsWR9dRK8GCrBFyLPgrzcZ8yHosQz1D58ce/LjZrbezkQ/
        +iIgWe1ZbR29526lqP76FWNIkVN6Yf3jvaeUuT3vgwCUEgB5NeRx9P6Wq2BLyKmUozRXwc
        74j5YvISvi2NIIKB8KQhVroHSfoRtS4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-p9dv_WtYPFGIRcb0vVvu2A-1; Thu, 06 Apr 2023 10:32:41 -0400
X-MC-Unique: p9dv_WtYPFGIRcb0vVvu2A-1
Received: by mail-wr1-f72.google.com with SMTP id h18-20020adfa4d2000000b002cea098a651so4959209wrb.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 07:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680791560; x=1683383560;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j895ymwzo5cFUK4EnI2MaN8LhhF7WBFR4yyDeDEaR/E=;
        b=6zt83VugKm9KaDD0ytQasoZdOB16NP1oFpFVDP3hklo/7ubTEIWsgRtWuE7pWDMHr6
         Hyr4DWvFG5+RYF3OlAjGb4dhU30P7Hlt+zgieQz/vSErIz3xajlxM0f4J35T1Cf2PIHw
         qWLn18PY62Be1dO+e7NNs9t0nq5WHHsDROOvl9qPrfaH27yOigsvSvKhv2Xl88X/t+rv
         co97Xt04/Q6PTvMc4z8CNAZgm46yFGenVGknS4Vmx/yxSn+X2uY49cGE2xcSsNJ+QubM
         5R38YtkIo4cCVM6p91AQ/PttDskxHrM6twLKN2acCopYnfxyps7e8/bMNqjw0CkBgb5d
         YsRw==
X-Gm-Message-State: AAQBX9cFQu8KF0GdzrXBZgNQtlm586c4qBZBSlhjY3wl3oWE4N4DWsiu
        uSQA6TEL+u4mrLH6p9KATxBOrvG4e9tIPtXVZ+fKWMoJS4xqARAFn4ZoguFsW66yIyUe8HvzReW
        uee3CGnGjTX6tofm+eP/e
X-Received: by 2002:adf:e807:0:b0:2db:9ccf:f9f5 with SMTP id o7-20020adfe807000000b002db9ccff9f5mr7281887wrm.0.1680791560105;
        Thu, 06 Apr 2023 07:32:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZQFqd68J323693RzSjFbAIGhMIx+Sk7+HCdTARcTO1jXA82EQy191Q5dTyk14QuMR9BHz7KQ==
X-Received: by 2002:adf:e807:0:b0:2db:9ccf:f9f5 with SMTP id o7-20020adfe807000000b002db9ccff9f5mr7281865wrm.0.1680791559754;
        Thu, 06 Apr 2023 07:32:39 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id a15-20020a5d4d4f000000b002cfe685bfd6sm1881580wru.108.2023.04.06.07.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 07:32:38 -0700 (PDT)
Message-ID: <a4994de5-973e-8df9-bb23-d74659641070@redhat.com>
Date:   Thu, 6 Apr 2023 16:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com,
        linux-mm@kvack.org, riel@surriel.com, mhocko@suse.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, Bagas Sanjaya <bagasdotme@gmail.com>
References: <20230310182851.2579138-1-shr@devkernel.io>
 <20230310182851.2579138-3-shr@devkernel.io>
 <ce494e5a-3540-d6ad-4e9c-0bb49c7e1e1b@redhat.com>
 <qvqw8rf6uicf.fsf@dev0134.prn3.facebook.com>
 <e7a930f6-feba-29a4-7c48-ae7d8108c7dc@redhat.com>
 <20230406141619.GB35884@cmpxchg.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 2/3] mm: add new KSM process and sysfs knobs
In-Reply-To: <20230406141619.GB35884@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06.04.23 16:16, Johannes Weiner wrote:
> On Thu, Apr 06, 2023 at 03:23:11PM +0200, David Hildenbrand wrote:
>>>>
>>>> Often, when you have to start making a list of things that a patch does, it
>>>> might make sense to split some of the items into separate patches such that you
>>>> can avoid lists and just explain in list-free text how the pieces in the patch
>>>> fit together.
>>>>
>>>> I'd suggest splitting this patch into logical pieces. For example, separating
>>>> the general profit calculation/exposure from the per-mm profit and the per-mm
>>>> ksm type indication.
>>>>
>>>
>>> Originally these were individual patches. If I recall correctly Johannes
>>> Weiner wanted them as one patch. I can certainly split them again.
>>
>> That's why I remember that v1 contained more patches :)
>>
>> Again, just my opinion on patches that require a description in form of a
>> list ...
> 
> My concern was the initial splitting of patch 1. I found it easier to
> review with the new prctl() being one logical change, and fully
> implemented in one go. The changelog is still in the form of a list,
> but it essentially enumerates diff hunks that make up the interface.
> 
> No objection to splitting out the multiple sysfs knobs, though!
> 
> The strategy I usually follow is this:
> 
> 1. Split out changes based on user-visible behavior (new prctl(), new
>     sysfs knob)
> 
> 2. Extract changes made along the way that have stand-alone value in
>     existing code (bug fixes, simplifying/documenting tricky sections,
>     cleanups).
> 
> 3. Split out noisy prep work such as renames and refactors that make
>     the user-visible functional changes more difficult to understand.
> 
> and then order the series into sections 2, 3, and 1.
> 

I agree. The most important part is the "logical change" part. Once it's 
down to a list of 3 items or so for a single commit we can usually 
express it like (just an example that does no longer apply due to 
pages_volatile() not being required) the following when combining items 
1+2+3 from the list:

"
Let's expose the general KSM profit via sysfs and document that new 
toggle. [add details about that and especially why we are doing that]

As we need the number of volatile pages to calculate the general KSM 
profit, factor out existing functionality into a helper.
"

Much easier to read.

-- 
Thanks,

David / dhildenb

