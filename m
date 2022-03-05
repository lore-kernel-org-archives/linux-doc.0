Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF6FC433F5
	for <linux-doc@archiver.kernel.org>; Sat,  5 Mar 2022 16:13:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbiCEQOA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Mar 2022 11:14:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiCEQOA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Mar 2022 11:14:00 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1987CDF494
        for <linux-doc@vger.kernel.org>; Sat,  5 Mar 2022 08:13:10 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id w16so22778104ybi.12
        for <linux-doc@vger.kernel.org>; Sat, 05 Mar 2022 08:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1cfb/nn077Ec8GJU4qIIFMYN/GdF2b6pVpRmpIKeBH4=;
        b=FR0H/SAbI3abnPBBRfp57Ib52QMIyIaQdqS7w3WO+QM6jCOwTkm4WV69e8iejuANPv
         knmh0vzVV3EoUkHt7GA2g9g6nfkHc9/mGu+fLEtRmomQE/euSNnDOcocjSdKcJnarmZu
         Tt1MBVSraTnXC/1Wwy8eA1YpgnvCsb5rVh0Xv4dERY2cku8k1YF6YGf+V36q49Xancin
         viU95n9yMi6fWtNCtKsKkkD/II3RMJZmuKilcSITQnAdYrcVeJ1Z12fWkPZ5mSX5LN8c
         L7JI4jwQKy5Sg9cydnApwDpH/EMTsJKVDd0a3PFWP6tBLv48kJ4EpZw2sxyxnyMrTPI3
         m9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1cfb/nn077Ec8GJU4qIIFMYN/GdF2b6pVpRmpIKeBH4=;
        b=qdECHiVfeSvOSMMhfqq0uWf5UElbZLdTyKIczxF4IXNWyRt7xX9NF9g0SKNWz353TP
         EstzJxBHea8siY9YABTpL2ztXcmKJj75//jKVxdr32zDAtsMywDnjmCwFReEVDFIpx+1
         XXh57Iy4lQYUT4YWOXH3gWN75T3rLXAyO0IR1JJsrCgI6YLJ/PrqCLyv5badG/hNuMZL
         Jl+p/rA9u2LKRpAuuz/6CMFEk3lceMCAtklzIeKhXUCpMMlDo6nEbf0juAFcxd6qWODM
         wc7lFqC2rnHM4Z8ly4/B17k3XnheCFJCOKPgHe+bfuaG1sEJZbDwb6Lk7VrXo3Pv1mxV
         EW5A==
X-Gm-Message-State: AOAM531gCRUlBr3gbGY2k6VkukvQAuAVLGnxQs3d1GHmy2sYAZAncbJN
        Fbs4QDExPFo67a5Mc7hrdU5vFspmgcR1Y9zRDOM=
X-Google-Smtp-Source: ABdhPJwEYZM621LzO+15Q7q151ewpW30ZhABuKGfEBfYVbH9YPr195ASP5FHDu7FCSBH95mlzsEhoibAVR+Di23vXrs=
X-Received: by 2002:a25:fd4:0:b0:628:f1b9:cf1e with SMTP id
 203-20020a250fd4000000b00628f1b9cf1emr2793362ybp.104.1646496789278; Sat, 05
 Mar 2022 08:13:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645669457.git.siyanteng@loongson.cn> <87a6e5hcfw.fsf@meer.lwn.net>
In-Reply-To: <87a6e5hcfw.fsf@meer.lwn.net>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Sun, 6 Mar 2022 00:12:55 +0800
Message-ID: <CAEensMzxriv0Vho=a+T5Ce-5Fox=RfLyPPe-=At7StUDPg=JJw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add Chinese translations for KSM documents
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Alex Shi <seakeel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2022=E5=B9=B43=E6=9C=885=E6=97=A5=
=E5=91=A8=E5=85=AD 01:09=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng01@gmail.com> writes:
>
> > v4:
> >   Fix build error and build warning.
> >
> > v3:
> >       Fix the patch '[1/3] Add Chinese translation for vm/ksm.rst'
> >       because its old version does not apply for the latest commit.
> >
> > v2:
> >
> >       According to the suggestions from Yanteng Si, Alex Shi and
> >       Jonathan Corbet, I have modified my patches. Here are my specific
> >       changelog:
> >
> >       1. Remove Redundant Labels in added Documents like ``.. _ksm_sysf=
s:``
> >
> >          Yanteng Si said: Too many tags will cause a compilation
> >          warning, because an identical one already exists for the Origi=
n
> >          document. Jonathan Corbet think so.
> >
> >       2. Align with standard Chinese format on the 'original', 'transla=
tor',
> >          etc.
> >
> >       3. fix some translation error like =E2=80=9Cpages_unshared=E2=80=
=9D, I remove  '=E7=8B=AC=E4=BA=AB'.
> >
> >          Alex Shi suggest to remove '=E7=8B=AC=E4=BA=AB'.
> >
> >       4. Refactor translations/zh_CN/admin-guide/mm/index.rst.
> >
> >          Yanteng Si: Compile pass is only one of the basis for checking
> >          through, we also have to check the html for any problems, as
> >          far as I know, the above treatment is very ugly.
> >
> > xu xin (3):
> >   Add Chinese translation for vm/ksm.rst
> >   zh_CN: Add translations for admin-guide/mm/ksm.rst
> >   zh_CN: Add translation for admin-guide/mm/index.rst
>
> So you are passing on somebody else's patches, and have modified one of
> them.  That means that your signoff needs to be in the chain, but you've
> not added it.  Please fix that and I should be able to apply this set.
Will do.

Thanks,
Yanteng
