Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AB1EB64DD
	for <linux-doc@archiver.kernel.org>; Thu, 10 Aug 2023 03:26:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjHJD0V (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Aug 2023 23:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbjHJD0U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Aug 2023 23:26:20 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 552782680;
        Wed,  9 Aug 2023 20:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=P7W0E4TOXYMRkvsXug7Xm14Pybcj+N+axUI6XlnIjkk=; b=YIH9KwkqGkpV/9Akin4deBs9R2
        ERJFx5BVrR98PZcmIoDHvKVRGjJIqNc4ReBwxpqbjN+zjaZlZ4ZVZrSwl3P8OcOz51eFXXkHaH8LS
        lZlTWNSJtAZ2CIdDlSS7r63Hk8jPTUHxbwnEpdcdPJg8qg6TzBPynzIjcpxYi3d9clt3mgn0bVlHm
        f6wjmtxEPOAjB9sxk+hu1QN7ZtYiayMH4tVHPB1BwElAPIsBJeo7Of/SC8Hn5LdrbmHnRoDnRHmrA
        4ndkayuV2HrTH4NBNkbKv2cYulqvo++Gt/F1z43PcejpMp1FNjKaxRLytSDgtTN5vHr9QdlnkV+C4
        kkS2cDsw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qTwJD-00A8C9-ED; Thu, 10 Aug 2023 03:25:59 +0000
Date:   Thu, 10 Aug 2023 04:25:59 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Peter Xu <peterx@redhat.com>
Cc:     David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Hugh Dickins <hughd@google.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Yin Fengwei <fengwei.yin@intel.com>,
        Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH mm-unstable v1] mm: add a total mapcount for large folios
Message-ID: <ZNRYx8GhYftE4Xeb@casper.infradead.org>
References: <20230809083256.699513-1-david@redhat.com>
 <ZNQD4pxo8svpGmvX@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNQD4pxo8svpGmvX@x1n>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 09, 2023 at 05:23:46PM -0400, Peter Xu wrote:
> Hi, David,
> 
> Some pure questions below..
> 
> On Wed, Aug 09, 2023 at 10:32:56AM +0200, David Hildenbrand wrote:
> > Let's track the total mapcount for all large folios in the first subpage.
> > 
> > The total mapcount is what we actually want to know in folio_mapcount()
> > and it is also sufficient for implementing folio_mapped(). This also
> > gets rid of any "raceiness" concerns as expressed in
> > folio_total_mapcount().
> 
> Any more information for that "raciness" described here?

UTSL.

        /*
         * Add all the PTE mappings of those pages mapped by PTE.
         * Limit the loop to folio_nr_pages_mapped()?
         * Perhaps: given all the raciness, that may be a good or a bad idea.
         */

