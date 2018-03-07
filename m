Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D1CDA7E686
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 23:14:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754981AbeCGXO0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 18:14:26 -0500
Received: from mail-ua0-f196.google.com ([209.85.217.196]:34318 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754975AbeCGXOZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Mar 2018 18:14:25 -0500
Received: by mail-ua0-f196.google.com with SMTP id m43so2682055uah.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Mar 2018 15:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=MFK8wB1IAOOFV4ANHaTa/EhS+6LTQz5ihz5SEVNSRJ4=;
        b=mU79a+Zs4mLECtyr0TjD6SRJwMjSOH9I5jQQDh0/FjgO2cmAE6fJzno/tz4EMY2Abg
         xvkTtwkjz96uhhhFseAMW/nuHWnOo1dth0QwK0JWkbSIR3YVJxZT1rpro6scM2jdh/lZ
         +8CzLibvyjebfc0DLF5cxXv1OxPKRTuKx3RLrutTnGl1mGZ99cgqRQDewcN3XrjkLCoW
         73/Utzx1od2Bj9U8aKG77S6zKyHswe5Pw9EYSdR6tf6lnb0bVUvHMnZA/kc6TV8WGajM
         eSVNpNxod3O0i1n8zmQ4UOVwIsYK11MXpwmjzR+kdYtkDDT29OaCsVecLblSuf+Fmmem
         uXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=MFK8wB1IAOOFV4ANHaTa/EhS+6LTQz5ihz5SEVNSRJ4=;
        b=P/ZDyO9O5sElk8DYqFkbR/zs1W8g1ixa7bvtUAiiy1g8J34z3LTr58vVyPOGuTUWLg
         OYNGcwkAW02M5Hntj6YiYrOqAOsP9HDvqsWyxosfavjxUcvG8NdHP2jtZfv9P1cBy1fq
         HDccb3k0k0uvXYd9SxAFfXWTWvVe28YiCtXEiM4GWGJ3IvZB3kOkgeWxpS3xiJtOS7BI
         50j2w5Ogj6QzBurLdI6P4ZZBkajOxq6j1G5KGgxb0omSEqLPvlNSvG3Zz5kG4yeGad5z
         g7fNRVBsmyLA9atMewhazUlNvTQ+hchkQo6QdL3IHBdsYKcsgDNc01D9bHQGMIMDL/U8
         /NVw==
X-Gm-Message-State: AElRT7E6zN8EBkQlsItlTi60EksQLqbSbGK/yKPqdhH0hxCkXmd4xhnQ
        lt/u98d6zqNee+KxwwU0foB6v0F68ZGx22/SCdaIeQ==
X-Google-Smtp-Source: AG47ELtEiAfJksJxbiHwxx/yK5ER1fLNpGuIj05dc2nj8DvsYSjoBx+cUm4w1AMHiNR5R/bdRvg9HLI0P52lpn0JSpk=
X-Received: by 10.159.38.51 with SMTP id 48mr18870845uag.193.1520464463943;
 Wed, 07 Mar 2018 15:14:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.242.140 with HTTP; Wed, 7 Mar 2018 15:14:23 -0800 (PST)
In-Reply-To: <20180307214624.D4361772@viggo.jf.intel.com>
References: <20180307214624.D4361772@viggo.jf.intel.com>
From:   Kees Cook <keescook@google.com>
Date:   Wed, 7 Mar 2018 15:14:23 -0800
Message-ID: <CAGXu5jLy9jNW-M3sC9-hy3+QFMHyzgo8frEnFCL6nnL9Yp-WKQ@mail.gmail.com>
Subject: Re: [PATCH] [v2] docs: clarify security-bugs disclosure policy
To:     Dave Hansen <dave.hansen@linux.intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Andy Lutomirski <luto@kernel.org>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 7, 2018 at 1:46 PM, Dave Hansen <dave.hansen@linux.intel.com> wrote:
>
> From: Dave Hansen <dave.hansen@linux.intel.com>
>
> I think we need to soften the language a bit.  It might scare folks
> off, especially the:
>
>          We prefer to fully disclose the bug as soon as possible.
>
> which is not really the case.  Linus says:
>
>         It's not full disclosure, it's not coordinated disclosure,
>         and it's not "no disclosure".  It's more like just "timely
>         open fixes".
>
> I changed a bit of the wording in here, but mostly to remove the word
> "disclosure" since it seems to mean very specific things to people
> that we do not mean here.
>
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
> Cc: Andrea Arcangeli <aarcange@redhat.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Kees Cook <keescook@google.com>
> Cc: Tim Chen <tim.c.chen@linux.intel.com>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>
>  b/Documentation/admin-guide/security-bugs.rst |   24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff -puN Documentation/admin-guide/security-bugs.rst~embargo2 Documentation/admin-guide/security-bugs.rst
> --- a/Documentation/admin-guide/security-bugs.rst~embargo2      2018-03-07 13:23:49.390228208 -0800
> +++ b/Documentation/admin-guide/security-bugs.rst       2018-03-07 13:42:37.618225395 -0800
> @@ -29,18 +29,20 @@ made public.
>  Disclosure
>  ----------
>
> -The goal of the Linux kernel security team is to work with the
> -bug submitter to bug resolution as well as disclosure.  We prefer
> -to fully disclose the bug as soon as possible.  It is reasonable to
> -delay disclosure when the bug or the fix is not yet fully understood,
> -the solution is not well-tested or for vendor coordination.  However, we
> -expect these delays to be short, measurable in days, not weeks or months.
> -A disclosure date is negotiated by the security team working with the
> -bug submitter as well as vendors.  However, the kernel security team
> -holds the final say when setting a disclosure date.  The timeframe for
> -disclosure is from immediate (esp. if it's already publicly known)
> +The goal of the Linux kernel security team is to work with the bug
> +submitter to understand and fix the bug.  We prefer to publish the fix as
> +soon as possible, but try to avoid public discussion of the bug itself
> +and leave that to others.
> +
> +Publishing the fix may be delayed when the bug or the fix is not yet
> +fully understood, the solution is not well-tested or for vendor
> +coordination.  However, we expect these delays to be short, measurable in
> +days, not weeks or months.  A release date is negotiated by the security
> +team working with the bug submitter as well as vendors.  However, the
> +kernel security team holds the final say when setting a timeframe.  The
> +timeframe varies from immediate (esp. if it's already publicly known bug)

Nit: I think "a" is missing. I was expecting: "... already a publicly known ...

>  to a few weeks.  As a basic default policy, we expect report date to
> -disclosure date to be on the order of 7 days.
> +release date to be on the order of 7 days.

Otherwise, yeah, looks good.

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
