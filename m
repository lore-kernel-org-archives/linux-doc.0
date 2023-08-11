Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B19C0015E
	for <linux-doc@archiver.kernel.org>; Fri, 11 Aug 2023 15:20:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236599AbjHKPUC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Aug 2023 11:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236597AbjHKPTm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Aug 2023 11:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2364C358C
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691767127;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Jo0mEcRfDjKXk0toT3MA/an0CZ6PSxrp9vF9M+Za+G4=;
        b=gT/3bqAtUYHPFY0GHuQ6400y11MWRkLp/qxf41Yw+wBQWSyFfH3z76quC7BTLgGLAfDRar
        eo99AMrWBNgMOLMtU8Tt+pzGQ8gjXMlKhByTX3hVrtXCGcxgoqxViBwpf3qlbCm/OSmZyl
        uF31k7J3Sgz9DMSpF5UC8AUn5QKrfqk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-pzgb0FukOMua6nnDrqmNxw-1; Fri, 11 Aug 2023 11:18:43 -0400
X-MC-Unique: pzgb0FukOMua6nnDrqmNxw-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-40fd6d83c21so5492371cf.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 08:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691767121; x=1692371921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo0mEcRfDjKXk0toT3MA/an0CZ6PSxrp9vF9M+Za+G4=;
        b=gsO1o8bUlDM7ycPuKFs8fQK7KTdb+w9q1Co7n/Xk1BeeKR4Nj4URucvouezczUN7Ev
         q5tI4NYOo6HV61qgDgLtg+HXSeDQQY2HT9YwfKaQZf86Xj76PGASU+ua1BwutPPq7Ue1
         +7dnIKpXqCSUEqmd8Cs01Ff+jNYQ7GFf8qddq05V/+9ljgHB7C5BtJ3naiKXr9Pp52TG
         6HtnY1HsbKPV/ErCJvfkppf6sZq9dcxzgwm50OSB3ji+KsVKEANfX7dQ6LTtLimx60BL
         iFqBAbyF/bJszK2/k/3srSnojabo1Nm4WJjhcPhlowKba6NZ0GLhZEghV3irO9ay1Eps
         0Q5g==
X-Gm-Message-State: AOJu0YxJB46ZNwyvxsFffYyRzIteByu0AtmQOBDakpEO4xcNwD8s1mG5
        JJE2h2P8trn8eQ+lx/zoN0SBpGxPWitD0+8F6Gfy5Yas8syme29GU6UT6EqwWU7Meqtt2CxpAfj
        szF2rV9Eo42uFUUA0abyQ
X-Received: by 2002:a05:622a:1a06:b0:40f:dcda:ea10 with SMTP id f6-20020a05622a1a0600b0040fdcdaea10mr2733833qtb.3.1691767121012;
        Fri, 11 Aug 2023 08:18:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu3sq9QlwOyun+Cer+VeBozeAoyni7P5APQeEkVKQ5+NJw6tsiiA41v7qX2wELRvM3P8bl9w==
X-Received: by 2002:a05:622a:1a06:b0:40f:dcda:ea10 with SMTP id f6-20020a05622a1a0600b0040fdcdaea10mr2733810qtb.3.1691767120739;
        Fri, 11 Aug 2023 08:18:40 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id g3-20020ac870c3000000b0040f200feb4fsm1229705qtp.80.2023.08.11.08.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 08:18:40 -0700 (PDT)
Date:   Fri, 11 Aug 2023 11:18:38 -0400
From:   Peter Xu <peterx@redhat.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Hugh Dickins <hughd@google.com>,
        Yin Fengwei <fengwei.yin@intel.com>,
        Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH mm-unstable v1] mm: add a total mapcount for large folios
Message-ID: <ZNZRTmvkAlm4yeAd@x1n>
References: <20230809083256.699513-1-david@redhat.com>
 <ZNQD4pxo8svpGmvX@x1n>
 <e5e29217-11d3-a84b-9e29-44acc72222f3@redhat.com>
 <155bd03e-b75c-4d2d-a89d-a12271ada71b@arm.com>
 <ZNUbNDiciFefJngZ@x1n>
 <db3c4d94-a0a9-6703-6fe0-e1b8851e531f@redhat.com>
 <ZNVPJ9xxd2oarR3I@x1n>
 <ZNVbObUGbos73ZJ5@casper.infradead.org>
 <8222bf8f-6b99-58f4-92cc-44113b151d14@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8222bf8f-6b99-58f4-92cc-44113b151d14@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 11, 2023 at 12:27:13AM +0200, David Hildenbrand wrote:
> On 10.08.23 23:48, Matthew Wilcox wrote:
> > On Thu, Aug 10, 2023 at 04:57:11PM -0400, Peter Xu wrote:
> > > AFAICS if that patch was all correct (while I'm not yet sure..), you can
> > > actually fit your new total mapcount field into page 1 so even avoid the
> > > extra cacheline access.  You can have a look: the trick is refcount for
> > > tail page 1 is still seems to be free on 32 bits (if that was your worry
> > > before).  Then it'll be very nice if to keep Hugh's counter all in tail 1.
> > 
> > No, refcount must be 0 on all tail pages.  We rely on this in many places
> > in the MM.
> 
> Very right.

Obviously I could have missed this in the past.. can I ask for an example
explaining why refcount will be referenced before knowing it's a head?

> 
> One could theoretically
> 
> 1) Move the compound/entire mapcount to page[2]
> 2) Make hugetlb stop using the entire mapcount and only the total
>    mapcount.
> 3) Then leave total_mapcount and nr_pages_mapped in page[1]
> 4) Make page_mapcount() use total_mapcount for hugetlb.
> 
> When (un)mapping a PMD-mapped THP, we would go to page[2]. Otherwise, only
> page[1].
> 
> The entire mapcount, similarly to nr_pages_mapped, primarily serves to get
> memory stats right; well, and to implement page_mapcount() for THP.
> 
> But I'm not 100% sure yet if the overhead from having nr_pages_mapped in
> page[2] is significant enough at this point.

Worth trying.

Besides the cachelines, cmpxchg should also lock the memory bus and
meanwhile affect the whole processor pipelines in some way. Maybe that
effect is amplified too when it runs in a loop with one more counter.

-- 
Peter Xu

