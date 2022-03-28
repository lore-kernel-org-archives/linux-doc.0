Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35E5C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 12:29:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242478AbiC1MbI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 08:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236056AbiC1MbH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 08:31:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 00FF846171
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 05:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648470566;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uDJW+VRZ0lkB4aVLbXWKZbUhXcFP4EfwK6n4Uy4lwg0=;
        b=g99VIiqZ3f97S88+sXzv2ZvWfpmG/DPGMn8B2x/OmY/ThMH639FKs2b6orTkI21rXl5nMm
        NN0GdndNA+phntUE5aT8JETOzzSLNo9bLE8oRUKGJ+wT2fcwnYV0eyBD30WMUilH9yfmaA
        /n3y3N71mFZzg5y2TO0LaqBDodVfFfs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-ZD7xI1fyPwG41F9gYHhvIQ-1; Mon, 28 Mar 2022 08:29:23 -0400
X-MC-Unique: ZD7xI1fyPwG41F9gYHhvIQ-1
Received: by mail-wr1-f71.google.com with SMTP id t15-20020adfdc0f000000b001ef93643476so4249719wri.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 05:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=uDJW+VRZ0lkB4aVLbXWKZbUhXcFP4EfwK6n4Uy4lwg0=;
        b=PFWDJ82O1l59yTy6vS0RYctnNMDp2v4Zp8e0R9L8tjTuwiqkdebtTLkJ/GyXybHtrQ
         j9a8nL9jxl5MHfqeO5uRZVZcUKha0vkYLkzqo9Wr6f8+zbU1S2FmUKy1PKq/m6XfcZZC
         DtTauIGTkhjtjYyvys9nYeZKY05mW9/za/6pboFdBkIkH8lgA0tgvygyC/Cd3wd0Rzim
         yh1+TujPnJi2lkhZl69D15EU+v4h13lkPZYxjlqLSsGtNUv7O6mbkMDe9Ot7cCRYZqFX
         EeHqIC8Wu21ntKgwOSBZJSi4fp0bFHahZWePFEwb6GiEI6jPldbdZL7lW0EUqx6dDGq8
         w9Vg==
X-Gm-Message-State: AOAM533znOVf+a2tA1xZH0e0mInqGka7JEsDXHFuFOcBL352CLqSsUmK
        wNO8iA3HZJep5C/j+gWuCqQR6fookhR/jibsGf0wtt66ChuseDtdE+TcwKsUCECGhJqfE/iISmf
        jQ3zhH/LEUSByYQvhSDr5
X-Received: by 2002:a05:600c:2188:b0:38c:9a21:9c95 with SMTP id e8-20020a05600c218800b0038c9a219c95mr34197763wme.87.1648470562763;
        Mon, 28 Mar 2022 05:29:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx65TgCLAVpVyrjQljIsWyIGLMML5hh19qQWup4wGr237NPXo64tTFUf24HO1O4bjAyZGY+iA==
X-Received: by 2002:a05:600c:2188:b0:38c:9a21:9c95 with SMTP id e8-20020a05600c218800b0038c9a219c95mr34197726wme.87.1648470562499;
        Mon, 28 Mar 2022 05:29:22 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:2200:50d1:ff5c:5927:203a? (p200300cbc704220050d1ff5c5927203a.dip0.t-ipconnect.de. [2003:cb:c704:2200:50d1:ff5c:5927:203a])
        by smtp.gmail.com with ESMTPSA id k23-20020a7bc417000000b0038ccada7566sm11524959wmi.11.2022.03.28.05.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 05:29:21 -0700 (PDT)
Message-ID: <400edaab-7c6c-f4d1-9a94-e8d0803857fa@redhat.com>
Date:   Mon, 28 Mar 2022 14:29:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [page-reclaim] Re: [GIT PULL] Multi-gen LRU for 5.18-rc1
Content-Language: en-US
To:     Andrew Morton <akpm@linux-foundation.org>,
        Yu Zhao <yuzhao@google.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <baohua@kernel.org>,
        Brian Geffon <bgeffon@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Donald Carr <d@chaos-reins.com>,
        Hillf Danton <hdanton@sina.com>,
        =?UTF-8?Q?Holger_Hoffst=c3=a4tte?= <holger@applied-asynchrony.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Rik van Riel <riel@surriel.com>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        the arch/x86 maintainers <x86@kernel.org>
References: <20220326010003.3155137-1-yuzhao@google.com>
 <CAHk-=wjp=jEhjvD9GPnHfuV5Kc1=rUnf84b_qscLJ8fkY74u3Q@mail.gmail.com>
 <CAOUHufbqum18T4kZ=d_hMehz=N=3iSuNfGrLof5tB8kjGkk8yw@mail.gmail.com>
 <20220326134928.ad739eeecd5d0855dbdc6257@linux-foundation.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220326134928.ad739eeecd5d0855dbdc6257@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 26.03.22 21:49, Andrew Morton wrote:
> On Fri, 25 Mar 2022 19:16:15 -0600 Yu Zhao <yuzhao@google.com> wrote:
> 
>> On Fri, Mar 25, 2022 at 7:07 PM Linus Torvalds
>> <torvalds@linux-foundation.org> wrote:
>>>
>>> On Fri, Mar 25, 2022 at 6:00 PM Yu Zhao <yuzhao@google.com> wrote:
>>>>
>>>> This is more of an option than a request for 5.18. I'm sending it to
>>>> you directly because, in my judgement, it's now as ready as it'll ever
>>>> be.
>>>
>>> So I do expect to merge this, but I don't think it has been in
>>> linux-next, has it?
>>
>> No. I could ask Stephen to see if he is willing to take this series. I
>> was hoping to go through Andrew since his tree is what most MM
>> developers test. I haven't heard from Andrew, so I assume he has no
>> strong opinion and I don't want to put him in a different position.
> 
> hm, sorry, something in the headers here fooled my (elaborate) procmail
> rules :(
> 
> Please yes, let's have a cycle in -next.  I thought we decided to do
> that in discussion with Matthew Wilcox?
> 

I'd appreciate if we could merge most MM-related stuff through the -MM
tree; it exists for a reason IMHO. Andrew, you usually have a very good
feeling when something's ready to be merged upstream (sufficient review
from relevant folks, sufficient exposure via -mm and -next, ...).

-- 
Thanks,

David / dhildenb

