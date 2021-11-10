Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C618EC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 16:54:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A470261168
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 16:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhKJQ4u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Nov 2021 11:56:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41227 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229995AbhKJQ4u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Nov 2021 11:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636563242;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3skehNDJHqZFHvrdLObhkU+zt+1yZ5NMVqO6+J/UxgE=;
        b=VFysK3QZkH6akCS3dHWqikmt7eyQFjBFri+j3zTPbY1ea4qw22Ft7YM0HaeCmx4jSEKQMH
        rM/jqZyknzuMWaPiD6NGHe1PMXKPAU0g/5vGjSCKah6hiCjsFVM9Scx1VUqhbuulGo6Wi/
        asqzaVGB2NB9vswvnPlrJ069BHiEd2c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582--l-gV6xiNy27W9z6meyN8A-1; Wed, 10 Nov 2021 11:54:00 -0500
X-MC-Unique: -l-gV6xiNy27W9z6meyN8A-1
Received: by mail-wm1-f69.google.com with SMTP id l6-20020a05600c4f0600b0033321934a39so1418778wmq.9
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 08:54:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=3skehNDJHqZFHvrdLObhkU+zt+1yZ5NMVqO6+J/UxgE=;
        b=h0PIE5fM1Nrufgiomo150lmCEJizK0B9SCrnZskMuGsFGen05WmAYvwCd153d8U3QQ
         nDQ+FYfdRVCNHbCCg2hzbIGufVAfhWjNk11Usdr30SnYj0ngkaOpn+3jYJs87sk162br
         BLOA3ii5fgUjNYJZ+echZkAPpt0j8ix0n6Y39YYuUSd/E/1+Kt9tm+wnCX8nV25HbqCB
         +N9oq10QvTEwbScHP2w67n9v04LT/2HkZfyFeIDS6m5emf88jssla9wZXz6r403L1tE7
         NB5ITnShDE2JfKrmZbdSodKK8xqrXgJEIcLLsHtE+pZGxptiFR4mGWUJZcjkG8yYtfw4
         OZgw==
X-Gm-Message-State: AOAM531W2wPC+cvZwWq3OCbNWDZOTcK6Qdji9YgrdI+Dwxy8Opvj0gS8
        gdeaWsnojl3dLdDgc2Luc/NxI074dKOokZdTMHtQBvjXQGjJJBzvGgmDSrFIG2OShD9fKitQNb3
        nxuvGTCNaCSmvmHyR1hRb
X-Received: by 2002:a5d:59ab:: with SMTP id p11mr541377wrr.340.1636563239610;
        Wed, 10 Nov 2021 08:53:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmw7VPt89V/wQDpl+r2pm834mtB3sAdR7mcz3Tn1FXjAMGhv2J/CUV7Ygff/myU9JVf71JCw==
X-Received: by 2002:a5d:59ab:: with SMTP id p11mr541350wrr.340.1636563239362;
        Wed, 10 Nov 2021 08:53:59 -0800 (PST)
Received: from [192.168.3.132] (p5b0c604f.dip0.t-ipconnect.de. [91.12.96.79])
        by smtp.gmail.com with ESMTPSA id n8sm363484wrp.95.2021.11.10.08.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 08:53:58 -0800 (PST)
Message-ID: <b9ea9c5b-2b7e-a6a9-f1b3-241c0882197c@redhat.com>
Date:   Wed, 10 Nov 2021 17:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 00/15] Free user PTE page table pages
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jason Gunthorpe <jgg@nvidia.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com
References: <20211110105428.32458-1-zhengqi.arch@bytedance.com>
 <20211110125601.GQ1740502@nvidia.com>
 <8d0bc258-58ba-52c5-2e0d-a588489f2572@redhat.com>
 <20211110143859.GS1740502@nvidia.com>
 <6ac9cc0d-7dea-0e19-51b3-625ec6561ac7@redhat.com>
 <YYv4Msg7zVLS3KE/@casper.infradead.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YYv4Msg7zVLS3KE/@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10.11.21 17:49, Matthew Wilcox wrote:
> On Wed, Nov 10, 2021 at 04:37:14PM +0100, David Hildenbrand wrote:
>>> I'd suggest to make this new lock a special rwsem which allows either
>>> concurrent read access OR concurrent PTL access, but not both. This
>>
>> I looked into such a lock recently in similar context and something like
>> that does not exist yet (and fairness will be challenging). You either
>> have a single reader or multiple writer. I'd be interested if someone
>> knows of something like that.
> 
> We've talked about having such a lock before for filesystems which want
> to permit either many direct-IO accesses or many buffered-IO accesses, but
> want to exclude a mixture of direct-IO and buffered-IO.  The name we came
> up with for such a lock was the red-blue lock.  Either Team Red has the
> lock, or Team Blue has the lock (or it's free).  Indicate free with velue
> zero, Team Red with positive numbers and Team Blue with negative numbers.
> If we need to indicate an opposing team is waiting for the semaphore,
> we can use a high bit (1 << 30) to indicate no new team members can
> acquire the lock.  Not sure whether anybody ever coded it up.

Interesting, thanks for sharing!

My excessive google search didn't reveal anything back then (~3 months
ago) -- only questions on popular coding websites asking essentially for
the same thing without any helpful replies. But maybe I used the wrong
keywords (e.g., "multiple reader, multiple writer", I certainly didn't
search for "red-blue lock", but I do like the name :) ).

Fairness might still be the biggest issue, but I am certainly no locking
expert.

-- 
Thanks,

David / dhildenb

