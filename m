Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1121CC43334
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 17:19:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232907AbiGFRTK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 13:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiGFRTK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 13:19:10 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B111838E
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 10:19:08 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id b85so15172699yba.8
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 10:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=sQ/ZknbalC3P/8medLU725+6gH2FeWzdEOU+lfbjBqg=;
        b=BT1dGCU+ASL4InNk7ICscpx43fHkAGBZW/uvlkoJBIr8024pQrl8Dkyj/J11WGUPko
         txTTCLZdJukrBjCXQFZlyqN/UNTf9aJKxoxepocmBAlh7ncv7vsWwfB0UFL6C60Zsx8R
         +hQKAHdTnKq5S+9hZf48yubFo4jpqSs283prhXQmL2xtI+H29d2kcktgRsBGTAumC5dk
         /XdG9MfTS46R3dHxVuPzqeZ4Nxz+3QnOibukQ18gAmLFEWpiO1BGLEBoH1cOughOrzfd
         A0PJ/S98MNExqKn/6CPC9xpYhBM+gZKb9BDiNq0r6Bm5cRT65g54uHnUhoc4Uka5NFgC
         fioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=sQ/ZknbalC3P/8medLU725+6gH2FeWzdEOU+lfbjBqg=;
        b=r8D3Q5nNslh7qCojxaMd0fsntAzUzL8SEM10pBO82u3Q8fcvzTsm1PxR7tC8kHlUy9
         H5L3gYpigznQXx9hR6cV1B6wollvbIuRKipT4eFcl9tIM/K3muP4JcdHdmDul4T+CeCD
         C8TDGE00Z6rByEAC9VnFLAEi+TtaYRSpALJ2hSoZFOcxHZxjWFx1dDqXnwIjAs1mRj5V
         Q+sSjc8HhaoiU1AhRdTBvVpnlzmR0PpTKPi2/f83En3/5nivGzSfEu7X6pUyosQQwhUB
         RJ07PszwgtHaQuaH0uO05y8KLqBuRNT+yLQojb7i/BeYgvmdsZrj8lYBxnWkMyvuu/jS
         GGoQ==
X-Gm-Message-State: AJIora9TlzNou/gSgx/lJicv2IaZn9VCp1uq9OgR92nF51SaF7p1kET8
        if9PGIKZ7dvtWVbTqsVdxI/NruXIbHu7P3bYBrxsWQ==
X-Google-Smtp-Source: AGRyM1sLKh6cuork0uqfZJqJYWLsYo2ZhmFiiqBTxs6ZTksF/sdtSlHGk4jANSSa59QB+dLDUNlsaepVjiBRq3L7EB4=
X-Received: by 2002:a05:6902:287:b0:66e:36d0:ad2a with SMTP id
 v7-20020a056902028700b0066e36d0ad2amr21225633ybh.341.1657127947893; Wed, 06
 Jul 2022 10:19:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0d:f944:0:0:0:0:0 with HTTP; Wed, 6 Jul 2022 10:19:07 -0700 (PDT)
In-Reply-To: <CAKXUXMyem+n2NySP2smrZLyjvVDWeSAM3Fst4QejLiCCH_gO8g@mail.gmail.com>
References: <20220704225757.1811311-1-martin.fernandez@eclypsium.com>
 <CAKXUXMy+8_O_k5AzE+3VEcMvpJ1BBRm337Nu1J7TDjoKGZx3qA@mail.gmail.com>
 <CAKgze5ZoYEcPDwDgPkNehuM431z7SdF03308N0EuRRBWr68T1Q@mail.gmail.com> <CAKXUXMyem+n2NySP2smrZLyjvVDWeSAM3Fst4QejLiCCH_gO8g@mail.gmail.com>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Wed, 6 Jul 2022 14:19:07 -0300
Message-ID: <CAKgze5aTqiusFuhxezMroecDA5dgMb_BHUG5Au+dxL5UYDZiCw@mail.gmail.com>
Subject: Re: [PATCH v3] doc/checkpatch: Add description to MACRO_ARG_REUSE
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/6/22, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> On Wed, Jul 6, 2022 at 3:26 PM Martin Fernandez
> <martin.fernandez@eclypsium.com> wrote:
>>
>> On 7/6/22, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>> > On Tue, Jul 5, 2022 at 1:00 AM Martin Fernandez
>> > <martin.fernandez@eclypsium.com> wrote:
>> >>
>> >> Add a description, an example and a possible workaround to the
>> >> MACRO_ARG_REUSE check.
>> >>
>> >> Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
>> >> Acked-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>> >> ---
>> >>  Documentation/dev-tools/checkpatch.rst | 20 ++++++++++++++++++++
>> >>  1 file changed, 20 insertions(+)
>> >>
>> >> diff --git a/Documentation/dev-tools/checkpatch.rst
>> >> b/Documentation/dev-tools/checkpatch.rst
>> >> index b52452bc2963..86545c65cf7b 100644
>> >> --- a/Documentation/dev-tools/checkpatch.rst
>> >> +++ b/Documentation/dev-tools/checkpatch.rst
>> >> @@ -759,6 +759,26 @@ Indentation and Line Breaks
>> >>  Macros, Attributes and Symbols
>> >>  ------------------------------
>> >>
>> >> +  **ARG_REUSE**
>> >
>> > The name of this checkpatch type is actually "MACRO_ARG_REUSE".
>>
>> You are right.
>>
>> >> +    Using the same argument multiple times in the macro definition
>> >> +    would lead to unwanted side-effects.
>> >
>> > how about "... may lead to unwanted side effects"?
>> >
>> > Rationale: it does only lead to side effects if there are multiple
>> > computations involved.
>>
>> Good point.
>>
>> > just on spelling:
>> > s/side-effects/side effects/
>> >
>> >> +
>> >> +    For example, given a `min` macro defined like::
>> >> +
>> >> +      #define min(x, y)  ((x) < (y) ? (x) : (y))
>> >> +
>> >> +    If you call it with `min(foo(x), 0)`, it would expand to::
>> >> +
>> >> +      foo(x) < 0 ? foo(x) : 0
>> >> +
>> >> +    If `foo` has side-effects or it's an expensive calculation the
>> >> +    results might not be what the user intended.
>> >> +
>> >
>> > s/side-effects/side effects/
>> >
>> >> +    For a workaround the idea is to define local variables to hold
>> >> the
>> >> +    macro's arguments. Checkout the actual implementation of `min` in
>> >> +    include/linux/minmax.h for the full implementation of the
>> >> +    workaround.
>> >> +
>> >
>> > I ran checkpatch on all commits from v5.17..v5.18 and looked for all
>> > check warnings with MACRO_ARG_REUSE.
>> >
>> > There were 35 warnings in 15 commits, touching 16 different files (4
>> > in drivers/staging, 5 in drivers/net/wireless/, 5 in
>> > drivers/net/ethernet/, 1 in drivers/net/dsa/, 1 in drivers/net/can/).
>> >
>> > As far as I see it from those commits, the more common way to address
>> > this is to check that a macro is only used locally in some file and
>> > that all uses of that macro pass a constant value as macro argument.
>> >
>> > Maybe we add these two as equally good alternatives?
>>
>> Yes, that's what I did on my patch that triggered this patch. But I
>> don't think that's a workaround. You still have the issue there, just
>> that the uses of the macros are "good".
>>
>> I think that falls better into the "I know what I'm doing, I'm ok with
>> the warning" scenario, than a proper workaround.
>>
>
> Well, the purpose of the checkpatch documentation is to provide some
> more background information on the warning (e.g., the historic
> motivation, what to consider when judging its validity) and any hints
> on possible resolutions. So, I would expect to see the documentation
> cover explaining the most common (reusable) resolutions. A valid
> argument why a check warning can be ignored falls into such a
> resolution. In fact, the category "CHECK" in checkpatch.pl already
> suggests that often the resolution may be to "inspect some code, but
> not modify the code and then further 'ignore' the reported warning",
> as some rules in checkpatch are checking something with just some
> quite weak heuristics.
>
> So, for this patch here: How about avoiding the word "workaround" and
> just state these to options as resolution, e.g., a text like this:
>
> Here are two possible options:
> - Check the macro arguments of all uses of this macro to be free of
> unintended side effects. Passing a constant value is usually fine, as
> the compiler will use constant propagation and further optimizations
> to produce acceptable code.
> - If needed, define local variables in the macro to hold the macro's
> argument. See the implementation of `min` in include/linux/minmax.h as
> one example of this option.
>
> What do you think?

Yep, that's very good. I'll go with it.

> I really appreciate you providing some documentation for this rule. I
> also appreciate the rules that checkpatch.pl checks being better
> explained to all of us in the kernel community. That avoids that we
> all, especially newcomers, individually wonder about what checkpatch
> intends to warn us about.
>
> Lukas
>
