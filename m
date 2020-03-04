Return-Path: <SRS0=BeNN=4V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB9BC3F2D7
	for <linux-doc@archiver.kernel.org>; Wed,  4 Mar 2020 16:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43A8220674
	for <linux-doc@archiver.kernel.org>; Wed,  4 Mar 2020 16:57:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h8fJVp2S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbgCDQ5P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Mar 2020 11:57:15 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43117 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729436AbgCDQ5P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Mar 2020 11:57:15 -0500
Received: by mail-ot1-f66.google.com with SMTP id j5so2682523otn.10
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2020 08:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yur0Lyv+QJRNaR7D40FqUvoblidYiD7uzVtpeJGfpoE=;
        b=h8fJVp2SaF3A56yqOVd/mE3UUipG62giQzolZLRD+kOBXhfj5bja+6QKAMbrpZ9jW9
         cqLLDf11AYJqoChCP0MuTxzgXO3Ry+jbByGXkDv8CiuoAtn+X+agsiN0Eg0mM8ye/l5F
         pTBWyDI1m2CMuZLebNdA4R/oLl/BEcoUY+i9DwAfYMoQuEGSoa3iF0wgx/ICu5L2lTZl
         O85wMz4GqBg3OPZTxcNieibjBOHurx1sIrdiXlrN7nZ0BJZkBFbaQuVJJz+dYZVvacsc
         fXMcvSeklaI2PDY7z/T424kx6VSNEt7whxYviMYSnFyxGI7NroEjgMmfew9zbE80u7Zt
         R0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yur0Lyv+QJRNaR7D40FqUvoblidYiD7uzVtpeJGfpoE=;
        b=JkGoTXkIBk7UPjAuWk8OMTs6087YhrlakxTptdFCKZ8ZtEUfzT2F/BEP6YenJrAV3D
         2n9YJwpwrr64mpxQEXP2c1uUQCvtprygX5P/VbmdXNaJFxJiaf5aVIKBnYEE0B3Xzeh7
         xrmBpBhAJZtjyGRGXG5YPHuUwncMo5bKnzzjeS8BFFxTGH/BIKzdddvXrvDN3tgqkEtl
         oBktNAWmVxQ3H6RLYz3J5HE3CulLzP0EhePdjQ9qeMP6UvF0RVWbr1S9Fsgjg5vCetB8
         UEevIeMOt1LYqjpzmIiuQifsOS5pBdjIPrTgnknCrP6dLfJBNc+/15KtDZ7tO5JmsYcQ
         jaeQ==
X-Gm-Message-State: ANhLgQ2Pp4+u4AWzPQtMso62vF27vMlrM2zDk0gwF9xdPkXQLoufoAJi
        E98F2ybgSlQd0HLGl5tDJa8fjBi4atl4vRitvkdSwA==
X-Google-Smtp-Source: ADFU+vs12r4zQxfj9cL2WOtCruFuHlcQNcTHjfV5jcwryTDPR2pPlVweaPccG2PDWVxgEfMd8LA1M2zc1hl2WSrpanM=
X-Received: by 2002:a9d:68ce:: with SMTP id i14mr3218726oto.233.1583341034238;
 Wed, 04 Mar 2020 08:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20200304162541.46663-1-elver@google.com> <20200304162541.46663-2-elver@google.com>
 <1583340277.7365.153.camel@lca.pw>
In-Reply-To: <1583340277.7365.153.camel@lca.pw>
From:   Marco Elver <elver@google.com>
Date:   Wed, 4 Mar 2020 17:57:03 +0100
Message-ID: <CANpmjNPKjbCi=m+3Cqyhh9o5xrmLOzB6O48vtAP9KMsEsgzNrA@mail.gmail.com>
Subject: Re: [PATCH 2/3] kcsan: Update Documentation/dev-tools/kcsan.rst
To:     Qian Cai <cai@lca.pw>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 4 Mar 2020 at 17:44, Qian Cai <cai@lca.pw> wrote:
>
> On Wed, 2020-03-04 at 17:25 +0100, 'Marco Elver' via kasan-dev wrote:
> >  Selective analysis
> >  ~~~~~~~~~~~~~~~~~~
> > @@ -111,8 +107,8 @@ the below options are available:
> >
> >  * Disabling data race detection for entire functions can be accomplished by
> >    using the function attribute ``__no_kcsan`` (or ``__no_kcsan_or_inline`` for
> > -  ``__always_inline`` functions). To dynamically control for which functions
> > -  data races are reported, see the `debugfs`_ blacklist/whitelist feature.
> > +  ``__always_inline`` functions). To dynamically limit for which functions to
> > +  generate reports, see the `DebugFS interface`_ blacklist/whitelist feature.
>
> As mentioned in [1], do it worth mentioning "using __no_kcsan_or_inline for
> inline functions as well when CONFIG_OPTIMIZE_INLINING=y" ?
>
> [1] https://lore.kernel.org/lkml/E9162CDC-BBC5-4D69-87FB-C93AB8B3D581@lca.pw/

Strictly speaking it shouldn't be necessary. Only __always_inline is
incompatible with __no_kcsan.

AFAIK what you noticed is a bug with some versions of GCC. I think
with GCC >=9 and Clang there is no problem.

The bigger problem is turning a bunch of 'inline' functions into
'__always_inline' accidentally, that's why the text only mentions
'__no_kcsan_or_inline' for '__always_inline'. For extremely small
functions, that's probably ok, but it's not general advice we should
give for that reason.

I will try to write something about this here, but sadly there is no
clear rule for this until the misbehaving compilers are no longer
supported.

Thanks,
-- Marco
