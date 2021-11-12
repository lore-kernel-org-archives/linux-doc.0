Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA84C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 12 Nov 2021 21:26:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D943610FF
	for <linux-doc@archiver.kernel.org>; Fri, 12 Nov 2021 21:26:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235744AbhKLV3Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 12 Nov 2021 16:29:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235720AbhKLV3Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Nov 2021 16:29:24 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8F2C061766
        for <linux-doc@vger.kernel.org>; Fri, 12 Nov 2021 13:26:33 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id w1so43024394edd.10
        for <linux-doc@vger.kernel.org>; Fri, 12 Nov 2021 13:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ntZGBdiceWxX5bWKAyYQPAfUlf1Jy17/iBsUfaHjtvE=;
        b=WnpzkwgfwXofLeiX77Oe8YFgQJUod+ED3X+7zGSdhuhBdJ1F2P+TdKgmMLEdVL1SvZ
         /GS6JghHYzPxFbK4+NWebHaGgWNfR8ePRUJ+vL2ZwudXOMenfcKfNrB9ar+yxKCNchIc
         qL8+VW1E3C2BAaWeSIjvcK1Ufg0h/Rn5taTmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ntZGBdiceWxX5bWKAyYQPAfUlf1Jy17/iBsUfaHjtvE=;
        b=xj12qmtU7HDp723hzAZhEp+xv+mUM+O7CPbdeWhZMQGiYuRmHjffl/gvgNMbOhXrhE
         PZSY3mcDyHsSrbb00nexpu+mdSeRU20H+vgMHzAMR/DNWD9O+Ble7LDG30xM9e2tgh5y
         kL/brJ9K1JCzJMT91gronKb1DD+osh+PJsPpnOogOKv4K6wUiZ228OpJOJc2BvxJ/6oV
         6D+5n3/VMeHgzWVSL1Oi4Ub72AAvjxy788IRmGEJOjWl89MkaLeDol9q2El5zOufvaw7
         sX1TNNFTiIaO6fz81R+wQnYg05RHeypQOn+Gg8ChgpW9Nf+EQTqu8ISieY/cNfKmeV9v
         0i/A==
X-Gm-Message-State: AOAM533jiOA6iwTOUz4P6Gb+3CzxX9wcAsI9DZupaOlCOwuqCbTCOAJu
        b0VXXLfcgSEXxmzfOy92J2n1VfvwYkuCXdkgPDs=
X-Google-Smtp-Source: ABdhPJzvhG9nnc33qJdtF7cjhcSTMWRhcRURCig0LC20MVmY7csbvm4YMl2+Ame8JBdcFM8jFVKqLQ==
X-Received: by 2002:a17:906:58c1:: with SMTP id e1mr22889917ejs.327.1636752391423;
        Fri, 12 Nov 2021 13:26:31 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id j21sm2906898edp.21.2021.11.12.13.26.29
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 13:26:30 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id b15so42675076edd.7
        for <linux-doc@vger.kernel.org>; Fri, 12 Nov 2021 13:26:29 -0800 (PST)
X-Received: by 2002:adf:cf05:: with SMTP id o5mr22971280wrj.325.1636752379227;
 Fri, 12 Nov 2021 13:26:19 -0800 (PST)
MIME-Version: 1.0
References: <20211027233215.306111-1-alex.popov@linux.com> <ac989387-3359-f8da-23f9-f5f6deca4db8@linux.com>
In-Reply-To: <ac989387-3359-f8da-23f9-f5f6deca4db8@linux.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 12 Nov 2021 13:26:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgRmjkP3+32XPULMLTkv24AkA=nNLa7xxvSg-F0G1sJ9g@mail.gmail.com>
Message-ID: <CAHk-=wgRmjkP3+32XPULMLTkv24AkA=nNLa7xxvSg-F0G1sJ9g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Introduce the pkill_on_warn parameter
To:     Alexander Popov <alex.popov@linux.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul McKenney <paulmck@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Joerg Roedel <jroedel@suse.de>,
        Maciej Rozycki <macro@orcam.me.uk>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Kees Cook <keescook@chromium.org>,
        Luis Chamberlain <mcgrof@kernel.org>, Wei Liu <wl@xen.org>,
        John Ogness <john.ogness@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Jann Horn <jannh@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Lutomirski <luto@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Laura Abbott <labbott@kernel.org>,
        David S Miller <davem@davemloft.net>,
        Borislav Petkov <bp@alien8.de>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Scull <ascull@google.com>,
        Marc Zyngier <maz@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Wang Qing <wangqing@vivo.com>, Mel Gorman <mgorman@suse.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrew Klychkov <andrew.a.klychkov@gmail.com>,
        Mathieu Chouquet-Stringer <me@mathieu.digital>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Stephen Kitt <steve@sk2.org>, Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mike Rapoport <rppt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-hardening@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>, notify@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 12, 2021 at 10:52 AM Alexander Popov <alex.popov@linux.com> wrote:
>
> Hello everyone!
> Friendly ping for your feedback.

I still haven't heard a compelling _reason_ for this all, and why
anybody should ever use this or care?

               Linus
