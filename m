Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8526CC4320E
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 18:10:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BA9B6109E
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 18:10:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344554AbhIASLH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Sep 2021 14:11:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39635 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236874AbhIASLH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Sep 2021 14:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630519809;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9NKf3uO34AvCSRdJEV//9X5/WuVnzohW4EzO2VLlwhk=;
        b=FKh9pXjyrA5VUcTjVMLEwJV8w4aGM34Y5zt9AJLrLHzAnZOeV0gXU374Uc30UofLDsnfBJ
        LuGBLM5qv5cldwkKCuu/D3xLMvG9P5xpg+mKNcHNHQeevTv1EuQ5NNe84ViGUmocM4oCma
        zXVvM/0SRtqLDXbBDGC9fi+tyZZhxz8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-NW-wB2jpMqmmd1Bnb8oTeQ-1; Wed, 01 Sep 2021 14:10:08 -0400
X-MC-Unique: NW-wB2jpMqmmd1Bnb8oTeQ-1
Received: by mail-wm1-f71.google.com with SMTP id a201-20020a1c7fd2000000b002e748bf0544so167553wmd.2
        for <linux-doc@vger.kernel.org>; Wed, 01 Sep 2021 11:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9NKf3uO34AvCSRdJEV//9X5/WuVnzohW4EzO2VLlwhk=;
        b=jApCMh5tuR3McKyjtXViHlqPTTZHpjza793cRVLdl2N/iEV0hbU9oVtXQllH2HOgMb
         doGbR4bNSVzYqvr6KryDa4PRU7PbtIDNMI1/56yzEecIgQD1UtcsqWpjZnW+lJlD/0Ef
         PP0jSuD358EpU5tNnaNLQG2+YQn2DC5s4vMtRJrUxEErElZ09/6BPeQGrQm1ybWJYXKr
         B8FQxD3E2rZ5L7+C5Dwk8sACkPuTykmZeAuhKLuR9M8lPSQTgBK3TW0Vph7+HMXZos1H
         boC8PFj/QVeNADZpQDNbGS/E3k8CUD+G7UrlQbTFgHj09Zl5yNJaI6tQejQNX9MZLYdD
         TsRA==
X-Gm-Message-State: AOAM5332KHKZNzvZYuIW/GmWyp+EleA6ODehnKmzcrcXHSZgrbKZv6eQ
        R3zCqQuaq5r+CUAxOVga5UNC66IDfOmhK7FQVowuYqlJ9dTndW/vuoQRn4Q/5fMjUqtYS8P2a3J
        IRC2PWrDqkl83rF3fWvGJ
X-Received: by 2002:adf:c3c3:: with SMTP id d3mr762064wrg.373.1630519807442;
        Wed, 01 Sep 2021 11:10:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+M43pfhuaLKye8YBTMT45+0fbZOP2iZhzz9o/djvCwsKzzBpvEOE73hmUgETCVRm8npRcXg==
X-Received: by 2002:adf:c3c3:: with SMTP id d3mr762051wrg.373.1630519807306;
        Wed, 01 Sep 2021 11:10:07 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23f71.dip0.t-ipconnect.de. [79.242.63.113])
        by smtp.gmail.com with ESMTPSA id c13sm165598wru.73.2021.09.01.11.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 11:10:06 -0700 (PDT)
Subject: Re: [PATCH v2 6/9] mm: free user PTE page table pages
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com, kirill.shutemov@linux.intel.com,
        mika.penttila@nextfour.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        songmuchun@bytedance.com
References: <20210901135314.GA1859446@nvidia.com>
 <0c9766c9-6e8b-5445-83dc-9f2b71a76b4f@redhat.com>
 <20210901153247.GJ1721383@nvidia.com>
 <7789261d-6a64-c47b-be6c-c9be680e5d33@redhat.com>
 <20210901161613.GN1721383@nvidia.com>
 <e8ebb0bb-b268-c43b-6fc1-e5240dc085c9@redhat.com>
 <20210901171039.GO1721383@nvidia.com>
 <ef7a722d-0bc0-1c68-b11b-9ede073516e0@redhat.com>
 <20210901175547.GP1721383@nvidia.com>
 <52ba8125-0382-3270-a958-ed113ae1db2a@redhat.com>
 <20210901180914.GS1200268@ziepe.ca>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <01754b36-12c6-48dc-4f84-c289b7aa47ec@redhat.com>
Date:   Wed, 1 Sep 2021 20:10:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901180914.GS1200268@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01.09.21 20:09, Jason Gunthorpe wrote:
> On Wed, Sep 01, 2021 at 07:58:47PM +0200, David Hildenbrand wrote:
>> You'll most likely have to touch each and every place either way, for
>> example when suddenly returning "null" instead of a pte. It's just a matter
>> of making this easier to review and the changes as minimal and as clear as
>> possible.
> 
> I imagine the leading series to add the simplified API would include
> the null return already - the THP race avoidance requires it anyhow.
> 

Okay, so we're on the same page.

> So you end up with a simpler self contained series that is a stand
> alone improvement followed by a much smaller series here that doesn't
> got back and re-touch the first series's changes.

Exactly.


-- 
Thanks,

David / dhildenb

