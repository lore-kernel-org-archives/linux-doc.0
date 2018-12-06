Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 20EB17D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 12:37:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbeLFMg7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Dec 2018 07:36:59 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:46879 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729038AbeLFMg7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Dec 2018 07:36:59 -0500
Received: by mail-io1-f68.google.com with SMTP id v10so179772ios.13
        for <linux-doc@vger.kernel.org>; Thu, 06 Dec 2018 04:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WidNIP8PGlQQtkA0lmSuS7tUfoPMSknLn9VUL0IsozE=;
        b=eF4lMLd2gM5bZJkTfp6Rs2kYVm7O2ljRh8HtAeOfR/uvqp9VX9Le/TtrRT4623RIW9
         S37itEwpEmj2zoERka2diuAljUcjkjdXO182hvOyUN0whOir04e6TkSCA33JGJhc04yc
         vA0VMroGWF2XsAc9XPb2Ti576+1OhnTFlFLpuSYYU9PlebzUtOiYlNDXrS7Q3wLpNtpv
         VTEefTG7R6HvqN1nlJnEta/2ds92zk+a+UXyTze/lHXdz5XyqfUTgAu2aMkeBOT3EWdZ
         +0v4SzUCJkcJF52coaPIb3gYx+Uu7LXUvWaHF1dyFK8zP8+M/DrG8ohcEnrL4h4pDCXE
         DaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WidNIP8PGlQQtkA0lmSuS7tUfoPMSknLn9VUL0IsozE=;
        b=I2h53gIkUM5PX1fAa6tXS6nK90aAGdpjcFssycLxQkl1ycS4fKmAQZFniC0/m1/84F
         8Jx5uwGfs3/8V77PYC6Ymemu2zyHySnUydqgxJu+Ngh12x3+tOHRHW4rNBKKECFc7gFa
         lKKJFBnnxB5QJNMtoS+GHADXiPsKW51rlSBYLdXhOSRQuj0F9vXWtYIxRBAzhwptRfHz
         h1VJOYQ8TMPdxUTmfu+RblXp+IUubRzm+Gus20QBkzUHoRdwOL2EFJGNmZuzx89JkD9g
         uR7hM6fC1v7a5QlErgoE7+NKEM1zQfEtQCaBFUyfxnakG3vsVed2b65aSOCdXV5NtawR
         Tplg==
X-Gm-Message-State: AA+aEWYHGqVyMJKnfsd9AOrBGTh/H9SV64AmEMh5dCDG0d6hiJK8a4p+
        NjsmD2r7pW+A3WOPnfus7t//PQKLFIWA3HMB6uUCqA==
X-Google-Smtp-Source: AFSGD/Xm9VGdnSPf1hWOUupCpcd7a1Mg3qQvtYoJwqmAMi3YOnI7fV93LEeSmCsW4kQDTIuBhjZmOXHOAFzCCUI1QE0=
X-Received: by 2002:a6b:6919:: with SMTP id e25mr8796163ioc.119.1544099817423;
 Thu, 06 Dec 2018 04:36:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1541687720.git.andreyknvl@google.com> <c9028422854fb5bfb79d798397b30d4701207062.1541687720.git.andreyknvl@google.com>
 <20181129182323.GI22027@arrakis.emea.arm.com>
In-Reply-To: <20181129182323.GI22027@arrakis.emea.arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 6 Dec 2018 13:36:46 +0100
Message-ID: <CAAeHK+y7AwdXsEgBYqLUzps2K8aGcbDsSpS+obCs11voZX55og@mail.gmail.com>
Subject: Re: [PATCH v8 2/8] uaccess: add untagged_addr definition for other arches
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Evgenii Stepanov <eugenis@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 29, 2018 at 7:23 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Thu, Nov 08, 2018 at 03:36:09PM +0100, Andrey Konovalov wrote:
> > diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> > index efe79c1cdd47..c045b4eff95e 100644
> > --- a/include/linux/uaccess.h
> > +++ b/include/linux/uaccess.h
> > @@ -13,6 +13,10 @@
> >
> >  #include <asm/uaccess.h>
> >
> > +#ifndef untagged_addr
> > +#define untagged_addr(addr) addr
> > +#endif
>
> Nitpick: add braces around (addr). Otherwise:

Will do in v9, thanks!

>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
