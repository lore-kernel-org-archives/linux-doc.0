Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B61AC433F5
	for <linux-doc@archiver.kernel.org>; Wed,  8 Dec 2021 01:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239225AbhLHBdj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Dec 2021 20:33:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235025AbhLHBdj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Dec 2021 20:33:39 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B07C061746
        for <linux-doc@vger.kernel.org>; Tue,  7 Dec 2021 17:30:07 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id v15so1443407ljc.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Dec 2021 17:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oY1YzqKk4aWlmDE7Q71zlaeF3NQefpgJ3dA3BCsYPu4=;
        b=TanE49c9j+vNtjsphwwu+auu7KpkPp9t6oDpqsR9KpWE2jkcvQhEk6OEOBCjxsocAo
         IpFwWN9l/B5J2eGgk8Y/vEQssZ1DEE2Grjx3JXxUG5gFO0yQIcTfFqYYHIa2ppmo+sPs
         VWZcZQW5df3SiZwqVx2vzkLqDxpHWIMAbJtmHYirApmq3Mzz5Vhuud99RWwRaquR5hMn
         Rl/NLQg6IDpEvVQd29AbrfdbUwbZiQEjwTsBqxB786bbtei5ynb0q6Bd293w+peeoXJ/
         xQPVxcvPmcIujIKv/yI/7zQUozAsGlfWK9iB9HCWkYAqVqbngMaLTia8w1gyyeVuZqxR
         upfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oY1YzqKk4aWlmDE7Q71zlaeF3NQefpgJ3dA3BCsYPu4=;
        b=NdrXYB6IFOANN7V8tufVGK+n2RU/fIwyhqq99YY0GifM6d0p+xJyekJXzP4SjR39DF
         1CU0gVq4VksVtnvmgIllWH/hjAl5rgL86VFwW+IW/C6MzosFBNtL4Pm1BHiNzcfsv2R2
         qHAjsX5dnARAaEccc1e7XC6CK0eXyCWtcwEdN1Dr+kFDZUEGJlymF2IqoJ83u9zITk+v
         +XYuJhmRWD5e0msXwVj02Lp2hsQvItXhG6S/curvWSnnr+4Iic49591C0qS8AlZlkBg4
         Sx7nskVn4ndz9gJRDjrU6r/HwgC1ZvpPesThs3E6W/Mt8m2nzoR07dYOgeWGDRf6q871
         p0Ww==
X-Gm-Message-State: AOAM533CeoO4zQKpN5VTbPUrysN/pAwpJJYfZhrbmNCBicc3WsDa7KMK
        KYf5TMleuxeOCcgRJsVRe494BA33+n7vgSPXCEnJmQ==
X-Google-Smtp-Source: ABdhPJxmd2LH6zwPwgpPDbCVOETpHSXAwZjmhvHQMjUkXqasuAqG1D74p/kFoM4q8OpYs6prJvtVqpiLKndVoC9He3Y=
X-Received: by 2002:a05:651c:292:: with SMTP id b18mr47002761ljo.220.1638927005840;
 Tue, 07 Dec 2021 17:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20211206140313.5653-1-ojeda@kernel.org> <20211206140313.5653-15-ojeda@kernel.org>
In-Reply-To: <20211206140313.5653-15-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 7 Dec 2021 17:29:53 -0800
Message-ID: <CAKwvOdnA+XU9u+dJ6NfmVFDTxdkCH4v04nMVaieuzauWZtBUpw@mail.gmail.com>
Subject: Re: [PATCH 14/19] docs: add Rust documentation
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Yuki Okushi <jtitor@2k36.org>, Wei Liu <wei.liu@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 6, 2021 at 6:07 AM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> Most of the documentation for Rust is written within the source code
> itself, as it is idiomatic for Rust projects. This applies to both
> the shared infrastructure at `rust/` as well as any other Rust module
> (e.g. drivers) written across the kernel.

I'm sure Documentation/rust/ will grow over time; there's certainly
more that can be added and core kernel devs will have more questions
over time. I'm still running into a SNAFU actually building; see
https://lore.kernel.org/lkml/CAKwvOdk9VNenJJN5HnPpGgsHT+OsRsgPGSesQgqMP2aLPWy0NQ@mail.gmail.com/.

But I read through all that was added here and didn't find anything
problematic IMO.  I didn't verify the png's are actually the logo...

I don't think `make htmldocs` produced any new warnings, though it's
not exactly warning free at the moment (pre-existing before this
series).

> However, these documents contain general information that does not
> fit particularly well in the source code, like the Quick Start guide.
>
> It also contains a few binary assets used for the `rustdoc` target
> and a few other small changes elsewhere in the documentation folder.

How is rust-logo.png being included in the docs? Is there something
with RST that isn't grep'able for rust-logo.png?

> --
> 2.34.0
>


--
Thanks,
~Nick Desaulniers
