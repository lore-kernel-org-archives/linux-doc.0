Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0A24E7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Mar 2019 16:49:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfCKQtd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Mar 2019 12:49:33 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:52110 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727674AbfCKQtd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Mar 2019 12:49:33 -0400
Received: by mail-it1-f194.google.com with SMTP id e24so8393066itl.1
        for <linux-doc@vger.kernel.org>; Mon, 11 Mar 2019 09:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wheW8ruAVLkED+IQx5lIuhsAFwray9LmcUkbx4VnGWg=;
        b=anKR7d3mbOMpLsfGpjU4FyFPreObgWL1efAgwNK8fiI4IDR3m9Nn4PBGZlrLaFOOfz
         k0xijHrhDgaCLRTos8yWw9LQ2jqXtK+CZ+AFGfIhxpSj9cyvrIkQNpPFAhXosARqD7re
         6CJp7R8nP1T7m+XL4bP0z+ZDevfYoB7GpYXf9//FOfFryUE3b8ePevKMFMDbzPOYmK49
         R5fiq3no1lOWLaiKNT7Wq/N60S4ssmpqJEQBGws7nc6SEtGBczyfZkPA41kwRssTt7pr
         vAtb2OMZvJfqrKGijZVY5Pv7rj11qdIGfdyhbSuDrJGo5C31B929wyZZJtbbQlv4H0UQ
         R3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wheW8ruAVLkED+IQx5lIuhsAFwray9LmcUkbx4VnGWg=;
        b=pKAki070wykDqZUMjdZrUyRu5aC1L4ZnKBs96W1m1RyqE792P1zhtT/JOsqsUzhnwh
         DMpfu86Z3w9tSPKMQSV07fpWr+7OBqH44YBi5dS7s2iHfZrRj7UFO3YjXxAlmKqdNaZX
         3XATQ16BRw4aG1S90FMazYvBtEJ37HdI9ijjwvAaImhTWhpVhZVgiF5N1YgHwkgn8mlj
         7bNma0trsQjJYttKbhB5kGCTlpLBtesNH+sL+pwgZAEM50TQCubPsrJXyyeGNDvvfiaT
         eOjNqP+PDRCxuHVHLSU+zPhQXqUTlquypmrMp9ofbibzGteqNDL0qJ6KpRk8wKbgiRNZ
         LfIw==
X-Gm-Message-State: APjAAAXqA+mHDUFGF40N3A+dYuBvXSJCxbIPNQSu+U/ADdYp96LrKYCT
        LgrmZ6+VPnI0B8dR2GfAmhaWgdhy0KSjCZFQsUi1tQ==
X-Google-Smtp-Source: APXvYqxzhBCEfAw2XXxuQ/qW6kAhxeeRnGThucg80P/97odjEf/PBvcQelpwvmriD0Ll5pqV0Fxz9cQw3GqzlY34UuY=
X-Received: by 2002:a24:32d0:: with SMTP id j199mr390920ita.71.1552322972201;
 Mon, 11 Mar 2019 09:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20181215212304.19390-1-natechancellor@gmail.com> <CAK8P3a05QL855mx21R-Pr6c2WjhSoopdFk9z4HvKoeM19A5aSQ@mail.gmail.com>
In-Reply-To: <CAK8P3a05QL855mx21R-Pr6c2WjhSoopdFk9z4HvKoeM19A5aSQ@mail.gmail.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Mon, 11 Mar 2019 17:49:21 +0100
Message-ID: <CAKv+Gu8nWO_GCPF1e6viGTSi5c-C+HoXqFNU=9yboC47E-kAFg@mail.gmail.com>
Subject: Re: [PATCH] ARM: Ensure that NEON code always compiles with Clang
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nicolas.pitre@linaro.org>,
        Tri Vo <trong@android.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 11 Mar 2019 at 17:22, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Dec 15, 2018 at 10:24 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >  endif
> > diff --git a/arch/arm/lib/xor-neon.c b/arch/arm/lib/xor-neon.c
> > index a6741a895189..4600b62d845f 100644
> > --- a/arch/arm/lib/xor-neon.c
> > +++ b/arch/arm/lib/xor-neon.c
> > @@ -14,7 +14,7 @@
> >  MODULE_LICENSE("GPL");
> >
> >  #ifndef __ARM_NEON__
> > -#error You should compile this file with '-mfloat-abi=softfp -mfpu=neon'
> > +#error You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
> >  #endif
> >
>
> I see this patch has made it in now, but I also see two other problems with the
> same file that prevent it from working right with clang:
>
> - it triggers #warning This code requires at least version 4.6 of GCC

What is currently the oldest GCC we support for ARM?

> - As I reported in https://bugs.llvm.org/show_bug.cgi?id=40976, even
>   when it builds cleanly, it does not get vectorized.
>
> Has anyone actually managed to get this to do the right thing?
>

On my Cortex-A57 under KVM, I get this at boot

[    0.002287] xor: measuring software checksum speed
[    0.100054]    arm4regs  :  5212.800 MB/sec
[    0.200131]    8regs     :  3472.800 MB/sec
[    0.300205]    32regs    :  3282.000 MB/sec
[    0.400281]    neon      :  7011.600 MB/sec

So that means that
a) the cost model is inaccurate, at least for some cores,
b) given that the code is only selected if it is faster, it would be
nice if we could override the cost model based decisions made by the
vectorizer.
