Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10E6C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 27 Dec 2021 05:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbhL0F6k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Dec 2021 00:58:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbhL0F6g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Dec 2021 00:58:36 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97001C06173E
        for <linux-doc@vger.kernel.org>; Sun, 26 Dec 2021 21:58:36 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id h23so7678221iol.11
        for <linux-doc@vger.kernel.org>; Sun, 26 Dec 2021 21:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gxXQ2EiSj3lfPIUmelf9uKnPG79S+ZDttlLdm7vD3Qw=;
        b=Th/056KBB0wov6LMP4NShyFbMJAeQKEtkF1URVGN+Pn0DtTOvHZ+y2K7Pjairp9yQk
         +P+J6Csmxn5L5Xe8eCKDqSgOPBgwARLHOJp4azp43yp4B9tZgOFtLbWul7De7iyJLOu9
         bxqojEp8KUib6ty4Gqh7Nz3fx3h+YyGk37pATvgMH46Q1M+DjWPu36pwBmUzxEerrNyc
         l4D0Vy1gyLFiXSbCHrDPDgUXI9x/bvaHkdzkwZxM/5kCfCcrsze0uxbPG7TwFu0KKnoA
         esCKJB6Qb+K3SHk5mtSdGdB3PSQIYJGHHh/UqgyIZkNsk8W3JxzYiQFzA7qi5GanYnXe
         QItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gxXQ2EiSj3lfPIUmelf9uKnPG79S+ZDttlLdm7vD3Qw=;
        b=IB8/eawnJFvdRXoB5dDnlrWwXsMoZnR2lHqqtonAG9RiUsTtym3GOqFapFFKaPKnRw
         7h9ASpowNY29h3YZTok5sABskURVc9MslDzzr9642b/4ioW10aGg8X3vHVfCErBbA68i
         TiYxUo1eM0ltBBOv6V4QgyhBiKqu63qsCHO6PrFlfRd47asG9cCetQdPWHDDAFFs+jbb
         iZ7YFcVSYg141BT7RqxONANFSbMALQLs+7tpVg7GrC9dFzwmFAgO41fyfngitkGkubsB
         x8iqWSOxw7MN9HB45z10/dCDHUQRGYt5CziBGEIIYaLc2TAwCSSI+wijtS5ZWYyrT11q
         fdjA==
X-Gm-Message-State: AOAM530+tYgNe+IA0mvDOPP7vOEeIWbe3fu0+kx55BnvYQ7nUdoP1mbK
        mq910pIJV9tzW8oah1R7zp5K3AiXzb4qVaCu1m0=
X-Google-Smtp-Source: ABdhPJxoekMKPvbglf9D0aguGpCNGAyt1CQa24HwFxzqUFI264kohDUhSTwrwFZE2TgDYbbk7VQgCy3BJWVGzjU8zqQ=
X-Received: by 2002:a02:7f87:: with SMTP id r129mr7107457jac.2.1640584715864;
 Sun, 26 Dec 2021 21:58:35 -0800 (PST)
MIME-Version: 1.0
References: <20211226082923.3261-1-tangyizhou@huawei.com> <20211226082923.3261-2-tangyizhou@huawei.com>
 <CAJy-Amkd7YJszrgxmxXCYjHNR1ngwk+irHJvfDUnJXZ5fc_wfw@mail.gmail.com> <1bedacab-eeba-8fef-6fae-017653ea6c54@huawei.com>
In-Reply-To: <1bedacab-eeba-8fef-6fae-017653ea6c54@huawei.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 27 Dec 2021 13:57:59 +0800
Message-ID: <CAJy-AmmfKLshRf4zsCmFqYtOzT0jzm0XzUCHBPdfbsKN9LJvFw@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/zh_CN: Add power/index Chinese translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        yanteng si <siyanteng01@gmail.com>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 27, 2021 at 9:30 AM Tang Yizhou <tangyizhou@huawei.com> wrote:
>
> On 2021/12/26 16:30, Alex Shi wrote:
> > On Sun, Dec 26, 2021 at 4:01 PM Tang Yizhou <tangyizhou@huawei.com> wro=
te:
> >>
> >> Translate power/index.rst into Chinese.
> >>
> >> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> >> ---
> >>  Documentation/translations/zh_CN/index.rst    |  4 +-
> >>  .../translations/zh_CN/power/index.rst        | 55 ++++++++++++++++++=
+
> >>  2 files changed, 57 insertions(+), 2 deletions(-)
> >>  create mode 100644 Documentation/translations/zh_CN/power/index.rst
> >>
> >> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentatio=
n/translations/zh_CN/index.rst
> >> index 46e14ec9963d..7658e2fa6f98 100644
> >> --- a/Documentation/translations/zh_CN/index.rst
> >> +++ b/Documentation/translations/zh_CN/index.rst
> >> @@ -104,13 +104,14 @@ TODOList:
> >>     :maxdepth: 2
> >>
> >>     core-api/index
> >> +   accounting/index
> >
> > What's this?
>
> It's https://www.kernel.org/doc/html/latest/accounting/index.html.
>
> The Chinese version is not in the same order as the English version
> and I move it to where it should be.
>

It's a different part of doc, better to split out as another patch.
With this,

Reviewed-by: Alex Shi <alexs@kernel.org>

Thanks
Alex

> >
> > Thanks
> > Alex
> >
> >>     cpu-freq/index
> >>     iio/index
> >>     sound/index
> >>     filesystems/index
> >>     virt/index
> >>     infiniband/index
> >> -   accounting/index
> >> +   power/index
> >>     scheduler/index
> >>
> >>  TODOList:
> >> @@ -129,7 +130,6 @@ TODOList:
> >>  * netlabel/index
> >>  * networking/index
> >>  * pcmcia/index
> >> -* power/index
> >>  * target/index
> >>  * timers/index
> >>  * spi/index
> >> diff --git a/Documentation/translations/zh_CN/power/index.rst b/Docume=
ntation/translations/zh_CN/power/index.rst
> >> new file mode 100644
> >> index 000000000000..fd379adfda8e
> >> --- /dev/null
> >> +++ b/Documentation/translations/zh_CN/power/index.rst
> >> @@ -0,0 +1,55 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +.. include:: ../disclaimer-zh_CN.rst
> >> +
> >> +:Original: Documentation/power/index.rst
> >> +
> >> +:=E7=BF=BB=E8=AF=91:
> >> +
> >> +  =E5=94=90=E8=89=BA=E8=88=9F Tang Yizhou <tangyeechou@gmail.com>
> >> +
> >> +=3D=3D=3D=3D=3D=3D=3D=3D
> >> +=E7=94=B5=E6=BA=90=E7=AE=A1=E7=90=86
> >> +=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +.. toctree::
> >> +    :maxdepth: 1
> >> +
> >> +TODOList:
> >> +
> >> +    * apm-acpi
> >> +    * basic-pm-debugging
> >> +    * charger-manager
> >> +    * drivers-testing
> >> +    * energy-model
> >> +    * freezing-of-tasks
> >> +    * opp
> >> +    * pci
> >> +    * pm_qos_interface
> >> +    * power_supply_class
> >> +    * runtime_pm
> >> +    * s2ram
> >> +    * suspend-and-cpuhotplug
> >> +    * suspend-and-interrupts
> >> +    * swsusp-and-swap-files
> >> +    * swsusp-dmcrypt
> >> +    * swsusp
> >> +    * video
> >> +    * tricks
> >> +
> >> +    * userland-swsusp
> >> +
> >> +    * powercap/powercap
> >> +    * powercap/dtpm
> >> +
> >> +    * regulator/consumer
> >> +    * regulator/design
> >> +    * regulator/machine
> >> +    * regulator/overview
> >> +    * regulator/regulator
> >> +
> >> +.. only::  subproject and html
> >> +
> >> +   Indices
> >> +   =3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +   * :ref:`genindex`
> >> --
> >> 2.17.1
> >>
> > .
> >
