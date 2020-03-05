Return-Path: <SRS0=ObY3=4W=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911F6C3F2D7
	for <linux-doc@archiver.kernel.org>; Thu,  5 Mar 2020 14:24:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 69E1B2073D
	for <linux-doc@archiver.kernel.org>; Thu,  5 Mar 2020 14:24:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OM4RnwdM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgCEOYw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Mar 2020 09:24:52 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44261 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbgCEOYw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Mar 2020 09:24:52 -0500
Received: by mail-oi1-f194.google.com with SMTP id d62so6082379oia.11
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2020 06:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WdOkNe1i6CaMq0tiqi6obtIyviMmK0f4VHBh6zrGclw=;
        b=OM4RnwdMX0NZkgJ/bEYRwZ4DEKC9CqL3GBqgB8jycaaqqfeXg4lCg8xta+B7KQUVGs
         6yn/PGd0NC3SFcK2Z4nefBFb4svzBNCUxxDuENwEjpAX0tDsxqDEdobHJxUBAZ9o4Y2F
         6xoEW56RCfHhbtG7zEVcrIUdAvz8z9XNfxAT0/n8b5u8bgWpLAgLnT7cORPAukLkjbq0
         DORieg5PQ+BpZ512yIPBK6NfXHcYzoue7gSMVLbEb454lIS6YUAA2xcu29HgTaT3Cwjr
         fAQBqGwylxeeR369m+wuS+ozCghE6Fbg2L0ccY6GE7oCyjYnUgDHPEAlUPFJIboW3og1
         INMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WdOkNe1i6CaMq0tiqi6obtIyviMmK0f4VHBh6zrGclw=;
        b=r6EFGdNoStyp+eg7AtOnb9G/033L8U/i2GYy9PXZp3+2FKramzbbPLnpggy280MKXa
         cvf6NqqoP1rDo2YNlu/OL4UVhMKw1ch10+H9BK40G/aao2V8j6BsOPLNy49asEzOMBdl
         Q3Ygw49XynYgh2d2KdPfZ6tq6oE7Me0umo6f9MjhPqdmKBgwVv7V1AUYgqlpjQo7kmOo
         CeO9j1qlkWPaUwNW/clUZpPLJZO4EKWZ7G2rSnysb6GYpklE+7EZpT9an1Fwysd030i+
         eiiT3wD1LGuxrD1ffMdZe1c9TZQn8940srM+KSLzA2lF6T72iZATsUmf+458uS76RxG+
         eedQ==
X-Gm-Message-State: ANhLgQ1FtFe6zjwygPbtStka7qTPxnLS+iVi1TvQkhYSHF8/lOmDotER
        +nC7ivydP5SHiKvG9kLNi8r3b5CtnZbcdeodRtD6ww==
X-Google-Smtp-Source: ADFU+vv1nKSBxduKwSixE/BNFAraPWGVbnVVEN4Un3kPQ+Lw1Agag1Q3554pmIcOe0gTV1JrFh4GOGs7fvc/1gSOfD0=
X-Received: by 2002:a05:6808:8d5:: with SMTP id k21mr5897489oij.121.1583418291263;
 Thu, 05 Mar 2020 06:24:51 -0800 (PST)
MIME-Version: 1.0
References: <20200304162541.46663-1-elver@google.com> <20200304162541.46663-2-elver@google.com>
 <1583340277.7365.153.camel@lca.pw> <CANpmjNPKjbCi=m+3Cqyhh9o5xrmLOzB6O48vtAP9KMsEsgzNrA@mail.gmail.com>
In-Reply-To: <CANpmjNPKjbCi=m+3Cqyhh9o5xrmLOzB6O48vtAP9KMsEsgzNrA@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Thu, 5 Mar 2020 15:24:39 +0100
Message-ID: <CANpmjNMXFyhA23WrTTAjzGcjvtXz-1y5DQi6a0xgSxzg_7bGEg@mail.gmail.com>
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

On Wed, 4 Mar 2020 at 17:57, Marco Elver <elver@google.com> wrote:
>
> On Wed, 4 Mar 2020 at 17:44, Qian Cai <cai@lca.pw> wrote:
> >
> > On Wed, 2020-03-04 at 17:25 +0100, 'Marco Elver' via kasan-dev wrote:
> > >  Selective analysis
> > >  ~~~~~~~~~~~~~~~~~~
> > > @@ -111,8 +107,8 @@ the below options are available:
> > >
> > >  * Disabling data race detection for entire functions can be accomplished by
> > >    using the function attribute ``__no_kcsan`` (or ``__no_kcsan_or_inline`` for
> > > -  ``__always_inline`` functions). To dynamically control for which functions
> > > -  data races are reported, see the `debugfs`_ blacklist/whitelist feature.
> > > +  ``__always_inline`` functions). To dynamically limit for which functions to
> > > +  generate reports, see the `DebugFS interface`_ blacklist/whitelist feature.
> >
> > As mentioned in [1], do it worth mentioning "using __no_kcsan_or_inline for
> > inline functions as well when CONFIG_OPTIMIZE_INLINING=y" ?
> >
> > [1] https://lore.kernel.org/lkml/E9162CDC-BBC5-4D69-87FB-C93AB8B3D581@lca.pw/
>
> Strictly speaking it shouldn't be necessary. Only __always_inline is
> incompatible with __no_kcsan.
>
> AFAIK what you noticed is a bug with some versions of GCC. I think
> with GCC >=9 and Clang there is no problem.
>
> The bigger problem is turning a bunch of 'inline' functions into
> '__always_inline' accidentally, that's why the text only mentions
> '__no_kcsan_or_inline' for '__always_inline'. For extremely small
> functions, that's probably ok, but it's not general advice we should
> give for that reason.
>
> I will try to write something about this here, but sadly there is no
> clear rule for this until the misbehaving compilers are no longer
> supported.

I've sent v2 of the comment/documentation update series:
   http://lkml.kernel.org/r/20200305142109.50945-1-elver@google.com
  (only this patch changed)

Please check it captures the current caveat around "__no_kcsan inline"
with old compilers.

Thank you,
-- Marco
