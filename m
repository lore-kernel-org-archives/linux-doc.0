Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DD4C001B0
	for <linux-doc@archiver.kernel.org>; Wed,  9 Aug 2023 21:24:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjHIVYo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Aug 2023 17:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjHIVYo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Aug 2023 17:24:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3624138
        for <linux-doc@vger.kernel.org>; Wed,  9 Aug 2023 14:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691616241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pab5T/wYPnPTPqi6VHLKDV5cGJ+aQFsll7X5AJmwYhg=;
        b=AoRmKUYKbNmzxKASeWe9UjYkSZC18acVG3Gn08nzCZZGHrPE4rjPQzmUnTGhsaqmrBf5+K
        ZBWCkIAJGg681rk95uiOmTbm0+zaicvmB2IZZsL1bmXznamAM4I059TSFJn6Kordiu26zY
        CitXXi/8FaIVv2GH3hvbN2sHE16gPks=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-h6qoKGtaMye8rKB1WZLQlg-1; Wed, 09 Aug 2023 17:23:59 -0400
X-MC-Unique: h6qoKGtaMye8rKB1WZLQlg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-63cc3a44aedso669956d6.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Aug 2023 14:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691616239; x=1692221039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pab5T/wYPnPTPqi6VHLKDV5cGJ+aQFsll7X5AJmwYhg=;
        b=HzvXUSeGEjVZ9KpwZ3qRrivxmEUn7f2RGS3Hv8YQxje5dGgAk66F+LWeLHPbltaSlQ
         vUZzKvNWjRwtemhb/9cCZck/tSXVCLoy2BOpnzRKPlDdvoCtMJfxCgssUQERdU8jcP1L
         SBWSLuxXB4W10bRvw7UNRQUo+uydoaW4xFOANZ5ig6S7Q4LTt+aI3u7Lv0/bsTWZFSic
         BSFnfk0UInwcAzW4P+QzZISLGFNCkncI15mxtVZ7jhi47GIKQLR4mq2M0noB9tx64OfT
         F8DVw4pYV9085M++iJPv+xZtSUul7Z2a092XwnlnwjyYfYbJ6s+D910N83McY7M2nLw7
         ESjg==
X-Gm-Message-State: AOJu0YzhaxzMy6rHDDMVZLGzY+kKEZ/UNHC47jTVKhsWwcBUPxv4CbCZ
        i4jFrLdh2P+6meHdLBCadZorpXXPIvKzWpYA84tITNszVGJoAqEVY5ApBhNXALViu84pXo9RfaE
        W4Wdyib/5uwlq6zXanr0t
X-Received: by 2002:ad4:5f87:0:b0:63c:f852:aa3a with SMTP id jp7-20020ad45f87000000b0063cf852aa3amr422291qvb.4.1691616239119;
        Wed, 09 Aug 2023 14:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHi2kXqydousZJhJDvXoAPDN6/pIDbQYIYiwnoX8uPhzD3iHOwErPThsw+blPrDnInkOW/ZQ==
X-Received: by 2002:ad4:5f87:0:b0:63c:f852:aa3a with SMTP id jp7-20020ad45f87000000b0063cf852aa3amr422283qvb.4.1691616238907;
        Wed, 09 Aug 2023 14:23:58 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id p1-20020a0c8c81000000b0063f8025407bsm3518958qvb.66.2023.08.09.14.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 14:23:58 -0700 (PDT)
Date:   Wed, 9 Aug 2023 17:23:46 -0400
From:   Peter Xu <peterx@redhat.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Hugh Dickins <hughd@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Yin Fengwei <fengwei.yin@intel.com>,
        Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH mm-unstable v1] mm: add a total mapcount for large folios
Message-ID: <ZNQD4pxo8svpGmvX@x1n>
References: <20230809083256.699513-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230809083256.699513-1-david@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, David,

Some pure questions below..

On Wed, Aug 09, 2023 at 10:32:56AM +0200, David Hildenbrand wrote:
> Let's track the total mapcount for all large folios in the first subpage.
> 
> The total mapcount is what we actually want to know in folio_mapcount()
> and it is also sufficient for implementing folio_mapped(). This also
> gets rid of any "raceiness" concerns as expressed in
> folio_total_mapcount().

Any more information for that "raciness" described here?

> 
> With sub-PMD THP becoming more important and things looking promising
> that we will soon get support for such anon THP, we want to avoid looping
> over all pages of a folio just to calculate the total mapcount. Further,
> we may soon want to use the total mapcount in other context more
> frequently, so prepare for reading it efficiently and atomically.

Any (perhaps existing) discussion on reduced loops vs added atomic
field/ops?

I had a feeling that there's some discussion behind the proposal of this
patch, if that's the case it'll be great to attach the link in the commit
log.

Thanks,

-- 
Peter Xu

