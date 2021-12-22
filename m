Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3B2C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 22 Dec 2021 08:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243435AbhLVIvd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Dec 2021 03:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36595 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243463AbhLVIvd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Dec 2021 03:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640163092;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nRvPpmnSEt5Rvd34gy/AZJdD22ErE5su7GVxhYTxDPU=;
        b=UUoIhwgFBeDHEGX8VRshWzGRqp2WDzzHkXrCjMXAme20vl/smY+Oc7yxJ+N9TqgXerN+Ho
        BnYjCITo5w8LMWvJ3crNf/UcurqSa5huMxd2c6C2YvUFnA1Kta+WL89PwXsnL23pw6VOaK
        joPERnecK1j7IAYsDiHWoDb27hMs5PM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-wncZV7K-Or6-O4VItNZhBQ-1; Wed, 22 Dec 2021 03:51:31 -0500
X-MC-Unique: wncZV7K-Or6-O4VItNZhBQ-1
Received: by mail-wm1-f71.google.com with SMTP id b83-20020a1c1b56000000b0033283ea5facso1235592wmb.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Dec 2021 00:51:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=nRvPpmnSEt5Rvd34gy/AZJdD22ErE5su7GVxhYTxDPU=;
        b=tkVfor5Gm/LB7FQZ5M16Zbd3U0Xig/wWzTXbuwPL2I+VkbWS1NT8faxuguDm1F4JfA
         cVQh1Ys/5Swfr6fOqRXf4yY2Mxo5JShaVEYIUOE5PvmXxoKohcejsL+uSlHkuLut9tpU
         nBLwQtnqlA90VvKeIp+3WpIHm9BW+7nA5/LZMZssU50nbGjlEyzrOgLqQ+IOixTOXOGP
         fTTQPCDt9jfs075Imk9uP4BkJmWhN1plFP0hYIHyaQpFBHVzJX/JjClJrMQTqr6iv1ow
         /tao8CvAyBS1/sO292L0jkKcjmHSNr0chylhtOMri0557QALpW5BFDIK6Rr9pa7MP3Tv
         sYXg==
X-Gm-Message-State: AOAM533+HfVyQ/P5vzawSllZ498A+dlyXDq9vhxO0L2Ig4WrHVgmVxHD
        sIjmfnuUeTGa8DSVz1n/fZhfGkkBjdvG51ubv//X+IVbwQkJsKiLiSs6c/brEoXeGtelurJv5Vf
        u+1aI56fjZkGwaSNKkoco
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr1350812wrs.291.1640163090493;
        Wed, 22 Dec 2021 00:51:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQMP+gg2IazNMUXRkhEzF32QnEjZyzB2DCEgSFhBQY5dN8NepNFzMV52fB9tfCbRd1xCQ93w==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr1350801wrs.291.1640163090217;
        Wed, 22 Dec 2021 00:51:30 -0800 (PST)
Received: from [192.168.3.132] (p5b0c646a.dip0.t-ipconnect.de. [91.12.100.106])
        by smtp.gmail.com with ESMTPSA id w25sm4451796wmk.20.2021.12.22.00.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Dec 2021 00:51:29 -0800 (PST)
Message-ID: <3e0868e6-c714-1bf8-163f-389989bf5189@redhat.com>
Date:   Wed, 22 Dec 2021 09:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Nadav Amit <namit@vmware.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        David Rientjes <rientjes@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Roman Gushchin <guro@fb.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Donald Dutile <ddutile@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Oleg Nesterov <oleg@redhat.com>, Jan Kara <jack@suse.cz>,
        Linux-MM <linux-mm@kvack.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <4D97206A-3B32-4818-9980-8F24BC57E289@vmware.com>
 <CAHk-=whxvVQReBqZeaV41=sAWfT4xTfn6sMSWDfkHKVS3zX85w@mail.gmail.com>
 <5A7D771C-FF95-465E-95F6-CD249FE28381@vmware.com>
 <CAHk-=wgMuSkumYxeaaxbKFoAbw_gjYo1eRXXSFcBHzNG2xauTA@mail.gmail.com>
 <CAHk-=whYT0Q1F=bxG0yi=LN5gXY64zBwefsbkLoRiP5p598d5A@mail.gmail.com>
 <fca16906-8e7d-5d04-6990-dfa8392bad8b@redhat.com>
 <20211221010312.GC1432915@nvidia.com>
 <fd7e3195-4f36-3804-1793-d453d5bd3e9f@redhat.com>
 <CAHk-=wgQq3H6wfkW7+MmduVgBOqHeiXQN97yCMd+m1mM-1xCLQ@mail.gmail.com>
 <900b7d4a-a5dc-5c7b-a374-c4a8cc149232@redhat.com>
 <20211221190706.GG1432915@nvidia.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
In-Reply-To: <20211221190706.GG1432915@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 21.12.21 20:07, Jason Gunthorpe wrote:
> On Tue, Dec 21, 2021 at 06:40:30PM +0100, David Hildenbrand wrote:
> 
>> 2) is certainly the cherry on top. But it just means that R/O pins don't
>> have to be the weird kid. And yes, achieving 2) would require
>> FAULT_FLAG_EXCLUSIVE / FAULT_FLAG_UNSHARED, but it would really 99% do
>> what existing COW logic does, just bypass the "map writable" and
>> "trigger write fault" semantics.
> 
> I still don't agree with this - when you come to patches can you have
> this work at the end and under a good cover letter? Maybe it will make
> more sense then.

Yes. But really, I think it's the logical consequence of what Linus said
[1]:

  "And then all GUP-fast would need to do is to refuse to look up a page
   that isn't exclusive to that VM. We already have the situation that
   GUP-fast can fail for non-writable pages etc, so it's just another
   test."

We must not FOLL_PIN a page that is not exclusive (not only on gup-fast,
but really, on any gup). If we special case R/O FOLL_PIN, we cannot
enable the sanity check on unpin as suggested by Linus [2]:

  "If we only set the exclusive VM bit on pages that get mapped into
   user space, and we guarantee that GUP only looks up such pages, then
   we can also add a debug test to the "unpin" case that the bit is
   still set."

There are really only two feasible options I see when we want to take a
R/O FOLL_PIN on a !PageAnonExclusive() anon page

(1) Fail the pinning completely. This implies that we'll have to fail
    O_DIRECT once converted to FOLL_PIN.
(2) Request to mark the page PageAnonExclusive() via a
    FAULT_FLAG_UNSHARE and let it succeed.


Anything else would require additional accounting that we already
discussed in the past is hard -- for example, to differentiate R/O from
R/W pins requiring two pin counters.

The only impact would be that FOLL_PIN after fork() has to go via a
FAULT_FLAG_UNSHARE once, to turn the page PageAnonExclusive. IMHO this
is the right thing to do for FOLL_LONGTERM. For !FOLL_LONGTERM it would
be nice to optimize this, to *not* do that, but again ... this would
require even more counters I think, for example, to differentiate
between "R/W short/long-term or R/O long-term pin" and "R/O short-term pin".

So unless we discover a way to do additional accounting for ordinary 4k
pages, I think we really can only do (1) or (2) to make sure we never
ever pin a !PageAnonExclusive() page.


[1]
https://lkml.kernel.org/r/CAHk-=wgQq3H6wfkW7+MmduVgBOqHeiXQN97yCMd+m1mM-1xCLQ@mail.gmail.com
[2]
https://lkml.kernel.org/r/CAHk-=wiyxQ==vnHFHW99S_OPwA=u1Qrfg2OGr_6zPcBAuhQY2w@mail.gmail.com


-- 
Thanks,

David / dhildenb

