Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBECC433FE
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 08:42:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiI3Imh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 04:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiI3Img (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 04:42:36 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1A7142E0A
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 01:42:34 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id o2so5815861lfc.10
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 01:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=JNPYcplm2Vx2ZR4Sdm6aXrihBwm9ZJOw/j38yUyeGfY=;
        b=hAq28dS+UzBSegl8Yce+lYYWsz41viGzbQzt6qhbD+cj4WCMqJ0OV2N33nokZfWpF8
         Iihrhs5/9Iug926Sc5WIWJe+ybqcJ+UQFMvN2iD3unjqY56+6oycgzx+obisOs76Tg4j
         v/HfzJIKBBrFB7tkA0GLUtTNsjpJ4Re1L8ctZGpXzg1YCHXye96U0Sa/g88OgzB7Necc
         BUbXmLFTAulB34OPeplTcvIES1qsVUh5AwZibMVHxPVxtHJu60knvxIjJt8THZ0Lf8uj
         ZB5sQ2NgPclSd9tYDYKumKNX6MZs5OsEq9u5O4wejA7OYOyyWK67pq8e9FQBeoKPBQm2
         mIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JNPYcplm2Vx2ZR4Sdm6aXrihBwm9ZJOw/j38yUyeGfY=;
        b=ot/fnUxGAytq0jUf7gj8V0OWJP4adehcYbyTO9hWr+t84oBQ90iIUskTAUvz76KX2b
         ya6zFtV+knuMHpxaag/7p0oLeLU74XMn3P1dZvCZQ6+6EUuuP8hNv1mkHi5jADyg56hr
         X3UHqQ7d9S3eAcg9K4usftnv13fhw3M52BecTTdnJdQ4zQby3NqLOpsRFw+Qzz6wa9na
         zrQwbH0kRTsM9hzCjj97cWW0aH8Gtok9E+8SXklO6zAxMcdN0t91fYowu53R1zRv01ll
         DK4vGHgvHwRrfdrk8LuasRGwK9VgQexNyfQynxKXvw/qsh/1XPoH8T2jlETPpGT/RM27
         /V3g==
X-Gm-Message-State: ACrzQf1ncH3cewPoIs8eXDwlKCAaYDCqvgjSGg0v75YyAkuuwIXnNxss
        PkVG7+PJOKzKl25Q/k1mbxD+t3x4wd6/nbDSS2U=
X-Google-Smtp-Source: AMsMyM5jYos6JRITBnJj/9VVvth0oegY5I3ucTMxLac49edoTSIZccH0ax7uwls/oprhQw+1eagXJibL2VYXIKbQj/Q=
X-Received: by 2002:a05:6512:b08:b0:4a1:d704:fc59 with SMTP id
 w8-20020a0565120b0800b004a1d704fc59mr2823571lfu.629.1664527352859; Fri, 30
 Sep 2022 01:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220923040419.3787429-1-siyanteng@loongson.cn> <Yy2qyUoRq5in4Q+w@bobwxc.mipc>
In-Reply-To: <Yy2qyUoRq5in4Q+w@bobwxc.mipc>
From:   Alex Shi <seakeel@gmail.com>
Date:   Fri, 30 Sep 2022 16:41:56 +0800
Message-ID: <CAJy-AmkNaRf5jxjHeYFrcXHdB=1W-5iqQb5Cm-fwUxV91nzauw@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Fix build warning
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 23, 2022 at 8:47 PM Wu XiangCheng <wu.xiangcheng@linux.dev> wro=
te:
>
> > Since commit 702f436ab07b ("docs/zh_CN: add dt changesets translation")
> > introduce a build warning:
> >
> > Warning: Documentation/translations/zh_CN/devicetree/changesets.rst
> > references a file that doesn't exist:
> > Documentation/Devicetree/changesets.rst
> >
> > Change the first letter of Devicetree to lowercase.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>
> Better a Fixes: tag.
>

Right.

> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
>
> Thanks,
>
> > ---
> >  Documentation/translations/zh_CN/devicetree/changesets.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/translations/zh_CN/devicetree/changesets.rst=
 b/Documentation/translations/zh_CN/devicetree/changesets.rst
> > index 2ace05f3c377..3df1b03c5695 100644
> > --- a/Documentation/translations/zh_CN/devicetree/changesets.rst
> > +++ b/Documentation/translations/zh_CN/devicetree/changesets.rst
> > @@ -1,7 +1,7 @@
> >  .. SPDX-License-Identifier: GPL-2.0
> >  .. include:: ../disclaimer-zh_CN.rst
> >
> > -:Original: Documentation/Devicetree/changesets.rst
> > +:Original: Documentation/devicetree/changesets.rst
> >
> >  :=E7=BF=BB=E8=AF=91:
> >
> > --
> > 2.31.1
> >
> >
>
> --
> Wu XiangCheng   0x32684A40BCA7AEA7
>
