Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C97C433ED
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 01:50:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B11AC61414
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 01:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233824AbhDUBv1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 21:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbhDUBv1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Apr 2021 21:51:27 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE0BC06174A
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 18:50:53 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d124so27111671pfa.13
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 18:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MLr1/6rm60HUOmbkjw+p7yNzZW/jJpijovzhpLvGueE=;
        b=Lu6CxHY9fSeChipHvDEXmdozT94hRTz3FlKU3k+R8JuCgjW5YgVHSsxrTbL9N8O30g
         IfoS+D1wLS53uQ5o5FZenKsvoBZscHkWDfPcJcpKgAShjmBeyzkQamLkfOB9UQKURrfJ
         zWNknLM/sQSgLvZKSHBVdXS5l0W63OGY3JkDDb+GQmJABXP3jADhocrsu/X2m+02erTU
         5pUkzdZVj8s19AxhpCC4JYilcsT0+M0yrLQraK/O2Wi3N/oJYchHgHSw2R0id1laoKFt
         CVwUV9HPH3su03KnS3OZe5nWtoMecw2pdU4tju3GQlf2AeAvdTtCobV1CNP5Zhug+LGa
         x7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MLr1/6rm60HUOmbkjw+p7yNzZW/jJpijovzhpLvGueE=;
        b=dd6uUuDPZW32QN/gELp0OR236OxTYKlxalN1Omu0QMxM1O26cuDa163k6DqGdQ2meA
         njn+oQ6/UhnuvL8UN3PWaylSVrosh1JjohEDCoGYcrvWJtE5tVSeSxBBcS4qj4TB32QS
         Tk+WOCfdqBDhsbglauMjcey3zXQ6UoONFYBqE05kdookkvilPwy6DSTxTzXYdBxqD7no
         R1WnrMtUaodzErCIXgJaamWDOO/Io7oVoJNxYDMa5C93CV2lTMLRhOhR4XSKJkFu0sWh
         s7zIU78t8lCANMpsHXVze35nspfNHsDvvTs1EP5+HC0H6nBwRDeGa4nr+aMBNYwJQfj9
         xLRg==
X-Gm-Message-State: AOAM533IqX67OkNurP2zBjf/5TCf7AI+XgK0cGOr4RmIDJRq1MIQR1xg
        ii5qU8lTj1gxOAJkOfORHtmgEEgw5u1PwuHmjiU=
X-Google-Smtp-Source: ABdhPJwX4ng/DgoRM6nKk+qJ+lYq+18nmuxr56m9L8syw9vgKm1fYLYmV/0O+3uzXp/1W7nxa1NeB6DL+znNKp1aSdU=
X-Received: by 2002:a17:90a:f40a:: with SMTP id ch10mr7923552pjb.62.1618969853184;
 Tue, 20 Apr 2021 18:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618836460.git.siyanteng@loongson.cn> <87pmyoipft.fsf@meer.lwn.net>
In-Reply-To: <87pmyoipft.fsf@meer.lwn.net>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Wed, 21 Apr 2021 09:50:44 +0800
Message-ID: <CAMU9jJpNoJJGeX7HjNwazXgRWXKmTA-E=SRRMCis7On++TF+XA@mail.gmail.com>
Subject: Re: [PATCH 0/3] add three core api docs
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        "Wu X.C." <bobwxc@email.cn>, Yanteng Si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B44=E6=9C=8821=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=886:04=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng@loongson.cn> writes:
>
> > This patch add three core api docs.
> >
> >
> > Yanteng Si (3):
> >   docs/zh_CN: add core-api kernel-api.rst translation
> >   docs/zh_CN: add core-api printk-basics.rst translation
> >   docs/zh_CN: add core-api printk-formats.rst translation
> >
> >  .../zh_CN/core-api/kernel-api.rst             | 433 +++++++++++++
> >  .../zh_CN/core-api/printk-basics.rst          | 118 ++++
> >  .../zh_CN/core-api/printk-formats.rst         | 577 ++++++++++++++++++
> >  3 files changed, 1128 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/core-api/kernel-ap=
i.rst
> >  create mode 100644 Documentation/translations/zh_CN/core-api/printk-ba=
sics.rst
> >  create mode 100644 Documentation/translations/zh_CN/core-api/printk-fo=
rmats.rst
>
> Please, don't forget to add these files to index.rst.  This suggests to
> me that you haven't tried a docs build; please always do that too.

Hi jonathan,

OK=EF=BC=81I add indexs when I test every time, but this time the indexs ar=
e
based on the
previous set, so I'm worried that repeated commits will cause
conflicts. I will add them to v2.

and next time :
when I add a new file, I will do the associated index.rst changes in
the same patch.

BTW. My other gmail mailbox may be broken, the mail can't be sent,
please don't be surprised if you receive two identical emails.


Thanks,

Yanteng
