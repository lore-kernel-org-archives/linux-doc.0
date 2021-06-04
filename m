Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FA0C07E94
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 15:20:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C611461404
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 15:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhFDPWk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Jun 2021 11:22:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41833 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229881AbhFDPWj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jun 2021 11:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622820053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4AbIlLedm5Mu+ovdpvNjPfOsXH7m99kQNtIejaRsUUU=;
        b=eBAIu4T1v2QMvm5Oc0+dXshQ8vnZHsUuw4qfpirqoXOCAVcHRay+mAON9Tyh2/tQGk2AmK
        vZD4Iu75ZF6sNhXHpjdcDtglxmoMkdfdBnpbldxw8vtW+W0Yks+oPrXU9MaAww+3bcxjK0
        dZ/xXzz7P1EQxXY80VUkbq53xX8kq9E=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-reuj9MexNCe8OY-9aEOeXA-1; Fri, 04 Jun 2021 11:20:51 -0400
X-MC-Unique: reuj9MexNCe8OY-9aEOeXA-1
Received: by mail-qk1-f198.google.com with SMTP id o14-20020a05620a0d4eb02903a5eee61155so6824046qkl.9
        for <linux-doc@vger.kernel.org>; Fri, 04 Jun 2021 08:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4AbIlLedm5Mu+ovdpvNjPfOsXH7m99kQNtIejaRsUUU=;
        b=bBHIZaIhb1cWitaPGXbKSJ04Dg0rCZSjpD87LxqAWW1QOyMUM1rtfJtUdSF7dPaE6U
         07P1+zO2pJcJnbvrqqhdJMZex3TSs1VBwj5b7rHpJqrq4jag2y9zu5U8AKqKb7gMWQjh
         0hlvMlEEVrF6yuBJNAN5Hn5bNG3U9jjY5hbeRHa612oayle7CA4/mqM2E5O//rdSddRW
         A3nftOLIm0jB37v1lV+r1fSJ7rWn6mK+NUhQRFMkQkFHkGiGl/nd3JmgaN3suOdfHJVd
         bFPb8aUUtH57TJyWQFH60cKAniwVxAGjdf7qCXTUuZX/F3ohfN3+mS8+Y8sJq9c0bsQr
         6KNg==
X-Gm-Message-State: AOAM532IQGe/UPWd2scbEyH8g/qE4iTIgdSGTyscUn8jTkv3oYIxYPlZ
        OOzYE3T8oFbO14+ZM9tVggRDUYlrtf/RvzyT/siX3bsIh3ys8DOEDttA6fxNP2SfyzuHpa6eaO0
        /cL6S5Swk3Uu3l8Yoo0s4
X-Received: by 2002:a37:911:: with SMTP id 17mr2506622qkj.436.1622820051403;
        Fri, 04 Jun 2021 08:20:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSkb15icJCjCC2a0yzUkFB8Tk/1b3Gxyat2dgZri3GuoK2EOI4ZaPq1ePBkTLwQGSCPYLtvg==
X-Received: by 2002:a37:911:: with SMTP id 17mr2506604qkj.436.1622820051225;
        Fri, 04 Jun 2021 08:20:51 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
        by smtp.gmail.com with ESMTPSA id x9sm3701082qtf.76.2021.06.04.08.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:20:50 -0700 (PDT)
Date:   Fri, 4 Jun 2021 11:20:49 -0400
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
Message-ID: <YLpE0U789jvD2zxN@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <3853054.AI2YdRgKcH@nvdebian>
 <YLjrjJXMP9Y3bvej@t490s>
 <10231977.pWpf7cJbZl@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <10231977.pWpf7cJbZl@nvdebian>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 04, 2021 at 11:07:42AM +1000, Alistair Popple wrote:
> On Friday, 4 June 2021 12:47:40 AM AEST Peter Xu wrote:
> > External email: Use caution opening links or attachments
> > 
> > On Thu, Jun 03, 2021 at 09:39:32PM +1000, Alistair Popple wrote:
> > > Reclaim won't run on the page due to the extra references from the special
> > > swap entries.
> > 
> > That sounds reasonable, but I didn't find the point that stops it, probably
> > due to my limited knowledge on the reclaim code.  Could you elaborate?
> 
> Sure, it isn't immediately obvious but it ends up being detected at the start 
> of is_page_cache_freeable() in the pageout code:
> 
> 
> static pageout_t pageout(struct page *page, struct address_space *mapping)
> {
> 
> [...]
> 
> 	if (!is_page_cache_freeable(page))
> 		return PAGE_KEEP;

I did look at pageout() but still missed this small helper indeed (while it's
so important to know..), thanks!

-- 
Peter Xu

