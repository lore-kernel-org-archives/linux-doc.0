Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936D1C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 10 Mar 2022 01:55:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbiCJB4O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Mar 2022 20:56:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232234AbiCJB4N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 20:56:13 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72909127D69
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 17:55:13 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2dbd8777564so43643537b3.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Mar 2022 17:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yVW9cPr64IaGWPJHQRUXGjGqZHmSbtP4ao2Ej6HYB7o=;
        b=h3iW4AH7ZisIYdDnlNY982/d0Ww1UFM4WQYuagOZL5F/Th0B1sBvMG3Lu7BtJuUH2I
         dXfLblgP+2JgHrinUhnHURqnekhW9j5WIf8Wy2UKfGI3QmaaHPU1vyfAsZcqMT7wbywp
         mtMZnJWINOBuuXmSx0D/h1u/iTZT3r5z3RoYLw6JLwoZzYwtkO+phkHuGNnCE98RqIDZ
         pwrcXDpHB1s9KjIRFEXgKJIuLI7yywfR+IHxpMSWZbUUaVPindtS+bDkhzoYZqpUtXFX
         O8aKukhCXu4XU3M4KGRwcNdtWDbSqIJRNCLR8xyhFhsdFcdzLY1QfNkOyLFMprjRPYVv
         PK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yVW9cPr64IaGWPJHQRUXGjGqZHmSbtP4ao2Ej6HYB7o=;
        b=35v8ef7/gPNNS2xXOJYiRFIRymGmC7kB5aGi4cNGwKyPTk/jNq3r0ngLFvXsglUvXP
         QmOlFR4tKwPKSBdUREGBo5bFtS8VUcCv718FL1/gJbmUe+TzgLL7DGbe4TCLJey46Crg
         V9cYbu3Pl61SbQz1Rg/UWHD4Bmk+HXX3rzBkXvsGpaLJMOkKzkww2ajZwxh/QAnnWPFU
         1VsSJ9Ib36K3xcrap4krZa4hISzMMku02sRcnxWUAsSwGi4fPDMCdzpvdCl25og/JQ3Q
         91t/JvWdS2ak4OiNzRe+3Xu2drkVztHdvoORV3GBgoarQc6afA5kcM+7IvAizoJrrnam
         nhSg==
X-Gm-Message-State: AOAM533hTESoGqqO2TH4dGpn1w1omYTB2Zop8j+xxYAx6R/K2Fy8X7DW
        os5cqsYmYfMkdh9mlSvVTQRwskAS9kzg5R1wf2Q=
X-Google-Smtp-Source: ABdhPJx4NUL9Klm7lcTMnsm9YpcbV3E/aM7S7+PznGq+/PIj/CFuL/5m1oK/82ceUkLk/GyLLPWSQ2ls07OvaRw5bLY=
X-Received: by 2002:a81:752:0:b0:2dc:8195:681d with SMTP id
 79-20020a810752000000b002dc8195681dmr2301691ywh.212.1646877312666; Wed, 09
 Mar 2022 17:55:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646642188.git.siyanteng@loongson.cn> <87ilsm7lda.fsf@meer.lwn.net>
In-Reply-To: <87ilsm7lda.fsf@meer.lwn.net>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 10 Mar 2022 09:54:53 +0800
Message-ID: <CAEensMwWpJcNyC04ro_GrJakaUScJxbmRroPtfkkp9mgNEv_Dw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] docs/zh_CN: add devicetree translation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2022=E5=B9=B43=E6=9C=8810=E6=97=
=A5=E5=91=A8=E5=9B=9B 07:32=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng01@gmail.com> writes:
>
> > From: Yanteng Si <siyanteng01@gmail.com>
> >
> > v2:
> > * Pick Alex's Review-by tag.
> > * Modify "test-date" to "=E6=B5=8B=E8=AF=95=E6=95=B0=E6=8D=AE" accordin=
g to Alex's opinion.
> >
> > v1:
> > * Translate .../devicetree/of_unittest.rst and .../devicetree/usage-mod=
el.rst into Chinese.
> >
> > Yanteng Si (3):
> >   docs/zh_CN: add devicetree index translation
> >   docs/zh_CN: add devicetree usage-model translation
> >   docs/zh_CN: add devicetree of_unittest translation
> >
> >  .../translations/zh_CN/devicetree/index.rst   |  50 +++
> >  .../zh_CN/devicetree/of_unittest.rst          | 189 ++++++++++
> >  .../zh_CN/devicetree/usage-model.rst          | 330 ++++++++++++++++++
> >  Documentation/translations/zh_CN/index.rst    |   6 +-
> >  4 files changed, 574 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/translations/zh_CN/devicetree/index.r=
st
> >  create mode 100644 Documentation/translations/zh_CN/devicetree/of_unit=
test.rst
> >  create mode 100644 Documentation/translations/zh_CN/devicetree/usage-m=
odel.rst
>
> Set applied, thanks.
>
> For future patches, though, could you please ensure that your signoff
> and sending email addresses match?
>
That's a tricky one. To be honest, I don't like siyanteng01, but
<siyanteng@gmail.com> has been registered by some lucky guy.

On the other hand, <siyanteng@loongson.cn> seems to be rejected by the
doc mailing list, which I haven't tried in a while.

Please give me some time to solve this matter, thanks=EF=BC=81

Thanks,
Yanteng
