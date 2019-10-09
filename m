Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B49AC7D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 Oct 2019 21:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731763AbfJIVwA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 Oct 2019 17:52:00 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46962 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730490AbfJIVwA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Oct 2019 17:52:00 -0400
Received: by mail-pg1-f193.google.com with SMTP id b8so2260976pgm.13
        for <linux-doc@vger.kernel.org>; Wed, 09 Oct 2019 14:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=97UEnZkq1363enDKYmWWwRqD4DtS+tvynceFknVUyPM=;
        b=InKPrTMa1e+FdIdNqHTz6q5ntOS2TrnoAYbmW5rmZYhz/Xd468AHt+nDruAX4im8yd
         kp8hdhrpOoDT+6VAmNnsYsS95oMWgUU1hvT/qR6wz3KBzWLB+SJjoBUTzCJKCxJpHO4g
         Mm5LZv6e86yVL3WjjtncdqED1RU6EDsgGs0ZDTyvsK0ewcfrHUTwhJ2BMVLscZA8KAyZ
         i1YRwlQXNGubbaLPYmP5p8gLfAMntJ9NIY6/MPIBs2GRh+X7xa2ukf+gQVt0dAOFYAfE
         nhYDXgkfsIz/da3KJMbIHXqmPWJNPKVW5xFAyVEmCphH/jobx5Msdq62kQ2UnUWLgAHy
         piag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=97UEnZkq1363enDKYmWWwRqD4DtS+tvynceFknVUyPM=;
        b=IFD6Rc3pY65spP1COKj6yu60wBv7TOXSCq7lmV87I9s2T95EVgsCS+828crgAZjJVV
         zD18KNSGct9NL37DUnoftdz9MWPaxh30W9u05mPmkTzMNxkwypXG9OaRSZmrm2jfnw+i
         DgzEro+TuNb83nBuGfL6K9gROY+0idGhxwSHa8j3/TXLH0vnezBVgmojcy3AAisu+CsF
         GrinJ7P6m16aWNJwTrqNjMZWSrfDGtUuqKK39WTSL8JZrSSePOpAs8xJ/+f7oLNvPAnF
         AZOipY58E80mK0onQEUyemVGE11Q8vrf0c/ytNI3P3+1FL4c4JdPOKioxxAqz/eALMTt
         Zf7A==
X-Gm-Message-State: APjAAAX3Fe86yzk76Y4FxTHEGpPpQ+im0CP+oCG6kiXRU0mu7T3IOXyU
        3MDeXgdXtH3nQEop0dHHPjoqJA/cpxzpkFfExcfdeg==
X-Google-Smtp-Source: APXvYqyYmg74kA+ZWKX9kiYOJ1AMY8piMfZHJZXRGpX39gd4Zdj8mePRHNpEP6oLPbJP2HAssHN1Q87KYFoUuC+pQd4=
X-Received: by 2002:a63:ef51:: with SMTP id c17mr6596833pgk.10.1570657918818;
 Wed, 09 Oct 2019 14:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1570292505.git.joe@perches.com> <09a42c7275afa7e6e9e3fc57a15122201fccd6f7.1570292505.git.joe@perches.com>
 <CANiq72=KMcYmcHL442OKwDBJj3czey-XtjtOBTLqh_HAsoJAzA@mail.gmail.com>
In-Reply-To: <CANiq72=KMcYmcHL442OKwDBJj3czey-XtjtOBTLqh_HAsoJAzA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 9 Oct 2019 14:51:46 -0700
Message-ID: <CAKwvOdmuk_3AJKoiQi2feMD=3cHcTYFCfxuQ53VS_aHWeDEh9g@mail.gmail.com>
Subject: Re: [PATCH 3/4] Documentation/process: Add fallthrough pseudo-keyword
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Joe Perches <joe@perches.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Pavel Machek <pavel@ucw.cz>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Kan Liang <kan.liang@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Shawn Landden <shawn@git.icu>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Miller <davem@davemloft.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Oct 5, 2019 at 10:48 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Oct 5, 2019 at 6:47 PM Joe Perches <joe@perches.com> wrote:
> >
> > +When the C17/C18  [[fallthrough]] syntax is more commonly supported by
>
> Note that C17/C18 does not have [[fallthrough]]. C++17 introduced it,
> as it is mentioned above. I would keep the
> __attribute__((fallthrough)) -> [[fallthrough]] change you did,
> though, since that is indeed the standard syntax (given the paragraph
> references C++17).
>
> I was told by Aaron Ballman (who is proposing them for C) that it is
> more or less likely that it becomes standardized in C2x. However, it
> is still not added to the draft (other attributes are already,
> though). See N2268 and N2269:
>
>     http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2268.pdf (fallthrough)
>     http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2269.pdf
> (attributes in general)
>

Interesting. I think those links might be useful to include, or drop
the section on C++ style attributes outright. Either way:
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
