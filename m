Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FBCEE49AA
	for <linux-doc@archiver.kernel.org>; Mon, 21 Aug 2023 16:09:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235707AbjHUQJD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Aug 2023 12:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235444AbjHUQJC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Aug 2023 12:09:02 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484A1103
        for <linux-doc@vger.kernel.org>; Mon, 21 Aug 2023 09:08:59 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-68a3b66f350so1531056b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 21 Aug 2023 09:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692634139; x=1693238939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yaHdRkYkPRI69aZ/lmvZ478sSBPpifQtYAZYN/ChpUk=;
        b=BfhKszstxVugd4QaXKP6AKbVdheAmpXmwLBTkJkrEwF1b9tdmdhyJQ1wCjiHwI2uJh
         2cx+mg75Wn7zmMvD+fACBuuJktjZRPWKtGdCxWDjXEQ0BHRCcLR3p7uPKpxsf7tTPi4Z
         4o9xjU5MXBWcKouKHQqe+4hhOhZ3Kl9uQT44k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692634139; x=1693238939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaHdRkYkPRI69aZ/lmvZ478sSBPpifQtYAZYN/ChpUk=;
        b=lrXKr8cBwlFnnFYYo08dH+bGO40HVy0Ztih1PwG1EQO4xltPxI3B3E1l6TUCCsRkDu
         PJ+eW8Kycp6eQ+iBjgQMmT3rynlq/p8AVNoxWeDwheFCv0vC9xBOKzuI2GXiqXihxdFe
         3qKHHro3XhiK9Z+JBDbEm1paeXinIJCE9mbyPJy87OMzu6FLEESclr4FZGuyP/HBPRU0
         rJHpHDW61ukHsCffNWESOeb6TYDvPJNQLVXXXeAODs2mZIrxSP1qCnQNsARAmYgpC8T/
         llBJWeCXIomlvudrbv2h6k9gKOG7WvOeJvdxROtYEMzt6KyOWV8KyZFPtbHWEgMS5oLl
         wp/g==
X-Gm-Message-State: AOJu0YzwDLySTI+OW8WNE3c+4TEJkV4T2rC9f1uJaCoCzfrqmaOc9XF9
        8qJccneXykwGaIhyc8wVLfRzAw==
X-Google-Smtp-Source: AGHT+IEOgTyR4jaB6XtqhahHvy0ziUqApkFMs3XvCv9+1wdEIAaSHh7YR1f9BPyQSwl9uXmMQ9DBEw==
X-Received: by 2002:a05:6a00:234a:b0:688:11cc:ed88 with SMTP id j10-20020a056a00234a00b0068811cced88mr9337228pfj.33.1692634138793;
        Mon, 21 Aug 2023 09:08:58 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id v24-20020aa78098000000b006877a17b578sm6359010pff.40.2023.08.21.09.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 09:08:58 -0700 (PDT)
Date:   Tue, 22 Aug 2023 01:08:53 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Tomasz Figa <tfiga@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] kconfig: introduce listunknownconfig
Message-ID: <20230821160853.GA3913@google.com>
References: <20230817012007.131868-1-senozhatsky@chromium.org>
 <CAK7LNASJWKSsdzn5ccgWaC35-XvHGU7pnE6C=eZFDbqrrghtdQ@mail.gmail.com>
 <20230820024519.GK907732@google.com>
 <CAK7LNAS9KC1GjPgadMEivSpy4TMYU8mQ+BrtfJpNs2kvhK18yA@mail.gmail.com>
 <20230820072119.GM907732@google.com>
 <20230820073332.GN907732@google.com>
 <CAK7LNARTZXvWD8PrA3bC+Ok7LK85qO=pkMs4kOPGn90OBooL6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARTZXvWD8PrA3bC+Ok7LK85qO=pkMs4kOPGn90OBooL6w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On (23/08/21 21:27), Masahiro Yamada wrote:
> > +       const char *list_missing;
> >
> > +       list_missing = getenv("KCONFIG_LIST_MISSING");
> 
> 
> My (original) hope was to add a single switch, KCONFIG_VERBOSE, to address both:
> 
>   - A CONFIG option is hidden by unmet dependency (Ying Sun's case)
>   - A CONFIG option no longer exists  (your case)
>   - Anything else we need to be careful

So I see a "no longer existing option" as a terminal condition. In
general there is no point in continuing the build because the build
will not include some driver/functionality that is still expected to
be there. (This has actually happened to us).

[..]
> > @@ -482,6 +490,12 @@ int conf_read_simple(const char *name, int def)
> >
> >                         sym = sym_find(line + strlen(CONFIG_));
> >                         if (!sym) {
> > +                               if (list_missing) {
> > +                                       conf_warning("unknown symbol: %s",
> > +                                                    line + strlen(CONFIG_));
> > +                                       continue;
> > +                               }
> > +
> 
> 
> This should be warned only if (def != S_DEF_AUTO),
> otherwise the same warning will be displayed twice.

Good point.

> > @@ -530,6 +544,13 @@ int conf_read_simple(const char *name, int def)
> >         }
> >         free(line);
> >         fclose(in);
> > +
> > +       if (list_missing) {
> > +               if (conf_warnings)
> > +                       exit(1);
> > +               exit(0);
> > +       }
> > +
> 
> This is something different because you are making these
> errors instead of warnings.

Right. So "verbose" and "list missing" probably have slightly different
requirements.

When "verbose" complaints about a downgraded option, for instance, then
you can regenerate the config and continue, because the symbol is still
there.

When "list missing" complaints about an option then we should stop and
investigate. That option, for example, can be added by build infra based
on some USE flags switch, etc. So there can be multiple parties that
needs to be fixed. Apart from that we need to figure out what option
(if any) replaces the gone symbol. "list missing" is basically "missed
expectations", we need to do some work before we can build the kernel.

I can "list missing" under KCONFIG_VERBOSE. It probably still better
error exit if missing symbols are found. Thoughts?
