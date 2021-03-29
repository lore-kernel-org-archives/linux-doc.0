Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80634C433C1
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 12:07:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 579586192B
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 12:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbhC2MGi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Mar 2021 08:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbhC2MGL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Mar 2021 08:06:11 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF69C061574
        for <linux-doc@vger.kernel.org>; Mon, 29 Mar 2021 05:06:11 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id ap14so5903196ejc.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Mar 2021 05:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=n4ZBYqmDsUSzNi+Xw3nf7PDlZxZlAktzHot6pHMzbd4=;
        b=F93pMoVghsS8kcFa0E3f+CGu91h7N24RWmddNfb6WDhp5ygFzEcdbVsUFb6OV3cJDi
         2og9J2R79q9MQNFn/7s+Ae74Cha//8Ufr8RhzJ7Ewl1TixAQCXenDDulBIwYVoRnnquZ
         NlLSS6Xw22S6ANHaVE/BGJ/UNXXqc2Tc8ughoFu0JnYgP4yuUNp7SItO1JgptjpY66iP
         crAKQ6U/Ok9D+4vj6G7z88Zvu+sJ9WYw7MsZYH6FddlZvHpL0AphB3qWiPmbRvi0x22G
         ln1LdbgLAINWEH7c0FHWTRnwuurfgGUaeiNo0TLqCoOJ881pj9aM49MqR5Z+qEiiODHW
         3n4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=n4ZBYqmDsUSzNi+Xw3nf7PDlZxZlAktzHot6pHMzbd4=;
        b=iVcsD6p0RJNJBK/mXKiRpP1UxKbQhHoxu4CY9UeoQYNpHhzOuKKIhPhNhWNgRYHDLt
         Y1EjQJABkHjv5jtoyFC5bvV9798r3b1TKz4tkjNhgJ0BvlzENcjq8sAwu1/nhGcqRDTA
         GUxIq4KLoZobpoRConm1mPSZJxmmCe6HDG+tXBx0kUIokEc1/BPDp7+ev2fCut+jivd4
         +iXqHf0Izu9Ol1W4OdqSBbS5fRr1ItTO+vCXI/VVUjkISSUeK9jmb+GI9mHdpTrjKxur
         GY1zSNJ3lOM511H7nwi8jqrTHmyKm4BzsaZeZDeY/Ci45mc5uT+6Lhd1MpX2MUlTKSt8
         /YXA==
X-Gm-Message-State: AOAM533D/LwHVoQf1HrrLnbA0dJFyOZMcrhVP8PgyhzNuNjZBonMFkes
        Mya/o7npW7bu4uKx+doGndhz1gi2q5Qb00THKwY=
X-Google-Smtp-Source: ABdhPJy1dwQi6lRRIucG0JqZBwbWHHoer5NvnXF+06wiybezSPyE/fhc/TiXq5oTdBVmo9Ctx0vVAxuIoA4gCmgG8r4=
X-Received: by 2002:a17:906:82c5:: with SMTP id a5mr28795392ejy.232.1617019570150;
 Mon, 29 Mar 2021 05:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210329025144.9776-1-siyanteng@loongson.cn> <20210329025144.9776-3-siyanteng@loongson.cn>
 <20210329062139.GA8845@mipc>
In-Reply-To: <20210329062139.GA8845@mipc>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 29 Mar 2021 20:05:59 +0800
Message-ID: <CAEensMx39qOE=XmT+Lt8cqqjZD1rujrxOD-FWkqUTdojTJKBNg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] docs/zh_CN: add cpu-freq cpu-drivers.rst translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu X.C. <bobwxc@email.cn> =E4=BA=8E2021=E5=B9=B43=E6=9C=8829=E6=97=A5=E5=91=
=A8=E4=B8=80 =E4=B8=8B=E5=8D=882:21=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Mon, Mar 29, 2021 at 10:51:38AM +0800, Yanteng Si wrote:
> > This patch translates Documention/cpu-freq/cpu-drivers.rst into Chinese=
.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  .../zh_CN/cpu-freq/cpu-drivers.rst            | 259 ++++++++++++++++++
> >  1 file changed, 259 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/cpu-freq/cpu-drive=
rs.rst
> >
> > diff --git a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst =
b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
> [...]
> > +1.5. target/target_index
> > +------------------------
> > +
> > +target_index=E8=B0=83=E7=94=A8=E6=9C=89=E4=B8=A4=E4=B8=AA=E5=8F=82=E6=
=95=B0/=EF=BC=9A``struct cpufreq_policy * policy``=E5=92=8C``unsigned int``
>
> "s/=E3=80=82/=EF=BC=9A/" means use '=EF=BC=9A' to replace '=E3=80=82' ;
> aka "s/{0}/{1}/" means use {1} to replace {0}, this is a sed command.
> So, please delete the '/' .
OK!
>
> [...]
> > +
> > +=E5=A6=82=E6=9E=9C=E4=BD=A0=E9=9C=80=E8=A6=81=E5=9C=A8driver_freq_tabl=
e=E4=B8=AD=E5=A4=84=E7=90=86pos=E7=9A=84=E4=BD=8D=E7=BD=AE=EF=BC=8C=E4=B8=
=8D=E8=A6=81=E5=87=8F=E5=8E=BB=E6=8C=87=E9=92=88=EF=BC=8C=E5=9B=A0=E4=B8=BA=
=E5=AE=83=E7=9A=84=E4=BB=A3=E4=BB=B7=E7=9B=B8=E5=BD=93=E9=AB=98=E3=80=82=E7=
=9B=B8=E5=8F=8D=EF=BC=8C=E4=BD=BF=E7=94=A8=E5=AE=8F
> > +  cpufreq_for_each_entry_idx() =E5=92=8C cpufreq_for_each_valid_entry_=
idx() =E3=80=82
>
> The spaces in the begin are also redundant.
>
OK!
> And one more thing:
>   The numbers of columns are very random, if someone read the rst files
>   <http://fars.ee/sqoL.png>
>   instead of html files, that may cause difficulties. Please use a
>   monospaced font to fix the problem, try to keep in 74-80 columns
>   except meet a long English word, one Chinese character use 2 columns.
>
>   This comment is for all patches.
>
> Thanks!
>
> Wu X.C.
>
Thanks!

Yanteng
