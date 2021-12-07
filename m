Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5323C433EF
	for <linux-doc@archiver.kernel.org>; Tue,  7 Dec 2021 11:25:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbhLGL3C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Dec 2021 06:29:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbhLGL3B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Dec 2021 06:29:01 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFAA3C061574
        for <linux-doc@vger.kernel.org>; Tue,  7 Dec 2021 03:25:31 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id u74so27146068oie.8
        for <linux-doc@vger.kernel.org>; Tue, 07 Dec 2021 03:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x5wO0G+tehA3S+yfe0XuwRR8DeW1wZ5UR3a1pHKoHws=;
        b=XLfO7ScOsGf9swrtIsDEV6bU8rszIkoDKALSHV+Bz1IJ9yKxBvLpA0LGuazEqYyzsH
         OLyDGj0CPG7kis3OZNGeDA50orqw0tl9vxLZWL9WFMT4bNDkB/YL8I1STKfwKQLXByCe
         1yz+O0WEdjzsVuXqqQAwhFbzdPBuh2bLgHKbzksdNS5UJH68pEypptLyMdsyGTyJrDaH
         XfeaIdsOrOeGhgA3wJw+7a6pWqbLN89iFi6eNP6VHR0V3Vjvo3988x/9N/e6yaMsyu6P
         zvSJ88/HDLNXQ705Ctvw3xlX2L1prpFGTP/bPfVlsjRInoUgHTsGJU3JxyBns4JNOpWw
         RYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x5wO0G+tehA3S+yfe0XuwRR8DeW1wZ5UR3a1pHKoHws=;
        b=AwsvdhT7TtGR8KOEQYqV4NEaJ5J1x6GLlEVaetO5GC39+gWwSn+8LjPeBtEls9fLNh
         ih7WeaGITo3Gtrfh6JAoXOV9PLlO7MCz7RAUOtSmMhkdH8O/Yh+IrT4oubHLWJTd2V+1
         cWFSDu2H3nkx3Zmxhdbc4X1kqfCn0u4VQtlgMIvPJsChgMBbL8pM9VXEw1QnHUYZmaLt
         AifraaDINXbwK3+ryvosRsPQ6oHTqzHmk+6haSFD3J7BEHdxaAgpymS0B30Nvh3jv4o6
         m9kxA/WkpLBgZGD1k20vCGbqK68Q2+jWkf8l3ukagy5pz9w/MtFbmP637Zru35cJNq5o
         KPoA==
X-Gm-Message-State: AOAM533MylOmzxUu0nriqrwgYg87qnv0U1HQQVcLCH4Wbih6qfZ7ChIc
        lfLSZHWsLEFM/n/7g7tOgOJyjQYrqpn9q4c48nR9QEZpxSzR6ObT
X-Google-Smtp-Source: ABdhPJze2Af6PabBQz2gqbdn7wRDUCFRq45zyfEpn5lX0FDxgIMvaROgU6i8/oJRBF9U4bZ6KEDVU2GQ9UBxJe/YfO4=
X-Received: by 2002:a54:4701:: with SMTP id k1mr4483888oik.37.1638876331135;
 Tue, 07 Dec 2021 03:25:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638706875.git.siyanteng@loongson.cn> <87lf0x38s6.fsf@meer.lwn.net>
In-Reply-To: <87lf0x38s6.fsf@meer.lwn.net>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 7 Dec 2021 19:25:20 +0800
Message-ID: <CAEensMzFa0HO0NDfjvGRcgDU1n_AcF9CGwqLLB2Ma_7zN-vq9g@mail.gmail.com>
Subject: Re: [PATCH 00/11] docs: fix build warning
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B412=E6=9C=887=E6=97=
=A5=E5=91=A8=E4=BA=8C 02:09=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng01@gmail.com> writes:
>
> > I can't stand these red warnings anymore, especially when I'm testing m=
y
> > patches and looking for my own warnings in a sea of warnings. so, let's
> > fix them!
>
> So I totally approve of fixing docs build warnings, so thanks for doing
> this work.  As I was working through the patches, though, I noticed that
> these patches are against linux-next, so I can't take them into the docs
> tree.  Instead, each fix needs to go into the tree that has introduced
> the problem.
>
> Thus, I encourage you to separate out this patch set, add an appropriate
> Fixes tag to each, then send each separately to the same places where
> the original patch went.  That should get these problems fixed before
> they go into mainline.
OK, will do!

Thanks,
Yanteng
>
> Sorry to make more work, but I'd like to see these changes get in.  I've
> commented on a couple of the individual patches as well.
>
> Thanks,
>
> jon
