Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CA0567D048
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Jun 2018 17:15:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751951AbeFERPg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Jun 2018 13:15:36 -0400
Received: from mail-qt0-f196.google.com ([209.85.216.196]:37791 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753404AbeFERFv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Jun 2018 13:05:51 -0400
Received: by mail-qt0-f196.google.com with SMTP id q13-v6so3204642qtp.4;
        Tue, 05 Jun 2018 10:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=bF1CR2qsK8jOAYOkJS03kmIipTowewlCCJfMjbpFnv8=;
        b=kqvx0EePf1WoydO9npBcAo5YuQ+0gpCgP61aTTJo/3+ktmayeMPXO2ZuRBneZTTFOb
         20XlufPCssZZDuNVyFxpW0kYlSE3UGj14nDE3v7UL6YeqibKmYRutrgMl+LAVs38iHMj
         qh/Q2+um6xm6bIImre/Ujko4/aAG1uM8AHBOWCrKzwfITcHFED6IX+1UYj0DdIRSXnoQ
         JEibuxYcEiK4RtwBUJqi36L/qKEOFCtLeCnwUNofA8SkPF1tcb/VZE2sK2m6Qk4F/nXP
         tQp4S5uwxjpEvhyxmjR5POH1d6/nPsL68Pqa8pG/+wrKS5Yq1peKPXn8glCra+4tByzz
         JPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=bF1CR2qsK8jOAYOkJS03kmIipTowewlCCJfMjbpFnv8=;
        b=t/vKMGxqKKX36y5TjAEOEdQeNVgHtCG6FhiXCXdjJkm+EcbYtdCyoeuO/tu8OsT5H/
         QfuFg1TE/qPELRtylRLc0tffI2MTyFBw8xFdGC1dsO8qaOx6gLcXSjt4BElvar2UIC2Q
         lLW+46o2AQsDv7mQRTDaiY7+6ZTy9D01p1OoNSIAhUGjK88BlFYgaLN8jLy/BiNS7FsM
         w7EOd9ugLn9PWDJZECd+e9zJAeW9oLQ7UCFOFMAK/vg2w7pcFn8s9hOGEV3NT/iTosyv
         mQrvYVsQ8DzfOrsnnsJvRWJemVDbtOAeDzH0iTw7/1mLfYsOeSciZKFU8dE80kGV2m3Z
         S2gw==
X-Gm-Message-State: APt69E2k4WH65zMXNaINq01Zd9wmXnE5mC0xN1rVof2IY7C9r/O6i5Pf
        APxQzj1pAYu94E85lCRQoB8hSfjaMyBkIq9QK00=
X-Google-Smtp-Source: ADUXVKKJnGiETvb6zLxykhF/VCfrR8Nj6j23FDi/qr7FAchrs5Ym1I2fxm4XWNGtfBl6xucl88zXVTgtSNeoqDi/2xc=
X-Received: by 2002:ac8:32f3:: with SMTP id a48-v6mr24118362qtb.404.1528218351061;
 Tue, 05 Jun 2018 10:05:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:98f9:0:0:0:0:0 with HTTP; Tue, 5 Jun 2018 10:05:50 -0700 (PDT)
In-Reply-To: <cover.1528215659.git.msuchanek@suse.de>
References: <cover.1528215659.git.msuchanek@suse.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 Jun 2018 20:05:50 +0300
Message-ID: <CAHp75VdG4Vp2_6LMLv--kwiMkXO4mdc1DUgRQLBCtp2OoEmAZQ@mail.gmail.com>
Subject: Re: [PATCH v10 0/5] Kernel parameter parser cleanup/enhancement
To:     Michal Suchanek <msuchanek@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Aaron Wu <Aaron.Wu@analog.com>,
        Tony Luck <tony.luck@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Steven Rostedt," <rostedt@goodmis.org>,
        Laura Abbott <lauraa@codeaurora.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Baoquan He <bhe@redhat.com>,
        Ilya Matveychikov <matvejchikov@gmail.com>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 5, 2018 at 7:43 PM, Michal Suchanek <msuchanek@suse.de> wrote:
> Hello,
>
> due to work on the fadump_extra_args I looked at the kernel parameter parser
> and found its grammar rather curious.
>
> It supports double quotes but not any other quoting characters so double quotes
> cannot be quoted. What's more, the quotes can be anywhere in the parameter
> name or value and are interpteted but are removed only from start and end of
> the parameter value.
>
> These are the patches not specific to fadump which somewhat straighten the
> qouting grammar to make it on par with common shell interpreters.

I didn't notice any use of string_unescape_*() functionality. So, your
patch is kinda very specific to some narrow subset of escaping and
unescaping stuff.
Thus, it's still not on par with shell, right?

>
> Specifically double and single quotes can be used for quoting as well as
> backslashes with the usual shell semantic. All quoting characters are removed
> while the parameters are parsed.
>
> Previous versions (including the fadump part) can be found here:
>
> https://www.mail-archive.com/linuxppc-dev@lists.ozlabs.org/msg126148.html
> https://www.mail-archive.com/linuxppc-dev@lists.ozlabs.org/msg123639.html
>
> Thanks
>
> Michal
>
> Michal Suchanek (5):
>   lib/cmdline.c: Add backslash support to kernel commandline parsing.
>   Documentation/admin-guide: backslash support in kernel arguments.
>   init/main.c: simplify repair_env_string.
>   lib/cmdline.c: Implement single quotes in commandline argument
>     parsing.
>   Documentation/admin-guide: single quotes in kernel arguments.
>
>  Documentation/admin-guide/kernel-parameters.rst |  5 +-
>  init/main.c                                     | 13 ++---
>  lib/cmdline.c                                   | 63 +++++++++++++++----------
>  3 files changed, 46 insertions(+), 35 deletions(-)
>
> --
> 2.13.6
>



-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
