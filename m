Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F330CC4332F
	for <linux-doc@archiver.kernel.org>; Tue,  8 Nov 2022 17:13:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234092AbiKHRNe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Nov 2022 12:13:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234402AbiKHRNd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 12:13:33 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A81D11F
        for <linux-doc@vger.kernel.org>; Tue,  8 Nov 2022 09:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=TwoxAAhMqjnSMAjXp8FcGGcQyEIzv9Y4WU/7rKvG91A=; b=CzsfzkYV35VsLg8mZymf8jy6Nu
        EhyniGch5LGnZKeLPZS74ehfuXxKpIVLzEw3KKUCXnvUqjyDlx8cONBoTYznSu6VMd2lWfJbfKPHV
        MsHdrVhC45mPitBK8kIDORBmpgv8bMhFAwB9e0Jx3c/S/B367I6Lw7bGrlPGQ+58pDNimBgImxWaU
        Vb1SZiCwC7PUIkXqBzR6NeeyXLu7XjaFZBAS3zBgUyb4wkdH3oBWRBocTbiCM9bDFgw4exnpCUzgK
        jZ5o8REvoR0g+1RJ3es7VLKh8yV43/ouNcYmNrHISgiZ0UCGJJGiRFUptCuQe7Q6N/FMjAcwnp2iY
        8iJS8WAA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1osSAC-00ASIP-66; Tue, 08 Nov 2022 17:13:28 +0000
Date:   Tue, 8 Nov 2022 17:13:28 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] scripts/kernel-doc: support EXPORT_SYMBOL_NS_GPL() with
 -export
Message-ID: <Y2qOOLDudCnXmz5S@casper.infradead.org>
References: <0-v1-c80e152ce63b+12-kdoc_export_ns_jgg@nvidia.com>
 <Y2p01rcfyDfIqufZ@casper.infradead.org>
 <Y2qB/TkNvPInZnY4@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2qB/TkNvPInZnY4@nvidia.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 08, 2022 at 12:21:17PM -0400, Jason Gunthorpe wrote:
> On Tue, Nov 08, 2022 at 03:25:10PM +0000, Matthew Wilcox wrote:
> > On Tue, Nov 08, 2022 at 11:02:35AM -0400, Jason Gunthorpe wrote:
> > > (I don't know perl at all so happy to replace this with something more elegant)
> > >  my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
> > > +my $export_symbol_ns = '^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,\s*\w+\)\s*;';
> > 
> > How about:
> > 
> > -my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
> > +my $export_symbol = '^\s*EXPORT_SYMBOL(_NS)?(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
> > 
> > Not them i'm a perlite either, but this is just a regexp.
> 
> I started like that, but the target text looks like this:
> 
> EXPORT_SYMBOL_NS_GPL(iommufd_access_destroy, IOMMUFD);
> 
> And the (\w+) capture should only pick "iommufd_access_destroy", so
> the ideal regex does the ",\s*\w+)" part only if _NS was matched
> earlier.

Oh, right, I missed that part of the regex difference.  How about
terminating the match with [,)]?  ie:

+my $export_symbol = '^\s*EXPORT_SYMBOL(_NS)?(_GPL)?\s*\(\s*(\w+[,)]\s*\)\s*;';

