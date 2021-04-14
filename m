Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5700DC433ED
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 15:59:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35CDA61249
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 15:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352757AbhDNQAH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Apr 2021 12:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351276AbhDNQAH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Apr 2021 12:00:07 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBF2C061574
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 08:59:45 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id a21so8015236oib.10
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 08:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gJjfNud5QYZyiTwL4ISAsMq6h+dsj4rD2s8JUXPYqx0=;
        b=E26vdto+7+v0DCRl2a5wNEiyvbac+RGqfSuPJpTrWOBDPHN+KbGPmqXTQGMyUYI2zi
         m6dIjJ1zK7jhQWYB7T1lbBVWarFVcacnu4k2lOaFD8RWVK/Id3U41p+6XdU0GjoFg8oo
         5w+n7HoUJQZpnkF5lRmsECxpj/JIjRHXyeqlsBsL/PH1w9J6m+0TDE/EG6yKKWdB7RtK
         02TS+vM8kAbaA6KOoZEPdjZ/oLwtHAApcWlljx73UES4NFABywsuvAqVzcW2trN7Wk7+
         w/pW2r/GBOYVLrsCnOvUm+FLpU7r25k5UORsKlBOj2YkQpH9VoWb2+I5vISgChjUgw+p
         eMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gJjfNud5QYZyiTwL4ISAsMq6h+dsj4rD2s8JUXPYqx0=;
        b=l4pcGiLvsXZH6Np//LMBu5DyOYxg23AEE+DOaiC/W13d5RnemGz56Ln3u2mdtm6TyK
         A8Q++u7wuSRaDCcQr2O/Xpx0JgY83RhAq6ae0ZaqlA7ffiY+i8AQTEpn/4/+i/mL9h1P
         PIPf5yd3L/ncpWo8J6K7hJSD/DIV/RzGFz4UdHFjNzOnoJkVCi6NULV+yguA8HEDwmlw
         192Z9caH2Da+MvnCRFtK+/I1VovJgpCB2vDjeP/rmlO+CuqjaGioyxnCZ8ioGCYEcDvM
         m8Wtd+0lQ57BPOMHE5YiEfc74w+lOTo9bP3tI24a2mDHr2ZkFN79sjLbeU/d3JQH0Zgb
         pwBg==
X-Gm-Message-State: AOAM533ZBAPXidi1pMclNb9dPkzievFSMxijdi/ujo3CE+TXpUMGmvOJ
        4M10klBU/Y+Tj8F83ZEi7rtZI1+h7/uQcLDd06U=
X-Google-Smtp-Source: ABdhPJxKlo/uBww6P8TAdWzSoM9QKPi+vlHA0XSrYWBef6CXF+6LErnZC3UoPQ89GjiPpuJNRl+GxabYjQZSroObVJw=
X-Received: by 2002:aca:3b85:: with SMTP id i127mr2827498oia.103.1618415985186;
 Wed, 14 Apr 2021 08:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210413131237.2253955-1-siyanteng@loongson.cn> <87lf9lsxou.fsf@meer.lwn.net>
In-Reply-To: <87lf9lsxou.fsf@meer.lwn.net>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 14 Apr 2021 23:59:33 +0800
Message-ID: <CAEensMynerPf7T_Lpgks-yHqA4znx3B5-tqy=QHiMq-hK+-Mtw@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] docs/zh_CN: add core api and openrisc translation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I guess it's because I didn't sit down when I sent it. ~>_<~
I'll find out why, and tomorrow I'll try sending again.

Thanks,

Yan teng

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B44=E6=9C=8814=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=885:04=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng@loongson.cn> writes:
>
> > This series of patches translates core-api/irq/* and openrisc/* into
> > Chinese
> >
> > v1 -> v2:
> >
> > Modify some words under Xiangcheng Wu's suggestion. Thanks for his rewi=
ew!
> >
> > v2 -> v3:
> >
> > keep the signs number equal to the title char under Alex's suggestion.
> > Thanks for his rewiew!
> >
> >
> > Yanteng Si(11):
> > docs/zh_CN: add core-api irq concepts.rst translation
> > docs/zh_CN: add core-api irq irq-affinity.rst translation
> > docs/zh_CN: add core-api irq irq-domain.rst translation
> > docs/zh_CN: add core-api irq irqflags-tracing.rst
> > docs/zh_CN: add core-api irq index.rst translation
> > docs/zh_CN: add core-api index.rst translation
> > docs/zh_CN: add translation to zh_CN index
> > docs/zh_CN: add openrisc openrisc_port.rst translation
> > docs/zh_CN: add openrisc todo.rst translation
> > docs/zh_CN: add openrisc index.rst translation
> > docs/zh_CN: add translation to zh_CN index
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>
> This looks like it's about ready to go in, but I seem to be missing
> patch 11...?
>
> Thanks,
>
> jon
