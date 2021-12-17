Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1996DC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 17 Dec 2021 18:11:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238929AbhLQSLW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Dec 2021 13:11:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22963 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236243AbhLQSLU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 13:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639764679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hdfHxUnq6Oqm9XHwzWNrUsr9UOXdYQoaq+fiSudykl8=;
        b=cMahuuQyeJoHgl+KgkCr/Uap0t59SoFqpFJHZ4VAUwILPIPQe7nqSwC9neBrdAC0Tn8hB6
        BeG2k7JoaU2ygffFVZh+GkhvOIxMDLrDd/8d0NXGBUKyA6Fi0GgCJYF0T1rW8hX6ZvxojS
        O3irI4SyrozSL0qvQwXD7Cx6yPBLBu4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-e-d2WqwpNzuWzMciVX9brQ-1; Fri, 17 Dec 2021 13:11:18 -0500
X-MC-Unique: e-d2WqwpNzuWzMciVX9brQ-1
Received: by mail-wr1-f69.google.com with SMTP id v18-20020a5d5912000000b001815910d2c0so877307wrd.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 10:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=hdfHxUnq6Oqm9XHwzWNrUsr9UOXdYQoaq+fiSudykl8=;
        b=Dft+npp0K8SKI/r3GQYa+dcMCLYutaN0qHOcKUoF21sx1oQnesJFjZ34yvtTziEomq
         E9r/QKsxU7VS06rrfPFazvIaHcMVkN/iDJHWJ3MrQHvwl7toZ7fma/QNVrcGY4+Vw5sK
         PLsAlURA6gcuPy6dRouoaH3N672p9QPYIAvsnnZbJ5x3wFWdthLBhQzawU4bv/Aop4fK
         3h06BWkw1UziwPzyKi5RevQxkwok8yb0MGpDBfffVlsD80u0CFiGhX/2La3P79U2vU8j
         clhy7/L4LdPcN0IWqNkmw4SgqAe5ihfgkmcroImeYoFVybmWhXmxbYlvlfaX46zlJufQ
         AYOw==
X-Gm-Message-State: AOAM532y+FUMe4+exKyR+kR4hLkpCtd2ZA2SUS170M2ffRh2bfYSoWQ6
        5s7JUqTYKLFlvqSyOszsFU7pka0PJst9dz1BeVjXP+Z4Df+sIqtMqzpAgH9+vRH9PiN9hgTi6p0
        MWLFoa9NR1YEXQ1n0gUso
X-Received: by 2002:a05:6000:178a:: with SMTP id e10mr3479606wrg.373.1639764677185;
        Fri, 17 Dec 2021 10:11:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLgy4aZOFKjfg55PAvd6AQPyzQU9oTMWCfs9cPWTUhUrmiyEGJg84XCeuZydB2K04JHLv4EA==
X-Received: by 2002:a05:6000:178a:: with SMTP id e10mr3479574wrg.373.1639764676913;
        Fri, 17 Dec 2021 10:11:16 -0800 (PST)
Received: from [192.168.3.132] (p4ff234b8.dip0.t-ipconnect.de. [79.242.52.184])
        by smtp.gmail.com with ESMTPSA id n1sm9827003wrc.54.2021.12.17.10.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 10:11:16 -0800 (PST)
Message-ID: <7f35b4a3-8a31-d74c-fcc0-ecc87071d9a5@redhat.com>
Date:   Fri, 17 Dec 2021 19:11:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 03/11] mm: simplify hugetlb and file-THP handling in
 __page_mapcount()
Content-Language: en-US
To:     Mike Kravetz <mike.kravetz@oracle.com>,
        linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Michal Hocko <mhocko@kernel.org>,
        Nadav Amit <namit@vmware.com>, Rik van Riel <riel@surriel.com>,
        Roman Gushchin <guro@fb.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Donald Dutile <ddutile@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Oleg Nesterov <oleg@redhat.com>, Jan Kara <jack@suse.cz>,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20211217113049.23850-1-david@redhat.com>
 <20211217113049.23850-4-david@redhat.com>
 <0b0007b3-bf6f-ccd7-96cf-3dd861abf224@oracle.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <0b0007b3-bf6f-ccd7-96cf-3dd861abf224@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17.12.21 19:06, Mike Kravetz wrote:
> On 12/17/21 03:30, David Hildenbrand wrote:
>> Let's return early for hugetlb, which really only relies on the compound
>> mapcount so far and does not support PageDoubleMap() yet. Use the chance
> 
> It is too early to say if hugetlb double mapping will use PageDoubleMap().
> I do not think (hope) it will be necessary.  So, I think you can drop mention
> of it here.

Desires have most certainly been expressed from a couple of parties --
to PTE map huge pages :) Hopefully we'll find a way to avoid
PageDoubleMap, I agree.

Dropping the comment!

> 
>> to cleanup the file-THP case to make it easier to grasp. While at it, use
>> head_compound_mapcount().
>>
>> This is a preparation for further changes.
>>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
> 

Thanks!

-- 
Thanks,

David / dhildenb

