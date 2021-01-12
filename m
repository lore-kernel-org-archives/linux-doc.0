Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C1FC433E0
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 00:39:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3434224F9
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 00:39:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728557AbhALAjY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 19:39:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728983AbhALAir (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jan 2021 19:38:47 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48BF9C0617A5
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 16:38:06 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id ga15so1034193ejb.4
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 16:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AAGK7QJnpAigixBsDwJOzFarQpa+uBn1LCtFQ6nqZOg=;
        b=Zj+qOLhHhCXzhbKC6BIAew+AX4ps5bw/ov5suzZPwzPwiHyKHAlZpPGpfXEv10EV0C
         f+u28iptdt6p3p/fA/LMgRUvZ0kd2jfsUajM6UJUSBoPn2lAtcEaVibSRudyHVAG4Dsh
         5wbu9vfoEfHtNNaSfcndmEfzD+b2I4KevWgCKhp795ZOltdJO0dx3nFQahcQtqyMYYOD
         C+m5v5SJZNDC8hJ4kQip8/63FIZVNzGX83A1ZZhSRmCpE6039rjwpXxqRHRMtjE9QYc0
         9ucW1UVi0j32EE9Iam8Z1bs/Sa6LKBX/qLkboU4v1MA6+NRGJrzDgARi25KLBaPpYdf+
         oFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAGK7QJnpAigixBsDwJOzFarQpa+uBn1LCtFQ6nqZOg=;
        b=Itta5HXclg/9Hn1LikXimBkHqwVaa/Cv+MHvcXtxOyR5NU/cB2ewk8NOHADP4klIlh
         NmQ9ygdt6mn8CbmU1wnd9i/ALpGmhxuxvRx7HSNJWgs+VC1flHDvjEx+zvPf9UkMSlBt
         X0nTMVxHYhd9NvJJg47MXM1IQaiUl4gaHigVxMnTWLyQIZv0aYf4aj8creLoT+nQU2t2
         h0+uOe/OWI5oyqbl3T7jbw8ETC/EBU3pOrXR5d62rFI0wQ1vl4FZ/JDAvIImmNTv7Voc
         obAhrnBV6xld9zsDhCNbrWBHjR23DkW1yMtcjctalkeF6lFqe+9CB7rMrh95mVtBlQIc
         HXkg==
X-Gm-Message-State: AOAM532hyQD1/JB9o2Oq3h+a979Nt3A7C4C9CUp2DXmlYWGd4vgqVuSC
        HAqhTK/OAmpz/rWLJxHJz+hTfWOd9dsRVxDzMw7C
X-Google-Smtp-Source: ABdhPJxzGLv08AscXEmZjjVg2gsLIwKeoO6Prumvngl5LoIbvGS5MQiYEFtsPvhL3T6YwqPt/MFDm1VJuygtgOcJAMM=
X-Received: by 2002:a17:906:1194:: with SMTP id n20mr1301510eja.269.1610411884658;
 Mon, 11 Jan 2021 16:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <20210111201224.l5r2zxuyd7ayszke@google.com>
 <CAGG=3QWo5_wwTMHtif4BzFssByaW1ScvpaEH1p1nZ6ymVggLjA@mail.gmail.com> <20210111203120.daeef4yuwgmk5em4@google.com>
In-Reply-To: <20210111203120.daeef4yuwgmk5em4@google.com>
From:   Bill Wendling <morbo@google.com>
Date:   Mon, 11 Jan 2021 16:37:53 -0800
Message-ID: <CAGG=3QVs8dUaqcnuHYiaqccMhp7OmkxewZ_PAhAr96todNJhfQ@mail.gmail.com>
Subject: Re: [PATCH] pgo: add clang's Profile Guided Optimization infrastructure
To:     Fangrui Song <maskray@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 11, 2021 at 12:31 PM Fangrui Song <maskray@google.com> wrote:
> On 2021-01-11, Bill Wendling wrote:
> >On Mon, Jan 11, 2021 at 12:12 PM Fangrui Song <maskray@google.com> wrote:
> >>
> >> On 2021-01-11, 'Bill Wendling' via Clang Built Linux wrote:
> >> >From: Sami Tolvanen <samitolvanen@google.com>
> >> >
> >> >Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> >> >profile, the kernel is instrumented with PGO counters, a representative
> >> >workload is run, and the raw profile data is collected from
> >> >/sys/kernel/debug/pgo/profraw.
> >> >
> >> >The raw profile data must be processed by clang's "llvm-profdata" tool before
> >> >it can be used during recompilation:
> >> >
> >> >  $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
> >> >  $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> >> >
> >> >Multiple raw profiles may be merged during this step.
> >> >
> >> >The data can be used either by the compiler if LTO isn't enabled:
> >> >
> >> >    ... -fprofile-use=vmlinux.profdata ...
> >> >
> >> >or by LLD if LTO is enabled:
> >> >
> >> >    ... -lto-cs-profile-file=vmlinux.profdata ...
> >>
> >> This LLD option does not exist.
> >> LLD does have some `--lto-*` options but the `-lto-*` form is not supported
> >> (it clashes with -l) https://reviews.llvm.org/D79371
> >>
> >That's strange. I've been using that option for years now. :-) Is this
> >a recent change?
>
> The more frequently used options (specifyed by the clang driver) are
> -plugin-opt=... (options implemented by LLVMgold.so).
> `-lto-*` is rare.
>
> >> (There is an earlier -fprofile-instr-generate which does
> >> instrumentation in Clang, but the option does not have broad usage.
> >> It is used more for code coverage, not for optimization.
> >> Noticeably, it does not even implement the Kirchhoff's current law
> >> optimization)
> >>
> >Right. I've been told outside of this email that -fprofile-generate is
> >the prefered flag to use.
> >
> >> -fprofile-use= is used by both regular PGO and context-sensitive PGO (CSPGO).
> >>
> >> clang -flto=thin -fprofile-use= passes -plugin-opt=cs-profile-path= to the linker.
> >> For regular PGO, this option is effectively a no-op (confirmed with CSPGO main developer).
> >>
> >> So I think the "or by LLD if LTO is enabled:" part should be removed.
> >
> >But what if you specify the linking step explicitly? Linux doesn't
> >call "clang" when linking, but "ld.lld".
>
> Regular PGO+LTO does not need -plugin-opt=cs-profile-path=
> CSPGO+LTO needs it.
> Because -fprofile-use= may be used by both, Clang driver adds it.
> CSPGO is relevant in this this patch, so the linker option does not need to be mentioned.

I'm still a bit confused. Are you saying that when clang uses
`-flto=thin -fprofile-use=foo` that the profile file "foo" is embedded
into the bitcode file so that when the linker's run it'll be used?

This is the workflow:

clang ... -fprofile-use=vmlinux.profdata ... -c -o foo.o foo.c
clang ... -fprofile-use=vmlinux.profdata ... -c -o bar.o bar.c
ld.lld ... <output file> foo.o bar.o

Are you saying that we don't need to have
"-plugin-opt=cs-profile-path=vmlinux.profdata" on the "ld.lld ..."
line?

-bw
