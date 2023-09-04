Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA51C83F33
	for <linux-doc@archiver.kernel.org>; Mon,  4 Sep 2023 05:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245139AbjIDFK7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Sep 2023 01:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239171AbjIDFK6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Sep 2023 01:10:58 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD40D9
        for <linux-doc@vger.kernel.org>; Sun,  3 Sep 2023 22:10:54 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-76dc77fd024so87443285a.3
        for <linux-doc@vger.kernel.org>; Sun, 03 Sep 2023 22:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693804253; x=1694409053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXUZaycyRKFF7YD/xZN3g8M3+P9PTWamNfdRK18yuN0=;
        b=csTbv377JuwAxnoqJ6rOG3/O4YzvqguBB8nn8UMsj7imvRc7qbJAjyrZGDGYRl3uK5
         0ldLwwyhaHkz3E4yuyfurhks9yVexwEb5P3X3Awyn/OBObRme1PT/MpnXvrd5MIWwHNt
         WwvbQ5lY/NSD/NqP7t7sEMekMue9iUOmFEpQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693804253; x=1694409053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXUZaycyRKFF7YD/xZN3g8M3+P9PTWamNfdRK18yuN0=;
        b=Ct+ue5BR++Au9pl2zVFQWY7qpqMizDn6HJmzhueLY5JKeOHjC0pFEWaP8oRyu4E7yw
         w+Tlb51g0npg4SBt6yG0mHjr7GDejrGCev7SyvGnUBv4HHHo9fHIjUmFYmh3T0m1aCaR
         Tud2jPFX0H4Sibh41Illw/biPStAWJQ7mMYFBBuWC+xJUFbMLO8IK2hih/Ieg9TSMYbT
         Nk+2riOgLWJudCpQ0E+ClJiwrmHFw/07jb3ULaxAI+N0/iwTvZ5gH4D495SQQWdnw3Tg
         oJwpoy6U/8NywpAG8tzsmpcCi4txliMF7roopA2/TJs0DoAX/6RUoJuCirVWPdacIXPH
         Nj7Q==
X-Gm-Message-State: AOJu0YxlrUpWw4ohgqm7ID10nt1HG3c4MRYE0H5q2zqgrNwyc7iG1CMP
        7VGobHe9YqQQ7oDGJL2/+vJIIkXmWaSiToIO/xM=
X-Google-Smtp-Source: AGHT+IERXh95cn1K5h96GrP45vt8C1aJcHaJuXJzLp4OLIPDNXdqU4nvcJwEp2nD/spjKiDxuRN0AQ==
X-Received: by 2002:a05:620a:2054:b0:76f:1dd4:101f with SMTP id d20-20020a05620a205400b0076f1dd4101fmr9941016qka.39.1693804253191;
        Sun, 03 Sep 2023 22:10:53 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id t29-20020a05620a035d00b00767303dc070sm3144731qkm.8.2023.09.03.22.10.52
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 22:10:52 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-64c2e2572f7so7636676d6.1
        for <linux-doc@vger.kernel.org>; Sun, 03 Sep 2023 22:10:52 -0700 (PDT)
X-Received: by 2002:a0c:f58a:0:b0:64f:6cc4:63d1 with SMTP id
 k10-20020a0cf58a000000b0064f6cc463d1mr9212576qvm.6.1693804251772; Sun, 03 Sep
 2023 22:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230817012007.131868-1-senozhatsky@chromium.org>
 <CAK7LNASJWKSsdzn5ccgWaC35-XvHGU7pnE6C=eZFDbqrrghtdQ@mail.gmail.com>
 <20230820024519.GK907732@google.com> <CAK7LNAS9KC1GjPgadMEivSpy4TMYU8mQ+BrtfJpNs2kvhK18yA@mail.gmail.com>
 <20230820072119.GM907732@google.com> <20230820073332.GN907732@google.com>
 <CAK7LNARTZXvWD8PrA3bC+Ok7LK85qO=pkMs4kOPGn90OBooL6w@mail.gmail.com>
 <20230822061203.GA610023@google.com> <CAK7LNAS0qEZk+xAq84=7SuJSQz5F3dNBjYKPoeKTd_caq-QMKg@mail.gmail.com>
 <CAAFQd5DeDEhPUQScXB67v9giiV=G33L-YDdtF4e-+UcmBXG6jA@mail.gmail.com>
 <CAK7LNATj-jnOLMkgzz=3MfqWgUjKF-MwSKQkr4hW0g7+tEsXUw@mail.gmail.com>
 <CAAFQd5AhN5m8eaGsrKfh1gHPLiOVd9_3BwoHpr7u6iY92Ft-bg@mail.gmail.com> <CAK7LNAR6o=K=eGzi194Ly787Ji4Twfqq3dcr8NE5m23ayGM3Fg@mail.gmail.com>
In-Reply-To: <CAK7LNAR6o=K=eGzi194Ly787Ji4Twfqq3dcr8NE5m23ayGM3Fg@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 4 Sep 2023 14:10:34 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DTNfNDPtvFd-=kkGYY5nduLp3SLjzNmHPgu6QfQO3ypw@mail.gmail.com>
Message-ID: <CAAFQd5DTNfNDPtvFd-=kkGYY5nduLp3SLjzNmHPgu6QfQO3ypw@mail.gmail.com>
Subject: Re: [RFC][PATCH] kconfig: introduce listunknownconfig
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ying Sun <sunying@nj.iscas.ac.cn>,
        Jesse T <mr.bossman075@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 1, 2023 at 12:28=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Aug 31, 2023 at 11:30=E2=80=AFAM Tomasz Figa <tfiga@chromium.org>=
 wrote:
> >
> > On Sat, Aug 26, 2023 at 10:11=E2=80=AFAM Masahiro Yamada <masahiroy@ker=
nel.org> wrote:
> > >
> > > On Thu, Aug 24, 2023 at 2:30=E2=80=AFPM Tomasz Figa <tfiga@chromium.o=
rg> wrote:
> > > >
> > > > Hi Masahiro,
> > > >
> > > > On Thu, Aug 24, 2023 at 10:00=E2=80=AFAM Masahiro Yamada <masahiroy=
@kernel.org> wrote:
> > > > >
> > > > > On Tue, Aug 22, 2023 at 4:30=E2=80=AFPM Sergey Senozhatsky
> > > > > <senozhatsky@chromium.org> wrote:
> > > > > >
> > > > > > On (23/08/21 21:27), Masahiro Yamada wrote:
> > > > > > >
> > > > > > > My (original) hope was to add a single switch, KCONFIG_VERBOS=
E, to address both:
> > > > > > >
> > > > > > >   - A CONFIG option is hidden by unmet dependency (Ying Sun's=
 case)
> > > > > > >   - A CONFIG option no longer exists  (your case)
> > > > > > >   - Anything else we need to be careful
> > > > > >
> > > > > > A quick question: is it too late to suggest an alternative name=
?
> > > > > > Could KCONFIG_SANITY_CHECKS be a little cleaner? Because we bas=
ically
> > > > > > run sanity checks on the config.
> > > > >
> > > > >
> > > > > Ying's is not applied yet. So, it is not too late.
> > > > >
> > > > > But, I started to be a little worried
> > > > > because it is unpredictable how many KCONFIG_* env
> > > > > variables will increase until people are satisfied.
> > > > >
> > > >
> > > > Is there really a problem with having those? There are a lot of
> > > > different env variables affecting different parts of the kernel bui=
ld.
> > > > If they are useful, and even better, allow catching issues quickly,
> > > > should we favor less options or usefulness for users?
> > >
> > >
> > >
> > > I am considering how to implement it.
> > >
> > >
> > >
> > > One way is to add env variables as a new request arises.
> > >
> > > Sergey is doing two things by one option.
> > >
> > >
> > >    KCONFIG_WARN_UNKNWON_SYMBOL : warn unknown symbol in input .config
> > > or defconfig
> > >    KCONFIG_WARN_TO_ERROR       : turn warnings into errors
> > >
> > >
> > >
> > > Another way is to handle those as command line options.
> > >
> > >   -Wunknown-symbol
> > >   -Werror             (associated with W=3De)
> > >   -Wall               (associated with W=3D1)
> > >
> > >
> > >
> > >   $ make W=3D1e olddefconfig
> > >
> > >
> > > will work to sanity check.
> > >
> > >
> >
> > I see, I think I misunderstood your previous message, sorry. Agreed
> > that there could be other approaches than an environment variable and
> > a command line option could definitely work as well. I'll leave the
> > details to you and Sergey, but ideally we would have something that is
> > simple to use both in scripts (e.g. distro build systems) and in
> > manual build for end users
> >
> > >
> > >
> > >
> > > > > >
> > > > > > And one more question: those sanity checks seem very reasonable=
.
> > > > > > Is there any reason we would not want to keep them ON by defaul=
t?
> > > > > > And those brave souls, that do not wish for the tool to very th=
at
> > > > > > the .config is sane and nothing will get downgraded/disabled, c=
an
> > > > > > always set KCONFIG_SANITY_CHECKS to 0.
> > > > >
> > > > >
> > > > > Kconfig is meant to resolve the dependency without causing an err=
or.
> > > > > If a feature is not available, it is automatically, silently hidd=
en,
> > > > > and that works well.
> > > >
> > > > How do you come to the conclusion that it works well? I've heard ma=
ny
> > > > people unhappy about the way Kconfig works. How does one know that
> > > > something is missing (and should maybe be fixed?) if Kconfig silent=
ly
> > > > hides it?
> > >
> > >
> > > Kconfig has worked like that for a long time, but I do not know
> > > how to detect non-existing symbols.
> > >
> > >
> >
> > I think a tool to detect symbols present in old config, but missing in
> > new kernel solves the "upgraded config" part of the problem.
> >
> > The other part ("new config") would probably be solved by some kind of
> > a tool that looks at the currently present hardware and spews a list
> > of Kconfig options together with their dependencies, but arguably
> > that's not something that would be a part of Kconfig itself.
> >
> > For the graphical configuration tools like menuconfig I could imagine
> > that the options with unmet dependencies could be still displayed but
> > greyed out, so at least one can open the help for the item and check
> > which dependencies are missing.
>
>
> Yes. That idea exists, and at least for xconfig,
> I got a patch to grey out hidden options.
>
> https://lore.kernel.org/linux-kbuild/20200708133015.12286-1-maxime.chreti=
en@bootlin.com/
>
>
> I liked the idea, and suggested improvements, but did not receive v2.
>
> Maybe I could revisit it when I have some time,
> but I always have TODOs more than my capacity.
>

Let me see if I can do something about it. It sounds like a very
convenient thing, although I'd definitely prefer menuconfig over
xconfig.

>
>
> Anyway, I applied Sergey's patch, so the life of you guys
> will get a little easier.

Thanks a lot!

Best regards,
Tomasz
