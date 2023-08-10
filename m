Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF53C001DB
	for <linux-doc@archiver.kernel.org>; Thu, 10 Aug 2023 08:37:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjHJIhy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Aug 2023 04:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbjHJIhy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Aug 2023 04:37:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6840B2107
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 01:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691656629;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8wOvD7jYN9ChNQ8zLFm4c8kgaf8S6DImHpzgpTUCLH0=;
        b=bcSNo95hg1n35SDC/0yLlSLLMHbxRpdLqxTVZJMq3KmLJoGozRGR7L+fbwb8QkwXa0auCI
        zJ07mXpNxXK+NHeG+wZ3u0xHRq+WPkHJr3Eqf6MKyrY91V3L5sl7Nhea8lpR3U0vkbvy9t
        IRcW95zmRjQPrGIJwtpMmBtMsABvUME=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-QaF1d0OxO0a90bak9L5u7Q-1; Thu, 10 Aug 2023 04:37:07 -0400
X-MC-Unique: QaF1d0OxO0a90bak9L5u7Q-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fe13f529f5so4671835e9.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 01:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691656627; x=1692261427;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wOvD7jYN9ChNQ8zLFm4c8kgaf8S6DImHpzgpTUCLH0=;
        b=VsMvsmHCZ3Huny8LhbS34CG6u+/d2RWdNCvCzgPYLUfYgtYegp3u+LA5QC2Dd5i/L/
         KhfJWX2NncNEWVSm3yIvNawewyro74B9yEkzoVCNjO0L54eNbCle3nmA0xUk5rC8pavb
         jh/uJYF8QhVt/NaAECR8Sq8ymBZ1sfWMCYjNv/k5pRB1WjiRBZxGRmaJD+kAFgGsLH+R
         oHc+7kzHr+GOMnYN6/5b/c8M0mMD4jY2+AUzYuVUwyEySoFashQn+zBV83gYfJiNrp7i
         JNfuIThPhMuq08yX5rae5krqG/M0Wto0kxK29Cy9GAA77FaCNQlFcSA40RZEtfceAFw3
         2xig==
X-Gm-Message-State: AOJu0YyMmWmp5/2bbG20r0J2mpwU57FdmG2MxovLdxbHsahcvf8DMQeU
        EnEHnd3cllDmeVIYvY5koS7azlh7Tm9akOVq7UIdZZJ0s3JwOyYwcPfhAe5w1aCDB4uukxXUMT2
        tm/zXOSdzdb91lsbrLfcc
X-Received: by 2002:a05:600c:22c8:b0:3fb:a0fc:1ba1 with SMTP id 8-20020a05600c22c800b003fba0fc1ba1mr1391284wmg.35.1691656626683;
        Thu, 10 Aug 2023 01:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOirMlgSgvNCvjwAHcORn56HjxbIL6isaqI433RP3sVUOSu7WwdXepmvm07QTec9yD2UFMlg==
X-Received: by 2002:a05:600c:22c8:b0:3fb:a0fc:1ba1 with SMTP id 8-20020a05600c22c800b003fba0fc1ba1mr1391267wmg.35.1691656626296;
        Thu, 10 Aug 2023 01:37:06 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id b13-20020adfe30d000000b003113ed02080sm1367445wrj.95.2023.08.10.01.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 01:37:05 -0700 (PDT)
Message-ID: <7e31254d-8889-7e79-50e1-2630bd493d59@redhat.com>
Date:   Thu, 10 Aug 2023 10:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Hugh Dickins <hughd@google.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Yin Fengwei <fengwei.yin@intel.com>,
        Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>
References: <20230809083256.699513-1-david@redhat.com> <ZNQD4pxo8svpGmvX@x1n>
 <ZNRYx8GhYftE4Xeb@casper.infradead.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH mm-unstable v1] mm: add a total mapcount for large folios
In-Reply-To: <ZNRYx8GhYftE4Xeb@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10.08.23 05:25, Matthew Wilcox wrote:
> On Wed, Aug 09, 2023 at 05:23:46PM -0400, Peter Xu wrote:
>> Hi, David,
>>
>> Some pure questions below..
>>
>> On Wed, Aug 09, 2023 at 10:32:56AM +0200, David Hildenbrand wrote:
>>> Let's track the total mapcount for all large folios in the first subpage.
>>>
>>> The total mapcount is what we actually want to know in folio_mapcount()
>>> and it is also sufficient for implementing folio_mapped(). This also
>>> gets rid of any "raceiness" concerns as expressed in
>>> folio_total_mapcount().
>>
>> Any more information for that "raciness" described here?
> 
> UTSL.
> 
>          /*
>           * Add all the PTE mappings of those pages mapped by PTE.
>           * Limit the loop to folio_nr_pages_mapped()?
>           * Perhaps: given all the raciness, that may be a good or a bad idea.
>           */
> 

Yes, that comment from Hugh primarily discusses how we could possibly 
optimize the loop, and if relying on folio_nr_pages_mapped() to reduce 
the iterations would be racy. As far as I can see, there are cases where 
"it would be certainly a bad idea" :)


In the other comment in that function, it's also made clear what the 
traditional behavior with PMD-mappable THP was "In the common case, 
avoid the loop when no pages mapped by PTE", which will no longer hold 
with sub-PMD THP.

-- 
Cheers,

David / dhildenb

