Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D237C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 22:11:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349016AbiFCWLI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 18:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbiFCWLI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 18:11:08 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19AC82A722
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 15:11:04 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C5DF37DA;
        Fri,  3 Jun 2022 22:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C5DF37DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1654294263; bh=DdSWo2hOcVaQOzMXPNBpbbMkdy/UNVK1Yj05lZQKeFs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=GmyGnfqKvE71jKWTqy45Iy5hVvHYq9JAUbjFATSME4TFbzZxBeMuoUQT8BoPjaPYI
         Y7uJv8vjymvFH0tIknloFmftQh4Gmsczsa1b5nCLOy5C6YpyII+AMSq5T+GnX0Y4b9
         qkMRxcv947KDc1Erobxwm+JAobCZvmS5Nj19gpoh/v179JQiEUtA/GHpT/VqDizslD
         ISViBxQAZ8aSi9rYsGrwxmB+8Pce+824YIEUFnSz+iBy4fJd0pB+El9nbZyr8+GUrl
         hom4ztAPurSKS9Cf0/XngZJn8cu7aGFqw3cUs8VRictRK720/FbTRzB7lLxwpFJJ3G
         7U2h+Ffu9x9hQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Adam Turner <aaturnerpython@outlook.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Sphinx pre v3 -- removing support
In-Reply-To: <YponOKPBgE8pgBYD@casper.infradead.org>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <877d5xx1xo.fsf@meer.lwn.net> <YponOKPBgE8pgBYD@casper.infradead.org>
Date:   Fri, 03 Jun 2022 16:11:03 -0600
Message-ID: <87tu91ieiw.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Matthew Wilcox <willy@infradead.org> writes:

> There's a bug I've been meaning to track down & report where _some_ links
> are broken when building with the Sphinx natively installed on my system
> (Debian 4.3.2-1).  I haven't bothered because (a) life is short and (b)
> it's not affecting the kernel.org build.  If we're going to ask
> kernel.org to move to a newer version of Sphinx, we should make sure
> that the links won't be broken on whatever version we pick.
>
> An example:
> <span class=3D"kt"><span class=3D"pre">void</span></span><span class=3D"w=
"> </span><span class=3D"p"><span class=3D"pre">*</span></span><span class=
=3D"sig-name descname"><span class=3D"n"><span class=3D"pre">kmap_local_fol=
io</span></span></span><span class=3D"sig-paren">(</span><span class=3D"k">=
<span class=3D"pre">struct</span></span><span class=3D"w"> </span><a class=
=3D"reference internal" href=3D"#c.kmap_local_folio" title=3D"folio"><span =
class=3D"n"><span class=3D"pre">folio</span></span></a><span class=3D"w"> <=
/span><span class=3D"p"><span class=3D"pre">*</span></span><span class=3D"n=
"><span class=3D"pre">folio</span></span>, <span class=3D"n"><span class=3D=
"pre">size_t</span></span><span class=3D"w"> </span><span class=3D"n"><span=
 class=3D"pre">offset</span></span><span class=3D"sig-paren">)</span><a cla=
ss=3D"headerlink" href=3D"#c.kmap_local_folio" title=3D"Permalink to this d=
efinition">=C2=B6</a><br /></dt>
>
> Other than that being a big pile of html, that <a href> around 'folio'
> should be a link to struct folio and not back to the c.kmap_local_folio
> anchor.

This is almost certainly our bug, not something in Sphinx.

You can see what our kerneldoc script is generating with a simple:

  scripts/kernel-doc include/linux/highmem.h

Within the output, you'll find the markup for the function in question:

.. c:function:: void * kmap_local_folio (struct folio *folio, size_t offset)

   Map a page in this folio for temporary usage

I am thinking that our automarkup module is getting confused by the
'struct folio' in the prototype there; will try to dig further shortly.

Thanks,

jon
