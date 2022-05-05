Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE10C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  5 May 2022 04:49:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236408AbiEEExM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 May 2022 00:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235492AbiEEExJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 May 2022 00:53:09 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB15C3F88A
        for <linux-doc@vger.kernel.org>; Wed,  4 May 2022 21:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=kLCBVCmT5KkJQLwDEkVNu+Ri0GbKXrf5Pqq5oqmV3ZA=; b=pPEWQrlw+uQQXrDZm1Yp/VMtIA
        M8BXeLRh1y9vEGPoY3gqZzUXDQhjtw08XRD6mN3YW+/wpu8XLz0lFp9Ull5MFSdal4u290x2H+4S+
        goFz7i/iF+BdpWaQb48QH0JHMd8U6tG7qUWm/sxO4z699Od8IEiBlE6ruBm76uKrJ3Hi71JUc8z/9
        ZHg9nL3cGyOmZxgBL34bMKmN97N93jm6tFx0NzzV649CGQOaZH2nwcIN7JqgFxi3F4CF1nysk9Sjy
        IUk8sGWbxjHYXpKh1A4lwb/33Zov0k8pOAkEPdwlPWxu7KmB8moH1h54nqynaaLppyf/aEhwx6FfT
        C4xCR9Eg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nmTQa-00HGql-7Y; Thu, 05 May 2022 04:49:24 +0000
Date:   Thu, 5 May 2022 05:49:24 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] mm,doc: Add new documentation structure
Message-ID: <YnNXVAr5RFtoA8Y3@casper.infradead.org>
References: <20220503063032.3680308-1-willy@infradead.org>
 <20c73284-66e5-8e3a-aa78-01f982720aea@nvidia.com>
 <YnLiKnVdBFYLtCJe@casper.infradead.org>
 <7628c3d7-9b5a-f3b1-1a05-a348e701c171@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7628c3d7-9b5a-f3b1-1a05-a348e701c171@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 04, 2022 at 09:43:04PM -0700, Randy Dunlap wrote:
> 
> 
> On 5/4/22 13:29, Matthew Wilcox wrote:
> > On Wed, May 04, 2022 at 06:12:09AM -0700, John Hubbard wrote:
> >> This needs to be properly merged with the existing index. Otherwise
> >> the result here is very confusing because there are two summaries
> >> and no explanation of what is going on here.
> >>
> >> If I get a moment today, I'll take a quick shot at at merging them,
> >> and post some suggestions here, but just wanted to point that out
> >> before this goes in as-is.
> > 
> > John and I have chatted to understand what he was getting at here,
> > but haven't had a chance to review this change in-person yet.
> > 
> > +++ b/Documentation/vm/index.rst
> > @@ -2,6 +2,9 @@
> >  Linux Memory Management Documentation
> >  =====================================
> > 
> > +Memory Management Guide
> > +=======================
> > +
> >  This is a guide to understanding the memory management subsystem
> >  of Linux.  If you are looking for advice on simply allocating memory,
> >  see the :ref:`memory_allocation`.  For controlling and tuning guides,
> > @@ -24,10 +27,14 @@ see the :doc:`admin guide <../admin-guide/mm/index>`.
> >     shmfs
> >     oom
> >  
> > -This is a collection of documents about the Linux memory management (mm)
> > -subsystem internals with different level of details ranging from notes and
> > -mailing list responses for elaborating descriptions of data structures and
> > -algorithms.
> > +Legacy Documentation
> > +====================
> > +
> > +This is a collection of older documents about the Linux memory management
> > +(mm) subsystem internals with different level of details ranging from
> 
> I prefer (MM).
> Otherwise LGTM.

Heh, I just moved that around; it's how it was before.  I have no
preference here, so I'll just change it to be the way you like it.
Thanks!
