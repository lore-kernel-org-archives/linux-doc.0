Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558CEC4338F
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 05:58:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CEFA61057
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 05:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhHAF61 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 1 Aug 2021 01:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhHAF60 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 1 Aug 2021 01:58:26 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 306D8C06175F
        for <linux-doc@vger.kernel.org>; Sat, 31 Jul 2021 22:58:17 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id u25so19997502oiv.5
        for <linux-doc@vger.kernel.org>; Sat, 31 Jul 2021 22:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bJjJ0BsxwY8CzEebOY5eZ+uyDkuH/+8wvD9jsDs92vk=;
        b=Y82962JIkoOhNrjjW2fENiEncmp1fyHThcusvEMheT6mfxC6489WlWUvNZJn2kAk4I
         CEbTlmxNwWsNuOFv8o73rEaTYYyQFGJPCEvp2psIppUFvilGaUFvvg5fJeLI1SuvcVAF
         GU82n9O8sfHHJep6n4p+nEC+WBFSD5iLyrl1JkNcCw1Kzp+7479wy+uQF77ZLaIvr6Ne
         2oZ+DtJX/CpyXxH5jESZdtEd9sQBVZmX6qD3Xzqn06MefAaYumj6uy7qCepFjW1yi6Gp
         nebIVkc4Y7Mtp2L6Z9Y6d9OzWzTnZwzusR+da2t42op35um+XtP/+G6ZcGT9GagC+AJ0
         s1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bJjJ0BsxwY8CzEebOY5eZ+uyDkuH/+8wvD9jsDs92vk=;
        b=pa4DW/hVi3rHsS95rmIiU3r/m1KcXau7n/YkEoSfB8clzKgV74l1Nj1R5KCCf1P7ou
         BkcdJihGctIBDh+oavwmsnqiS0MDpbxbSjfEenOI2TLCdKJ4kZdZhWz0MUCksIIIgwZ/
         buVV/9Lh3PUsI3s3I4OLra2sZQyMruf8Ky6I+ZJELd3FSn+Qt2kPscew6qL56hcifxEE
         GUHfxqrSksIkt6Nav0poe7EoTfyiZGi2RieKCVIM+YIbRGwzYA1rKvJJPJixPB+xbZBu
         IJ4MsqxP/VrPuNkjI9TT1U4YzHXDFBmG1DInwESLBvL5Jc9xyI8Hg8Qn0ZrZnjK/qHJg
         r4YQ==
X-Gm-Message-State: AOAM530i6Zqc14AlEN3R4ePnqOrHlHe95BJrvo8vDYum6zfRpRNO1Kkz
        KuuMewT/TWOa4snc01RAp2LqA81cLJOm1ctC1gQ=
X-Google-Smtp-Source: ABdhPJyOZw+fBkzezSN51b3OzckqlICWRHURIBVlF+FtnV0LxURRV16bfEjo0j3FjJfglg0SYFsgYzkJO8USOY8HTTk=
X-Received: by 2002:aca:1215:: with SMTP id 21mr1742142ois.37.1627797495906;
 Sat, 31 Jul 2021 22:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627007852.git.siyanteng@loongson.cn> <c3fed7c5819f63ae1cb685d05992f2b36f4de055.1627007853.git.siyanteng@loongson.cn>
 <CAJy-AmmVFxcDQPSfd1ZhR5GTC8ESRixWABrk4E5E8Ay-owWwuw@mail.gmail.com> <CAJy-AmnT++R2sgvOWGTS=T1PC2i81diVpLrwGmKOiW_+QZ8a8A@mail.gmail.com>
In-Reply-To: <CAJy-AmnT++R2sgvOWGTS=T1PC2i81diVpLrwGmKOiW_+QZ8a8A@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Sun, 1 Aug 2021 13:57:56 +0800
Message-ID: <CAEensMwRcLTLjs8L4vqMEvqDoA9maQ9YNcNF8TaoG3Y6SZuiUQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] docs/zh_CN: add virt acrn index translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, wanpengli@tencent.com,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenfeiyang@loongson.cn,
        =?UTF-8?B?6ZmI6aOe5oms?= <chris.chenfeiyang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B48=E6=9C=881=E6=97=A5=E5=
=91=A8=E6=97=A5 =E4=B8=8A=E5=8D=8810:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jul 29, 2021 at 9:34 PM Alex Shi <seakeel@gmail.com> wrote:
>
> > > +
> > > +.. _cn_virt_acrn_index:
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +ACRN=E7=AE=A1=E7=90=86=E5=B9=B3=E5=8F=B0
> >
> > CC, Wanpeng,
> > Any comments for the translation of 'Hypervisor'?
>
> Got some suggestions from Intel OCT guys, they suggest using =E8=B6=85=E7=
=BA=A7=E7=AE=A1=E7=90=86=E5=99=A8 for
> hypervisor. It looks nice, isn't it?
yeah! >_<

Thanks,

Yanteng
