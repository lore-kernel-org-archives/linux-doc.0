Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B56DCCA473
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 14:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbiGFOVx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 10:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233168AbiGFOVu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 10:21:50 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1516125297
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 07:21:49 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 76so11967046ybd.0
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TZKM0t6HsBIfJ0404Af4NFugyDQyMH8W4cl9OJ1Qs2w=;
        b=O6cpp28PS4XrE4nOdOPkbf5qTPLQLJI9TtIv1+LhRrp8ubMhX4Zj3MwtSgRDYLqkTO
         1Y+2387LN94AF1PIAWFAk4+owAKN47wmWsLs/MyAIaKUedmYXhv+t/oLRBlz9ocHnrHI
         WLoT4G+J9R6sQFq4Rzsd2oMC/5OKiOqT4xcQelXvbmkw28/qn5p97SZnDoJ19ul7marN
         uXpVyeyNDUQT6mMGEhJxi05bJkhfaNSIJaU1bmlFAe7qgKa73sNbsi14E4B1CWcyj2G3
         DXaOS2osYPbRtZrppjpPEyVfwxn92ucyiP6f8HPhPd7m89zdWhYBIqWAf3Cm3WQg29NH
         wZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TZKM0t6HsBIfJ0404Af4NFugyDQyMH8W4cl9OJ1Qs2w=;
        b=e+OZp1GqPOW6yX2f+dK9msbDRjjmKF2uinZZY2EN0jMkCREC2AkZW4OmwkFxk54i5M
         5TEbCKhvq46xf0La86JrbmMc+Tl7vNzE7ds+4H7REHQCpTDrCBHWsiDT6WjTlPyVBj/Y
         yaDKqvOoKMmbm18VCBg+OcZx6W2J4f7HBEEdDhppCj+MPAEYfPumETgDf9/acZHF4MK3
         xzKzXrSj0S40n2d7lJwvgKCZf2y2sqq4G3rjD7TlK4/iDPO7ySig+wCy1eLIYp8fCrqS
         j7HNHCjoOPMXw9lMSosaMTnheZYPOCX5Bl9VWph2uzWIMT3Dw3t/OPFIeKLuyUzIznNb
         0fow==
X-Gm-Message-State: AJIora/m9ClHmp/jeFKg+IZczCpkXkGbSyJzw/sx5zL2MrAiblx4VKjm
        xMp6uknWsAjBRF1wl7waAju7Ul0Rzx1ObeUyrFc=
X-Google-Smtp-Source: AGRyM1uzYJzOnZs52NzsIutn8wb1SSrFAgtbM2FmKigWtGcQtlvusxASGTaZnbudJFvnfDW+GkG1bX0yg/Bfjd7RpmQ=
X-Received: by 2002:a5b:8cd:0:b0:66e:7510:8de2 with SMTP id
 w13-20020a5b08cd000000b0066e75108de2mr9119437ybq.27.1657117308108; Wed, 06
 Jul 2022 07:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220704225757.1811311-1-martin.fernandez@eclypsium.com>
 <CAKXUXMy+8_O_k5AzE+3VEcMvpJ1BBRm337Nu1J7TDjoKGZx3qA@mail.gmail.com> <CAKgze5ZoYEcPDwDgPkNehuM431z7SdF03308N0EuRRBWr68T1Q@mail.gmail.com>
In-Reply-To: <CAKgze5ZoYEcPDwDgPkNehuM431z7SdF03308N0EuRRBWr68T1Q@mail.gmail.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Wed, 6 Jul 2022 16:21:37 +0200
Message-ID: <CAKXUXMyem+n2NySP2smrZLyjvVDWeSAM3Fst4QejLiCCH_gO8g@mail.gmail.com>
Subject: Re: [PATCH v3] doc/checkpatch: Add description to MACRO_ARG_REUSE
To:     Martin Fernandez <martin.fernandez@eclypsium.com>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 6, 2022 at 3:26 PM Martin Fernandez
<martin.fernandez@eclypsium.com> wrote:
>
> On 7/6/22, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > On Tue, Jul 5, 2022 at 1:00 AM Martin Fernandez
> > <martin.fernandez@eclypsium.com> wrote:
> >>
> >> Add a description, an example and a possible workaround to the
> >> MACRO_ARG_REUSE check.
> >>
> >> Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
> >> Acked-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> >> ---
> >>  Documentation/dev-tools/checkpatch.rst | 20 ++++++++++++++++++++
> >>  1 file changed, 20 insertions(+)
> >>
> >> diff --git a/Documentation/dev-tools/checkpatch.rst
> >> b/Documentation/dev-tools/checkpatch.rst
> >> index b52452bc2963..86545c65cf7b 100644
> >> --- a/Documentation/dev-tools/checkpatch.rst
> >> +++ b/Documentation/dev-tools/checkpatch.rst
> >> @@ -759,6 +759,26 @@ Indentation and Line Breaks
> >>  Macros, Attributes and Symbols
> >>  ------------------------------
> >>
> >> +  **ARG_REUSE**
> >
> > The name of this checkpatch type is actually "MACRO_ARG_REUSE".
>
> You are right.
>
> >> +    Using the same argument multiple times in the macro definition
> >> +    would lead to unwanted side-effects.
> >
> > how about "... may lead to unwanted side effects"?
> >
> > Rationale: it does only lead to side effects if there are multiple
> > computations involved.
>
> Good point.
>
> > just on spelling:
> > s/side-effects/side effects/
> >
> >> +
> >> +    For example, given a `min` macro defined like::
> >> +
> >> +      #define min(x, y)  ((x) < (y) ? (x) : (y))
> >> +
> >> +    If you call it with `min(foo(x), 0)`, it would expand to::
> >> +
> >> +      foo(x) < 0 ? foo(x) : 0
> >> +
> >> +    If `foo` has side-effects or it's an expensive calculation the
> >> +    results might not be what the user intended.
> >> +
> >
> > s/side-effects/side effects/
> >
> >> +    For a workaround the idea is to define local variables to hold the
> >> +    macro's arguments. Checkout the actual implementation of `min` in
> >> +    include/linux/minmax.h for the full implementation of the
> >> +    workaround.
> >> +
> >
> > I ran checkpatch on all commits from v5.17..v5.18 and looked for all
> > check warnings with MACRO_ARG_REUSE.
> >
> > There were 35 warnings in 15 commits, touching 16 different files (4
> > in drivers/staging, 5 in drivers/net/wireless/, 5 in
> > drivers/net/ethernet/, 1 in drivers/net/dsa/, 1 in drivers/net/can/).
> >
> > As far as I see it from those commits, the more common way to address
> > this is to check that a macro is only used locally in some file and
> > that all uses of that macro pass a constant value as macro argument.
> >
> > Maybe we add these two as equally good alternatives?
>
> Yes, that's what I did on my patch that triggered this patch. But I
> don't think that's a workaround. You still have the issue there, just
> that the uses of the macros are "good".
>
> I think that falls better into the "I know what I'm doing, I'm ok with
> the warning" scenario, than a proper workaround.
>

Well, the purpose of the checkpatch documentation is to provide some
more background information on the warning (e.g., the historic
motivation, what to consider when judging its validity) and any hints
on possible resolutions. So, I would expect to see the documentation
cover explaining the most common (reusable) resolutions. A valid
argument why a check warning can be ignored falls into such a
resolution. In fact, the category "CHECK" in checkpatch.pl already
suggests that often the resolution may be to "inspect some code, but
not modify the code and then further 'ignore' the reported warning",
as some rules in checkpatch are checking something with just some
quite weak heuristics.

So, for this patch here: How about avoiding the word "workaround" and
just state these to options as resolution, e.g., a text like this:

Here are two possible options:
- Check the macro arguments of all uses of this macro to be free of
unintended side effects. Passing a constant value is usually fine, as
the compiler will use constant propagation and further optimizations
to produce acceptable code.
- If needed, define local variables in the macro to hold the macro's
argument. See the implementation of `min` in include/linux/minmax.h as
one example of this option.

What do you think?

I really appreciate you providing some documentation for this rule. I
also appreciate the rules that checkpatch.pl checks being better
explained to all of us in the kernel community. That avoids that we
all, especially newcomers, individually wonder about what checkpatch
intends to warn us about.

Lukas
