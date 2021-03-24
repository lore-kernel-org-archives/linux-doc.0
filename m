Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55946C433C1
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 08:57:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F291619F7
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 08:57:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbhCXI4q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Mar 2021 04:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbhCXI4l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Mar 2021 04:56:41 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F81C061763;
        Wed, 24 Mar 2021 01:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=sxMaufYpsMH1tSKVYzmjq7TKO69dlBCLc6KIS4uiWrM=; b=YGogS5fmhYxLcwp7a89qC+hrAm
        ut9ckvDAEh+IYHxIFihwfU8hDhE/BdIE06tvUytzKbATrCo/Jbr8JJGtvnqkwGqjZGoYoYLbuA/vp
        ZAAwIGPNJz2ZG6xpQZdw6SXs4XEHqlDNVyMRqEx8ubS1Y8ogiFzo/ZF4p1dtjaTFm6yqNmNI0hbHh
        NRLqF8DrTVictdd9G4/JlEgae+2oeGtXdl7cAyDTPzUOM5X2Mj+I2sxku/rrDzvlgFEj3k9Xx4yVQ
        YbrTmU9SQIT1rJ1U9g5NmvBYpO7629Kg/t+jl0996d5uCXoA+8+hPQns55mZrve3+RG/EZ0YfWORa
        Exwou4Bw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lOzIl-00BAWW-2w; Wed, 24 Mar 2021 08:55:50 +0000
Date:   Wed, 24 Mar 2021 08:55:43 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Baoquan He <bhe@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Young <dyoung@redhat.com>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Ingo Molnar <mingo@redhat.com>, Jessica Yu <jeyu@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>, kexec@lists.infradead.org,
        Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sasha Levin <sashal@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vivek Goyal <vgoyal@redhat.com>, Will Deacon <will@kernel.org>,
        x86@kernel.org
Subject: Re: [PATCH v2 00/12] Add build ID to stacktraces
Message-ID: <20210324085543.GA2660708@infradead.org>
References: <20210324020443.1815557-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324020443.1815557-1-swboyd@chromium.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 23, 2021 at 07:04:31PM -0700, Stephen Boyd wrote:
>  x5 : 0000000000000000 x4 : 0000000000000001
>  x3 : 0000000000000008 x2 : ffffff93fef25a70
>  x1 : ffffff93fef15788 x0 : ffffffe3622352e0
>  Call trace:
>   lkdtm_WARNING+0x28/0x30 [lkdtm ed5019fdf5e53be37cb1ba7899292d7e143b259e]
>   direct_entry+0x16c/0x1b4 [lkdtm ed5019fdf5e53be37cb1ba7899292d7e143b259e]

Yikes.  No, please do not make the backtraces a complete mess for
something that serves absolutely no need.
