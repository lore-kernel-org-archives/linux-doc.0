Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79061C48BE0
	for <linux-doc@archiver.kernel.org>; Thu, 10 Jun 2021 23:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 593C9613E1
	for <linux-doc@archiver.kernel.org>; Thu, 10 Jun 2021 23:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhFJXGV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Jun 2021 19:06:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51203 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230297AbhFJXGU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 19:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623366263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Kn4921Fy2QxClPboKoVBlarBT42fXZONHXvZsMc4G14=;
        b=APFp1kQLqm/VxcHMem0c8P4f5Z0Xe0pUOUCRGoIWHkFswrmqOFh++H5j53G/+tmc7rBJFY
        Ayjr4Trg3/tMsFCMLg9ibGgGYkjLInb+RfGvuk7BEJNSiFxx5XULYPz8ljh9dntgnnx9jT
        fQYwjI1WDBM4mXl+/2vbBZZTFB030b8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-k6plnBu2PDCOSSAtiAG1sQ-1; Thu, 10 Jun 2021 19:04:22 -0400
X-MC-Unique: k6plnBu2PDCOSSAtiAG1sQ-1
Received: by mail-qv1-f70.google.com with SMTP id ea18-20020ad458b20000b0290215c367b5d3so17722024qvb.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 16:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kn4921Fy2QxClPboKoVBlarBT42fXZONHXvZsMc4G14=;
        b=Nll+XieviUnCfguvjPfJQvgGdlYLpzQo5MiBQaGskfHu9z2ijzRM0t3JDuPudaXENH
         +//Nr+A7dW4xqXToGd438XAwOS8r0j3ennry6mERihLxCGHp9Fsg8zdCPAn64pg9Y8Py
         Byb5POrd1aMxfmtDzwAc3G779nF5J/9fPSsT5+fOhRVMyz+nJQ7qUwifNsnTKx3LupCm
         iZHEFur8EMPEP2ocExoPp7hHZ6fHD1gyW5lGFiCnH53gOV9TF9TJiF9pJdimx1SrlceX
         DVkM2NrnMgqj6meuOwWm6wFwwPPTbCNlKmqj0yUS8NDryXiHJzrwmThPocVKgxiJ9YVK
         3Bvg==
X-Gm-Message-State: AOAM530PL3DvemOr2VozlOCpuzd31wOC2geed5bdemPZWUdFSlMicNp2
        8vSY0QmaKkAhhYNoOAU47hT0NxB8KztVRSLFolKdpJHbKxvBVfsKmIdPcL06cdK/68Zz2865xMF
        69MoJ8YS7LqrF4C7lGXDK
X-Received: by 2002:a05:620a:1116:: with SMTP id o22mr1055472qkk.263.1623366261642;
        Thu, 10 Jun 2021 16:04:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrG/yfGVS5sWgTKcNo1dgRgBZLWinZ0GsXIy0VHGuGgZrohA7iNbV+b0qys3C0GTOZDsvbFg==
X-Received: by 2002:a05:620a:1116:: with SMTP id o22mr1055448qkk.263.1623366261403;
        Thu, 10 Jun 2021 16:04:21 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca. [174.93.75.200])
        by smtp.gmail.com with ESMTPSA id j14sm3076434qtj.96.2021.06.10.16.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 16:04:20 -0700 (PDT)
Date:   Thu, 10 Jun 2021 19:04:19 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     linux-mm@kvack.org, akpm@linux-foundation.org,
        rcampbell@nvidia.com, linux-doc@vger.kernel.org,
        nouveau@lists.freedesktop.org, hughd@google.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hch@infradead.org, bskeggs@redhat.com, jgg@nvidia.com,
        shakeelb@google.com, jhubbard@nvidia.com, willy@infradead.org,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v10 07/10] mm: Device exclusive memory access
Message-ID: <YMKacyNstEM9brUD@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <2773835.D95cIkl9rl@nvdebian>
 <YMJUM4sx1VclR7oz@t490s>
 <6429491.QiJgnDeYu7@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6429491.QiJgnDeYu7@nvdebian>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 11, 2021 at 12:21:26AM +1000, Alistair Popple wrote:
> > Hmm, the thing is.. to me FOLL_SPLIT_PMD should have similar effect to explicit
> > call split_huge_pmd_address(), afaict.  Since both of them use __split_huge_pmd()
> > internally which will generate that unwanted CLEAR notify.
> 
> Agree that gup calls __split_huge_pmd() via split_huge_pmd_address()
> which will always CLEAR. However gup only calls split_huge_pmd_address() if it
> finds a thp pmd. In follow_pmd_mask() we have:
> 
> 	if (likely(!pmd_trans_huge(pmdval)))
> 		return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
> 
> So I don't think we have a problem here.

Sorry I didn't follow here..  We do FOLL_SPLIT_PMD after this check, right?  I
mean, if it's a thp for the current mm, afaict pmd_trans_huge() should return
true above, so we'll skip follow_page_pte(); then we'll check FOLL_SPLIT_PMD
and do the split, then the CLEAR notify.  Hmm.. Did I miss something?

-- 
Peter Xu

