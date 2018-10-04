Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 609D07D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 16:12:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbeJDXGO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 19:06:14 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51680 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727407AbeJDXGN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Oct 2018 19:06:13 -0400
Received: by mail-wm1-f65.google.com with SMTP id 143-v6so9554004wmf.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Oct 2018 09:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zwA+tSgQuA+pgEuJcmrQMT7TOK3gYP4Fut+qMSm90Hg=;
        b=WJAHVy74lH3c9Jeb/T+x86gz1Cx56o2qAQ9NBp14bVHT73QP6EpmuA3Wa7a7RUC7hN
         ffNQ53yVTyYps3wQ+jTptvKUoz2pdUV9cbIMrE/RzpzJzvdeqtiqzj1IDAaKTUZFSBYF
         +oeaRVYyLIhjQzHST+WbYpUwZ1kvrkGsPtDoAfqYoYjSWFnLr0wqUPJu7WyCQLoEQu3F
         tVbG6mIrVJD/qNzCS30H6TvQ9gTv5b7MnYapTdLiILuioWj+C+93M2frkxPNbbl4HRyF
         8DriNhs1EzLc4+MV2oU0VnQA8J6/3bivnGfi4h4A6AMi5toKpL9ngZONX6K4Mg7Eevp0
         6E8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zwA+tSgQuA+pgEuJcmrQMT7TOK3gYP4Fut+qMSm90Hg=;
        b=dKJU/jLIgSMgS2jn5N7DmYxTgXjrNGlVUsNk3fL8Z6D9rljn6imeTEqpt/VZ5BI8iG
         EfIBpNn+ocMEp7bXak4bXS1Nm89gxdqISwBd2R9n7iuTlC1R0NpuutHhfpYL/1BvuAXg
         Fwnqwf56XmXVtzFiAE5oI2lKFtba0d6W6gKIRjxh7uibH49LhMKQI9a9iYet/EDjwre5
         Mer665DZXotY00zfTw0T8TRa2iaCBPcU8lLHTQEgVlrkmR807zdzMH5wcXFcvOGizlFE
         v6VptfrYh070L9hc7n+451ym4sRaQ3dxMc7CuyurDAKHTcM4I0DQ7R8VH6v+ZDYrpOWK
         xRGQ==
X-Gm-Message-State: ABuFfohvzWRXxeVW6OAo+H9HUmajW3r2jwOHjE3knCXUr6hcwK/i5+Lp
        rpjbuNy4/zqH5qMtSb92iQt0tjhpy6yWnIjiGhtBRg==
X-Google-Smtp-Source: ACcGV616CzSraccRxzEbau+A9fQgfvQsE1DJWliI6fc/cfIQS1234f3EJjAjHnFKkbafr7ziCOfGIZGKOWYnZWldTQY=
X-Received: by 2002:a1c:1fcd:: with SMTP id f196-v6mr5267962wmf.19.1538669535756;
 Thu, 04 Oct 2018 09:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20180921150553.21016-1-yu-cheng.yu@intel.com> <20180921150553.21016-7-yu-cheng.yu@intel.com>
 <20181004132811.GJ32759@asgard.redhat.com> <3350f7b42b32f3f7a1963a9c9c526210c24f7b05.camel@intel.com>
 <87murtn19o.fsf@mid.deneb.enyo.de>
In-Reply-To: <87murtn19o.fsf@mid.deneb.enyo.de>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Thu, 4 Oct 2018 09:12:04 -0700
Message-ID: <CALCETrXTqxQLWEHhSQ6WsDosnD61rnN2TgAFFomVAf5URP4DzA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 6/9] x86/cet/ibt: Add arch_prctl functions for IBT
To:     Florian Weimer <fw@deneb.enyo.de>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
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
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>,
        libc-alpha <libc-alpha@sourceware.org>,
        "Carlos O'Donell" <carlos@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 4, 2018 at 9:08 AM Florian Weimer <fw@deneb.enyo.de> wrote:
>
> * Yu-cheng Yu:
>
> > On Thu, 2018-10-04 at 15:28 +0200, Eugene Syromiatnikov wrote:
> >> On Fri, Sep 21, 2018 at 08:05:50AM -0700, Yu-cheng Yu wrote:
> >> > Update ARCH_CET_STATUS and ARCH_CET_DISABLE to include Indirect
> >> > Branch Tracking features.
> >> >
> >> > Introduce:
> >> >
> >> > arch_prctl(ARCH_CET_LEGACY_BITMAP, unsigned long *addr)
> >> >     Enable the Indirect Branch Tracking legacy code bitmap.
> >> >
> >> >     The parameter 'addr' is a pointer to a user buffer.
> >> >     On returning to the caller, the kernel fills the following:
> >> >
> >> >     *addr = IBT bitmap base address
> >> >     *(addr + 1) = IBT bitmap size
> >>
> >> Again, some structure with a size field would be better from
> >> UAPI/extensibility standpoint.
> >>
> >> One additional point: "size" in the structure from kernel should have
> >> structure size expected by kernel, and at least providing there "0" from
> >> user space shouldn't lead to failure (in fact, it is possible to provide
> >> structure size back to userspace even if buffer is too small, along
> >> with error).
> >
> > This has been in GLIBC v2.28.  We cannot change it anymore.
>
> In theory, you could, if you change the ARCH_CET_LEGACY_BITMAP
> constant, so that glibc will not use the different arch_prctl
> operation.  We could backport the change into the glibc 2.28 dynamic
> linker, so that existing binaries will start using CET again.  Then
> only statically linked binaries will be impacted.
>
> It's definitely not ideal, but it's doable if the interface is
> terminally broken or otherwise unacceptable.  But to me it looks like
> this threshold isn't reached here.

I tend to agree.

But I do think there's a real problem that should be fixed and won't
affect ABI: the *name* of the prctl is pretty bad.  I read the test
several times trying to decide if you meant
ARCH_GET_CET_LEGACY_BITMAP?  But you don't.

Maybe name it ARCH_CET_CREATE_LEGACY_BITMAP?  And explicitly document
what it does if legacy bitmap already exists?

--Andy
