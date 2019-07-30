Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4DAF77D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Jul 2019 21:12:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387592AbfG3VMw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Jul 2019 17:12:52 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56302 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387589AbfG3VMv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jul 2019 17:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=AGT1mgQtN5O2bIid/hu8bvBZ4cnh5dILbEAlwsJ2UQI=; b=Y32wwVnvQptTDs1tFyneR3G+v
        mM09R9HulyVgjPBUUvr8xYdw0iAywC8XTUoto27LWdETdu6cMXiIEYMe6HAQN/M6gAQ/g2Cbg0yQn
        3fpFyyN23da2X4h3s6VHWClcpcdb//FHKWbceFK9m2xYm3qMoZrWqsXMCr49TGeDnr4W4PLH9dTan
        SaLXDygYI/LTJprMuzBRgf1b65Jdq6py0lYFyIqDC5qTvndXNd6MonX3+Ce0RwLXGoEx7Lptycoph
        L+ayjFvfARUkUtE9FuBke2CMMTzM19vXEJoEO2SWaqSEcu7Lk5tIISOeM9i3F1mZVFuhvjUD/rKCw
        86w0BqZoQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hsZQQ-00076B-UB; Tue, 30 Jul 2019 21:12:50 +0000
Date:   Tue, 30 Jul 2019 14:12:50 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Tri Vo <trong@android.com>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] idr: Document calling context for IDA APIs mustn't use
 locks
Message-ID: <20190730211250.GD4700@bombadil.infradead.org>
References: <20190730210752.157700-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730210752.157700-1-swboyd@chromium.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 30, 2019 at 02:07:52PM -0700, Stephen Boyd wrote:
> The documentation for these functions indicates that callers don't need
> to hold a lock while calling them, but that documentation is only in one
> place under "IDA Usage". Let's state the same information on each IDA
> function so that it's clear what the calling context requires.
> Furthermore, let's document ida_simple_get() with the same information
> so that callers know how this API works.

I don't want people to use ida_simple_get() any more.  Use ida_alloc()
instead.

> - * Context: Any context.
> + * Context: Any context. It is safe to call this function without
> + * synchronisation in your code.

I prefer "without locking" to "without synchronisation" ...

