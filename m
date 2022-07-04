Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B8AC43334
	for <linux-doc@archiver.kernel.org>; Mon,  4 Jul 2022 14:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234921AbiGDOyw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Jul 2022 10:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234879AbiGDOys (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Jul 2022 10:54:48 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2D525D8
        for <linux-doc@vger.kernel.org>; Mon,  4 Jul 2022 07:54:46 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a11so11372117ljb.5
        for <linux-doc@vger.kernel.org>; Mon, 04 Jul 2022 07:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OhFJP83IUHbWPfa5XYA713widvtxwIUdWS+vTNhcHqQ=;
        b=Xe7CHCSsEz+tXgH/AUorOWUqTjmElx3eZxxCbN2rvu5hEKtRQXaKV9JXb3+CmnooOt
         UidEeuY5CT3tyzS4l6ZvwrRWvSqQmHqZMQlqcyGFo3UzXDXqHi7E3ZPM7vhkvc/ykkbX
         jwApdwkKJ+W0fHtc8/AhL2Fkdv6pbBHHQz7PBrfHkE/2q4YRAzuGWY5HBNkGgud3MZf7
         wImrxJOa4Mt1x3urfEofX1CfGl0+I30oIOwvNuOO7O9X2/ic1JLDidw23/olpvFqEyKD
         NQOypMZy95h580lV5j285CauX0SJnCAsvPH7QFyrsWd+CTyZ44pfe4k4LfEevYO1UnC4
         1omA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OhFJP83IUHbWPfa5XYA713widvtxwIUdWS+vTNhcHqQ=;
        b=Oq6Ej80kIF8d/Ig0pH/WC6tT0qaDd+CgBaa3yvGjCddX+s+GRexDkPNwzTnNlcU5R2
         aFjNIiGYJDOxUNOB9jIxvl38RmbPVvjzxqc8PZ70DFVlvrhLsI7CbybrDciJTvrEy7Tu
         wVtfSDnJ/7BOPYmqt6Fp3VAlo/3+VLxkAL0TZwoke+5F5UhwJY1qlavkMDMh++/UbbsX
         YzznxSdD7pXmtNqezsmQ6Ti7PrXnHtkKs3v0jVhnI0+Zhq3lr8q8gDLYB73tG7/Pyt0K
         Gybsb9zV8ZSUh5jNKjaK9K7IcTSjO3Ag83gCZx1cX+Xb2eScd2YgdDjORUsp0VRRsZJT
         qoYg==
X-Gm-Message-State: AJIora/ZNMg0Msfv1utxzTCOBBbUW4w6yffYUTfdiz8LcfL/T1lJrBIz
        fSr+Al4G9cZrlRHXxZNwE6j0yTMDFmVzFTrG/IA=
X-Google-Smtp-Source: AGRyM1utHU8HxeU3bNMYTjlVttY0rtc0w9MLBhtOUgQOF9K4bVXSrj1LfeWamTuUwbfwnKb1s985g/rQXTUKt8Gnawg=
X-Received: by 2002:a2e:8449:0:b0:25d:1a37:ead2 with SMTP id
 u9-20020a2e8449000000b0025d1a37ead2mr4847876ljh.509.1656946484006; Mon, 04
 Jul 2022 07:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220704134402.1486566-1-martin.fernandez@eclypsium.com>
In-Reply-To: <20220704134402.1486566-1-martin.fernandez@eclypsium.com>
From:   Dwaipayan Ray <dwaipayanray1@gmail.com>
Date:   Mon, 4 Jul 2022 20:24:32 +0530
Message-ID: <CABJPP5D96YATx1QxKhz+_JoonEKzduzHjNj0CG1=oUbnyEHzTw@mail.gmail.com>
Subject: Re: [PATCH v2] doc/checkpatch: Add description to MACRO_ARG_REUSE
To:     Martin Fernandez <martin.fernandez@eclypsium.com>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, Jul 4, 2022 at 7:14 PM Martin Fernandez
<martin.fernandez@eclypsium.com> wrote:
>
> Add a description, an example and a possible workaround to the
> MACRO_ARG_REUSE check.
>
> Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index b52452bc2963..f7ed2c1f9d5e 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -759,6 +759,26 @@ Indentation and Line Breaks
>  Macros, Attributes and Symbols
>  ------------------------------
>
> +  **ARG_REUSE**
> +    Using the same argument multiple times in the macro definition
> +    would lead to unwanted side-effects.
> +
> +    For example, given a `min` macro defined like::
> +
> +.    #define min(x, y)  ((x) < (y) ? (x) : (y))

Prefer indentation of 6 spaces here (5 given).

> +
> +    If you call it with `min(foo(x), 0)` would expand to::

If you call it with `min(foo(x), 0)`, it would expand to::

> +
> +     foo(x) < 0 ? foo(x) : 0

Same indentation issue

> +
> +    If `foo` have side-effects or it's an expensive calculation the

s/have/has

> +    results might not be what the user intended.
> +
> +    For a workaround the idea is to define local variables to hold the
> +    macro's arguments. Checkout the actual implementation of `min` in
> +    include/linux/minmax.h for the full implementation of the
> +    workaround.
> +
>    **ARRAY_SIZE**
>      The ARRAY_SIZE(foo) macro should be preferred over
>      sizeof(foo)/sizeof(foo[0]) for finding number of elements in an
> --
> 2.30.2
>

With these changes in place:
Acked-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

Thanks,
Dwaipayan.
