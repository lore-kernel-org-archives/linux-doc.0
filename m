Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B1FC433E0
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 22:29:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D543461A1D
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 22:29:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232693AbhCXW3P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Mar 2021 18:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbhCXW2q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Mar 2021 18:28:46 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D909DC06174A
        for <linux-doc@vger.kernel.org>; Wed, 24 Mar 2021 15:28:45 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id m7so15768259pgj.8
        for <linux-doc@vger.kernel.org>; Wed, 24 Mar 2021 15:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=+1Ub9YvCJNkNw1vJdoc4OZ2njoC+Z+ZNVpn0PB64BJM=;
        b=TO/EZzd4fgWNl/zTpxUTiTLbIP71i4Gswkw+BfmyHNHw8UxdlRVNoOhoE+2arp4gDp
         /k2tSwtt+5mFFYe5z9K8b6tPrx0n5Z589OgZk8Sizx9rgiwNoHfyJG0uVLswsX6ruHfu
         rqpfBU0V873XdWmnTONw2KCbMdXr+IHLEwXpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=+1Ub9YvCJNkNw1vJdoc4OZ2njoC+Z+ZNVpn0PB64BJM=;
        b=BptnaEaB2T9UaoeJzyD4SjdOYZSmj7HMJ4/8tB5J7m9cgjZaFkrZHgDGrdRQ/ht1Wb
         l3pPDaNC/9wep+Xza0i/nN8S7V9tDCa28CC56UC7Hik7aY1JOfW6UyalCQiUEEYI7F1k
         wo2JKjV/Gmx+WLviVYDRqcra7x3DvD64j1YqGKbf1mr/BXTGgmr/yrZTfrd+n5M6DAiI
         tCzVbiR6zt6B6YghvIPuLLWS1+ys9hYLj81QX6NK13Q/ThgS6zGkIp64sH14bXOX/bx8
         jofijTSt6a3BXP9/pwot+YYyJOTX4BnkNmjsrzg+WSYqAjjyatOR47EGhcRvafhH/XMx
         TKlQ==
X-Gm-Message-State: AOAM533fMTHWZTFfIuikskMeCaU/TJhs191LGCYDo+SSwFw75N2Go/NV
        8iJtDxcMWWFt7Bv5dYL6SHIwwA==
X-Google-Smtp-Source: ABdhPJwf2IQBIdOH+njw+0F5M+SRHK32CepVNZOvRQuH5ws5yAv3U0tZR7DGyN4yglXc64mOgBltUA==
X-Received: by 2002:a63:5807:: with SMTP id m7mr4773070pgb.73.1616624925456;
        Wed, 24 Mar 2021 15:28:45 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:84ac:62f7:16a8:ccc7])
        by smtp.gmail.com with ESMTPSA id t16sm3518554pfc.204.2021.03.24.15.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 15:28:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2785cae4-20be-85b5-7838-9a6dbd2baf72@rasmusvillemoes.dk>
References: <20210324020443.1815557-1-swboyd@chromium.org> <20210324020443.1815557-5-swboyd@chromium.org> <6dfb8ca2-20f3-e58a-ad6b-db6a6472afe0@rasmusvillemoes.dk> <161661308874.3012082.15483899786731677633@swboyd.mtv.corp.google.com> <2785cae4-20be-85b5-7838-9a6dbd2baf72@rasmusvillemoes.dk>
Subject: Re: [PATCH v2 04/12] module: Add printk format to add module build ID to stacktraces
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date:   Wed, 24 Mar 2021 15:28:43 -0700
Message-ID: <161662492346.3012082.17886011577458863951@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Rasmus Villemoes (2021-03-24 15:21:34)
> On 24/03/2021 20.11, Stephen Boyd wrote:
> > Quoting Rasmus Villemoes (2021-03-24 02:57:13)
>=20
> >>
> >> Is there any reason you didn't just make b an optional flag that could
> >> be specified with or without R? I suppose the parsing is more difficult
> >> with several orthogonal flags (see escaped_string()), but it's a little
> >> easier to understand. Dunno, it's not like we're gonna think of 10 oth=
er
> >> things that could be printed for a symbol, so perhaps it's fine.
> >>
> >=20
> > I think I follow. So %pSb or %pSRb? If it's easier to understand then
> > sure. I was trying to avoid checking another character beyond fmt[1] but
> > it should be fine if fmt[1] is already 'R'.
> >=20
>=20
> I don't know. On the one hand, it seems sensible to allow such "flag"
> modifiers to appear independently and in any order. Because what if some
> day we think of some other property of the symbol we might want to
> provide access to via a "z" flag; when to allow all combinations of the
> R, b and z functionality we'd have to use four more random letters to
> stand for various combinations of those flags. On the other hand,
> vsprintf.c is already a complete wild west of odd conventions for
> %p<foo>, and it's not like symbol_string() gets extended every other
> release, and I can certainly understand the desire to keep the parsing
> of fmt minimal. So 'r' to mean 'Rb' is ok by me if you prefer that.

I'm inclined to use %pSb and %pSRb. The code looks to simpler and I
suppose we can worry about different ordering/combination problems if it
comes to it.

---8<---
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 41ddc353ebb8..0e94cba5ba20 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -968,6 +968,8 @@ char *symbol_string(char *buf, char *end, void *ptr,
 #ifdef CONFIG_KALLSYMS
        if (*fmt =3D=3D 'B')
                sprint_backtrace(sym, value);
+       else if (*fmt =3D=3D 'S' && (fmt[1] =3D=3D 'b' || (fmt[1] =3D=3D 'R=
' && fmt[2] =3D=3D 'b')))
+               sprint_symbol_stacktrace(sym, value);
        else if (*fmt !=3D 's')
                sprint_symbol(sym, value);
        else
