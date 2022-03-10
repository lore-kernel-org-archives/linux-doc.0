Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24523C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 10 Mar 2022 02:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233455AbiCJCIM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Mar 2022 21:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiCJCIL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 21:08:11 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B80D128666
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 18:07:12 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2dbc48104beso43284507b3.5
        for <linux-doc@vger.kernel.org>; Wed, 09 Mar 2022 18:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oKikUdY6JJQfb76Z5hR5iuyBsMKrNGAgDUtNz3th32s=;
        b=eesMbx4QXFcdyN6tatqzKsvYL+7A2dACPe65F2v4tDO1+/P6O58BvpKG/1fIvfKNre
         a2719fBjajOiX6HWpRxMvShGpbM8eI+3QN84NDqcbMfCYllfat8roE13W4nzcxvlVWvU
         MUbRoKPinPKlDiF37q+MZmunkXclMdmiXbL4qXtHDMEmqKl5NTBmaJhg7uE8FrbDCgei
         wXyJA6FaRZg5EEQtcpYTBw0p/jhfC5W95aqhrAa8e77xic3XbRJ6WYUYV5CnpdrPy7rd
         1wbErPRGoIjBVdq9teUhGz06sMTnz1guV55tVW59aVMoOHAjtY4tF3cfUI/+jrswFG6L
         D8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oKikUdY6JJQfb76Z5hR5iuyBsMKrNGAgDUtNz3th32s=;
        b=7OHWGUNwSFSDLAZBh1NRKeqSNaQ2eFcJp5KINEZjyUF0gvFnyaiAOWUSOoeCHLNXbR
         MFgLl3GUqBmMESZm/FSl4ihXYlJg9yWzFjqVPA9NugkaKRHZcjpUcFPzVD5hQWKxA7cn
         r0MsVIjeW1VtMHurNNiegw85XsXjtn0bhd7v9NDXCx2R2bHqHP6N/9htZKgJLhLjXo+p
         Ez9wbEiSCO0ybm7AkMAaaijpg0nbmbO6layKZiZYg17iE5HRh15dY4Yrqs9nmEuIr4zP
         xFjRLibHWrFG3oB3hWPA8cAq1zAS+gh7R1Q1FWj8qgNXoulfb1s75MN+r1DRNo5Q2/s7
         SOpw==
X-Gm-Message-State: AOAM5314p0x7cT/jqJeaiCzjUd5BqpxujvxyRSoQV1l3B4FzfIjMOj7g
        HI5yTcayhj9RMQMojg/WlrSTrs0hhgboU+VOSRY=
X-Google-Smtp-Source: ABdhPJy44W89Cx/2D72NoFkvN6zShJdixCEIUISxMjSmmZ56wHE9GqIRC1DLSWSzgT3VUTKdPN/PTmUb3QIqNy8ghAQ=
X-Received: by 2002:a81:e14:0:b0:2d6:f08c:3d1d with SMTP id
 20-20020a810e14000000b002d6f08c3d1dmr2259289ywo.398.1646878026636; Wed, 09
 Mar 2022 18:07:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646723502.git.siyanteng@loongson.cn> <5c1d9b95b570cc3412b6bf87fdcc35046b3ce606.1646723502.git.siyanteng@loongson.cn>
 <87ee3a7l9c.fsf@meer.lwn.net>
In-Reply-To: <87ee3a7l9c.fsf@meer.lwn.net>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 10 Mar 2022 10:06:47 +0800
Message-ID: <CAEensMxwCwkQMmpeDtPzjZ3K_UBtaWQy8-w-FJtCtH99xAQhDw@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] Add Chinese translation for vm/ksm.rst
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        xu xin <xu.xin16@zte.com.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yang Yang <yang.yang29@zte.com.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2022=E5=B9=B43=E6=9C=8810=E6=97=
=A5=E5=91=A8=E5=9B=9B 07:34=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng01@gmail.com> writes:
>
> > From: xu xin <xu.xin16@zte.com.cn>
> >
> > Translate Documentation/vm/ksm.rst into Chinese.
> > Update Documentation/translations/zh_CN/vm/index.rst.
> >
> > Reviewed-by: Yang Yang <yang.yang29@zte.com.cn>
> > Reviewed-by: Alex Shi <alexs@kernel.org>
> > Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> > Signed-off-by: xu xin <xu.xin16@zte.com.cn>
> > ---
> >  Documentation/translations/zh_CN/vm/index.rst |  1 +
> >  Documentation/translations/zh_CN/vm/ksm.rst   | 70 +++++++++++++++++++
> >  2 files changed, 71 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/vm/ksm.rst
>
> Since you are passing this patch onward, you need to apply your sigoff
> to it.
OK, thank you for your patience and guidance! >_<

Thanks,
Yanteng
