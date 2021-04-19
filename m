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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9373FC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 13:06:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EF5E61107
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 13:06:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233329AbhDSNGy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 09:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233360AbhDSNGx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 09:06:53 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB41C06174A
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 06:06:23 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id f29so24204415pgm.8
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2Jy2EIaFU8U5eqOeFz0G6j/OPCxwTmmPJQQQnJ/OaPU=;
        b=iFd0ikF4I3IXa5calC+DqwSSf68Okvv5PRwhLN29t7IJkcktVLWGKXi+bxuulyV3Kl
         nemfI0g/+zMaslpKPwrKzhozMU2slYDGjKKBJsVvqL3FcKSfgk45fLKVeL41ZzN40mLV
         TQYbQhclKRVHfFLX6dX2LE+eNfWDPAeIOYg9ntVM9wL0oocuP3tak2mQVjZwjPCY4NYq
         dRzJoUztS7gFpdgk+prEBDUNVJ1tIHEIkTtYyzAjnD8IyHip0do5SMpUFZ3DrEYmcKVu
         r/XMJwYzr1rPVVvNr5mUnBJ8dScjXMsom0HxLb++/Jr47x9u/LBD5JX6dCfVsZLMh06e
         q7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2Jy2EIaFU8U5eqOeFz0G6j/OPCxwTmmPJQQQnJ/OaPU=;
        b=m49VX3U4P1gLEsgEhCW36dCrWsmttQdzMuX1iKgGaxKF9xR0xsU3ZDXpaePPN/4Cde
         A93TfGrW0rrd66jp+eRLkdVFo8pUm3HBY24P4wj838Yx1xFtnqAeNBwkZoU8Dvirmjhc
         D7Zx80geOZBDJNLYeSK/SXZQoywrjeBQMwG5dPAGndtkHcM6Un6ULJW+4QdAleT4unoo
         /n4qPZw4QwIs5LsqfUwE7bqmMoTblVaMklZu7tQXbcSIVaFVU1J57uVJf/GfJCkNRFf3
         irxPU+l+bQz0hYMp6AS/t5EzGdJ3pHSTTMfM4I6Rb/lF9Mg7ZVnO3T2VLVCi28sbv40F
         VJUg==
X-Gm-Message-State: AOAM531y5X01e4hDBrR5SU0beok4rOaKxpnKBH5sXToBdgb7tKvjr9KN
        UNllqTrzD6v99DVAPSTdBDL0/z2hKN4Gki40H/YCJmI/geQ=
X-Google-Smtp-Source: ABdhPJwAbjg5VII2ccccwOOJIhJAEp0kWeqhk9+KgsRBVUyaz+Cpvq6z99zl1FGWHI3wZNwu9WGeC/zZlA4HGvCQNQ0=
X-Received: by 2002:a63:f943:: with SMTP id q3mr5704146pgk.108.1618837582708;
 Mon, 19 Apr 2021 06:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210416032917.2772471-1-siyanteng@loongson.cn> <8b673807-4713-f226-3c63-ae7d81463fcf@gmail.com>
In-Reply-To: <8b673807-4713-f226-3c63-ae7d81463fcf@gmail.com>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Mon, 19 Apr 2021 21:06:12 +0800
Message-ID: <CAMU9jJp7wbHpfPd=cPbVOAqqcESh=87Hcc_vLCqogM7KAdPUqQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] docs/zh_CN: add openrisc translation to zh_CN index
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Yanteng Si <siyanteng01@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thank you, v7 is already a complete series.=EF=BC=9A=EF=BC=89

Thanks=EF=BC=8C

Yanteng

Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B44=E6=9C=8819=E6=97=A5=E5=
=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=888:46=E5=86=99=E9=81=93=EF=BC=9A
>
> Next time, it's good to fold this patch into the patch set, not a separat=
ed one.
>
> Thanks
> Alex
> On 2021/4/16 =E4=B8=8A=E5=8D=8811:29, Yanteng Si wrote:
> > This patch add zh_CN/openrisc to zh_CN/index.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  Documentation/translations/zh_CN/index.rst | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation=
/translations/zh_CN/index.rst
> > index 8bb15ee2cf6d..f86fd7d31035 100644
> > --- a/Documentation/translations/zh_CN/index.rst
> > +++ b/Documentation/translations/zh_CN/index.rst
> > @@ -28,6 +28,7 @@
> >     iio/index
> >     riscv/index
> >     core-api/index
> > +   openrisc/index
> >
> >  =E7=9B=AE=E5=BD=95=E5=92=8C=E8=A1=A8=E6=A0=BC
> >  ----------
> >
