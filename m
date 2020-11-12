Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE99FC2D0A3
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 12:36:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E5F22151B
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 12:36:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HySLG8oG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbgKLMg0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Nov 2020 07:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbgKLMgZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Nov 2020 07:36:25 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751DFC0613D1;
        Thu, 12 Nov 2020 04:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=g6afxEkv8w12stEwjzr1cdlVobcym1pwKNlZUj1XDDI=; b=HySLG8oG5PBpDqgMbgodtI5XFP
        ZiLbeKhp6CxbUCtFAQkAUFpwX/3QJAo9UdP7Mjvv8CximJI14Yqr9gMGYNligNGqV744l8WAfa0Rt
        v5ERD7tlkp4a+AdY6AGK1VqxlqTpNtIxTpX19N/4YYAmOslCEM0C6zQKpyz6ck+opsGmDLqAWCDaj
        CkoUJu79qHY/qkOBlsxcmK3NoG13it8mZbZJWH3PPaEUS9njqz4IXJVl125vZJ+kitgZ35zX4PDYh
        k0/3J9I6XtD/5QPnCO/GHaoICwZUfT84MImc4XgNiy7BDLXRuS9SldgyOBBEjPARtHaWnMTn3MkVs
        JPBIiRkA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kdBpt-0008Es-7g; Thu, 12 Nov 2020 12:36:21 +0000
Date:   Thu, 12 Nov 2020 12:36:21 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Greg KH <gregkh@linuxfoundation.org>, corbet@lwn.net,
        peterz@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] seqnum_ops: Introduce Sequence Number Ops
Message-ID: <20201112123621.GY17076@casper.infradead.org>
References: <cover.1605027593.git.skhan@linuxfoundation.org>
 <d265685c901ea81c83c18e218a29710317ab7670.1605027593.git.skhan@linuxfoundation.org>
 <X6r7BIG8JTUOLcY0@kroah.com>
 <X6r7Vl45bgGQiAD2@kroah.com>
 <202011101614.E7D880689@keescook>
 <3075a4fd-8615-1459-2b20-b7d9d2be34ff@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3075a4fd-8615-1459-2b20-b7d9d2be34ff@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 11, 2020 at 12:23:03PM -0700, Shuah Khan wrote:
> > Agreed: this is a clear wrapping sequence counter. It's only abuse would
> > be using it in a place where wrapping actually is _not_ safe. (bikeshed:
> > can we call it wrap_u32 and wrap_u64?)
> 
> Still like seqnum_ops.
> 
> There is seqcount_t in seqlock.h which is a totally different feature.

Yes, and that's why this new thing, whatever it is called should not
have the word "sequence" in it.  People will get it confused.  Also,
"ops" in Linux means "vector of methods", like a_ops, f_op, i_op, fl_ops.
