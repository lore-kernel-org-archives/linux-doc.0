Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B86DC0015E
	for <linux-doc@archiver.kernel.org>; Sun, 23 Jul 2023 01:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjGWB5F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 Jul 2023 21:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjGWB5E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Jul 2023 21:57:04 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C6981BE6;
        Sat, 22 Jul 2023 18:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=44TAO7fZz6hxR8n6K1VxaF5RLJ5K1lVta2e75naOYuI=; b=fd471AmZbL4iL4EAIRqJ6GRP4x
        1DRBJMV05Hv8AtPWVzmT5MKc2o9+fg/k5Tzv82JBd/Y4PwAOIreWpiNU03lRIyz+2opZg3LQ6mRW0
        AbfzfVl9af5hZ5ig33UqNxgBP0g6dVgv8QYoqMzcScH2CRzSHEU/qraRu4zwaoHUdWvhh3XPhsZ01
        Yd/8N0SkiwOOGKfBRGuMAOZluMw52E4zd3lRM/TVhuKIgdTiX9k6AWqOZRZWsnO6GIbFfEz/Zk1U4
        vHUH0/OHR6Q4StDW01CP6YIsl6DD0JU70A5nZG+/oAUnQYzix4NizMqw3+z7NDsx90DuW49x5222B
        TpnUF3+A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qNOL5-002bdT-7n; Sun, 23 Jul 2023 01:56:51 +0000
Date:   Sun, 23 Jul 2023 02:56:51 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Pasha Tatashin <pasha.tatashin@soleen.com>
Cc:     akpm@linux-foundation.org, corbet@lwn.net, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rick.p.edgecombe@intel.com
Subject: Re: [PATCH v2 1/3] mm/page_table_check: Do WARN_ON instead of BUG_ON
Message-ID: <ZLyI48BYnecaROmZ@casper.infradead.org>
References: <20230722231508.1030269-1-pasha.tatashin@soleen.com>
 <20230722231508.1030269-2-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230722231508.1030269-2-pasha.tatashin@soleen.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 22, 2023 at 11:15:06PM +0000, Pasha Tatashin wrote:
>  static struct page_table_check *get_page_table_check(struct page_ext *page_ext)
>  {
> -	BUG_ON(!page_ext);
> +	PAGE_TABLE_CHECK_WARN(!page_ext);
> +
>  	return (void *)(page_ext) + page_table_check_ops.offset;
>  }

[...]

> @@ -137,15 +144,15 @@ void __page_table_check_zero(struct page *page, unsigned int order)
>  	struct page_ext *page_ext;
>  	unsigned long i;
>  
> -	BUG_ON(PageSlab(page));
> +	PAGE_TABLE_CHECK_WARN(PageSlab(page));
>  
>  	page_ext = page_ext_get(page);
> -	BUG_ON(!page_ext);
> +	PAGE_TABLE_CHECK_WARN(!page_ext);
>  	for (i = 0; i < (1ul << order); i++) {
>  		struct page_table_check *ptc = get_page_table_check(page_ext);

Seems like we're going to warn about !page_ext twice?  Or more than
twice -- once per tail page?

But then we'll crash because page_ext was NULL and offset was small?
