Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A715DC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 25 Feb 2021 09:48:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DF2E64E90
	for <linux-doc@archiver.kernel.org>; Thu, 25 Feb 2021 09:48:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234598AbhBYJsA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Feb 2021 04:48:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234545AbhBYJr7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Feb 2021 04:47:59 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F00C061574
        for <linux-doc@vger.kernel.org>; Thu, 25 Feb 2021 01:47:18 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id p1so1487739edy.2
        for <linux-doc@vger.kernel.org>; Thu, 25 Feb 2021 01:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xDQW6IIbwd6L/gtIMEotjn3rNgQpSogSBTV8r7o8PFk=;
        b=PGGiyXJDDy3/CFgg2XQAWtRJppma+hK4ghl4Pl/dn5FE7J10qeMIJyMdcPwFTUBwE2
         Qv4XADM1ka/orXH+8GY6UM5ZpzySbjMii09uEp3/r0e4Gce1EsWnNY0zEou67EtoBu6q
         ouoXUQVsZTaG2n2uLa0jKEnnqttteOCLS6t68A5NAxsaUHixAPlULau8ZnywTKL255NS
         z6aqf4fALi6w9eSUFSjG5dFIQPfapNNE7HOhBxHBSUIV4nNiSYXi9punTj5ZOhVGUAac
         nS0f3fr47E2WCAnXNKL3Ru9h4cvDhlcw3AT2QU17IV0Z1R/QhICf6yLwUBCgwusSXMsT
         JSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xDQW6IIbwd6L/gtIMEotjn3rNgQpSogSBTV8r7o8PFk=;
        b=lzyXXqG20RMh/ur89dYMcN4x6PyE4Vye9FJTuM35XjDa0MWayVMZaKbq/16f/6fwL6
         DZtuOS4touZAgfTzrqFgdfPkyztmW67eK2nMz677vWfKHqpRqAW0M8Ir/z+uttLPT23u
         xJ8mZaNGYTLw+8+lmgu2JZ7ta1C4gRIhCI/SGIkIHxWoKBLbU4kIfCqEBh6R0dU9Kczo
         Xx0aVcRM3OaYgBbnw9I3cXZFeAkZwDSwWF8Q/ou5O5AiXDjXmtwtTxIB+dN0xYv2pi4o
         IK2z9OU7v3OFloCiWERUs8rj4YMUjzHY6MCGfQNk9LhayHOuJMG1ee/bUo+q3pRZGIBP
         sv7w==
X-Gm-Message-State: AOAM5338iYFttbsU1fcAb8lPNWbXWy77TwPRip78x9TmSkzdfgi2GOgf
        kDQHQMJjeHoryb8DEED86EZkQ++bKq9iqCloCy0aHQlWSb74ig==
X-Google-Smtp-Source: ABdhPJz80aEWpDWkkxyq8q99fIAGYUsZw33UmUap0lggMXKNuhaq6l7C2eSyx/pGyKQRnKar+DjNaAcS4nFc6THq9kQ=
X-Received: by 2002:a05:6402:3094:: with SMTP id de20mr2071041edb.30.1614246437591;
 Thu, 25 Feb 2021 01:47:17 -0800 (PST)
MIME-Version: 1.0
References: <20210224031149.15179-1-siyanteng@loongson.cn> <20210224031149.15179-3-siyanteng@loongson.cn>
 <4b70f2e1-a690-fce9-ed7c-9acd193b809d@linux.alibaba.com>
In-Reply-To: <4b70f2e1-a690-fce9-ed7c-9acd193b809d@linux.alibaba.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 25 Feb 2021 17:47:06 +0800
Message-ID: <CAEensMzoXokkZgNba=Vfqb8jXyUkkHT4sDDe0uV-Ys1ua6G+7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] docs/zh_CN: add riscv features.rst translation
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

hi Alex

After I built it as html, I found that this file serves to index to a
table which describes the features of the architecture. I found the
same file in other architecture directories (e.g. arm,
x86,m68k......).
emmm, maybe we need it.

Yanteng


Alex Shi <alex.shi@linux.alibaba.com> =E4=BA=8E2021=E5=B9=B42=E6=9C=8824=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=8811:44=E5=86=99=E9=81=93=EF=BC=9A
>
> Do we need this file?
>
>
> =E5=9C=A8 2021/2/24 =E4=B8=8A=E5=8D=8811:11, Yanteng Si =E5=86=99=E9=81=
=93:
> > This patch translates Documentation/riscv/features.rst into Chinese.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  Documentation/translations/zh_CN/riscv/features.rst | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/riscv/features.rst
> >
> > diff --git a/Documentation/translations/zh_CN/riscv/features.rst b/Docu=
mentation/translations/zh_CN/riscv/features.rst
> > new file mode 100644
> > index 000000000000..37f557c38047
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/riscv/features.rst
> > @@ -0,0 +1,11 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: :doc:`../../../riscv/features`
> > +:Translator: Yanteng Si <siyanteng@loongson.cn>
> > +
> > +.. _cn_features.rst:
> > +
> > +
> > +.. kernel-feat:: $srctree/Documentation/features riscv
> >
