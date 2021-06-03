Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4315CC47082
	for <linux-doc@archiver.kernel.org>; Thu,  3 Jun 2021 14:47:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23307611CA
	for <linux-doc@archiver.kernel.org>; Thu,  3 Jun 2021 14:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbhFCOtc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Jun 2021 10:49:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36452 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231224AbhFCOtb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Jun 2021 10:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622731666;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ggwAzDwYsJe761/h5KeyH0+JH3HJIdjU1YmA0yiaMkI=;
        b=c6KbUWHozjlgPRGeKkkVLjeAZIWBPqMyh56ebADi0rfZcqAJGEBYATvwEoUYnfBI9VRW8f
        Gjk4IeEfuXNd/w7x4TXUjO2lOEmf8jgt5gI0IaRTryfSZKkzbgRUPYZn0vYcMtNngguA7V
        mIztC+qrLSMk4ynNtaj0G+X5RfORWt0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-h2rxhmL0PKSD8bDEqt-ivA-1; Thu, 03 Jun 2021 10:47:43 -0400
X-MC-Unique: h2rxhmL0PKSD8bDEqt-ivA-1
Received: by mail-qv1-f71.google.com with SMTP id k6-20020a0cd6860000b029021936c6e8ffso4570005qvi.7
        for <linux-doc@vger.kernel.org>; Thu, 03 Jun 2021 07:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ggwAzDwYsJe761/h5KeyH0+JH3HJIdjU1YmA0yiaMkI=;
        b=lOTemgjb8qk6pIGFuvoflzHTkRFT/g2cbyUJUeJVjfnrQUsIyfAcfnA3/Z9kiZI6TP
         hfY3nZDwzgEMG50dYU/72pa3guypajmV+7iFLhtE8EbAfRrtGdxZd71PbUF0z62xeoql
         kHv1ZGNJGEeVglB+fa3Z05gwSxv6KeM4gW34xsQAUC4UGjPZyBSUAhKOi6/slShjh3PM
         jAeYD91u87IshXgWuJqGUgc/NynO4W8Y9WX7x4U2Y+Q8tL+h0tzsw6fI7B4YPTfD+kD1
         Pp+TFSvd2kSCdR7AFwOCkAZb+YytgywG/cCpalXXaJcoeGCbaTMpOTaX3XA5c3lB8dWA
         QTPA==
X-Gm-Message-State: AOAM531BIGpeEOqWydhMNeDsPXdDOngDZ65uLJRb8+hjjVHX4BEPPAkz
        KH9NzdeNbDBENaNfdHt1S/rXseVOqdKfRWjaVz+CfZsJhMtchDYXYMbXIsbFN+4EUQLkpUa+k97
        7G81+jia4ywAtaxn0s7Kc
X-Received: by 2002:a37:ae81:: with SMTP id x123mr31891331qke.251.1622731662879;
        Thu, 03 Jun 2021 07:47:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8G2sTC80gzexHAH3BN9zjekxO4BROz6GuR6h2LK/qUHy5QdzjC03iGstjtnqP8uH7ytX0pw==
X-Received: by 2002:a37:ae81:: with SMTP id x123mr31891297qke.251.1622731662359;
        Thu, 03 Jun 2021 07:47:42 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
        by smtp.gmail.com with ESMTPSA id j28sm2041208qkl.35.2021.06.03.07.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 07:47:41 -0700 (PDT)
Date:   Thu, 3 Jun 2021 10:47:40 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     Balbir Singh <bsingharora@gmail.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        nouveau@lists.freedesktop.org, bskeggs@redhat.com,
        rcampbell@nvidia.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hch@infradead.org, jglisse@redhat.com, willy@infradead.org,
        jgg@nvidia.com, hughd@google.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Message-ID: <YLjrjJXMP9Y3bvej@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <YLdGXSw0zdiovn4i@balbir-desktop>
 <YLeXqp/U0DgylI/u@t490s>
 <3853054.AI2YdRgKcH@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3853054.AI2YdRgKcH@nvdebian>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 03, 2021 at 09:39:32PM +1000, Alistair Popple wrote:
> Reclaim won't run on the page due to the extra references from the special 
> swap entries.

That sounds reasonable, but I didn't find the point that stops it, probably due
to my limited knowledge on the reclaim code.  Could you elaborate?

-- 
Peter Xu

