Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF731C4160E
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 00:31:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5E2860295
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 00:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbhCDAbV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:31:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353081AbhCDADI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Mar 2021 19:03:08 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA16C061797
        for <linux-doc@vger.kernel.org>; Wed,  3 Mar 2021 15:51:07 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id l5so6134747ooj.7
        for <linux-doc@vger.kernel.org>; Wed, 03 Mar 2021 15:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cilium-io.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E/wr0fT0I7yiXwtdsqEsPqFrJ61emPLJgrDzqVvsCwc=;
        b=Rk23ty4+bc5BV6kqWSsua/rctvyP75yV3bfEv2fvBR0l+li24kdj5a2bFVJnqUMAjv
         SdnkUHdOrr7+ehIz1rD1YDtnJ4DhRqspOhwuLH37k+1iwjeYf0n/EDrTvbxcf9oJ48XA
         /Dwcc7UsGU8X3vB5lE+BXnhL/wdTaeuaNS4jd63P+vcevgmU0QaEQSNqb9g/nvlZC1YM
         zNHEnoZKoTN4XPvRTLXJp3tBo6tq4nyre7ooTDs3YMfKuLSa6TyhsXpRAiWcM38b67Dt
         KzH75JKwvI5RroFYCH97HV/Ez4busEbTOUpAmWMQ33pQC5ZiAfrEE5/J+KoTT+ehSq0z
         pD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E/wr0fT0I7yiXwtdsqEsPqFrJ61emPLJgrDzqVvsCwc=;
        b=JotYQ9Q8sIaXvTjtRyOtQWs6p1qlMoeSNXJwmMDceU2nxineTRQA261j/m85Re4+b0
         Mb2HhWsTQHZxxMkR9xGQ62i7JqX6ancmg3nXGdtdiK3J2e5rDvZ+EM7QqkWwZs8JqMQv
         5dQaRPabslY/Q+9A1Hi1x91IhUqOKa9+iTWwbpgfhlZvJDN5nV30pzxodnLaVaFr1REn
         fclIhnLjsCZfkgC/IT6HVhqacTMboKErRILStOlMssdUO9ltZl+l6eYxIz++S0hZR7cv
         EACqRsU7IqhI0PIRbWY+va4nalZY0Rq/D6lHel3nevH5cu7sgq4e0H2fFn/YcXbtff9u
         9EnQ==
X-Gm-Message-State: AOAM531qYT8wp5725KVccbv/c8JYCYZrWvQZGKBHZFm2EulVVGm/Uv5O
        u2tmnjHZKfKSeK1o5ZrAA03gauYFBwapEvdVe+eBkg==
X-Google-Smtp-Source: ABdhPJwVmc2156RMPrmhrO69/wE7ilvgnrBhCrPXsfMwzYNLZG0DtDXU3w4tN/jdvhorW978WFVzqxZ3ivV0zLv+Yaw=
X-Received: by 2002:a4a:ac49:: with SMTP id q9mr1226251oon.73.1614815466599;
 Wed, 03 Mar 2021 15:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20210302171947.2268128-1-joe@cilium.io> <20210302171947.2268128-14-joe@cilium.io>
 <0c5a3a41-2df2-2d54-80d5-00a9951074fb@fb.com>
In-Reply-To: <0c5a3a41-2df2-2d54-80d5-00a9951074fb@fb.com>
From:   Joe Stringer <joe@cilium.io>
Date:   Wed, 3 Mar 2021 15:50:56 -0800
Message-ID: <CADa=Ryw+qV=bVYkGj+9WkS6T_pGCBc4cpg6KnkoQg1wRfwwXNQ@mail.gmail.com>
Subject: Re: [PATCHv2 bpf-next 13/15] selftests/bpf: Test syscall command parsing
To:     Yonghong Song <yhs@fb.com>
Cc:     Joe Stringer <joe@cilium.io>, bpf <bpf@vger.kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Quentin Monnet <quentin@isovalent.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 3, 2021 at 2:23 PM Yonghong Song <yhs@fb.com> wrote:
>
>
>
> On 3/2/21 9:19 AM, Joe Stringer wrote:
> > Add building of the bpf(2) syscall commands documentation as part of th=
e
> > docs building step in the build. This allows us to pick up on potential
> > parse errors from the docs generator script as part of selftests.
> >
> > The generated manual pages here are not intended for distribution, they
> > are just a fragment that can be integrated into the other static text o=
f
> > bpf(2) to form the full manual page.
>
> I tried and the generated bpf(2) man page looks like:
>
> BPF(2)
>
>                           BPF(2)
>
> NAME
>         bpf - Perform a command on an extended BPF object
>
> COMMANDS
>         BPF_MAP_CREATE
>
>                Description
>                       Create  a map and return a file descriptor that
> refers to the map. The close-on-exec file descriptor flag (see fcntl(2))
> is automatically enabled for the
>                       new file descriptor.
>
>                       Applying close(2) to the file descriptor returned
> by BPF_MAP_CREATE will delete the map (but see NOTES).
>
>                Return A new file descriptor (a nonnegative integer), or
> -1 if an error occurred (in which case, errno is set appropriately).
>
>         BPF_MAP_LOOKUP_ELEM
> ...
>         BPF_PROG_BIND_MAP
>
>                Description
>                       Bind a map to the lifetime of an eBPF program.
>
>                       The map identified by map_fd is bound to the
> program identified by prog_fd and only released when prog_fd is
> released. This may be used  in  cases  where
>                       metadata  should  be  associated  with  a  program
>   which otherwise does not contain any references to the map (for
> example, embedded in the eBPF program
>                       instructions).
>
>                Return Returns zero on success. On error, -1 is returned
> and errno is set appropriately.
>
>
> Yes, this needs to be integrated into the real man page. But this is
> already great so people can see latest bpf latest features without
> going to the source code. Thanks!

:party-parrot:

Yeah I think the step around integrating into the real man page is an
area that folks may have opinions on and I'm CC'ing Michael here in
particular, but ultimately that manual is currently managed in the
upstream manpages tree so nothing actionable from this series,
absolute simplest is for someone (is that me?) to just package this
hunk up and submit it to the upstream tree every once in a while.
Slightly more elaborate would involve integrating the static text with
this generated text somewhere (either kernel tree or manpages tree)
and have someone run a cron job to generate & submit the changes.
Could be another option, these are the obvious ones that come to mind.

> >
> > Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> > Reviewed-by: Quentin Monnet <quentin@isovalent.com>
> > Signed-off-by: Joe Stringer <joe@cilium.io>
>
> Acked-by: Yonghong Song <yhs@fb.com>
