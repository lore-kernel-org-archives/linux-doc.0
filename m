Return-Path: <SRS0=Qf3S=CX=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACDAC43461
	for <linux-doc@archiver.kernel.org>; Mon, 14 Sep 2020 18:19:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAB85214F1
	for <linux-doc@archiver.kernel.org>; Mon, 14 Sep 2020 18:19:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jRlCDdAv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgINSTF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Sep 2020 14:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgINSTE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Sep 2020 14:19:04 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E99C06174A;
        Mon, 14 Sep 2020 11:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=0h0qzGfWwcJz7dSvOr1OATXb4JiKOBYywR9EhDga3jU=; b=jRlCDdAvErBeT3WS8IyZvM/JaR
        oXGoDwoEwWsjFNf/0V0EBc8unYyFDmQtQt4qzAMLEIGgjdpaHnfTxHVVnn8gQWU67yBQsTn3kjnFR
        hadxCfK/J72132ZaJkddvmU6B139ss0VizjUXhK3JNZz5cbYjecPaKa5rQSMh/Lp5kgsI2YEjAwPr
        8huS93cVSXXRh1iRo7WzTDZNXLhCTSKuFrYmwe1vBwOaeYuN5tLKG5tPxmPQmMQBIMQyzXU7OdlHA
        q7LD4M8uya1qPunScqJehQnsfFHcGw4bsdmSgwFwqg7O6JXG7M/ctPVwhyJ2e0xiZ5l9s+TpS0Gtn
        lMAxpcEw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kHt43-0007ox-6P; Mon, 14 Sep 2020 18:18:55 +0000
Date:   Mon, 14 Sep 2020 19:18:55 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Wang Qing <wangqing@vivo.com>, Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: zh_CN: add translatation for ext3.rst
Message-ID: <20200914181855.GU6583@casper.infradead.org>
References: <1600085362-2157-1-git-send-email-wangqing@vivo.com>
 <20200914121053.1a0e1efc@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914121053.1a0e1efc@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 14, 2020 at 12:10:53PM -0600, Jonathan Corbet wrote:
> On Mon, 14 Sep 2020 20:08:32 +0800
> Wang Qing <wangqing@vivo.com> wrote:
> > Translate Documentation/filesystems/ext3.rst into Chinese.
> 
> Thanks for your patch, I appreciate work on adding translations to the
> kernel docs.  That said...

Shouldn't we rather delete ext3.rst?  The filesystem has been gone for
five years, and if people are going to put work into the documentation,
I'd rather they put work into documentation that means something.
