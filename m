Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2FBCF7DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Apr 2018 21:17:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751492AbeDFVQ7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Apr 2018 17:16:59 -0400
Received: from mail-it0-f43.google.com ([209.85.214.43]:56033 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751435AbeDFVQ7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Apr 2018 17:16:59 -0400
Received: by mail-it0-f43.google.com with SMTP id 142-v6so3762715itl.5
        for <linux-doc@vger.kernel.org>; Fri, 06 Apr 2018 14:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=TxYxbPscPYnUACH84vJLbIU4s6Jh05Xb7Qg/Vxp68Rw=;
        b=r7jugiISvEuXMVOJ5OWS5WAFHFcsub2hj/kn+wPsJ5P/w09c95+R0wEUTaXA7o97mA
         DkxXtHK6sddv6LJOGvRwRv5JoyGMwen48yhmyKaVWlwfIYBGTIrjp12uwVJIZOnTMJy0
         5P3VejbV33GMAx7xMT+I+zcC1ar5sP5BY8mYLM8WUarV9MCS9pzIXj7V8anKQy3HcWb9
         MtmsH6o5vwenauR45VjS3pHBsZSdL5nkIDIrIgJw5tsDEZfZllbZ6ZuwiIYOj+5Ggtb1
         Uko+c1zHjfPSpfOzZhF+dEo6u10grcfKoqjA2jSSM6F4RdVw3GtRHpM+DMAflvNVHTB+
         hMmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=TxYxbPscPYnUACH84vJLbIU4s6Jh05Xb7Qg/Vxp68Rw=;
        b=YKyq26gg2X6+FqqKY2H85UmGxduLXNjXvv1h+DxxAmGpVCOv3h1n18+/2nwTrLUJMr
         py7NIX0kCTPV75KiEMho2oGTVWH6Qjav2eyfLaZ7P+RKBcsFBLgNUw5OEJpSidVOnSjV
         MyEmNdNivnNaNc+ib8UXiDgY3jXI5mugbNgp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=TxYxbPscPYnUACH84vJLbIU4s6Jh05Xb7Qg/Vxp68Rw=;
        b=PiV9qxM5tk1YRDaH53gfg6coQn0td2ysgQ5L0o77g7M/8R6QGiXcPHHXsqDb5a9wki
         J3kH8YoJRjNIm3+As3ZtQ4nvNQi0tsZ8jo5iGi1g/0XcJa1MmgNDhhS7QZk0VgvJ7Bj+
         lIz2Xq30bME/URQ8UGdsEzw10CumMRKDfGpxcwahKT0XpW9pnBZq8pHTkh0/9DE58md7
         Ewb0F3vUNxbkFHKlGKwtR0nFdv63R+S2/8fRTJzkR4eVN+H9zkLeGdnr7Si/azuqynE7
         H439L1mM9rkc4vfSdHYbCy4B80s+bkd36upg/OI0YV4o2yHuEztX8+7ds2gFVpqPs5gB
         BZ8w==
X-Gm-Message-State: ALQs6tAzZ7iE15ECppuRc9OL5uGTX6aaqr9QPsNhqi/sBW+EomHt4QYU
        qUWJWRhbDiMa6pJeFJ2uHbrTONC9wS1M7nh50RE=
X-Google-Smtp-Source: AIpwx4+BOcHYTdQIXBWAkG8bScC/661hGOxRbFSNYe82QaMgYxciSlqTPEwKW34dJ+eiV08AvuWqbHrOduYq46HwlGg=
X-Received: by 2002:a24:7693:: with SMTP id z141-v6mr19274569itb.113.1523049418109;
 Fri, 06 Apr 2018 14:16:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.95.15 with HTTP; Fri, 6 Apr 2018 14:16:57 -0700 (PDT)
In-Reply-To: <20180406210235.GB9618@bombadil.infradead.org>
References: <152287959470.14760.10350886166577848180.stgit@warthog.procyon.org.uk>
 <4034.1523025880@warthog.procyon.org.uk> <CA+55aFwKc1JzU6k=3R9n23HGXb5-BACT8pQ93rGTvgNjfa4ZHA@mail.gmail.com>
 <CA+55aFx_fs7C6JAX_ORJ9MoXEp25LcXS0CUnK4aO4p=hQw6xOg@mail.gmail.com> <20180406210235.GB9618@bombadil.infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 6 Apr 2018 14:16:57 -0700
X-Google-Sender-Auth: pc6P_Ire6kzlMdOnXnQq76xW6Uw
Message-ID: <CA+55aFztYij6jkVXXDDMawwEd_Qsb6LsB5wqS0em85VapYXm_A@mail.gmail.com>
Subject: Re: [PATCH net-next 00/12] fscache: Fixes, traces and development
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 6, 2018 at 2:02 PM, Matthew Wilcox <willy@infradead.org> wrote:
>
> We have out of date information in Documentation ...

My match is actually fairly lax.

As long as the email has both "git" and "pull" somewhere, I should see
it.  It doesn't actually have to be in the subject line.

And almost always the "git" is there anyway, and DavidH's email had
that one at least twice, in just one line:

>        git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git

and a lot of people end up having some boiler-plate that says "Please
pull" or something, so they get the "pull" part that way too, and I'll
see those emails even when they have nothing at all in the subject
line.

But yes:

> Jon, please consider applying:
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index f7152ed565e5..908bb55be407 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> -A pull request should have [GIT] or [PULL] in the subject line.  The
> +A pull request should have [GIT PULL] in the subject line.  The

That's the *safest* thing to have, in that now the subject line itself
already covers everything, and doesn't depend on anything else being
implicitly in the message itself.

And it's what most people seem to use, based on what I see. It makes
them stand out visually to humans too, not just to my usual filter.

Having "PATCH" in the subject like (like DavidH _does_ have) also ends
up being something I look for, but not during the first week of the
merge window when I'm overwhelmed by pull requests. I usually do that
at the very end of the merge window just to try to make sure
(sometimes even successfully) that I didn't miss anything.

                   Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
