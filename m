Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1C4C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 10:35:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 421AD60698
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 10:35:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhDSKfv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 06:35:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:51668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229537AbhDSKfu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Apr 2021 06:35:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C042A61166;
        Mon, 19 Apr 2021 10:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618828455;
        bh=x3qpL5c2x6AC1G6cAf8hh0pGiHggQ7osZn3E/d5QYMI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r3IHz8YWsF0Ua0bwxfM55rI+FrWNkfcwAUYD0+NzXflBNGUBzhYDGCUmTNikiLug6
         NJbVOjHVyw0nWL7UHsqt5WIdIeEFf4fVdIKGhgmSxWBU9tIHc67qDX2XB6/tMiCqGu
         hIFugWPAi+XQs5K9WGQotlpnAxC+w7SdyvmA/yOyqUKAO3cAkJkTxWEzTud1UNlMuW
         RAA0LJxYgy3PvGw196b5l2q3grFPwms86+oJy8/+8+oYOJOYqVjSOfbFCQmLH8Mluu
         ucgAeYdtkM5xxER3TRxc3XMnuuV3QYC1fZsixV9sfvObQUOkaknT0h+dligs0JHB2i
         yBxdgDMrM5yLQ==
Date:   Mon, 19 Apr 2021 12:34:09 +0200
From:   Jessica Yu <jeyu@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v4 05/13] module: Add printk formats to add module build
 ID to stacktraces
Message-ID: <YH1coYBRn3pNs4gu@gunter>
References: <20210410015300.3764485-1-swboyd@chromium.org>
 <20210410015300.3764485-6-swboyd@chromium.org>
 <YHg541E24iy5nddg@gunter>
 <161871075477.46595.10848605889976259732@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <161871075477.46595.10848605889976259732@swboyd.mtv.corp.google.com>
X-OS:   Linux gunter 5.11.6-1-default x86_64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

+++ Stephen Boyd [17/04/21 18:52 -0700]:
[snip]
>Sounds good. It means that some more ifdefs are probably required vs.
>making the array size be 0 when the config is disabled but that isn't a
>big problem for me. I'm reworking the code now and will test and then
>send v5 shortly. Thanks!

Great, thanks a lot Stephen!

Jessica
