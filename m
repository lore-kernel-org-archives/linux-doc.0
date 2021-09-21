Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12231C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 21 Sep 2021 16:30:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE7A361002
	for <linux-doc@archiver.kernel.org>; Tue, 21 Sep 2021 16:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhIUQbr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Sep 2021 12:31:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39154 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229918AbhIUQbo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Sep 2021 12:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632241816;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cvXMhGakfRvwam1AwXwENHJLraWpPC0CvrXKzv+4e2g=;
        b=ALc1iKTIJz4okp12S8zYygrrYFFiP1ygnHduDQfiAqqmBa6FFc8+wxvuRt5eyWF2m/I8Ev
        Hik3MWL4qOuQPJ/Lh46/Rum2W80ZefuyIVQaeB09kyokdcGxooFsEf9nzu4YUyp0li5Th2
        P7zHeDFyf5ojno1gkGPWbJWquO9XQJk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-hH_Q5QEKMzmLYPoH7sOgGA-1; Tue, 21 Sep 2021 12:30:14 -0400
X-MC-Unique: hH_Q5QEKMzmLYPoH7sOgGA-1
Received: by mail-qv1-f72.google.com with SMTP id r18-20020a056214069200b0037a291a6081so231441750qvz.18
        for <linux-doc@vger.kernel.org>; Tue, 21 Sep 2021 09:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cvXMhGakfRvwam1AwXwENHJLraWpPC0CvrXKzv+4e2g=;
        b=2Whffc/HrEEyjhPjjaTEgcrhSPCjkktWybNg03O+Tso2zMGWGvNx13TPxdR3Bv207M
         Si+FFPI7Ur1HItxH3GytwDl7F/z55Jiag+wEEnkDkhQb0RhNFiMr0oHc7i2Rn7tUUdOg
         XAAtRoRhInbXq4H+OgObnbwxoE5y2weoWdAuUfuf8BBV8ECqHPq3h82+mIkEKWYSrTU7
         5hsmRa7TDGBc1KLfGangvagOmqY9Y/X09tx7Da+70xNHO7X63mc5jiupdDYa1+g+Dbpo
         kC6KWQz8LdDgnHYNaXuJW2N4MolGJ6aWWeDeUR03fEYdTWdE0h3uc8QbXDk5it7QnryY
         2WbA==
X-Gm-Message-State: AOAM532W78ePhm1ujEv0XhepD5C+43L1Hp13w+lpIXfoKe6CjouKgm4M
        MuwaCNfgSqw1o1iqZLOkLy3SwV2tweP0PYygg1yjl0qCPXkZTzcWFIj3FAloc+EGaEGRqCYCrZq
        za75NhgxSxougdQ0tH/a2
X-Received: by 2002:a37:a152:: with SMTP id k79mr4734851qke.358.1632241814340;
        Tue, 21 Sep 2021 09:30:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA/BiE/VLlRf8pfn0lR/MXGfaprXd3avo4u1T1KPZaeFF4KcokyiBLbt3MnRhkYORRG/A1NA==
X-Received: by 2002:a37:a152:: with SMTP id k79mr4734811qke.358.1632241814099;
        Tue, 21 Sep 2021 09:30:14 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
        by smtp.gmail.com with ESMTPSA id r10sm9339894qkk.95.2021.09.21.09.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 09:30:13 -0700 (PDT)
Date:   Tue, 21 Sep 2021 12:30:11 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Tiberiu Georgescu <tiberiu.georgescu@nutanix.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "david@redhat.com" <david@redhat.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ivan Teterevkov <ivan.teterevkov@nutanix.com>,
        Florian Schmidt <flosch@nutanix.com>,
        "Carl Waldspurger [C]" <carl.waldspurger@nutanix.com>,
        Jonathan Davies <jond@nutanix.com>
Subject: Re: [PATCH v2 1/1] Documentation: update pagemap with shmem
 exceptions
Message-ID: <YUoIk247W1Sbt6Lf@t490s>
References: <20210920164931.175411-1-tiberiu.georgescu@nutanix.com>
 <20210920164931.175411-2-tiberiu.georgescu@nutanix.com>
 <YUjb91tWhd/YAgQW@t490s>
 <F6A49621-C7A4-4643-95C2-F47B02F132D2@nutanix.com>
 <YUn0ikP4Gip3Yc6L@t490s>
 <C983908F-7AF4-410B-90FF-DB4B9A06E917@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <C983908F-7AF4-410B-90FF-DB4B9A06E917@nutanix.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 21, 2021 at 04:08:29PM +0000, Tiberiu Georgescu wrote:
> Hmmm, so if we put emphasis on the accuracy of swap info, or accuracy in
> general, we need to use frontswap. Otherwise, mincore() could suffer from
> race conditions, and mark pages in the swap cache as being present.

IMHO it's not a race condition, but by design.

Quotting again from the mincore() man page:

       The vec argument must point to an array containing at least
       (length+PAGE_SIZE-1) / PAGE_SIZE bytes.  On return, the least
       significant bit of each byte will be set if the corresponding page is
       currently resident in memory, and be clear otherwise.

I think "within swap cache" does mean that it still resides in memory, so it's
not violating what it's designed to me, at least from the manpage.

> 
> Do you reckon this info (frontswap for mincore) should be present in
> the pagemap docs? I wouldn't want to bloat the section either.

I don't think the type of swap matters in this document, but imho mentioning
mincore() as the alternative to fetch swap is still meaningful as that's what's
missing for pagemap right now on shmem typed memories.

Even if it cannot identify some cases between "page presents", "page stays in
page cache", or "page stays in swap cache", it'll still be good enough to me.

Thanks,

-- 
Peter Xu

