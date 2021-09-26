Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC08C433EF
	for <linux-doc@archiver.kernel.org>; Sun, 26 Sep 2021 21:04:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01BDF60F39
	for <linux-doc@archiver.kernel.org>; Sun, 26 Sep 2021 21:04:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhIZVGD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 26 Sep 2021 17:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhIZVGC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 26 Sep 2021 17:06:02 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B266AC061570
        for <linux-doc@vger.kernel.org>; Sun, 26 Sep 2021 14:04:25 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z24so68553071lfu.13
        for <linux-doc@vger.kernel.org>; Sun, 26 Sep 2021 14:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nd2vLehXuAH1GvIPk6KPsYFYOFCcPT8zNbIC88gVSgo=;
        b=dHqH90LUZ36FhNJgwH+w+FbfrclDX+TZIO9zH2BHRPwf0j+Ma9gv7+YIEU/pKeMMzL
         s2JYNrzx+VsCbWBSoc0HkH9wc2fhhXAaU1ljU3FCcW/C/8Ikmo+JivAnNe0sVG97h3fd
         raC+JOa8Fa8KpZ3luvuQBfvkJTnXt8wHQGODM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nd2vLehXuAH1GvIPk6KPsYFYOFCcPT8zNbIC88gVSgo=;
        b=trDKexrCrMz6XvyHiy8690QHkmlolhhohMXwLNdb/v/t8OqDGkhszO1YiZ5Mg9wVNI
         E2ICkl7e8HDAP0gOKgJBDw3dq7wpyfb//8L1i+ApTUwfchAxqL3dLhYf65HgZ9r8v9P9
         gTYe+BerC2obKKJBNjl30Uz3aiMF/cvMr3VPxaTH5vOlgkrxazM8dlBSMHfpoQj/wLVt
         04AfQ7xuJjjaRbWNRko0GlR7TN0jIgTvAJ30wC8I8OPZIqj/5EordCohTMAM/mNkpLhY
         IC+avq87txVW2S5qMITwP5xzn/uHW3oVYHuJqZ3FwUrhDEe52Ss13o7SlXjHqTaIOLWT
         ZZEQ==
X-Gm-Message-State: AOAM533fuRW4zN5b8LZmmyAIkgoQB9BP6diBP0SHVlvMPWCOTNo5togk
        0LEYB6B27k52KgkaZJEWJylqxTpqs8Xw/Wu7
X-Google-Smtp-Source: ABdhPJwOA5EF3Y/go9xSywr5M64BCaNzTXQkWCNDuJS9pr5OrBR+MlzCDNbmchi4JcHYGTAtr0Nf8g==
X-Received: by 2002:ac2:4119:: with SMTP id b25mr19960176lfi.665.1632690263798;
        Sun, 26 Sep 2021 14:04:23 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id f26sm707174lfq.19.2021.09.26.14.04.23
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Sep 2021 14:04:23 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id x27so67825477lfu.5
        for <linux-doc@vger.kernel.org>; Sun, 26 Sep 2021 14:04:23 -0700 (PDT)
X-Received: by 2002:a2e:5815:: with SMTP id m21mr24158940ljb.95.1632690252388;
 Sun, 26 Sep 2021 14:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210909200948.090d4e213ca34b5ad1325a7e@linux-foundation.org>
 <20210910031046.G76dQvPhV%akpm@linux-foundation.org> <CAHk-=wgfbSyW6QYd5rmhSHRoOQ=ZvV+jLn1U8U4nBDgBuaOAjQ@mail.gmail.com>
 <202109211630.2D00627@keescook> <af3c775a1515f97c8dbe6a6651bd6e4b6986e8cd.camel@perches.com>
 <202109211757.F38DF644@keescook> <YUraGKetS+Tgc7y9@localhost.localdomain>
 <CAHk-=wjS-Jg7sGMwUPpDsjv392nDOOs0CtUtVkp=S6Q7JzFJRw@mail.gmail.com> <6a85bbbf952949118cc5f93b57d48265@AcuMS.aculab.com>
In-Reply-To: <6a85bbbf952949118cc5f93b57d48265@AcuMS.aculab.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 26 Sep 2021 14:03:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjoLAYG446ZNHfg=GhjSY6nFmuB_wA8fYd5iLBNXjo9Bw@mail.gmail.com>
Message-ID: <CAHk-=wjoLAYG446ZNHfg=GhjSY6nFmuB_wA8fYd5iLBNXjo9Bw@mail.gmail.com>
Subject: Re: function prototype element ordering
To:     David Laight <David.Laight@aculab.com>
Cc:     Alexey Dobriyan <adobriyan@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joe Perches <joe@perches.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "apw@canonical.com" <apw@canonical.com>,
        Christoph Lameter <cl@linux.com>,
        Daniel Micay <danielmicay@gmail.com>,
        Dennis Zhou <dennis@kernel.org>,
        "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Linux-MM <linux-mm@kvack.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        "mm-commits@vger.kernel.org" <mm-commits@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Sep 25, 2021 at 12:40 PM David Laight <David.Laight@aculab.com> wrote:
>
> If the function name starts at the beginning of a line it is
> much easier to grep for the definition.

That has always been a completely bogus argument. I grep to look up
the type as often as I grep for the function definition, plus it's not
at all unlikely that the "function" is actually a macro wrapper, so
grepping for the beginning of line is just completely wrong.

It's completely wrong for another reason too: it assumes a style of
programming that has never actually been all that common. It's a very
specific pattern to very specific projects, and anybody who learnt
that pattern for their project is going to be completely lost anywhere
else. So don't do it. It's just a bad idea.

So a broken "easier to grep for" is not an excuse for "make the code
harder to read" particularly when it just makes another type of
grepping harder, and it's not actually nearly universal enough to
actually be a useful pattern in the first place.

It's not only never been the pattern in the kernel, but it's generally
not been the pattern anywhere else either. It's literally one of the
broken GNU coding standards - and the fact that almost every other
part of the GNU coding standards were wrong (indentation, placement of
braces, you name it) should give you a hint about how good _that_ one
was.

Here's an exercise for you: go search for C coding examples on the
web, and see how many of them do

    int main(int argc, char **argv)

vs how many of them do

    int
    main(int argc, char **argv)

and then realize that in order for the "grep for ^main" pattern to be
useful, the second version has to not just be more common, it has to
be practically *universal*.

Hint: it isn't even remotely more common, much less universal. In
Debian code search, I had to go to the third page to find any example
at all of people putting the "int" and the "main" on different lines,
and even that one didn't place the "main()" at the beginning of the
line - they had been separated because of other reasons and looked
like this:

int
#ifdef _WIN32
    __cdecl
#endif // _WIN32
    main(int argc, char** argv)

instead.

Maybe Dbian code search isn't the place to go, but I think it proves
my case: the "function name at beginning of line" story is pure
make-believe, and has absolutely no relevance in the real world.

It's a bad straightjacket. Just get over it, and stop perpetuating the
idiotic myth.

If you care so much about grepping for function declarations, and you
use that old-fashioned GNU coding standard policy as an argument, just
be *properly* old-fashioned instead, and use etags or something.

Don't make the rest of us suffer.

Because I grep for functions all the time, and I'd rather have useful
output - which very much includes the type of the function. That's
often one reason _why_ I grep for things in the first place.

Other grep tricks for when the function really is used everywhere, and
you are having trouble finding the definition vs the use:

 - grep in the headers for the type, and actually use the type (either
of the function, or the first argument) as part of the pattern.

   If you really have no idea where it might be, you'll want to start
off with the header grep anyway, to find the macro case (or the inline
case)

   Yeah, splitting the declaration will screw the type information up.
So don't do that, then.

 - if it's so widely used that you find it all over, it's probably
exported. grep for 'EXPORT.*fnname' to see where it is defined.

   We used to (brokenly) export things separately from the definition.
If you find cases of that, let's fix them.

Of course, usually I know roughly where it is defined, so I just limit
the pathnames for 'git grep'.

But the 'add the type of the return value or first argument to the
pattern' is often my second go-to (particularly for the cases where
you might be looking for _multiple_ definitions because it's some
architecture-specific thing, or you have some partial pattern because
every filesystem does their own thing).

Other 'git grep' patterns that often work for kernel sources:

 - looking for a structure declaration? Use

      git grep 'struct name {'

   which mostly works, but obviously depends on coding style so it's
not guaranteed. Good first thing to try, though.

 - use

        git grep '\t\.name\>.*='

   to find things like particular inode operations.

That second case is because we have almost universally converted our
filesystem operation initializers to use that named format (and really
strive to have a policy of constant structures of function pointers
only), and it's really convenient if you are doing VFS changes and
need to find all the places that use a particular VFS interface (eg
".get_acl" or similar).

It used to be a nightmare to find those things back when most of our
initializers were using the traditional unnamed ordered structure
initializers, so this is one area where we've introduced coding style
policies to make it really easy to grep for things (but also much
easier to add new fields and not have to add pointless NULL
initializer elements, of course).

             Linus
