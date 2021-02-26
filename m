Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84542C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 09:16:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EA5864EF0
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 09:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbhBZJQD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Feb 2021 04:16:03 -0500
Received: from mx2.suse.de ([195.135.220.15]:45686 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230347AbhBZJOE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 26 Feb 2021 04:14:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1614330798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NpmD/XyqdVk2IjO45iWPEf2k/UHGXha3vB3YpbyX1Z8=;
        b=X0+bUqcflQ+ezhQYdOg3TH+dvESbYpmFuaUu49HKp1zP3i2u5fCjGHdUpL6+4udFWQbOUL
        HwR5aQ03Wozlqts8958vRBGcyEYQm9vxg44uLcMN/wowtoZHCYxVf/lDa7I6Kdiu0r0fCI
        FxgVwooJeM1jvkv4RH0hGqcokvU5vhs=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id F134CAC6E;
        Fri, 26 Feb 2021 09:13:17 +0000 (UTC)
Date:   Fri, 26 Feb 2021 10:13:17 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Timur Tabi <timur@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Marco Elver <elver@google.com>,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] printk: clarify the documentation for plain pointer
 printing
Message-ID: <YDi7rQKR/rQinyTH@alley>
References: <20210225164639.27212-1-vbabka@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225164639.27212-1-vbabka@suse.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu 2021-02-25 17:46:39, Vlastimil Babka wrote:
> We have several modifiers for plain pointers (%p, %px and %pK) and now also
> the no_hash_pointers boot parameter. The documentation should help to choose
> which variant to use. Importantly, we should discourage %px in favour of %p
> (with the new boot parameter when debugging), and stress that %pK should be
> only used for procfs and similar files, not dmesg buffer. This patch clarifies
> the documentation in that regard.
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Nice!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
