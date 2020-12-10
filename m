Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F16C4167B
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 20:10:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83D9423A33
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 20:10:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390321AbgLJUKX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 15:10:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390271AbgLJUKP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 15:10:15 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE8CC0613CF;
        Thu, 10 Dec 2020 12:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Sehsw6exza7TGUx9pa0H+ZJZe/39xW3MPwdPaMIB8IM=; b=iuwStN2Ub5o5LTf7qdabdW1yPY
        oQYnwzh9TYsgfnkC62IkXtcIy388sPAoonMJ9zGsSvEfP97p/mamPVnPSQHF2kmh49+7z49GtgDwP
        MYz+ID8/DV1b4s5MJK0WpURqCj21tg7LxCA1+A7BvrXHBf2pgM0scuCXDBPo2OIquogoj4XFxPsXg
        7IpKpRi716nWeLQgysauiOaXtcj1zaehFVdSFoztMl+94vPvNvQFpVAdMRcRnOI9w7k4o9Qu7O6iQ
        rUHacnCsnHs7W3GjKeO4PPoICDHhHVzSIx0fdzI5eUF1VHt+ofiOmoJ3ex2DUflxSnDqH6OIgZoKS
        BfsNEhGA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1knSFm-0001QR-AL; Thu, 10 Dec 2020 20:09:30 +0000
Date:   Thu, 10 Dec 2020 20:09:30 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Joe Perches <joe@perches.com>
Cc:     Christoph Hellwig <hch@lst.de>, apw@canonical.com,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
        linux-doc <linux-doc@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH] checkpatch: make the line length warnings match the
 coding style document
Message-ID: <20201210200930.GB7338@casper.infradead.org>
References: <20201210082251.2717564-1-hch@lst.de>
 <c3f1d9de2e5a61588f64e69a1309968d84a2dd12.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3f1d9de2e5a61588f64e69a1309968d84a2dd12.camel@perches.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 10, 2020 at 12:05:04PM -0800, Joe Perches wrote:
> Also, given the ever increasing average identifier length, strict
> adherence to 80 columns is sometimes just not possible without silly
> visual gymnastics.  The kernel now has quite a lot of 30+ character
> length function names, constants, and structs.

maybe checkpatch should warn for identifiers that are 30+ characters
long?  address the problem at its source ..
