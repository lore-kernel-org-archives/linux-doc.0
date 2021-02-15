Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65999C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 16:39:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27B8364DFF
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 16:39:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbhBOQim (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 11:38:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbhBOQho (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Feb 2021 11:37:44 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8EBAC0613D6
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 08:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=+s2h9rySWIXDHcSsGcn87PnJEK/rcMWhEdfpr62ddXo=; b=q1hmRNWp3yJ2/6jBAgX9YxSB/Z
        y6GEnYkpSPRrR6XHFZktRxrW+/cTqpaXCw4RSFrn/nUq2c3UPrAA5g6Vsy6IRdYEdiVVx3povu8qA
        d/loFxfqTdbCc5KS8UBytaVe2HI5drRWW6QIGhpJMB5wigP1IRhPV6tWKHC7HSkmIkRnPso5eHg2V
        +cxuFAGpq/E8+SS16BBLoBxQFqva3o2SSEUwQ38voG8Yx65zqPUSz6bU0Rw6/DIBQaB8EZwgnhvzL
        Bo5ze8+1a0oV/8h+RqvcYckpzx8e5SLce9EKkR/JbCnweh/FT+WIhIBsYtZGfD2UB/4U3zmg17rsB
        2qx8sSKA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lBgrp-00FnA1-MY; Mon, 15 Feb 2021 16:36:59 +0000
Date:   Mon, 15 Feb 2021 16:36:57 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Fix unaesthetic indentation
Message-ID: <20210215163657.GE2858050@casper.infradead.org>
References: <20210215161757.GD2858050@casper.infradead.org>
 <87k0r9mgt3.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k0r9mgt3.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 15, 2021 at 09:33:44AM -0700, Jonathan Corbet wrote:
> Matthew Wilcox <willy@infradead.org> writes:
> 
> > The current documentation build looks like this:
> >
> > $ make htmldocs
> >   SPHINX  htmldocs --> file:///home/willy/kernel/linux-next/Documentation/output
> > make[2]: Nothing to be done for 'html'.
> > WARNING: The kernel documentation build process
> >         support for Sphinx v3.0 and above is brand new. Be prepared for
> >         possible issues in the generated output.
> >         $
> >
> > That extra indentation before my next prompt isn't pretty.  This patch
> > fixes it, but I'm not a pythonista, and maybe there's a better way.
> >
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> >
> > diff --git a/Documentation/conf.py b/Documentation/conf.py
> > index 5bd45d5fb0a0..8a9ed3f29cd5 100644
> > --- a/Documentation/conf.py
> > +++ b/Documentation/conf.py
> > @@ -50,7 +50,7 @@ if major >= 3:
> >      sys.stderr.write('''WARNING: The kernel documentation build process
> >          support for Sphinx v3.0 and above is brand new. Be prepared for
> >          possible issues in the generated output.
> > -        ''')
> > +''')
> 
> The alternative would be:
> 
>           possible issues in the generated output.\n''')

Do you want me to submit a revised patch with that change?
