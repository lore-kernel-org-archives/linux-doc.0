Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC4AC43460
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 06:58:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3761961182
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 06:58:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhDHG7D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Apr 2021 02:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhDHG7C (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Apr 2021 02:59:02 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1E1C061761
        for <linux-doc@vger.kernel.org>; Wed,  7 Apr 2021 23:58:50 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id k8so731395pgf.4
        for <linux-doc@vger.kernel.org>; Wed, 07 Apr 2021 23:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=oftc1NSPwAHvdGkidhPdTmw2wlPlHS0GdWjKuKCXC58=;
        b=ZsOQLsQNhdyHGUnmS050o9RG9ou/KNrJPLWbyrkksp51cC7gTikSO8oTEum8aHZ+hz
         /k1f0tdgSNz3mThsz63L1UYRTBGEY10JFWV/eWIpNLFhkluaUU1HlCS32P0/yeHNzTZ6
         n4w2HVOQpL2wnVnSaa3iR1GvZ5xnIcbNf/Sm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=oftc1NSPwAHvdGkidhPdTmw2wlPlHS0GdWjKuKCXC58=;
        b=GIWp3219Y9g3g7a7tGaUNZ+nd61Q01Z2luaviuawGwI03S8HT/srKfgktFwWhZcXPO
         TEaeEcdZZ13twwiQ3T99F5lbN8Nl1loIbFYjXTy6kS5bj0RbaFX9gGmVJm1+OtsbT6Y/
         htc2W9Uh3NKIW6OSkaghQeMHBIZp7LT06gfR+Kr5WuvVRLpPSzUYFkI0zr7RZjiDmLC2
         LkD3QOskPSa64tOAgOYPuUXhN8zUWzlKktXQWYo2Cft68minM/Rhh+rRX5Fwi2kE/DA7
         CwfCf9ga3FBR++zZn8/yNNABbIndMhjfc1xXPUt5cQYqJNyhlAxh4KxKyYwJb7qwnsE4
         91nA==
X-Gm-Message-State: AOAM532MvNm6yT8LQBEpmKPaxZZuQrRCAIpipBuOixULrMWyHXAD0Ind
        HhvpC3YW5nSk/t9m5w0XSv848g==
X-Google-Smtp-Source: ABdhPJylI6CdFLUZkvObjJY6nD/2IdUH2xfQzI1KLNxMcZnhKfi+N71OuSOsvHMV/Yp+a3jyeRUSzA==
X-Received: by 2002:a62:d15e:0:b029:218:4f9:d8ee with SMTP id t30-20020a62d15e0000b029021804f9d8eemr6096757pfl.28.1617865129856;
        Wed, 07 Apr 2021 23:58:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e193:83c5:6e95:43de])
        by smtp.gmail.com with ESMTPSA id fs9sm7048656pjb.40.2021.04.07.23.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 23:58:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YG3J03GY+QqtKMlu@alley>
References: <20210331030520.3816265-1-swboyd@chromium.org> <20210331030520.3816265-5-swboyd@chromium.org> <YG3J03GY+QqtKMlu@alley>
Subject: Re: [PATCH v3 04/12] module: Add printk format to add module build ID to stacktraces
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
To:     Petr Mladek <pmladek@suse.com>
Date:   Wed, 07 Apr 2021 23:58:47 -0700
Message-ID: <161786512790.3790633.16827318365663068135@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Petr Mladek (2021-04-07 08:03:47)
> On Tue 2021-03-30 20:05:12, Stephen Boyd wrote:
> > Let's make kernel stacktraces easier to identify by including the build
> > ID[1] of a module if the stacktrace is printing a symbol from a module.
> > This makes it simpler for developers to locate a kernel module's full
> > debuginfo for a particular stacktrace. Combined with
> > scripts/decode_stracktrace.sh, a developer can download the matching
> > debuginfo from a debuginfod[2] server and find the exact file and line
> > number for the functions plus offsets in a stacktrace that match the
> > module. This is especially useful for pstore crash debugging where the
> > kernel crashes are recorded in something like console-ramoops and the
> > recovery kernel/modules are different or the debuginfo doesn't exist on
> > the device due to space concerns (the debuginfo can be too large for
> > space limited devices).
> >=20
> > @@ -359,15 +369,17 @@ int lookup_symbol_attrs(unsigned long addr, unsig=
ned long *size,
> > =20
> >  /* Look up a kernel symbol and return it in a text buffer. */
> >  static int __sprint_symbol(char *buffer, unsigned long address,
> > -                        int symbol_offset, int add_offset)
> > +                        int symbol_offset, int add_offset, int add_bui=
ldid)
> >  {
> >       char *modname;
> > +     const unsigned char *buildid;
> >       const char *name;
> >       unsigned long offset, size;
> >       int len;
> > =20
> >       address +=3D symbol_offset;
> > -     name =3D kallsyms_lookup(address, &size, &offset, &modname, buffe=
r);
> > +     name =3D kallsyms_lookup_buildid(address, &size, &offset, &modnam=
e, &buildid,
> > +                                    buffer);
> >       if (!name)
> >               return sprintf(buffer, "0x%lx", address - symbol_offset);
> > =20
> > @@ -379,8 +391,12 @@ static int __sprint_symbol(char *buffer, unsigned =
long address,
> >       if (add_offset)
> >               len +=3D sprintf(buffer + len, "+%#lx/%#lx", offset, size=
);
>=20
> Please add something like:
>=20
>         /* Keep BUILD_ID_SIZE_MAX in sync with the below used %20phN */
>         BUILD_BUG_ON(BUILD_ID_SIZE_MAX !=3D 20)
>=20

Done. Hopefully the "GNU" string check also fixes this module problem
you're seeing.
