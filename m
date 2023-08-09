Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D959C0015E
	for <linux-doc@archiver.kernel.org>; Wed,  9 Aug 2023 19:27:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbjHIT1m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Aug 2023 15:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233658AbjHIT1f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Aug 2023 15:27:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7390E2705
        for <linux-doc@vger.kernel.org>; Wed,  9 Aug 2023 12:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691609175;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k6xf89mSS43Mh9qXicJVyXd+LHrtdJLi91ztEImliwY=;
        b=LTbHLjltYnGm25OKkgk7EjCmRKmiSDCDqkIZB/hlRxNUsDFTG90ZQ56vgzKQTAAcPzBPFF
        H8myRhbJVrgOwbD7lHAJ7iklQoli2EdPXm3bc8PEPFXN0RahQTSmlDR9z2Wiy+aY52o+Oe
        hl0TT4mPIDysCP5uKfzQbuqwWpqBhZ4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-1-ppNS8NNwOzWExQkw1yNA-1; Wed, 09 Aug 2023 15:26:13 -0400
X-MC-Unique: 1-ppNS8NNwOzWExQkw1yNA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3178ddc3d94so134108f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Aug 2023 12:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691609172; x=1692213972;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6xf89mSS43Mh9qXicJVyXd+LHrtdJLi91ztEImliwY=;
        b=BnxsbU+DaxxNRvPJbXvPv+N3eiVSVmwsCKHyd6YDSY8liOFQs+R5J8fbVRAH2E+Z01
         9gFW+RzmEY+JTHiyWHtQkjBuPv1HrFs4hcQ5q99hZZF/O08EB7klLuhh7+qcSoEINzTj
         RG07nYfm+aECX6imBWUhjYt6wf2ZxguH9pgTm6oLn/5Gq6vlx1PDaUXTQdwRACt5rVr+
         pr7Y/xycgYmq2JpHLiwEw9WMcEg5m1NLEOrD+u/z3l/KGaBac0VnQwpFiu2k2hYLboQT
         wDwbVr+YdBa1XNtjhOoYFznEe6g/EnCZsvBz9n5ZCgtnTHKyTAYSovAK89ujdBb9QhVh
         ikcg==
X-Gm-Message-State: AOJu0YyslU9mgyrWMg+dlu5hf1NsC1ZOS7QlLJDRYc2mBBdp06S26hTD
        vWOjIX87bzHPtEt3J+Jl4SKSnBx1pRCSnorNDmUwcMSfgzeaB4HJxnHI62vyZZDiUTHNXNRELfT
        3YIwdeQLFEFSqVCZaWCvQ
X-Received: by 2002:a5d:6a4f:0:b0:314:3a3d:5d1f with SMTP id t15-20020a5d6a4f000000b003143a3d5d1fmr255546wrw.19.1691609172341;
        Wed, 09 Aug 2023 12:26:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLr5aiR3cnajcrFVMZx6P2KRMnVfsFfQxdftvyDgCbC8w/PiBJh4hK24vB5ITRl/jtTOUovA==
X-Received: by 2002:a5d:6a4f:0:b0:314:3a3d:5d1f with SMTP id t15-20020a5d6a4f000000b003143a3d5d1fmr255527wrw.19.1691609171991;
        Wed, 09 Aug 2023 12:26:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70e:6800:9933:28db:f83a:ef5? (p200300cbc70e6800993328dbf83a0ef5.dip0.t-ipconnect.de. [2003:cb:c70e:6800:9933:28db:f83a:ef5])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600004c500b003143aa0ca8asm17747899wri.13.2023.08.09.12.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 12:26:11 -0700 (PDT)
Message-ID: <703bb7de-aba7-ee4b-c2fb-3562318072a5@redhat.com>
Date:   Wed, 9 Aug 2023 21:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH mm-unstable v1] mm: add a total mapcount for large folios
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Hugh Dickins <hughd@google.com>,
        Yin Fengwei <fengwei.yin@intel.com>,
        Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>
References: <20230809083256.699513-1-david@redhat.com>
 <181fcc79-b1c6-412f-9ca1-d1f21ef33e32@arm.com>
 <ZNPnLGNCnt5lfdy8@casper.infradead.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZNPnLGNCnt5lfdy8@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09.08.23 21:21, Matthew Wilcox wrote:
> On Wed, Aug 09, 2023 at 08:07:43PM +0100, Ryan Roberts wrote:
>>> +++ b/mm/hugetlb.c
>>> @@ -1479,7 +1479,7 @@ static void __destroy_compound_gigantic_folio(struct folio *folio,
>>>   	struct page *p;
>>>   
>>>   	atomic_set(&folio->_entire_mapcount, 0);
>>> -	atomic_set(&folio->_nr_pages_mapped, 0);
>>> +	atomic_set(&folio->_total_mapcount, 0);
>>
>> Just checking this is definitely what you intended? _total_mapcount is -1 when
>> it means "no pages mapped", so 0 means 1 page mapped?
> 
> We're destroying the page here, so rather than setting the meaning of
> this, we're setting the contents of this memory to 0.
> 
> 
> Other thoughts that ran through my mind ... can we wrap?  I don't think
> we can; we always increment total_mapcount by 1, no matter whether we're
> incrementing entire_mapcount or an individual page's mapcount, and we
> always call folio_get() first, so we can't increment total_mapcount
> past 2^32 because folio_get() will die first.  We might be able to
> wrap past 2^31, but I don't think so.

 From my understanding, if we wrap the total mapcount, we already 
wrapped the refcount -- as you say, grabbing a reference ahead of time 
for each mapping is mandatory. Both are 31bit values. We could treat the 
total mapcount as an unsigned int, but that's rather future work.

Also, even folio_mapcount() and total_mapcount() return an "int" as of now.

But yes, I also thought about that. In the future we might want (at 
least) for bigger folios refcount+total_mapcount to be 64bit. Or we 
manage to decouple both and only have the total_mapcount be 64bit only.

-- 
Cheers,

David / dhildenb

