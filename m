Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2577DC001DE
	for <linux-doc@archiver.kernel.org>; Thu, 10 Aug 2023 21:49:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbjHJVtP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Aug 2023 17:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjHJVtO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Aug 2023 17:49:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7552ED
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 14:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691704106;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=T1ExLvwy+wUPzZuAeU99YLpuaOF9jFHCSTBDaGG9zOU=;
        b=LUs2cVeFDd2iS6yDwvFlcXcInj33XEGS9blMqr6ArpDK/Vuuf1V5mjwPY+h3F8BBi7ZsTr
        9uDLI9fBdJAuHVVDuLJIjm1hup4g5DVov/gSwlHTpMvwg2RtXNirY/ezUEj1/vFe1PdjMD
        lnX6CqnFt/GShQCMricT/bcnTWeHRoI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-uZY0lOTXM12YGv7CPsXGvQ-1; Thu, 10 Aug 2023 17:48:22 -0400
X-MC-Unique: uZY0lOTXM12YGv7CPsXGvQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-63cc3a44aedso3818586d6.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 14:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691704101; x=1692308901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1ExLvwy+wUPzZuAeU99YLpuaOF9jFHCSTBDaGG9zOU=;
        b=jwvQKHbWd8wOSypMMmmPq5O20qlHLaVwo66jg4DxZnSD+dXX0dARRK1Kk7/vTv4IrM
         yXXFZF9cfNZ0iIB2mf7HLwXhp3EC7hmAG0cU+sVptslCvc8os2nPgjnuaeumX+s7IaQm
         VTH+Yjb54qyIuPBXUbC+5gm/m7Bn7sGHMUjijV1+BTZWoQrwhpPqOO3TR2snxUi4Y57q
         VCoi37fIYJn9cxPJQPoafSvD0fr4EUpmdxMza6bqK9STFrbC5+5Syp3kJn01IOF8AOEh
         pNxladSv/7ocZpgabYG5PUWKAFIPrfkVgkbVQCLgIz4/vultebt/1GZMte0pPHL+EJOa
         twoQ==
X-Gm-Message-State: AOJu0YwPnIH+/kMJTb6LM30MwZWPD7cc4EdCqRUUAGt+A+km4PX1YE1u
        WB7BN9dHtZbFFHO4TmFhhovOsISCOh/Jw59tk16ofXUD0KG0w2qrBaHnzsqEKpuOvw8b/2bBOs3
        y3TEwR4QQxMY5A6NxyAng
X-Received: by 2002:ad4:5f87:0:b0:63c:f852:aa3a with SMTP id jp7-20020ad45f87000000b0063cf852aa3amr3922484qvb.4.1691704101698;
        Thu, 10 Aug 2023 14:48:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKQjfkLEtHK4TgBS5tvBCJy85maQwvYfEU+5Pht7gJJOOJ/2gXOWy0MnGa+bfiZMEcuCLmRw==
X-Received: by 2002:ad4:5f87:0:b0:63c:f852:aa3a with SMTP id jp7-20020ad45f87000000b0063cf852aa3amr3922466qvb.4.1691704101441;
        Thu, 10 Aug 2023 14:48:21 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id b20-20020a0cf054000000b0062ffec0a18esm758095qvl.84.2023.08.10.14.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 14:48:20 -0700 (PDT)
Date:   Thu, 10 Aug 2023 17:48:19 -0400
From:   Peter Xu <peterx@redhat.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Hugh Dickins <hughd@google.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Yin Fengwei <fengwei.yin@intel.com>,
        Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH mm-unstable v1] mm: add a total mapcount for large folios
Message-ID: <ZNVbIyHcqeKUDuSg@x1n>
References: <20230809083256.699513-1-david@redhat.com>
 <ZNQD4pxo8svpGmvX@x1n>
 <ZNRYx8GhYftE4Xeb@casper.infradead.org>
 <7e31254d-8889-7e79-50e1-2630bd493d59@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7e31254d-8889-7e79-50e1-2630bd493d59@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 10, 2023 at 10:37:04AM +0200, David Hildenbrand wrote:
> On 10.08.23 05:25, Matthew Wilcox wrote:
> > On Wed, Aug 09, 2023 at 05:23:46PM -0400, Peter Xu wrote:
> > > Hi, David,
> > > 
> > > Some pure questions below..
> > > 
> > > On Wed, Aug 09, 2023 at 10:32:56AM +0200, David Hildenbrand wrote:
> > > > Let's track the total mapcount for all large folios in the first subpage.
> > > > 
> > > > The total mapcount is what we actually want to know in folio_mapcount()
> > > > and it is also sufficient for implementing folio_mapped(). This also
> > > > gets rid of any "raceiness" concerns as expressed in
> > > > folio_total_mapcount().
> > > 
> > > Any more information for that "raciness" described here?
> > 
> > UTSL.
> > 
> >          /*
> >           * Add all the PTE mappings of those pages mapped by PTE.
> >           * Limit the loop to folio_nr_pages_mapped()?
> >           * Perhaps: given all the raciness, that may be a good or a bad idea.
> >           */
> > 
> 
> Yes, that comment from Hugh primarily discusses how we could possibly
> optimize the loop, and if relying on folio_nr_pages_mapped() to reduce the
> iterations would be racy. As far as I can see, there are cases where "it
> would be certainly a bad idea" :)

Is the race described about mapcount being changed right after it's read?
Are you aware of anything specific that will be broken, and will be fixed
with this patch?

I assume mapcount==1 will be very special in this case when e.g. holding a
pgtable lock, other than that I won't be surprised if mapcount changes in
parallel.  But I must confess I don't really have any thorough digests on
this whole matter.

> 
> 
> In the other comment in that function, it's also made clear what the
> traditional behavior with PMD-mappable THP was "In the common case, avoid
> the loop when no pages mapped by PTE", which will no longer hold with
> sub-PMD THP.

Having a total mapcount does sound helpful if partial folio is common
indeed.

I'm curious whether that'll be so common after the large anon folio work -
isn't it be sad if partial folio will be a norm?  It sounds to me that's
the case when small page sizes should be used.. and it's prone to waste?

-- 
Peter Xu

