Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73560C432BE
	for <linux-doc@archiver.kernel.org>; Thu,  2 Sep 2021 06:54:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FEFA60FC0
	for <linux-doc@archiver.kernel.org>; Thu,  2 Sep 2021 06:54:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237106AbhIBGzD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Sep 2021 02:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbhIBGzD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Sep 2021 02:55:03 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD06C061575
        for <linux-doc@vger.kernel.org>; Wed,  1 Sep 2021 23:54:05 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id u1so577805plq.5
        for <linux-doc@vger.kernel.org>; Wed, 01 Sep 2021 23:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Gjsbot1Ioib4U7AgvUadDJqCoxn0LGYzazPWjhiFe6A=;
        b=E3ouvM0ynVSTIUIqv7WlfcuLv7HFqUAlSQpDXOp9Hxbpq8gdlW9eTQw9XctxC0StvE
         kVzh3iVDyHB0lHCqASPPabxBWhTOXi7Dp7Qc2O/RHUfsetZzhMXdr1gedzUqbxfHwX6j
         LLgWQF90UCcPawQ115M+8DzGAotfDwmPuQXPrpqU330j1lOxHGXCWbSefY0zZgL8gLeA
         mf7kL7nm0rU4b6pfim3HmjCiZRWAISzh0KRyySgKjU2ySFlkBphYlPeCKDPp6v/xDtDV
         gPS/L48Qnr+bFH38DKNYPDBjl63nDmXBqkyeSqm0gESKa4YIZ8ggOiJbNLJC4REoEGET
         LT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=Gjsbot1Ioib4U7AgvUadDJqCoxn0LGYzazPWjhiFe6A=;
        b=BDIjD7AMGXLaqMojfje3lsonL0D3b7CDhbmPfYHiAD79VPeVJTa1MoSCyj1c/sU4hA
         67OKShjBKWHzphAmTOfDBzxhwOiaFIiqN5LhF4DZXFPH3e4ZsTvbOcMBIlHFwrh5XbUo
         LUElDpg0b63AD4AxHEqC2IB3XhniNiYJ3KV88EORI3fKkZExnxYH0hjuIhwweLXOd98V
         mz6ZAXuGt4FTEiZaF1Td35Fnx/ikE8fsA4H+GPIZ0zaB1AR4YebAyb86grkg3llIU7KV
         zOr0NWDXxwQNM202gVs3tY/tQt0SquF/+RGiMBTVCF7e1ihfJqUWzpCjscsOp6zI/Job
         y0bw==
X-Gm-Message-State: AOAM532l1KGHHXfnXUjZKaLY39nwXh3UPQSd+QNCdIvikAZQBDWpXzBX
        vI6VXml39oSgqwJ9Bxh7IR6Edw==
X-Google-Smtp-Source: ABdhPJw/aXZFpocogFeOr+q7ffvqB6cKQ+CRK4Ar6aPpZ/QDffD0XV0dhsYUFP+Ciy6Ir9IubMEEEw==
X-Received: by 2002:a17:90a:3f83:: with SMTP id m3mr2106262pjc.46.1630565644875;
        Wed, 01 Sep 2021 23:54:04 -0700 (PDT)
Received: from [10.254.207.253] ([139.177.225.243])
        by smtp.gmail.com with ESMTPSA id p34sm1354810pgb.14.2021.09.01.23.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 23:54:04 -0700 (PDT)
Subject: Re: [PATCH v2 6/9] mm: free user PTE page table pages
To:     Jason Gunthorpe <jgg@nvidia.com>,
        David Hildenbrand <david@redhat.com>
Cc:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
 <20210819031858.98043-7-zhengqi.arch@bytedance.com>
 <20210901135314.GA1859446@nvidia.com>
 <0c9766c9-6e8b-5445-83dc-9f2b71a76b4f@redhat.com>
 <20210901153247.GJ1721383@nvidia.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <47c7d6fd-056b-0e40-ae30-e2f099a97a95@bytedance.com>
Date:   Thu, 2 Sep 2021 14:53:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901153247.GJ1721383@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/9/1 PM11:32, Jason Gunthorpe wrote:
> 
>>> Also, I don't really understand how this scheme works with
>>> get_user_pages_fast.
>>
>> With the RCU change it in #8 it should work just fine, because RCU
>> synchronize has to wait either until all other CPUs have left the RCU read
>> section, or re-enabled interrupts.
> 
> So at this point in the series fast gup is broken, that does mean the
> series presentation really needs to be reworked. The better
> presentation is to add the API changes, with a
> no-functional-difference implementation, push the new API in well
> split patches to all the consumption sites, then change the API to
> have the new semantics.
> 
> RCU and refcount to free the page levels seems like a reasonable
> approach, but I have to say I haven't thought it through fully - are
> all the contexts that have the pte deref safe to do call_rcu?

See Documentation/RCU/rcubarrier.rst:

"Since call_rcu() never blocks, this code can safely be used from within
IRQ context."

So I think call_rcu() can be safely run in any context.

Thinks,
Qi

> 
> Jason
> 
> 
