Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1342BC001DE
	for <linux-doc@archiver.kernel.org>; Thu, 10 Aug 2023 22:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjHJW2E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Aug 2023 18:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjHJW2D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Aug 2023 18:28:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C27142724
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 15:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691706440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+cGHxCsAqOaWF0SLxrS8dHvtea21OVf1t7UnZ98qwrg=;
        b=GbgEzBhHtpakI/Gnz2//CJbv56rqZVwww/+CIiI16QjNmDDv4XjptxdyxBV4MR00fG0flP
        RFoz+BiAl6eLPZH2JWtrsZtHHiHaXlnFhQ3nFzcofPPSjPKwOEjyw+0Bu5XK38QdQ5UlGs
        PvoZftGNRX6jbL9ryNvD97SRu/xNmT8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-wwBgaBlqPw2YdQY55VkDCA-1; Thu, 10 Aug 2023 18:27:16 -0400
X-MC-Unique: wwBgaBlqPw2YdQY55VkDCA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-31785455660so930732f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 15:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691706435; x=1692311235;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cGHxCsAqOaWF0SLxrS8dHvtea21OVf1t7UnZ98qwrg=;
        b=VAF+nIVjLTnLuEk+UzdA0WrVrM8DwfUaEtcXQnGqMy3X4MGS1SGhKCw05o/TDB9vPe
         uN0EFlY26Czxbd5G/EhMau/wDd5paOUlEe21UgPF+GsLQ4T9h/Z3+XGQGzAKAaG3vqXW
         TfM/u8gyMJ3G2bRAlgFoaHE0TuIWlKC78IXzJ+UkzFOkmv/medxUKXDwzkFEbmrG4Awg
         YaoknKou9O8YSEPlRFTTZzuzz8fxRcsgLjuvKrKIJDr3H8YNhLYTOohINhjr8McJ8t+K
         fTcLo25y641SpA6rJ/gI1H7LUtn8jbv7s6RhM24n9ENuIiukf7thGu+nYgwkHzmCT5bb
         MZHQ==
X-Gm-Message-State: AOJu0Yxt0D4ICexeW3801fXNieGU7oYVLuQ1KCrRy4hyCW5B06IxVBMe
        YqtrTIJEXgHlW+3NnGyOJwldj0bChP2WVcBK1xWrO1Q3v7yQ0cdOJzX+sf89Pxws90XauzutdFf
        2QUejKbpeBNoVaUorVe33
X-Received: by 2002:a5d:56ce:0:b0:318:e4c4:497e with SMTP id m14-20020a5d56ce000000b00318e4c4497emr2091486wrw.50.1691706435720;
        Thu, 10 Aug 2023 15:27:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzP2iiM1LKr/tvCv65mXYl4MIU+MlKqq6pXMeBcKNLyEfZkqs5sJQ7WgoijYYA79kYIUnWRg==
X-Received: by 2002:a5d:56ce:0:b0:318:e4c4:497e with SMTP id m14-20020a5d56ce000000b00318e4c4497emr2091473wrw.50.1691706435345;
        Thu, 10 Aug 2023 15:27:15 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71a:8a00:8200:f041:4b87:a8be? (p200300cbc71a8a008200f0414b87a8be.dip0.t-ipconnect.de. [2003:cb:c71a:8a00:8200:f041:4b87:a8be])
        by smtp.gmail.com with ESMTPSA id l13-20020adfe9cd000000b0031934b035d2sm2586529wrn.52.2023.08.10.15.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 15:27:14 -0700 (PDT)
Message-ID: <8222bf8f-6b99-58f4-92cc-44113b151d14@redhat.com>
Date:   Fri, 11 Aug 2023 00:27:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>
Cc:     Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Hugh Dickins <hughd@google.com>,
        Yin Fengwei <fengwei.yin@intel.com>,
        Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>
References: <20230809083256.699513-1-david@redhat.com> <ZNQD4pxo8svpGmvX@x1n>
 <e5e29217-11d3-a84b-9e29-44acc72222f3@redhat.com>
 <155bd03e-b75c-4d2d-a89d-a12271ada71b@arm.com> <ZNUbNDiciFefJngZ@x1n>
 <db3c4d94-a0a9-6703-6fe0-e1b8851e531f@redhat.com> <ZNVPJ9xxd2oarR3I@x1n>
 <ZNVbObUGbos73ZJ5@casper.infradead.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH mm-unstable v1] mm: add a total mapcount for large folios
In-Reply-To: <ZNVbObUGbos73ZJ5@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10.08.23 23:48, Matthew Wilcox wrote:
> On Thu, Aug 10, 2023 at 04:57:11PM -0400, Peter Xu wrote:
>> AFAICS if that patch was all correct (while I'm not yet sure..), you can
>> actually fit your new total mapcount field into page 1 so even avoid the
>> extra cacheline access.  You can have a look: the trick is refcount for
>> tail page 1 is still seems to be free on 32 bits (if that was your worry
>> before).  Then it'll be very nice if to keep Hugh's counter all in tail 1.
> 
> No, refcount must be 0 on all tail pages.  We rely on this in many places
> in the MM.

Very right.

One could theoretically

1) Move the compound/entire mapcount to page[2]
2) Make hugetlb stop using the entire mapcount and only the total
    mapcount.
3) Then leave total_mapcount and nr_pages_mapped in page[1]
4) Make page_mapcount() use total_mapcount for hugetlb.

When (un)mapping a PMD-mapped THP, we would go to page[2]. Otherwise, 
only page[1].

The entire mapcount, similarly to nr_pages_mapped, primarily serves to 
get memory stats right; well, and to implement page_mapcount() for THP.

But I'm not 100% sure yet if the overhead from having nr_pages_mapped in 
page[2] is significant enough at this point.

-- 
Cheers,

David / dhildenb

