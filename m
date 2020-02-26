Return-Path: <SRS0=oITL=4O=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB245C4BA2D
	for <linux-doc@archiver.kernel.org>; Wed, 26 Feb 2020 23:19:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F049222C2
	for <linux-doc@archiver.kernel.org>; Wed, 26 Feb 2020 23:19:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xa3HZa1E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgBZXTD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Feb 2020 18:19:03 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:38913 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgBZXTD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Feb 2020 18:19:03 -0500
Received: by mail-pj1-f65.google.com with SMTP id e9so304123pjr.4
        for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2020 15:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zvqE6MvCPvJOL8QerB8lZLb+ktmIbQ2XOCq0TtICEMA=;
        b=Xa3HZa1EpXO1Kjzwiy274G3SpOxwxpWtXQ1vTHcSjfYcGO52mJyQEX33Y5Vti2WKHF
         sAlFBZzlnoSVacu+awRFirdHWDipZoGXW3YY918INaUXDPJ0jdp5klLmO57HXRQh5eYy
         7EmQ/vkz+W6LpEaOQyn1x+VJhE2F6PYeFwOc0Aakhxx48VLJQL2SvCF22nDIvif+g7/K
         68ImH4tBeCvXuMBWWmNXNO8+GBQk7+yYQDCNUw0ks1poL999C1qL1FJOumDPhOzwfCkJ
         JEhPVOB8xvF1x+HTuO56iO3emmw+laMwBPu0Hy2H8i5o9qQbLEFW4RRqe3kxUdl6gnam
         w28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zvqE6MvCPvJOL8QerB8lZLb+ktmIbQ2XOCq0TtICEMA=;
        b=nips97rTLGkEPdYWJXrK2oXRCknLe7n3I/l6Mw9Dm0J1KiUNdacZ6gBVQlhKxrwaaN
         W38N3jN6tejhweEfOa0zMAvU3Hr62Moliaqet1Dul807B/XpOX2DysfviyUirV283kWN
         AQTe8fgB7bYMIMO7HjwTogBq6raEtDouy8vSoLEYgB0LOG++07dK3oOAyDaQ49qUUSok
         gdT/bdbtXsW6NKpz1+0CvdsGPMP20KtqCIeHhJwjaLgJdSRLeRF/+oiZ0DWIbwv7PiEo
         k5j/e+4i92u0+ZcO2abTSXTFNU8oOl7HADMeRh2n1mShNs/CVwXfrsWCt5t+waGhAjJj
         QhLw==
X-Gm-Message-State: APjAAAU0RRcGdbnLB3ANar1dSK5KSuAM1shvbKRrPamTD1iO3wPyfUgI
        TuaFOOdkFo5+lW6nb91u5AeGrh531ZOi1CR4ZCFQ1A==
X-Google-Smtp-Source: APXvYqwAKmrsXVht51i2+AM65Vb4Wv0xKBJEdypHT8o2uZceWJyGrkmrIqrJoyV2IhJ4izvhHwRRuKGIsYCt9H3pItE=
X-Received: by 2002:a17:902:6948:: with SMTP id k8mr1607216plt.223.1582759141823;
 Wed, 26 Feb 2020 15:19:01 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <202002242003.870E5F80@keescook> <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
 <CAKwvOdn0_EETGtBVhbRKMPqv2K04Z1N4PuOZDZ6++Ejbi9-B-w@mail.gmail.com>
 <202002251353.25A016CD@keescook> <3b7b2b366220c9ba39ebc241ba22c0304f0d61b0.camel@perches.com>
In-Reply-To: <3b7b2b366220c9ba39ebc241ba22c0304f0d61b0.camel@perches.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 26 Feb 2020 15:18:50 -0800
Message-ID: <CAKwvOdmSix2hgDGsvcAzVD9L5XmM8tPDMyrdXmZjcvGXu_TMSQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/ Clang/LLVM
To:     Joe Perches <joe@perches.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 25, 2020 at 2:21 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-02-25 at 13:56 -0800, Kees Cook wrote:
> > I think we should take a specific version stand as the
> > "minimum" version. Being able to build x86 defconfig is a good minimum
> > IMO.
>
> Agree.
>
> It's odd to say that clang 4 is fine for arm when it's
> not fine for x86.  It's also reasonable to expect arm
> users to upgrade their compiler to a more recent version
> when the only cost is a very small bit of time.

That's a very x86 centric point of view.
-- 
Thanks,
~Nick Desaulniers
