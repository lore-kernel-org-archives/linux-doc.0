Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D91AC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 13 Apr 2022 01:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbiDMBy4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Apr 2022 21:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbiDMByz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Apr 2022 21:54:55 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1FC2DAA9
        for <linux-doc@vger.kernel.org>; Tue, 12 Apr 2022 18:52:35 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2eafabbc80aso6794287b3.11
        for <linux-doc@vger.kernel.org>; Tue, 12 Apr 2022 18:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1yFYZvCnZrCcXt7ZrkJr3JSinUG/SsvlbJfn6pei6fU=;
        b=pEGSGtPAa5FshyWhnWvjvszVQauyRwbFKk36bPw7y0M7KRV9B7yUNLC3VVXqRwRw84
         O/XlnWy307UlCqdY9AK+cb6GUNWETjKyIV+sXQY+zhibLCl27EuqAgEQ/05ND9I/HJs3
         TJXt1e4GCMf/4PTcC1VNIrWwcNyZMEyczGtMncaC3sSkEVrdCz7qcSKg0+qait/1x+c8
         gN6Rx1QFdWa8nmZ+RMxR/IjbC9QUFIyNo5ZIVjM35dkt4XzG0HoOBEppqtI+iBTzfEd5
         xcCuPaSlK1/rbBK75Zrl2bq4HxdIEjqhaM0hNg2/VzpPHE5khabK1GfgJqvSHcUCd6EP
         AdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1yFYZvCnZrCcXt7ZrkJr3JSinUG/SsvlbJfn6pei6fU=;
        b=WNH6SNyZJ/nsdUKLFpFx6Qrd9D2sfsiOJdz/CWMB9RsMPr8/wyuJ3aPy2zmtfk5wC4
         6xApBfOSa9/JiFppH1s21M8k0XRyPbmzzXwOBl/ceN3pClcrt0ogTbjvrwCUOAQzPAmD
         ha7ENrqV37qJcEWxl/hWt1aROdyMJ3b5BsFh+PRYG3sAZJ55CoJiucQQlYmdiv6rKzRI
         M8asEPyx7FpBHPvLRiYE5Zb3k3RkAXV6hy+NF1VWQdHzMNY67Lt/j7YkH/ObzhkXlamM
         lP84TFGDm0fxiR43HWrKwUrl1dNuS8dIJUiup4PdKx5ubUn/pgtok+DEdDrMzz+mw/iS
         CEQg==
X-Gm-Message-State: AOAM5315BhZp0tDIhYk0pRmgbBBy+Kcw/7/ySrRSJOd8OEwCzXBwCwc4
        9n2S9d+bBzELJmtNN8jLdJeIbnebfz+JDLJZo+A=
X-Google-Smtp-Source: ABdhPJwZcU9uFxpV0eVjeS+bwNXD03BzBSGngYmkylViyG+CLqLFTcxIbiGFW2woDpeb31pDJcQPl++NNZJTYVEj4KI=
X-Received: by 2002:a0d:c085:0:b0:2eb:c478:832c with SMTP id
 b127-20020a0dc085000000b002ebc478832cmr24364409ywd.92.1649814755123; Tue, 12
 Apr 2022 18:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220408144742.23225-1-tangyizhou@huawei.com> <20220408144742.23225-2-tangyizhou@huawei.com>
 <0c37089d-8dc8-8326-322b-e0171dba5736@gmail.com>
In-Reply-To: <0c37089d-8dc8-8326-322b-e0171dba5736@gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 13 Apr 2022 09:52:21 +0800
Message-ID: <CAEensMzw0MF-HsndC4XS3UZzJNtTPeo=6N3rhUQ=rDXXk2kYBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs/zh_CN: Add locking/index Chinese translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Tang Yizhou <tangyizhou@huawei.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alex Shi <seakeel@gmail.com> =E4=BA=8E2022=E5=B9=B44=E6=9C=8810=E6=97=A5=E5=
=91=A8=E6=97=A5 11:50=E5=86=99=E9=81=93=EF=BC=9A
>
>
> On 4/8/22 22:47, Tang Yizhou wrote:
> > Translate locking/index.rst into Chinese.
> >
> > Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
>
>
> Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
>
>
> > ---
> >  Documentation/translations/zh_CN/index.rst    |  2 +-
> >  .../translations/zh_CN/locking/index.rst      | 42 +++++++++++++++++++
> >  2 files changed, 43 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/translations/zh_CN/locking/index.rst
> >
> > diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation=
/translations/zh_CN/index.rst
> > index 88d8df957a78..ac32d8e306ac 100644
> > --- a/Documentation/translations/zh_CN/index.rst
> > +++ b/Documentation/translations/zh_CN/index.rst
> > @@ -108,6 +108,7 @@ TODOList:
> >     :maxdepth: 2
> >
> >     core-api/index
> > +   locking/index
> >     accounting/index
> >     cpu-freq/index
> >     iio/index
> > @@ -123,7 +124,6 @@ TODOList:
> >  TODOList:
> >
> >  * driver-api/index
> > -* locking/index
> >  * block/index
> >  * cdrom/index
> >  * ide/index
> > diff --git a/Documentation/translations/zh_CN/locking/index.rst b/Docum=
entation/translations/zh_CN/locking/index.rst
> > new file mode 100644
> > index 000000000000..700df8a2bb70
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/locking/index.rst
> > @@ -0,0 +1,42 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/locking/index.rst
> > +
> > +:=E7=BF=BB=E8=AF=91:
> > +
> > +  =E5=94=90=E8=89=BA=E8=88=9F Tang Yizhou <tangyeechou@gmail.com>
> > +
> > +=3D=3D
> > +=E9=94=81
> > +=3D=3D
> > +
> > +.. toctree::
> > +    :maxdepth: 1
> > +
> > +TODOList:
> > +
> > +    * locktypes
> > +    * lockdep-design
> > +    * lockstat
> > +    * locktorture
> > +    * mutex-design
> > +    * rt-mutex-design
> > +    * rt-mutex
> > +    * seqlock
> > +    * spinlocks
> > +    * ww-mutex-design
> > +    * preempt-locking
> > +    * pi-futex
> > +    * futex-requeue-pi
> > +    * hwspinlock
> > +    * percpu-rw-semaphore
> > +    * robust-futexes
> > +    * robust-futex-ABI
> > +
> > +.. only::  subproject and html
> > +
> > +   Indices
> > +   =3D=3D=3D=3D=3D=3D=3D
> > +
> > +   * :ref:`genindex`
