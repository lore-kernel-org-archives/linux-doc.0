Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD48C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 18:01:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80FD2611BF
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 18:01:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345278AbhERSDA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 May 2021 14:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56234 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345260AbhERSC7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 May 2021 14:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621360901;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Oue7U1wjftn7xVwPmUZCJccBeCJY9jE5A9d8yc2+hO4=;
        b=Ora0ec0MtMLAuvk+SbeTaOUni3CLwx59zVFX5AqLzUlof5EBxe0IA8CZNvO17Q+uDbisd0
        FgtwJ9J3KXftksjHr0Rdrigywaka5q7oWMySvpVP28sE+X2eFqtF78oLGJQuZcJQ7DrQTk
        M8APNkPboCNwMbRfLfAbVDrK6NqsCJk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-bKccTv4MP6uzSn86hb791Q-1; Tue, 18 May 2021 14:01:39 -0400
X-MC-Unique: bKccTv4MP6uzSn86hb791Q-1
Received: by mail-qk1-f199.google.com with SMTP id s4-20020a3790040000b02902fa7aa987e8so7761823qkd.14
        for <linux-doc@vger.kernel.org>; Tue, 18 May 2021 11:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Oue7U1wjftn7xVwPmUZCJccBeCJY9jE5A9d8yc2+hO4=;
        b=b2GnONJ+TunUtzixegG3bWObDRZxJQqm81csUbRZcdr9Kxib76pR0271mBOajSOr1C
         XApGjQ2oRCzfWwjVv3dIuU9nqSNbqicqBY1wnCGpO8RQrS858zgTYyDhNOMlcG1/y+eK
         vtPSIMLh2vpomvxBhWPGpIGQp+Qlz4pSNTZB1qFPQmqyy4k49jcWuR2ypdfaKi5gtS6z
         X+adcTUP8eFTs2DW3+NmAuXW92AmNxKovaRInKcUfV3NyOJZKBpJL3Ph0tCKFdi+ktQQ
         b7d4DYPpv3eztmG1P+rTP5odZyP/NwWmL/PobLmTUI2HBs5pmGgghoycvKgTJb3CPu1p
         Wb3g==
X-Gm-Message-State: AOAM532UJL4CTqYMkmLCeKpDJSIryvJ+7DnBfTKHu+EJG4LLwYE41Z5I
        ktMaTHrv5QB89OjLDKC2WvmH3B2qdyq+HROk+sJIgHayIx594fwzlqJKpHnFPfP6+ksFhQHn+ww
        +GuNM1mUrrDetPEvsaouC
X-Received: by 2002:ac8:a49:: with SMTP id f9mr6060389qti.157.1621360898457;
        Tue, 18 May 2021 11:01:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTICgj8/egwsE0Ivgqvw8kGv1T8HxyWhbScHPLgGtw0FYHBEe8vymzLu/hxY0OnGRaALaW5w==
X-Received: by 2002:ac8:a49:: with SMTP id f9mr6060354qti.157.1621360898147;
        Tue, 18 May 2021 11:01:38 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
        by smtp.gmail.com with ESMTPSA id b23sm1488671qtp.7.2021.05.18.11.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 11:01:37 -0700 (PDT)
Date:   Tue, 18 May 2021 14:01:36 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
        nouveau@lists.freedesktop.org, bskeggs@redhat.com,
        akpm@linux-foundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jhubbard@nvidia.com, rcampbell@nvidia.com, jglisse@redhat.com,
        hch@infradead.org, daniel@ffwll.ch, willy@infradead.org,
        bsingharora@gmail.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKQBACJCjsxeM3ro@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
 <YKMhorngO2DVrxac@t490s>
 <47694715.suB6H4Uo8R@nvdebian>
 <YKP5Dj4Q/riGGc43@t490s>
 <20210518173334.GE1002214@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210518173334.GE1002214@nvidia.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 18, 2021 at 02:33:34PM -0300, Jason Gunthorpe wrote:
> On Tue, May 18, 2021 at 01:27:42PM -0400, Peter Xu wrote:
> 
> > I also have a pure and high level question regarding a process fork() when
> > there're device exclusive ptes: would the two processes then own the device
> > together?  Is this a real usecase?
> 
> If the pages are MAP_SHARED then yes. All VMAs should point at the
> same device_exclusive page and all VMA should migrate back to CPU
> pages together.

Makes sense.  If we keep the anonymous-only in this series (I think it's good
to separate these), maybe we can drop the !COW case, plus some proper installed
WARN_ON_ONCE()s.

> 
> > Indeed it'll be odd for a COW page since for COW page then it means after
> > parent/child writting to the page it'll clone into two, then it's a mistery on
> > which one will be the one that "exclusived owned" by the device..
> 
> For COW pages it is like every other fork case.. We can't reliably
> write-protect the device_exclusive page during fork so we must copy it
> at fork time.
> 
> Thus three reasonable choices:
>  - Copy to a new CPU page
>  - Migrate back to a CPU page and write protect it
>  - Copy to a new device exclusive page

IMHO the ownership question would really help us to answer this one..

If the device ownership should be kept in parent IMHO option (1) is the best
approach. To be explicit on page copy: we can do best-effort, even if the copy
is during a device atomic operation, perhaps?

If the ownership will be shared, seems option (3) will be easier as I don't see
a strong reason to do immediate restorinng of ptes; as long as we're careful on
the refcounting.

Thanks,

-- 
Peter Xu

