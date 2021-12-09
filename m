Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D97C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 23:34:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233717AbhLIXh5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 18:37:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhLIXh4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 18:37:56 -0500
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A443AC061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 15:34:22 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id i6so13837236uae.6
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 15:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cLPCbXlc73RLi5yRCu5LMqkdSBhKm6ARAqaEQyFjM1w=;
        b=DpK/GOR9y2ZlqJkg724KD0n4G82r8weQKdRsrhWRO9wDMYXk/1qKSprRC6aSzX5HmX
         O079hRS8c/136V6+ueomtrqhJzr54Sgpb5teQyuiXazhAkQJRGvBHsUiCPBf48SCSC9K
         m6jweck1sQt61Pu+2/QfHH9pO/a+doDl+B3BYzDaEj6aSQh7vbSRT7tdiNmt7uX5bQpH
         cQtIS0J0ntSylJNXR4/scHZk/KscKhzrOdsrrTBf3U+QrI8+Ae2KeecsIaZTquAtuFQh
         YqjwyyN90Ey0UtUzS5IUUD/xF00vQX195NXCPMrXTCpxEtjwCabliuRzqhGNhn0azHB9
         xBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cLPCbXlc73RLi5yRCu5LMqkdSBhKm6ARAqaEQyFjM1w=;
        b=8LYGgefDGBWGsk0Vhbj5kWGihLuEAA1E5LSoponWlQZKOMOMeDxh0cIPDqPzhTaugY
         Iuo+qVrN2TEEBiMkF2j0HJvDjvcYoXPSe4q3K6tCts8tOcPC/PfGI4b0PdVcFBkBgBnF
         Wm6mpxtWWmqf+4B4WDvOPNiE99fReuz0vPYDWcgoalaNefY2w7QaiUuDQGk559o0ZQ4r
         XCaKWqun4Zc9XGpQFnU+LKpYtbmZbm00JsBwo1Fdn0U92sAIDf6BVsNv4bDKOM94vCEx
         w5rCcrEMgc92pn5QrvFg8wvjAdI2eZ+RrnPuNPgDBPL5tjttfU7zeKVyAinD4oGqC2jV
         PcvA==
X-Gm-Message-State: AOAM532oGODJrXQDfOHYUDTvW32wNh1t0NS/R7AJdFW7OjbxFRaqQHfl
        /AfxIvF2wylqVUQiWwRXF9XfZBbGS9WVzyh4EEVKagTF6oRNmw==
X-Google-Smtp-Source: ABdhPJxr4GawJTn/yvyD2EkQpeMQNbsqBYX5QEhHcDeVdcpyUaLxsx5ErJlPfDsEf7L4f0kdRWZgJQoSYa2I1Ighze0=
X-Received: by 2002:a05:6102:3ed1:: with SMTP id n17mr11596224vsv.3.1639092861718;
 Thu, 09 Dec 2021 15:34:21 -0800 (PST)
MIME-Version: 1.0
References: <20211209090744.544938-1-siyanteng@loongson.cn> <CAO658oUc4gFPA-OW2gXO07_yrPEx7Vxpx7PaVBZmQeZGDTMhzA@mail.gmail.com>
In-Reply-To: <CAO658oUc4gFPA-OW2gXO07_yrPEx7Vxpx7PaVBZmQeZGDTMhzA@mail.gmail.com>
From:   Grant Seltzer Richman <grantseltzer@gmail.com>
Date:   Thu, 9 Dec 2021 18:34:10 -0500
Message-ID: <CAO658oX_u-72eMFVFn8d6S+h1dipYMc3NNVGNL_hqyMYKA5U2g@mail.gmail.com>
Subject: Re: [PATCH] docs/bpf: Add libbpf into index/bpf
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Andrii Nakryiko <andrii@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 9, 2021 at 12:32 PM Grant Seltzer Richman
<grantseltzer@gmail.com> wrote:
>
> On Thu, Dec 9, 2021 at 4:09 AM Yanteng Si <siyanteng01@gmail.com> wrote:
> >
> > Since f42cfb469f9b ("bpf: Add documentation for libbpf including API autogen") which
> > introduced a warning:
> >
> > linux/Documentation/bpf/libbpf/index.rst
> >
> > Add it into index/bpf.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  Documentation/bpf/index.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/bpf/index.rst b/Documentation/bpf/index.rst
> > index 610450f59e05..bdf66f57f910 100644
> > --- a/Documentation/bpf/index.rst
> > +++ b/Documentation/bpf/index.rst
> > @@ -17,6 +17,11 @@ libbpf
> >
> >  Documentation/bpf/libbpf/index.rst is a userspace library for loading and interacting with bpf programs.
> >
> > +.. toctree::
> > +   :maxdepth: 1
> > +
> > +   libbpf/index
> > +
>
> I may be wrong (I'm confused easily by mailing lists) but I believe
> your tree is out of date, this was already added in patch
> 5931d9a3d0529dc803c792a10e52f0de1d0b9991

Apologies, I see this was sent to the linux-doc mailing list. The
above patch ID was submitted to bpf-next.

>
> >  BPF Type Format (BTF)
> >  =====================
> >
> > --
> > 2.27.0
> >
