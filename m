Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B299C83F12
	for <linux-doc@archiver.kernel.org>; Wed, 30 Aug 2023 00:46:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjH3AqN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Aug 2023 20:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbjH3Apm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Aug 2023 20:45:42 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC9ACCE
        for <linux-doc@vger.kernel.org>; Tue, 29 Aug 2023 17:45:38 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-26b41112708so3251888a91.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Aug 2023 17:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693356338; x=1693961138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=03m2A+TmUzgwhqrt9lI9ZZVbFhAvl2ARTiZlbzfRzC0=;
        b=Uix+AnNQO6XxqHVpvEolVOeSvw3DGoCXo7B7OWveMONkzJ9dS5uzMnvyhxz58r6sEd
         olztLVgw6tPViA2LYIPny7ID4YyFPvXm0aRwQdMgOUP/3zz8DxrHNV4sRyopcXl0E4Ph
         9lyCF9eiWsDxD6P77u+P//Cqr6WNZvhUzep80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693356338; x=1693961138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03m2A+TmUzgwhqrt9lI9ZZVbFhAvl2ARTiZlbzfRzC0=;
        b=f/I1WFb+UliA2BFDp3KQN7LBu4v3kmN3vxd2j0NXmT/ViwRVhEF0kHzKfsEE0/zqTy
         NoY1wdRx9WaatxS9RdA+hS3GmetL2IljFuuyYMEfJBzzWXygzqroRJ3ng5RF7YXXcAMA
         nlZ5tgCC42fwR8DnSgszCC4hGsEGwhnvMWsEQBJh4tIDalB4OLhRz4dFyuU2nUe/HLwh
         0u3KxfoBG3uxI3vnasmdfBECvJRdd56wp6j5ElMWTIBgaQIieoXFQrKfpXPBG1aa096e
         fN+J/0x1AhSemludqyP5KwNcvOh7YUzwTCbdSaTUKWiQvc0Hm8fTubBTdsA6FE9KZHnZ
         fu6w==
X-Gm-Message-State: AOJu0Yzpa54f4YJcSoV2vikb7jmKCYH8vxw2QrzFSIDIQ5xl7vGHXpDP
        Uf0Vu/zUhu9TSlRfcIzfLTtC4Y0TniybSH04glM=
X-Google-Smtp-Source: AGHT+IHYjpZQOYH32iyhG+dAWZLq6k37sN9+T4hVIVxiqFu/DJ8Z4UetURj4TiF4f5nBLcGIckVxDQ==
X-Received: by 2002:a17:90a:ea87:b0:268:3ea0:7160 with SMTP id h7-20020a17090aea8700b002683ea07160mr850064pjz.0.1693356337723;
        Tue, 29 Aug 2023 17:45:37 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id t24-20020a17090aba9800b0026b4ca7f62csm162223pjr.39.2023.08.29.17.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 17:45:37 -0700 (PDT)
Date:   Wed, 30 Aug 2023 09:45:33 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Tomasz Figa <tfiga@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: add warn-unknown-symbols sanity check
Message-ID: <20230830004533.GG3913@google.com>
References: <20230826071359.2060501-1-senozhatsky@chromium.org>
 <CAK7LNAROnZpZiOC4eS5kTcv4Q2YDrE9KYBD-dVcfXwBPQWvbmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAROnZpZiOC4eS5kTcv4Q2YDrE9KYBD-dVcfXwBPQWvbmg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On (23/08/29 22:13), Masahiro Yamada wrote:
> > +KCONFIG_WARN_UNKNOWN_SYMBOLS
> > +----------------------------
> > +This environment variable makes Kconfig warn about all unrecognized
> > +symbols in the .config file.
> 
> 
> This warns not only for the .config but also defconfig files.
> 
> Could you reword it?
> 
> For example,
> 
>  "symbols in the config input".

Done.

> 
> 
> > +
> > +KCONFIG_WERROR
> > +--------------
> > +If set, Kconfig will treat `KCONFIG_WARN_UNKNOWN_SYMBOLS` warnings as
> > +errors.
> 
> My hope is to turn other warnings in the config file into errors.

Done.

> > +++ b/scripts/kconfig/confdata.c
> > @@ -349,7 +349,12 @@ int conf_read_simple(const char *name, int def)
> >         char *p, *p2;
> >         struct symbol *sym;
> >         int i, def_flags;
> > +       bool found_unknown = false;
> > +       const char *warn_unknown;
> > +       const char *werror;
> >
> > +       warn_unknown = getenv("KCONFIG_WARN_UNKNOWN_SYMBOLS");
> > +       werror = getenv("KCONFIG_WERROR");
> >         if (name) {
> >                 in = zconf_fopen(name);
> >         } else {
> > @@ -437,6 +442,13 @@ int conf_read_simple(const char *name, int def)
> >                         if (def == S_DEF_USER) {
> >                                 sym = sym_find(line + 2 + strlen(CONFIG_));
> >                                 if (!sym) {
> > +                                       if (warn_unknown) {
> > +                                               conf_warning("unknown symbol: %s",
> > +                                                            line + 2 + strlen(CONFIG_));
> > +                                               found_unknown = true;
> > +                                               continue;
> 
> Please drop this 'continue' because it would skip
> conf_set_changed(true).

My bad. Those 'continue' are left-overs from previous version.

> > +                                       }
> > +
> >                                         conf_set_changed(true);
> >                                         continue;
> >                                 }
> > @@ -471,6 +483,13 @@ int conf_read_simple(const char *name, int def)
> >
> >                         sym = sym_find(line + strlen(CONFIG_));
> >                         if (!sym) {
> > +                               if (warn_unknown && def != S_DEF_AUTO) {
> > +                                       conf_warning("unknown symbol: %s",
> > +                                                    line + strlen(CONFIG_));
> > +                                       found_unknown = true;
> > +                                       continue;
> 
> Same here.

Same here. My bad.

> > @@ -519,6 +538,10 @@ int conf_read_simple(const char *name, int def)
> >         }
> >         free(line);
> >         fclose(in);
> > +
> > +       if (found_unknown && werror)
> > +               exit(1);
> 
> 
> I like to reuse 'conf_warnings' as you did in the previous version.

Done.
