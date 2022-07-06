Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5190CC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 11:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbiGFL3b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 07:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiGFL3b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 07:29:31 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E9A25C49
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 04:29:30 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id b85so13547962yba.8
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9dDLq9ywFZ8zqZH15zWm4q0BtnKax7ETihEXwlBlzzo=;
        b=Hh3GxEUnky0PE93SApp9ncsK35i7yRPKn5w15VQPxBqmr4aYUp6+hDSP3aARLEi8/n
         ZJeq753Zt0L62czzGg3LpgkhfDKO1jyYdee47HJm45BoX0wUP05UW+Au1XYF6kWNN0QD
         hIgk00zzUgXnOyNt/ZKJaPXUR9Wg2U+auMZf7G3TkfVZ9nMRB2Mhd7Z6srGYXmDVjYum
         hF3PPa6ltRr7JVrCqUqmx0go1WyAT5KnUTk+zWCD60qr2ikW42fdASvdQg0bHfLRdWIC
         f2rYlryHer8e/UI/w8HFMPmecUrMnMfF5IR2xXEup+R5jXceokIeKpwL1g8fvcHwmSV6
         WZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9dDLq9ywFZ8zqZH15zWm4q0BtnKax7ETihEXwlBlzzo=;
        b=UubWlF42oOJyGcbgncNPWl5W7bAulGr068qV4DsYr729rDMrb2Gl05HaYkj0GOENS/
         LhtFFn6qPxtisZjAiuyEozpxweNH9Z7tsIXyMIXoY4tCc/kH7WjgSX5spfNpus0kulIr
         6ba5bXmzFAZNZSD0wKENj5G/8Ha2xZeO/Qq9oRtSZaEpKxR2B6mMkd0hMJucvuAz2vcH
         K70P5DceTZNfsYbfIaNIyEOmbWsofZh9u/GAfgethGaxEN9uXiNwgxim2u3C1VbF4f9U
         Yg5QiqzUMbRSnXkt+QnV3jcNCyIaoBSoU0gT0paZEF6lRbmhlqHS7S408sObc+X+mt+J
         hvAQ==
X-Gm-Message-State: AJIora8lxFuD0/MG9k+ikopD9qbnEbFK4FoJem892Q9SlYsOhySuFUwa
        g+gJ8HbcciHNCkvp+dIZ9Lebtg/GrfOI6GlmlWwxjSWA
X-Google-Smtp-Source: AGRyM1siexdqcSRQQNkmjthE+VYEIDebuS7OMuDIBst5XikIB5tdrkOQotrA5CoGhJn5U+e9HFg688nFbvrT5rfAd8U=
X-Received: by 2002:a25:5809:0:b0:66c:8709:3611 with SMTP id
 m9-20020a255809000000b0066c87093611mr39914171ybb.608.1657106969304; Wed, 06
 Jul 2022 04:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220704225757.1811311-1-martin.fernandez@eclypsium.com>
In-Reply-To: <20220704225757.1811311-1-martin.fernandez@eclypsium.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Wed, 6 Jul 2022 13:29:18 +0200
Message-ID: <CAKXUXMy+8_O_k5AzE+3VEcMvpJ1BBRm337Nu1J7TDjoKGZx3qA@mail.gmail.com>
Subject: Re: [PATCH v3] doc/checkpatch: Add description to MACRO_ARG_REUSE
To:     Martin Fernandez <martin.fernandez@eclypsium.com>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 5, 2022 at 1:00 AM Martin Fernandez
<martin.fernandez@eclypsium.com> wrote:
>
> Add a description, an example and a possible workaround to the
> MACRO_ARG_REUSE check.
>
> Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
> Acked-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index b52452bc2963..86545c65cf7b 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -759,6 +759,26 @@ Indentation and Line Breaks
>  Macros, Attributes and Symbols
>  ------------------------------
>
> +  **ARG_REUSE**

The name of this checkpatch type is actually "MACRO_ARG_REUSE".

> +    Using the same argument multiple times in the macro definition
> +    would lead to unwanted side-effects.

how about "... may lead to unwanted side effects"?

Rationale: it does only lead to side effects if there are multiple
computations involved.

just on spelling:
s/side-effects/side effects/

> +
> +    For example, given a `min` macro defined like::
> +
> +      #define min(x, y)  ((x) < (y) ? (x) : (y))
> +
> +    If you call it with `min(foo(x), 0)`, it would expand to::
> +
> +      foo(x) < 0 ? foo(x) : 0
> +
> +    If `foo` has side-effects or it's an expensive calculation the
> +    results might not be what the user intended.
> +

s/side-effects/side effects/

> +    For a workaround the idea is to define local variables to hold the
> +    macro's arguments. Checkout the actual implementation of `min` in
> +    include/linux/minmax.h for the full implementation of the
> +    workaround.
> +

I ran checkpatch on all commits from v5.17..v5.18 and looked for all
check warnings with MACRO_ARG_REUSE.

There were 35 warnings in 15 commits, touching 16 different files (4
in drivers/staging, 5 in drivers/net/wireless/, 5 in
drivers/net/ethernet/, 1 in drivers/net/dsa/, 1 in drivers/net/can/).

As far as I see it from those commits, the more common way to address
this is to check that a macro is only used locally in some file and
that all uses of that macro pass a constant value as macro argument.

Maybe we add these two as equally good alternatives?

Lukas


>    **ARRAY_SIZE**
>      The ARRAY_SIZE(foo) macro should be preferred over
>      sizeof(foo)/sizeof(foo[0]) for finding number of elements in an
> --
> 2.30.2
>
