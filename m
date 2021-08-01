Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594C0C4338F
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 02:57:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3329161054
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 02:57:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbhHAC5I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 31 Jul 2021 22:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbhHAC5I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 31 Jul 2021 22:57:08 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22249C06175F
        for <linux-doc@vger.kernel.org>; Sat, 31 Jul 2021 19:57:00 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id z3so13370542ile.12
        for <linux-doc@vger.kernel.org>; Sat, 31 Jul 2021 19:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AB0yET1GT1AQ9UeHSsgsU/y09uGzq4CoYfxKHCAxJiU=;
        b=CIlNYtBBpF3G1neTg/Sj9WEbrPz8lgqi2RR6w1K2Mxdo2MdYVFkamapnLD/thgfs3s
         jo38lPqLZDZ7iOSIbnFbkvAMlOHZqpgoGBp7wsz/n2StQqnbeNu6Tq+I7xUqrWf9l6pE
         HtKdNxTl/xXcBaDnG4bv+B/8ytNeqqt7k00j8TypUMxS1qFQ0DmiTIPDFvk/O2tPxYKX
         in7qK2DMaKyOivesqYYG09Ha0EF6G2dU6nICR52+iRdkSmp0FM8xzh+McR0q5cbisBUN
         WB56KRsbBhTWavP/YAm5RD0K6uGIYICF0VdiQcnrntDmUfdsIuTDVvFE9aUhRUg3kdEk
         vqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AB0yET1GT1AQ9UeHSsgsU/y09uGzq4CoYfxKHCAxJiU=;
        b=pad5qhDoXi70jThcFbtWHQg8nAHiit2pJ9kuLeZp+C6sYMDvVr3S+qPHk/wjcyUzug
         pMxnqcNV5kFaSEoTi1cp5vSeJe2WD+eI7d0AMBhHaiTHvsBVfAAYnaWugAVIZx0yS2ul
         S9JlI8b2/LzTg5le0wlD3NUQmXcyhlocohlePYZZomF+T5lDc4dzCh6DH6kRt1V6N/ri
         scPVr9SIFTjGUXaSausfQQByatADXFmw82vRJGyMVDjRt3vtYCnXyPe3PrTWOOexPyhz
         ccIO34HKJoLCONPoAdHKftr0xVA8HSnikYBqR/gIeJzVC2a6pbnBxFMnWa9gdj69Emw9
         Cc9Q==
X-Gm-Message-State: AOAM531W8U1yIT/pSTnSoQyXJW74lpzx7eUUovlcnzU0rf7NMlf9rCXd
        icwidcX/FozfRhaCIy1S+HWIpbUQCl7jz8OMDnt4bqjX966hrg==
X-Google-Smtp-Source: ABdhPJwzo4sN3mkIE9QQA1w53hoMeIXg+3NK0upn+FkZYFW3uL8hNY0d4ywoxEK3FcgsemWkIJXPn2xEKy042P2VbG8=
X-Received: by 2002:a05:6e02:602:: with SMTP id t2mr3959545ils.118.1627786619651;
 Sat, 31 Jul 2021 19:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627007852.git.siyanteng@loongson.cn> <c3fed7c5819f63ae1cb685d05992f2b36f4de055.1627007853.git.siyanteng@loongson.cn>
 <CAJy-AmmVFxcDQPSfd1ZhR5GTC8ESRixWABrk4E5E8Ay-owWwuw@mail.gmail.com>
In-Reply-To: <CAJy-AmmVFxcDQPSfd1ZhR5GTC8ESRixWABrk4E5E8Ay-owWwuw@mail.gmail.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Sun, 1 Aug 2021 10:56:23 +0800
Message-ID: <CAJy-AmnT++R2sgvOWGTS=T1PC2i81diVpLrwGmKOiW_+QZ8a8A@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] docs/zh_CN: add virt acrn index translation
To:     Yanteng Si <siyanteng@loongson.cn>, wanpengli@tencent.com
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenfeiyang@loongson.cn, chris.chenfeiyang@gmail.com,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 29, 2021 at 9:34 PM Alex Shi <seakeel@gmail.com> wrote:

> > +
> > +.. _cn_virt_acrn_index:
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +ACRN=E7=AE=A1=E7=90=86=E5=B9=B3=E5=8F=B0
>
> CC, Wanpeng,
> Any comments for the translation of 'Hypervisor'?

Got some suggestions from Intel OCT guys, they suggest using =E8=B6=85=E7=
=BA=A7=E7=AE=A1=E7=90=86=E5=99=A8 for
hypervisor. It looks nice, isn't it?

Thanks
Alex
