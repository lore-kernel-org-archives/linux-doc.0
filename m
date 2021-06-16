Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEF5C48BE6
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 05:10:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03B03613CD
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 05:10:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhFPFM1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Jun 2021 01:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbhFPFM1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jun 2021 01:12:27 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD61C061574;
        Tue, 15 Jun 2021 22:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Rl/2xWe1t3fGA2tDzacpIzmBMWDTxaoSCgBv24N1Mms=; b=PLlDVvJ7YOqYoyxO8Nd8QMJyAa
        Ne0IYM4CugV05Vtu3A5E+3pJ7x+XtCoxDfBJNl+UM/QY98xkJl7rnPc8HPasHWdnYU0yHbWyGsu/S
        bjLRnen+2Uie3qiAgEHH7qmF8y+qzi/TgcNeBPLFOEsUWOjwSbFORhOA63QcjyNnmYqcUkYMfBG0U
        FzBVUO0UnvETeTSDlg2wU+QETNeUzvNSl3ejiAb80ajALIv/8VhnCrtyLHt+i4Y4J5xpGjbOiMasf
        SR0sb5q1eaP4nUvwWKwgK/xaB07RVPogTcUi67NxD6GwfGO2Y5xaa9uN/MJg1WpgMYJxPaxgcmIFp
        m8cwjCWQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ltNna-007cSD-3F; Wed, 16 Jun 2021 05:09:13 +0000
Date:   Wed, 16 Jun 2021 06:09:10 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Jia He <justin.he@arm.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Eric Biggers <ebiggers@google.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RFCv4 0/4] make '%pD' print full path for file
Message-ID: <YMmHdlJBnTBKUjeZ@infradead.org>
References: <20210615154952.2744-1-justin.he@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615154952.2744-1-justin.he@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Btw, please throw in a patch to convert iomap_swapfile_fail over to
the new %pD as that started the whole flamewar^H^H^H^H^H^H^Hdiscussion.
