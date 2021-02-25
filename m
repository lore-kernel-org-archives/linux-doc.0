Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE5EC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 25 Feb 2021 16:55:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23EDA64F19
	for <linux-doc@archiver.kernel.org>; Thu, 25 Feb 2021 16:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbhBYQzk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Feb 2021 11:55:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233814AbhBYQyI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Feb 2021 11:54:08 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6814EC061756;
        Thu, 25 Feb 2021 08:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ysyh0gCxVYwTqrOSb7HcOyTTk7+WIfYlDiJJKsaPQH0=; b=rwEtspEnD1gLgieFNTr1IzwMcY
        kX8wrFzDT0biKQuamhEUbg7ixJCY9sxXNCnV5TpT61yI0p8dQQvCNI0b0H9Go+8NIVYZk/NYz4DI1
        IY7/ma6ja1jEgmWtB9Y/fgJrCIx0aMfVrCD2J4QKKh8bW2xESGj065Xme6sEIlM/rof5cFUiThFnn
        Rjy6dldB7DLeH3sA/cPTvg53r7NdtGvsbwK0UDWDcEttxlSb88cTYhiFQbBKbvaL6JRUVx60GmQW8
        mtNfJ/eigDYMHrZ32XGjKQk/jHxO0naeaFPoQkkM83CJ0Qf22+n4Retp5SGw12Ps4JCw+pgj00RZD
        NUcXZnvg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lFJsE-00Avfq-JK; Thu, 25 Feb 2021 16:52:23 +0000
Date:   Thu, 25 Feb 2021 16:52:22 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Timur Tabi <timur@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Marco Elver <elver@google.com>
Subject: Re: [PATCH] printk: clarify the documentation for plain pointer
 printing
Message-ID: <20210225165222.GA2858050@casper.infradead.org>
References: <20210225164639.27212-1-vbabka@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225164639.27212-1-vbabka@suse.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 25, 2021 at 05:46:39PM +0100, Vlastimil Babka wrote:
> We have several modifiers for plain pointers (%p, %px and %pK) and now also
> the no_hash_pointers boot parameter. The documentation should help to choose
> which variant to use. Importantly, we should discourage %px in favour of %p
> (with the new boot parameter when debugging), and stress that %pK should be
> only used for procfs and similar files, not dmesg buffer. This patch clarifies
> the documentation in that regard.
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Really nice job.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
