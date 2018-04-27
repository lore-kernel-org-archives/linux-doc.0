Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0B1E17DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 13:21:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758128AbeD0NVS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 09:21:18 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56882 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758117AbeD0NVR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 09:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6t6ET7zOmu7tRVkByg1xGC8CH9GLBfgRA/vcsbrHhpU=; b=ifGuFWhMK2lM8HDAIpAGRGD6V
        ynMXhScOQQBIu7wcxpVBC5AFSXKu2YeLZQJolZJe4qGaQ0vXslFEhPrb6VSMLVCPr5LMQLSa1C+7u
        sEMlrIxRUBUdCGoBB0ThXVykvw1abiUewD8+u79PAC2nKZ+Q9xv7LXXkxveG2ijLFBQ3RTrPQ2SjW
        U8amD+PhPKSFZBGGF8aILZkviII0MGZJYCc6GIcsjSqctpFGmBmf/yMjcEx8tJe2OAGOTpohaMKhi
        VB8wxsPfZmz5USlDAiC4MBiqt8RkN+1XAQ3Dt+W14ByfCJcKuHG7G3mPcR4Xo5S2KBlhtqbKpMuKn
        htAhgp4kw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fC3JM-0001EU-U3; Fri, 27 Apr 2018 13:21:16 +0000
Date:   Fri, 27 Apr 2018 06:21:16 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] documentation: core-api: rearrange a few kernel-api
 chapters and sections
Message-ID: <20180427132116.GC8161@bombadil.infradead.org>
References: <f05c8785-e9e1-0a5e-b362-50669b75d80b@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f05c8785-e9e1-0a5e-b362-50669b75d80b@infradead.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 26, 2018 at 06:11:02PM -0700, Randy Dunlap wrote:
> Rearrange some kernel-api chapters and sections to group them
> together better.
> 
> - move Bit Operations from Basic C Library Functions to Basic
>   Kernel Library Functions (now adjacent to Bitmap Operations since
>   they are not typical C library functions)
> 
> - move Sorting from Math Functions to Basic Kernel Library Functions
>   since sort functions are more Basic than Math Functions
> 
> - move Text Searching from Math Functions to Basic Kernel Library
>   Functions (keep Sorting and Searching close to each other)
> 
> - combine CRC and Math functions together into the (newly named)
>   CRC and Math Functions chapter
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

This all makes sense to me.

Acked-by: Matthew Wilcox <mawilcox@microsoft.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
