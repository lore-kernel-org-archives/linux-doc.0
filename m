Return-Path: <SRS0=DBCI=DP=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F47EC4363D
	for <linux-doc@archiver.kernel.org>; Thu,  8 Oct 2020 02:47:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C7782145D
	for <linux-doc@archiver.kernel.org>; Thu,  8 Oct 2020 02:47:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="r4wcMIOi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgJHCrR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Oct 2020 22:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728209AbgJHCrR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Oct 2020 22:47:17 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646E1C061755;
        Wed,  7 Oct 2020 19:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=rrnmw/1AqLnfIB4Al9wZnYMvqYnWVlZSjEgeVO7+Jdo=; b=r4wcMIOizMp5uMKfjPrjz6gf4F
        ZhYTebc1UwisNEY7lCxt3SneN2BKAG+k9jaLelDZhLgmkUpoMd/PtuYgKf+APR/VzjlQ05+W4USEy
        W2kbnik33iJOmqQkXiiSP9GlyZs/eisRO3tSAD8QgyO2OXAmhH9tuv70etRrNw/r+qPzvRYWVS6U8
        lNo139eDM8wkD3lBugEsQKO/wFwfstVvxIreqsnusxAxTDqtwGDekvqz1JKjlWhGnwmp4UuJ51jei
        lh1ifwGWnqAxWNQvLhzt1Yl/5R69OlSkfX2nmDiRvfYWT7/6ZgnBzY9Lq2Eo2MQ+p+NA8Wy+OdKnL
        7tgWav5A==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kQLxS-0004h6-O2; Thu, 08 Oct 2020 02:47:06 +0000
Date:   Thu, 8 Oct 2020 03:47:06 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado 
        <nfraprado@protonmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Subject: Re: [PATCH] docs: Make automarkup ready for Sphinx 3.1+
Message-ID: <20201008024706.GZ20115@casper.infradead.org>
References: <C674RBXSO9XN.1LXXU71QQNTF1@ArchWay>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C674RBXSO9XN.1LXXU71QQNTF1@ArchWay>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 08, 2020 at 02:15:24AM +0000, Nícolas F. R. A. Prado wrote:
> > I have a feature request ... could you automarkup NULL as being
> > :c:macro?
> > Or maybe just anything matching \<[[:upper:]_[:digit:]]*\>
> > (i may have my regex syntax confused ... a word composed of any
> > arrangement of upper-case, digits and underscores.)
> 
> I think what you are suggesting are two separate things.
> 
> For NULL, what you're interested in is that it appears in a monospaced font, as
> if written ``NULL``, right? As I don't think a cross-reference to "the NULL
> macro definition" would make much sense.
> 
> While "anything containing only upper-case, digits and underscores" would
> actually be for cross-referencing to the definition of the macro symbol in
> question, right?

Well, maybe!  What I'd really like is to remove all the markup from
xarray.rst.  Jon managed to get rid of most of it with the (), but
there's still markup on:

LONG_MAX
NULL
-EBUSY
true
XA_MARK_[012]
XA_FLAGS_*
ENOMEM
EINVAL

I'm not sure there's much that automarkup can do about ``true``, but all
the others fit the all-caps-and-underscore-and-digits pattern.

I don't know how much we want errnos to link to anything in particular.
So maybe split these into 'well-known' (eg defined by ANSI C or POSIX)
definitions and things which are local macros:

LONG_MAX
NULL
-EBUSY
ENOMEM
EINVAL

vs

XA_MARK_[012]
XA_FLAGS_*

I'm willing to add more inline kernel-doc to get this to work better.
Or even convert #defines to enums ... whatever gets this working better.

> At the moment, this automarkup script is being used only for cross-referencing,
> but it is indeed a generic automarkup script, and could be used for the
> formatting of NULL.  But we also can't just make every upper-case word written
> in monospaced font, as that doesn't always makes sense.
> 
> So if I understood your two requests correctly, I think we could:
> 1. Always automatically format NULL using a literal ``.
> 2. Try to cross-reference every upper-case word with the macro definition using
> :c:macro, but if the cross-reference doesn't exist, format it normally, since
> it's just normal text (this is what we're doing for C references at the moment).
> 
> What do you think?

I think this works well, except that we need to match not just NULL
but other well-known ANSI/POSIX keywords.

Thanks for entertaining this!
