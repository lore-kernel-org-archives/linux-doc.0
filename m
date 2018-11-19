Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7105D7D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 22:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbeKTIns (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Nov 2018 03:43:48 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38279 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbeKTIns (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Nov 2018 03:43:48 -0500
Received: by mail-wr1-f66.google.com with SMTP id e3-v6so33719661wrs.5
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 14:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rn6DTdvqAWgPMVnXBkpNx8JUXTqj9odqPaLxlpVq9GY=;
        b=G5Zj+kB/DaPzFLkMUYOSH0jVEoj14icD+FYAsOkO++yUs7sqsA1BFRQXpJw1ybRXrO
         UQN/1gM5jbJAd5hI5zrckdCiklRoesLWWzBmM1r8Nmnq7UpUiRGFACYyKMVgACG+6MIW
         TeFnQG6MV+1t7FQMFvCbaeaPllvEfJkuAFMWGW+hJ9iki3WGgB6towompIrX27cKZWz9
         cOdQcMudfG3VEWWbMCWXPyMaARsP6YbojroF3PWy02H2pdmANuMnJMA90agoHf4aRoQ5
         ETy1O/mq6zZR7AQy4TvYQcOBIPygaq5NDLpRHNC0G4B1qzOmNtgub9aZrQtQIGlhDm97
         uhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rn6DTdvqAWgPMVnXBkpNx8JUXTqj9odqPaLxlpVq9GY=;
        b=jAgKhuobLsq6Y6Bb/DcfxAM31a/WpYXthW3CxDrrXFUIUOoU6dxfxFw+vBAdvofghL
         MFFTZhZZzBrjUGiIPypGEQtvsoxexNeqxpGlawgRfeRGNPDybvHe+hZ0hhIDl0hLoV0Y
         hu6/5cFUnpHpevHif9w4/CL2gTZd4QQkG1sbpuON9V1wszeLNlyefsvb8OneB34Wc71R
         Nor4Dmvby0gsF/5FXiSFE+5NnGL3Ikmjnuz2QahYLZ8Nnu3NcuH5xLTiTpabT4WlUnjm
         eAQLIDXr3X5QKxk0ElIQ7w6QBXPeAvfitoCfo58bJ48/uNdboEqcQnKeZwMInEARKI2R
         cy1A==
X-Gm-Message-State: AGRZ1gIF9S9EPjaFq7slCfuEAWw73+CbOQqlYmk6cg+CgINATwYgARQe
        ggNdxmMvw5tox5ycJsAQBXa+TsrEzOChgvUGE4OpLg==
X-Google-Smtp-Source: AJdET5cwjEMH66N+G50Kms8lEvgZQI1cbGvVz4noSdxEGU5YhgZUVxQwryVZc7E/98DvlHrHhRtOsOdYZ5ofWYgEOL0=
X-Received: by 2002:adf:e08c:: with SMTP id c12mr18845438wri.199.1542665880506;
 Mon, 19 Nov 2018 14:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20181119214934.6174-1-yu-cheng.yu@intel.com> <20181119214934.6174-9-yu-cheng.yu@intel.com>
In-Reply-To: <20181119214934.6174-9-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Mon, 19 Nov 2018 14:17:48 -0800
Message-ID: <CALCETrW9ABDotyM020V147+kuizpTRJUAANn-6kUt6-h0Qn0og@mail.gmail.com>
Subject: Re: [RFC PATCH v6 08/11] x86: Insert endbr32/endbr64 to vDSO
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 19, 2018 at 1:55 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> From: "H.J. Lu" <hjl.tools@gmail.com>
>
> When Intel indirect branch tracking is enabled, functions in vDSO which
> may be called indirectly must have endbr32 or endbr64 as the first
> instruction.  Compiler must support -fcf-protection=branch so that it
> can be used to compile vDSO.
>
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
> ---
>  arch/x86/entry/vdso/.gitignore        |  4 ++++
>  arch/x86/entry/vdso/Makefile          | 12 +++++++++++-
>  arch/x86/entry/vdso/vdso-layout.lds.S |  1 +
>  3 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/entry/vdso/.gitignore b/arch/x86/entry/vdso/.gitignore
> index aae8ffdd5880..552941fdfae0 100644
> --- a/arch/x86/entry/vdso/.gitignore
> +++ b/arch/x86/entry/vdso/.gitignore
> @@ -5,3 +5,7 @@ vdso32-sysenter-syms.lds
>  vdso32-int80-syms.lds
>  vdso-image-*.c
>  vdso2c
> +vclock_gettime.S
> +vgetcpu.S
> +vclock_gettime.asm
> +vgetcpu.asm


What's this hunk about?
