Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124F1C3F6B0
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jul 2022 17:14:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbiG0ROz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Jul 2022 13:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241673AbiG0ROL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jul 2022 13:14:11 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0BF76EBF
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 09:42:32 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id z23so32275765eju.8
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 09:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AcPJOkIHEC0icvBEnpWtnVKxz/BvRtFJOpxpTEHoQRg=;
        b=dnnAblfbBitvVzSIxg4x60tAPSI8URVjg+EFtGQCO+Egbv95vWxxuJA0seKRUNvCni
         MH/l2lfP3y3m2n82QniX+RZ7l/z/R/u1/iB5fRHweoFmNcwnKUaQHfBq5L2Tk1oDNYlw
         q+xyWk2wZadVAhHiWbYj77fvxQHCyW96l9uJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AcPJOkIHEC0icvBEnpWtnVKxz/BvRtFJOpxpTEHoQRg=;
        b=luunNv34DfZMJFN4Jp3ndXdNZW+VYHwybtl6zvNBh5EDI50iPwYsd+YRxUbOJQV4Ww
         Vsa9vciUiCQyyzTg8GF+mbxHpA82IWhaLJ+er2v7sGfPHCW8ffUqQti4DXhVjWCW4for
         3hbC/m3R197QLBhHjJvV2TJ/glGj2e2zBYnsISA94ar/GEabpxi3xNpp7IX9rfVw5vAB
         t+hkUbl7Wqoq9EV6jbQX5DlmzosnOqjcpRG/wwBRNP+kXz0TuTarnpJXStRijCTxG3bw
         LeeEmmFM5+/rYK3lsr2Joc1tX2JR5hs2fIw4J9QbvCGK7PTrV3xHeXAxS5I3ffT/UWrH
         Bvsw==
X-Gm-Message-State: AJIora+OKkjw8AnlK1ZbZ9QzxlhWkFuSaP2Tpd5byT1CLwMKBarSM/1/
        gHFclVKN0xZWUtwGASd02cYiJJDGExcwA3rD
X-Google-Smtp-Source: AGRyM1uYfp4f4BGflvahnvqYoFejGH8UgWHe3PNfjimaTGste2gWjd30OgvQ4VsIA/QS+oL0Oe2uKQ==
X-Received: by 2002:a17:906:6a1c:b0:72f:2174:13db with SMTP id qw28-20020a1709066a1c00b0072f217413dbmr17132159ejc.687.1658940148939;
        Wed, 27 Jul 2022 09:42:28 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id b3-20020aa7d483000000b0043ad162b5e3sm10390180edr.18.2022.07.27.09.42.28
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 09:42:28 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id l22so3763633wrz.7
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 09:42:28 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed0:b0:3a3:3ef3:c8d1 with SMTP id
 g16-20020a05600c4ed000b003a33ef3c8d1mr3721170wmq.154.1658940137807; Wed, 27
 Jul 2022 09:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210929185823.499268-1-alex.popov@linux.com> <d290202d-a72d-0821-9edf-efbecf6f6cef@linux.com>
 <20210929194924.GA880162@paulmck-ThinkPad-P17-Gen-1> <YVWAPXSzFNbHz6+U@alley>
 <CAHk-=widOm3FXMPXXK0cVaoFuy3jCk65=5VweLceQCuWdep=Hg@mail.gmail.com> <7c567acd-1cc1-a480-ca5a-d50a9c5a69ef@ispras.ru>
In-Reply-To: <7c567acd-1cc1-a480-ca5a-d50a9c5a69ef@ispras.ru>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 27 Jul 2022 09:42:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgSyNh2gZTnC-EoiGs5WNtVu99jcHXxLRUvwMabm37iKg@mail.gmail.com>
Message-ID: <CAHk-=wgSyNh2gZTnC-EoiGs5WNtVu99jcHXxLRUvwMabm37iKg@mail.gmail.com>
Subject: Re: [PATCH] Introduce the pkill_on_warn boot parameter
To:     Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc:     Petr Mladek <pmladek@suse.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Alexander Popov <alex.popov@linux.com>,
        Jonathan Corbet <corbet@lwn.net>,
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
        Thomas Garnier <thgarnie@google.com>,
        Will Deacon <will.deacon@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Laura Abbott <labbott@redhat.com>,
        David S Miller <davem@davemloft.net>,
        Borislav Petkov <bp@alien8.de>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-hardening@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        notify@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 27, 2022 at 9:17 AM Alexey Khoroshilov
<khoroshilov@ispras.ru> wrote:
>
> We see a number of cases where WARNING is used to inform userspace that
> it is doing something wrong, e.g.
> https://elixir.bootlin.com/linux/v5.19-rc8/source/net/can/j1939/socket.c#L181
> https://elixir.bootlin.com/linux/v5.19-rc8/source/drivers/video/fbdev/core/fbmem.c#L1023

That first case is entirely bogus.

WARN_ON() should only be used for "This cannot happen, but if it does,
I want to know how we got here".

But the second case is fine: Using "pr_warn()" is fine. A kernel
warning (without a backtrace) is a normal thing for something that is
deprecated or questionable, and you want to tell the user that "this
app is doing something wrong".

So if that j1939 thing is something that can be triggered by a user,
then the backtrace should be reported to the driver maintainer, and
then either

 (a) the WARN_ON_ONCE() should just be removed ("ok, this can happen,
we understand why it can happen, and it's fine")

 (b) the problem the WARN_ON_ONCE() reports about should be made
impossible some way

 (c) it might be downgraded to a pr_warn() if people really want to
tell user space that "guys, you're doing something wrong" and it's
considered a useful warning.

Honestly, for something like that j1939 can driver, I doubt (c) is
ever an option. The "return -EBUSY" is the only real information that
a user needs.

               Linus
